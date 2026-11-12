--  SPDX-FileCopyrightText: 2026 Max Reznik <reznikmm@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

with Ada.Command_Line;
with Ada.Exceptions;
with Ada.IO_Exceptions;
with Ada.Wide_Wide_Text_IO;
with VSS.Stream_Element_Vectors;
with VSS.Stream_Element_Vectors.Conversions;
with VSS.Strings.Conversions;
with ACP.Types.Inputs;
with ACP.Types.Outputs;
with Demo.Codecs;
with Demo.Connection;
with Demo.JSON;

procedure ACP_Client_Demo is
   use Demo.JSON;
   use type ACP.Types.Integer_64;
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

   Channel      : Demo.Connection.Channel;
   Prompt_Text  : VSS.Strings.Virtual_String := "Привіт з Ada!";
   Session_ID   : VSS.Strings.Virtual_String;
   User_Message : VSS.Strings.Virtual_String;
   User_Echo    : Boolean := False;
   Agent_Echo   : Boolean := False;
   Running      : Boolean := False;
   Idle         : Boolean := False;
   Stop_Reason  : VSS.Strings.Virtual_String;

   procedure Report (Item : VSS.Strings.Virtual_String);
   function Receive return Value;
   procedure Notification (Message : Value);
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

   procedure Notification (Message : Value) is
      Params : constant Value := Member (Message, "params");
      Typed  : ACP.Types.UpdateSessionNotification;
      Data   : constant Value := Member (Params, "update");
      Kind   : constant VSS.Strings.Virtual_String :=
        Text (Data, "sessionUpdate");
   begin
      if not Member (Message, "id").Is_Empty
        or else Text (Message, "method") /= "session/update"
        or else not Is_String (Member (Params, "sessionId"))
        or else not Is_Object (Data)
        or else not Updates.Decode (Params, Typed)
      then
         raise Ada.IO_Exceptions.Data_Error
           with "invalid session notification";
      end if;
      if Session_ID.Is_Empty then
         Session_ID := Typed.sessionId;
      elsif Session_ID /= Typed.sessionId then
         raise Ada.IO_Exceptions.Data_Error
           with "notification for another session";
      end if;

      if Kind = "user_message" or Kind = "agent_message" then
         declare
            Content : constant Value := Member (Data, "content");
            Block   : constant Value := Element (Content, 1);
         begin
            if not Is_String (Member (Data, "messageId"))
              or else Text (Data, "messageId").Is_Empty
              or else not Element (Content, 2).Is_Empty
              or else Text (Block, "type") /= "text"
              or else not Is_String (Member (Block, "text"))
              or else Text (Block, "text") /= Prompt_Text
            then
               raise Ada.IO_Exceptions.Data_Error
                 with "invalid echoed message";
            end if;
            if Kind = "user_message" then
               User_Message := Text (Data, "messageId");
               User_Echo := True;
            else
               Agent_Echo := True;
            end if;
         end;
      elsif Kind = "state_update" then
         if Text (Data, "state") = "running" then
            Running := True;
            Idle := False;
         elsif Text (Data, "state") = "idle" then
            if Running then
               Idle := True;
               Stop_Reason := Text (Data, "stopReason");
            end if;
         else
            raise Ada.IO_Exceptions.Data_Error
              with "unsupported foreground state";
         end if;
      end if;
   end Notification;

   function Call
     (Identifier : Value; Method : VSS.Strings.Virtual_String; Params : Value)
      return Value is
   begin
      Demo.Connection.Send
        (Channel, Encode (Request (Identifier, Method, Params)));
      loop
         declare
            Message : constant Value := Receive;
            ID      : constant Value := Member (Message, "id");
            Result  : constant Value := Member (Message, "result");
            Error   : constant Value := Member (Message, "error");
         begin
            if not Member (Message, "method").Is_Empty then
               Notification (Message);
            else
               if (not Is_String (ID) and not Is_Integer (ID))
                 or else Encode (ID) /= Encode (Identifier)
               then
                  raise Ada.IO_Exceptions.Data_Error
                    with "mismatched response ID";
               elsif not Error.Is_Empty then
                  raise Ada.IO_Exceptions.Data_Error
                    with
                      "agent error: "
                      & VSS
                          .Stream_Element_Vectors
                          .Conversions
                          .Unchecked_To_String (Encode (Error));
               elsif not Is_Object (Result) then
                  raise Ada.IO_Exceptions.Data_Error
                    with "missing response result";
               end if;
               return Result;
            end if;
         end;
      end loop;
   end Call;

begin
   if Ada.Command_Line.Argument_Count > 1 then
      raise Ada.IO_Exceptions.Use_Error with "usage: acp_client_demo [TEXT]";
   elsif Ada.Command_Line.Argument_Count = 1 then
      Prompt_Text :=
        VSS.Strings.Conversions.To_Virtual_String
          (Ada.Command_Line.Argument (1));
   end if;

   declare
      Input  : ACP.Types.InitializeRequest;
      Output : ACP.Types.InitializeResponse;
   begin
      Input.protocolVersion := 2;
      Input.info.name := "ada-acp-client";
      Input.info.version := "0.1.0";
      declare
         Result : constant Value :=
           Call
             (Integer_Value (1),
              "initialize",
              Initialize_Requests.Encode (Input));
      begin
         if not Is_Integer (Member (Result, "protocolVersion"))
           or else not Is_String (Member (Member (Result, "info"), "name"))
           or else not Is_String (Member (Member (Result, "info"), "version"))
           or else not Initialize_Replies.Decode (Result, Output)
           or else Output.protocolVersion /= 2
           or else not Output.capabilities.Is_Set
           or else not Output.capabilities.Value.session.Is_Set
         then
            raise Ada.IO_Exceptions.Data_Error
              with "agent does not support ACP v2 sessions";
         end if;
      end;
      Report ("Protocol: ACP v2");
   end;

   declare
      Input  : ACP.Types.NewSessionRequest;
      Output : ACP.Types.NewSessionResponse;
   begin
      Input.cwd := "/";
      declare
         Result : constant Value :=
           Call
             (String_Value ("new"),
              "session/new",
              New_Requests.Encode (Input));
      begin
         if not Is_String (Member (Result, "sessionId"))
           or else not New_Replies.Decode (Result, Output)
           or else Output.sessionId.Is_Empty
           or else (not Session_ID.Is_Empty and Session_ID /= Output.sessionId)
         then
            raise Ada.IO_Exceptions.Data_Error
              with "invalid session/new result";
         end if;
      end;
      Session_ID := Output.sessionId;
      Report ("Session: " & Session_ID);
   end;

   declare
      Input   : ACP.Types.PromptRequest;
      Output  : ACP.Types.PromptResponse;
      Content : Value := Array_Value;
      Block   : Value := Object_Value;
   begin
      Input.sessionId := Session_ID;
      Add (Block, "type", String_Value ("text"));
      Add (Block, "text", String_Value (Prompt_Text));
      Append (Content, Block);
      for Event of Content loop
         Input.prompt.Append (Event);
      end loop;
      declare
         Result : constant Value :=
           Call
             (String_Value ("prompt"),
              "session/prompt",
              Prompt_Requests.Encode (Input));
      begin
         if not Is_String (Member (Result, "messageId"))
           or else not Prompt_Replies.Decode (Result, Output)
           or else Output.messageId.Is_Empty
         then
            raise Ada.IO_Exceptions.Data_Error
              with "missing accepted messageId";
         end if;
      end;
      --  Completion can precede or follow the prompt response.
      while not Idle or not User_Echo or not Agent_Echo loop
         Notification (Receive);
      end loop;
      if User_Message /= Output.messageId or Stop_Reason /= "end_turn" then
         raise Ada.IO_Exceptions.Data_Error
           with "inconsistent prompt completion";
      end if;
      Report ("Prompt: " & Output.messageId);
      Report ("Echo: " & Prompt_Text);
      Report ("State: idle (end_turn)");
   end;

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
exception
   when Error : others =>
      Report
        ("acp_client_demo: "
         & VSS.Strings.Conversions.To_Virtual_String
             (Ada.Exceptions.Exception_Message (Error)));
      Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Failure);
end ACP_Client_Demo;
