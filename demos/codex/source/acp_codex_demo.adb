--  SPDX-FileCopyrightText: 2026 Max Reznik <reznikmm@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

with Ada.Command_Line;
with Ada.Containers.Vectors;
with Ada.Directories;
with Ada.Environment_Variables;
with Ada.Exceptions;
with Ada.IO_Exceptions;
with Ada.Wide_Wide_Text_IO;
with VSS.JSON.Streams;
with VSS.Stream_Element_Vectors;
with VSS.Strings.Conversions;
with ACP.Types.Inputs;
with ACP.Types.Outputs;
with Demo.Codecs;
with Demo.Connection;
with Demo.JSON;

procedure ACP_Codex_Demo is
   use Demo.JSON;
   use type ACP.Types.Integer_64;
   use type VSS.JSON.Streams.JSON_Stream_Element_Kind;
   use type VSS.Stream_Element_Vectors.Stream_Element_Vector;
   use type VSS.Strings.Virtual_String;

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
   package Updates is new
     Demo.Codecs
       (ACP.Types.UpdateSessionNotification,
        ACP.Types.Inputs.Input_UpdateSessionNotification,
        ACP.Types.Outputs.Output_UpdateSessionNotification);
   package Chunks is new
     Demo.Codecs
       (ACP.Types.ContentChunk,
        ACP.Types.Inputs.Input_ContentChunk,
        ACP.Types.Outputs.Output_ContentChunk);
   package Permission_Replies is new
     Demo.Codecs
       (ACP.Types.RequestPermissionResponse,
        ACP.Types.Inputs.Input_RequestPermissionResponse,
        ACP.Types.Outputs.Output_RequestPermissionResponse);

   type Agent_Message is record
      Identifier : VSS.Strings.Virtual_String;
      Text       : VSS.Strings.Virtual_String;
   end record;
   package Message_Vectors is new
     Ada.Containers.Vectors (Positive, Agent_Message);

   Channel         : Demo.Connection.Channel;
   Messages        : Message_Vectors.Vector;
   Session_ID      : VSS.Strings.Virtual_String;
   User_Message    : VSS.Strings.Virtual_String;
   Prompt_Active   : Boolean := False;
   Foreground_Seen : Boolean := False;
   Idle            : Boolean := False;
   Stop_Reason     : VSS.Strings.Virtual_String;
   Turn_Error      : VSS.Strings.Virtual_String;
   Prompt_Text     : VSS.Strings.Virtual_String :=
     "Відповідай одним коротким реченням українською: привітайся з Ada.";

   procedure Report (Item : VSS.Strings.Virtual_String);
   function Receive return Value;
   function Message_Index
     (Identifier : VSS.Strings.Virtual_String) return Positive;
   procedure Dispatch (Message : Value);
   function Call
     (Identifier : Value; Method : VSS.Strings.Virtual_String; Params : Value)
      return Value;

   procedure Report (Item : VSS.Strings.Virtual_String) is
   begin
      Ada.Wide_Wide_Text_IO.Put_Line
        (Ada.Wide_Wide_Text_IO.Standard_Error,
         VSS.Strings.Conversions.To_Wide_Wide_String (Item));
   end Report;

   function Receive return Value is
      Result : Value;
   begin
      if not Parse (Demo.Connection.Receive (Channel), Result)
        or else not Is_Object (Result)
        or else Text (Result, "jsonrpc") /= "2.0"
      then
         raise Ada.IO_Exceptions.Data_Error with "invalid JSON-RPC message";
      end if;
      return Result;
   end Receive;

   function Message_Index
     (Identifier : VSS.Strings.Virtual_String) return Positive is
   begin
      if Identifier.Is_Empty then
         raise Ada.IO_Exceptions.Data_Error with "missing messageId";
      end if;
      for Index in Messages.First_Index .. Messages.Last_Index loop
         if Messages (Index).Identifier = Identifier then
            return Index;
         end if;
      end loop;
      Messages.Append (Agent_Message'(Identifier => Identifier, Text => <>));
      return Messages.Last_Index;
   end Message_Index;

   procedure Dispatch (Message : Value) is
      Identifier : constant Value := Member (Message, "id");
      Method     : constant VSS.Strings.Virtual_String :=
        Text (Message, "method");
      Params     : constant Value := Member (Message, "params");
      Data       : constant Value := Member (Params, "update");
      Kind       : constant VSS.Strings.Virtual_String :=
        Text (Data, "sessionUpdate");
      Typed      : ACP.Types.UpdateSessionNotification;
   begin
      if not Is_String (Member (Message, "method")) then
         raise Ada.IO_Exceptions.Data_Error with "missing method";
      elsif not Identifier.Is_Empty then
         if not Is_String (Identifier) and not Is_Integer (Identifier) then
            raise Ada.IO_Exceptions.Data_Error with "invalid request ID";
         elsif Method = "session/request_permission"
           and then not Session_ID.Is_Empty
           and then Text (Params, "sessionId") = Session_ID
         then
            declare
               Result  : ACP.Types.RequestPermissionResponse;
               Outcome : Value := Object_Value;
            begin
               --  This noninteractive demo has no permission UI.
               Add (Outcome, "outcome", String_Value ("cancelled"));
               for Event of Outcome loop
                  Result.outcome.Append (Event);
               end loop;
               Demo.Connection.Send
                 (Channel,
                  Encode
                    (Response
                       (Identifier, Permission_Replies.Encode (Result))));
               Report ("Permission declined: " & Text (Params, "title"));
            end;
         else
            Demo.Connection.Send
              (Channel,
               Encode
                 (Error_Response
                    (Identifier, -32601, "Unsupported client method")));
         end if;
         return;
      elsif Method /= "session/update" then
         --  Optional extension notifications (including auth status).
         return;
      elsif not Is_String (Member (Params, "sessionId"))
        or else not Is_Object (Data)
        or else not Is_String (Member (Data, "sessionUpdate"))
        or else not Updates.Decode (Params, Typed)
      then
         raise Ada.IO_Exceptions.Data_Error with "invalid session update";
      end if;

      if Session_ID.Is_Empty then
         Session_ID := Typed.sessionId;
      elsif Session_ID /= Typed.sessionId then
         raise Ada.IO_Exceptions.Data_Error with "update for another session";
      end if;

      if Kind = "agent_message_chunk" then
         declare
            Chunk : ACP.Types.ContentChunk;
            Block : constant Value := Member (Data, "content");
         begin
            if not Is_String (Member (Data, "messageId"))
              or else not Is_Object (Block)
              or else not Chunks.Decode (Data, Chunk)
            then
               raise Ada.IO_Exceptions.Data_Error with "invalid agent chunk";
            end if;
            declare
               Index : constant Positive := Message_Index (Chunk.messageId);
            begin
               if Text (Block, "type") = "text" then
                  if not Is_String (Member (Block, "text")) then
                     raise Ada.IO_Exceptions.Data_Error
                       with "invalid text chunk";
                  end if;
                  Messages (Index).Text :=
                    Messages (Index).Text & Text (Block, "text");
               end if;
            end;
         end;
      elsif Kind = "agent_message" then
         declare
            Index    : constant Positive :=
              Message_Index (Text (Data, "messageId"));
            Content  : constant Value := Member (Data, "content");
            Position : Positive := 1;
         begin
            --  Omission preserves; null/[] clear; arrays replace content.
            if not Content.Is_Empty then
               if Content.First_Element.Kind /= VSS.JSON.Streams.Null_Value
                 and Content.First_Element.Kind /= VSS.JSON.Streams.Start_Array
               then
                  raise Ada.IO_Exceptions.Data_Error
                    with "invalid message content";
               end if;
               Messages (Index).Text.Clear;
               loop
                  declare
                     Block : constant Value := Element (Content, Position);
                  begin
                     exit when Block.Is_Empty;
                     if Text (Block, "type") = "text" then
                        if not Is_String (Member (Block, "text")) then
                           raise Ada.IO_Exceptions.Data_Error
                             with "invalid text block";
                        end if;
                        Messages (Index).Text :=
                          Messages (Index).Text & Text (Block, "text");
                     end if;
                  end;
                  Position := Position + 1;
               end loop;
            end if;
         end;
      elsif Prompt_Active
        and (Kind = "user_message" or Kind = "user_message_chunk")
      then
         User_Message := Text (Data, "messageId");
      elsif Prompt_Active and Kind = "state_update" then
         if Text (Data, "state") = "idle" then
            if Foreground_Seen then
               Idle := True;
               Stop_Reason := Text (Data, "stopReason");
               Turn_Error := Text (Member (Data, "error"), "message");
            end if;
         else
            --  Unknown states remain busy until a known idle state arrives.
            Idle := False;
            if Text (Data, "state") = "running"
              or Text (Data, "state") = "requires_action"
            then
               Foreground_Seen := True;
            end if;
         end if;
      end if;
   end Dispatch;

   function Call
     (Identifier : Value; Method : VSS.Strings.Virtual_String; Params : Value)
      return Value is
   begin
      Demo.Connection.Send
        (Channel, Encode (Request (Identifier, Method, Params)));
      loop
         declare
            Message  : constant Value := Receive;
            Result   : constant Value := Member (Message, "result");
            Error    : constant Value := Member (Message, "error");
            Reply_ID : constant Value := Member (Message, "id");
         begin
            if not Member (Message, "method").Is_Empty then
               Dispatch (Message);
            elsif (not Is_String (Reply_ID) and not Is_Integer (Reply_ID))
              or else Encode (Reply_ID) /= Encode (Identifier)
            then
               raise Ada.IO_Exceptions.Data_Error
                 with "mismatched response ID";
            elsif not Error.Is_Empty then
               raise Ada.IO_Exceptions.Data_Error
                 with
                   "ACP "
                   & VSS.Strings.Conversions.To_UTF_8_String (Method)
                   & ": "
                   & VSS.Strings.Conversions.To_UTF_8_String
                       (Text (Error, "message"))
                   & " (check Codex login and adapter version)";
            elsif not Is_Object (Result) then
               raise Ada.IO_Exceptions.Data_Error
                 with "missing response result";
            else
               return Result;
            end if;
         end;
      end loop;
   end Call;

begin
   if Ada.Command_Line.Argument_Count > 1 then
      raise Ada.IO_Exceptions.Use_Error with "usage: acp_codex_demo [TEXT]";
   elsif Ada.Command_Line.Argument_Count = 1 then
      Prompt_Text :=
        VSS.Strings.Conversions.To_Virtual_String
          (Ada.Command_Line.Argument (1));
   end if;

   declare
      Input  : ACP.Types.InitializeRequest;
      Output : ACP.Types.InitializeResponse;
      Result : Value;
   begin
      Input.protocolVersion := 2;
      Input.info.name := "ada-acp-codex-demo";
      Input.info.version := "0.1.0";
      Result :=
        Call
          (Integer_Value (1),
           "initialize",
           Initialize_Requests.Encode (Input));
      if not Is_Integer (Member (Result, "protocolVersion"))
        or else not Initialize_Replies.Decode (Result, Output)
        or else Output.protocolVersion /= 2
        or else not Output.capabilities.Is_Set
        or else not Output.capabilities.Value.session.Is_Set
      then
         raise Ada.IO_Exceptions.Data_Error
           with "adapter must support ACP v2 sessions";
      end if;
      Report
        ("Agent: "
         & Output.info.name
         & " "
         & Output.info.version
         & " (ACP v2)");
   end;

   declare
      Input     : ACP.Types.NewSessionRequest;
      Output    : ACP.Types.NewSessionResponse;
      Result    : Value;
      Directory : constant String :=
        Ada.Environment_Variables.Value
          ("ACP_CODEX_CWD", Ada.Directories.Current_Directory);
   begin
      Input.cwd :=
        VSS.Strings.Conversions.To_Virtual_String
          (Ada.Directories.Full_Name (Directory));
      Result :=
        Call
          (String_Value ("new"), "session/new", New_Requests.Encode (Input));
      if not Is_String (Member (Result, "sessionId"))
        or else not New_Replies.Decode (Result, Output)
        or else Output.sessionId.Is_Empty
        or else (not Session_ID.Is_Empty and Session_ID /= Output.sessionId)
      then
         raise Ada.IO_Exceptions.Data_Error with "invalid session/new result";
      end if;
      Session_ID := Output.sessionId;
      Report ("Session: " & Session_ID);
   end;

   declare
      Input   : ACP.Types.PromptRequest;
      Output  : ACP.Types.PromptResponse;
      Content : Value := Array_Value;
      Block   : Value := Object_Value;
      Result  : Value;
   begin
      Input.sessionId := Session_ID;
      Add (Block, "type", String_Value ("text"));
      Add (Block, "text", String_Value (Prompt_Text));
      Append (Content, Block);
      for Event of Content loop
         Input.prompt.Append (Event);
      end loop;
      Prompt_Active := True;
      Result :=
        Call
          (String_Value ("prompt"),
           "session/prompt",
           Prompt_Requests.Encode (Input));
      if not Is_String (Member (Result, "messageId"))
        or else not Prompt_Replies.Decode (Result, Output)
        or else Output.messageId.Is_Empty
      then
         raise Ada.IO_Exceptions.Data_Error with "missing accepted messageId";
      end if;
      while not Idle loop
         Dispatch (Receive);
      end loop;
      if not User_Message.Is_Empty and then User_Message /= Output.messageId
      then
         raise Ada.IO_Exceptions.Data_Error with "inconsistent user messageId";
      end if;
      Prompt_Active := False;
   end;

   for Message of Messages loop
      Report (Message.Text);
   end loop;

   declare
      Params : Value := Object_Value;
      Result : Value;
   begin
      Add (Params, "sessionId", String_Value (Session_ID));
      Result := Call (String_Value ("close"), "session/close", Params);
      if not Is_Object (Result) then
         raise Ada.IO_Exceptions.Data_Error
           with "invalid session/close result";
      end if;
   end;
   Report ("State: idle (" & Stop_Reason & ")");
   if Stop_Reason = "error" then
      raise Ada.IO_Exceptions.Data_Error
        with
          "Codex turn failed: "
          & VSS.Strings.Conversions.To_UTF_8_String (Turn_Error);
   elsif Stop_Reason = "cancelled" or Stop_Reason = "refusal" then
      Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Failure);
   end if;
exception
   when Error : others =>
      Report
        ("acp_codex_demo: "
         & VSS.Strings.Conversions.To_Virtual_String
             (Ada.Exceptions.Exception_Message (Error)));
      Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Failure);
end ACP_Codex_Demo;
