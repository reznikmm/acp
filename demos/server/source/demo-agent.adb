--  SPDX-FileCopyrightText: 2026 Max Reznik <reznikmm@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

with Ada.Containers;
with Ada.Strings.Fixed;
with VSS.JSON.Streams;
with VSS.Strings.Conversions;
with ACP.Types.Inputs;
with ACP.Types.Outputs;
with Demo.Codecs;

package body Demo.Agent is
   use Demo.JSON;
   use type ACP.Types.Integer_64;
   use type Ada.Containers.Count_Type;
   use type VSS.Strings.Virtual_String;
   use all type VSS.JSON.Streams.JSON_Stream_Element_Kind;

   package Initialize_Requests is new
     Demo.Codecs
       (ACP.Types.InitializeRequest,
        ACP.Types.Inputs.Input_InitializeRequest,
        ACP.Types.Outputs.Output_InitializeRequest);
   package Initialize_Replies is new
     Demo.Codecs
       (ACP.Types.InitializeResponse,
        ACP.Types.Inputs.Input_InitializeResponse,
        ACP.Types.Outputs.Output_InitializeResponse);
   package New_Requests is new
     Demo.Codecs
       (ACP.Types.NewSessionRequest,
        ACP.Types.Inputs.Input_NewSessionRequest,
        ACP.Types.Outputs.Output_NewSessionRequest);
   package New_Replies is new
     Demo.Codecs
       (ACP.Types.NewSessionResponse,
        ACP.Types.Inputs.Input_NewSessionResponse,
        ACP.Types.Outputs.Output_NewSessionResponse);
   package Prompt_Requests is new
     Demo.Codecs
       (ACP.Types.PromptRequest,
        ACP.Types.Inputs.Input_PromptRequest,
        ACP.Types.Outputs.Output_PromptRequest);
   package Prompt_Replies is new
     Demo.Codecs
       (ACP.Types.PromptResponse,
        ACP.Types.Inputs.Input_PromptResponse,
        ACP.Types.Outputs.Output_PromptResponse);
   package List_Replies is new
     Demo.Codecs
       (ACP.Types.ListSessionsResponse,
        ACP.Types.Inputs.Input_ListSessionsResponse,
        ACP.Types.Outputs.Output_ListSessionsResponse);
   package Resume_Requests is new
     Demo.Codecs
       (ACP.Types.ResumeSessionRequest,
        ACP.Types.Inputs.Input_ResumeSessionRequest,
        ACP.Types.Outputs.Output_ResumeSessionRequest);
   package Updates is new
     Demo.Codecs
       (ACP.Types.UpdateSessionNotification,
        ACP.Types.Inputs.Input_UpdateSessionNotification,
        ACP.Types.Outputs.Output_UpdateSessionNotification);

   function Numbered
     (Prefix : String; Number : Natural) return VSS.Strings.Virtual_String;
   function Locate
     (Self : State; Identifier : VSS.Strings.Virtual_String) return Natural;
   function Valid_Prompt (Content : Value) return Boolean;
   function Supported_Options (Params : Value) return Boolean;
   procedure Notify
     (Channel          : in out Demo.Connection.Channel;
      Identifier, Kind : VSS.Strings.Virtual_String;
      Payload          : Value);

   function Numbered
     (Prefix : String; Number : Natural) return VSS.Strings.Virtual_String
   is (VSS.Strings.Conversions.To_Virtual_String
         (Prefix & Ada.Strings.Fixed.Trim (Number'Image, Ada.Strings.Both)));

   function Locate
     (Self : State; Identifier : VSS.Strings.Virtual_String) return Natural is
   begin
      for Index in Self.Sessions.First_Index .. Self.Sessions.Last_Index loop
         if Self.Sessions (Index).Identifier = Identifier then
            return Index;
         end if;
      end loop;
      return 0;
   end Locate;

   function Valid_Prompt (Content : Value) return Boolean is
      use ACP.Types.JSON_Event_Lists;
      Position : Cursor := Content.First;
   begin
      if Content.Length <= 2 or else Content.First_Element.Kind /= Start_Array
      then
         return False;
      end if;
      Next (Position);
      while Has_Element (Position)
        and then Element (Position).Kind /= End_Array
      loop
         declare
            Block : Value;
            Depth : Natural := 0;
         begin
            if Element (Position).Kind /= Start_Object then
               return False;
            end if;
            loop
               declare
                  Event : constant VSS.JSON.Streams.JSON_Stream_Element :=
                    Element (Position);
               begin
                  Block.Append (Event);
                  case Event.Kind is
                     when Start_Object | Start_Array =>
                        Depth := Depth + 1;

                     when End_Object | End_Array     =>
                        Depth := Depth - 1;

                     when others                     =>
                        null;
                  end case;
               end;
               Next (Position);
               exit when Depth = 0;
            end loop;
            if Text (Block, "type") = "text" then
               if not Is_String (Member (Block, "text")) then
                  return False;
               end if;
            elsif Text (Block, "type") = "resource_link" then
               if not Is_String (Member (Block, "name"))
                 or not Is_String (Member (Block, "uri"))
               then
                  return False;
               end if;
            else
               return False;
            end if;
         end;
      end loop;
      return True;
   end Valid_Prompt;

   function Supported_Options (Params : Value) return Boolean is
      Servers     : constant Value := Member (Params, "mcpServers");
      Directories : constant Value := Member (Params, "additionalDirectories");
      function Empty_Option (Item : Value) return Boolean
      is (Item.Is_Empty
          or else Item.First_Element.Kind = VSS.JSON.Streams.Null_Value
          or else (Item.First_Element.Kind = Start_Array and Item.Length = 2));
   begin
      return Empty_Option (Servers) and Empty_Option (Directories);
   end Supported_Options;

   procedure Notify
     (Channel          : in out Demo.Connection.Channel;
      Identifier, Kind : VSS.Strings.Virtual_String;
      Payload          : Value)
   is
      Notification  : ACP.Types.UpdateSessionNotification;
      Update        : Value := Payload;
      No_Identifier : Value;
   begin
      Add (Update, "sessionUpdate", String_Value (Kind));
      Notification.sessionId := Identifier;
      for Event of Update loop
         Notification.update.Append (Event);
      end loop;
      Demo.Connection.Send
        (Channel,
         Encode
           (Request
              (No_Identifier,
               "session/update",
               Updates.Encode (Notification))));
   end Notify;

   procedure Process
     (Self    : in out State;
      Message : Value;
      Channel : in out Demo.Connection.Channel)
   is
      Identifier : constant Value := Member (Message, "id");
      Method     : constant VSS.Strings.Virtual_String :=
        Text (Message, "method");
      Params     : constant Value := Member (Message, "params");

      procedure Reply (Result : Value);
      procedure Fail
        (Code   : ACP.Types.Integer_64;
         Reason : VSS.Strings.Virtual_String;
         Data   : Value := Object_Value);
      procedure Reply (Result : Value) is
      begin
         Demo.Connection.Send
           (Channel, Encode (Response (Identifier, Result)));
      end Reply;
      procedure Fail
        (Code   : ACP.Types.Integer_64;
         Reason : VSS.Strings.Virtual_String;
         Data   : Value := Object_Value) is
      begin
         Demo.Connection.Send
           (Channel, Encode (Error_Response (Identifier, Code, Reason, Data)));
      end Fail;
   begin
      if not Is_Object (Message)
        or Text (Message, "jsonrpc") /= "2.0"
        or not Is_String (Member (Message, "method"))
        or (not Identifier.Is_Empty
            and not Is_String (Identifier)
            and not Is_Integer (Identifier))
      then
         Demo.Connection.Send
           (Channel,
            Encode (Error_Response (Null_Value, -32600, "Invalid request")));
         return;
      elsif Identifier.Is_Empty then
         --  Work completes synchronously before another message is read.
         --  Cancellation notifications therefore have no pending work.
         return;
      end if;

      if Method = "initialize" then
         declare
            Version : constant Value := Member (Params, "protocolVersion");
            Input   : ACP.Types.InitializeRequest;
            Output  : ACP.Types.InitializeResponse;
         begin
            if not Is_Integer (Version) then
               Fail (-32602, "protocolVersion must be an integer");
            elsif Version.First_Element.Number_Value.Integer_Value
                  not in 0 .. 65535
            then
               Fail (-32602, "protocolVersion is out of range");
            elsif Version.First_Element.Number_Value.Integer_Value < 2 then
               declare
                  Data      : Value := Object_Value;
                  Supported : Value := Array_Value;
               begin
                  Append (Supported, Integer_Value (2));
                  Add (Data, "requested", Version);
                  Add (Data, "supported", Supported);
                  Fail (-32022, "Unsupported protocol version", Data);
               end;
            elsif Self.Initialized then
               Fail (-32600, "Connection already initialized");
            elsif not Is_Object (Member (Params, "info"))
              or else not Is_String (Member (Member (Params, "info"), "name"))
              or else not Is_String
                            (Member (Member (Params, "info"), "version"))
              or else not Initialize_Requests.Decode (Params, Input)
            then
               Fail (-32602, "Invalid initialization parameters");
            else
               Output.protocolVersion := 2;
               Output.info.name := "ada-acp-echo";
               Output.info.version := "0.1.0";
               Output.capabilities := (Is_Set => True, Value => <>);
               Output.capabilities.Value.session :=
                 (Is_Set => True, Value => <>);
               Reply (Initialize_Replies.Encode (Output));
               Self.Initialized := True;
            end if;
         end;
      elsif not Self.Initialized then
         Fail (-32600, "Initialize the connection first");
      elsif Method = "session/new" then
         declare
            Input  : ACP.Types.NewSessionRequest;
            Output : ACP.Types.NewSessionResponse;
         begin
            if not Supported_Options (Params)
              or else not Is_String (Member (Params, "cwd"))
              or else not New_Requests.Decode (Params, Input)
            then
               Fail (-32602, "Invalid session parameters");
            elsif Input.cwd.Is_Empty
              or else VSS.Strings.Conversions.To_UTF_8_String (Input.cwd) (1)
                      /= '/'
            then
               Fail (-32602, "cwd must be absolute");
            elsif Input.additionalDirectories.Length /= 0
              or Input.systemPrompt.Is_Set
              or Input.mcpServers.Length > 2
            then
               Fail
                 (-32602, "Session extensions are not supported by this demo");
            else
               Output.sessionId :=
                 Numbered ("session-", Self.Sessions.Last_Index + 1);
               Self.Sessions.Append
                 (Session'(Output.sessionId, Input.cwd, True));
               Reply (New_Replies.Encode (Output));
            end if;
         end;
      elsif Method = "session/list" then
         declare
            Output : ACP.Types.ListSessionsResponse;
         begin
            if not Member (Params, "cursor").Is_Empty then
               Fail (-32602, "This demo has one page of sessions");
               return;
            end if;
            for Stored of Self.Sessions loop
               declare
                  Info : ACP.Types.SessionInfo;
               begin
                  Info.sessionId := Stored.Identifier;
                  Info.cwd := Stored.Directory;
                  Output.sessions.Append (Info);
               end;
            end loop;
            Reply (List_Replies.Encode (Output));
         end;
      elsif Method = "session/prompt"
        or Method = "session/close"
        or Method = "session/resume"
      then
         declare
            Session_ID : constant VSS.Strings.Virtual_String :=
              Text (Params, "sessionId");
            Index      : constant Natural := Locate (Self, Session_ID);
         begin
            if not Is_String (Member (Params, "sessionId")) then
               Fail (-32602, "sessionId must be a string");
            elsif Index = 0
              or else (not Self.Sessions (Index).Active
                       and Method /= "session/resume")
            then
               declare
                  Data : Value := Object_Value;
               begin
                  Add (Data, "sessionId", String_Value (Session_ID));
                  Fail (-32002, "Session not found", Data);
               end;
            elsif Method = "session/close" then
               Self.Sessions (Index).Active := False;
               Reply (Object_Value);
            elsif Method = "session/resume" then
               declare
                  Input    : ACP.Types.ResumeSessionRequest;
                  Snapshot : Value := Object_Value;
               begin
                  if not Supported_Options (Params)
                    or else not Resume_Requests.Decode (Params, Input)
                    or else Input.cwd /= Self.Sessions (Index).Directory
                    or else Input.additionalDirectories.Length /= 0
                    or else Input.systemPrompt.Is_Set
                  then
                     Fail (-32602, "Invalid resume parameters");
                  else
                     Self.Sessions (Index).Active := True;
                     Add (Snapshot, "state", String_Value ("idle"));
                     Notify (Channel, Session_ID, "state_update", Snapshot);
                     Reply (Object_Value);
                  end if;
               end;
            else
               declare
                  Input        : ACP.Types.PromptRequest;
                  Output       : ACP.Types.PromptResponse;
                  User_Update  : Value := Object_Value;
                  Agent_Update : Value := Object_Value;
                  Running      : Value := Object_Value;
                  Idle         : Value := Object_Value;
                  Content      : constant Value := Member (Params, "prompt");
               begin
                  if not Valid_Prompt (Content)
                    or else not Prompt_Requests.Decode (Params, Input)
                  then
                     Fail
                       (-32602,
                        "prompt must contain text or resource_link blocks");
                     return;
                  end if;
                  Self.Next_Message := Self.Next_Message + 1;
                  Output.messageId := Numbered ("user-", Self.Next_Message);
                  Add
                    (User_Update,
                     "messageId",
                     String_Value (Output.messageId));
                  Add (User_Update, "content", Content);
                  Notify (Channel, Session_ID, "user_message", User_Update);
                  Add (Running, "state", String_Value ("running"));
                  Notify (Channel, Session_ID, "state_update", Running);
                  Reply (Prompt_Replies.Encode (Output));
                  Add
                    (Agent_Update,
                     "messageId",
                     String_Value (Numbered ("agent-", Self.Next_Message)));
                  Add (Agent_Update, "content", Content);
                  Notify (Channel, Session_ID, "agent_message", Agent_Update);
                  Add (Idle, "state", String_Value ("idle"));
                  Add (Idle, "stopReason", String_Value ("end_turn"));
                  Notify (Channel, Session_ID, "state_update", Idle);
               end;
            end if;
         end;
      else
         Fail (-32601, "Method not found");
      end if;
   end Process;
end Demo.Agent;
