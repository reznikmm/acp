--  SPDX-FileCopyrightText: 2026 Max Reznik <reznikmm@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--
--  Generated from the ACP v2 schema. See schema/README.md.

pragma Ada_2022;
with ACP.Key_Lookups;

package body ACP.Types.Inputs is
   pragma Style_Checks (Off);
   use type VSS.JSON.JSON_Number_Kind;
   use type VSS.Strings.Virtual_String;

   procedure Input_Any_Value
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Any_Value'Class;
      Success : in out Boolean)
   is
      use type VSS.JSON.Streams.JSON_Stream_Element_Kind;
   begin
      case Reader.Element_Kind is
         when VSS.JSON.Streams.Start_Array  =>
            Value.Append ((Kind => VSS.JSON.Streams.Start_Array));
            Reader.Read_Next;
            while Success and Reader.Element_Kind /= VSS.JSON.Streams.End_Array
            loop
               Input_Any_Value (Reader, Value, Success);
            end loop;
            Value.Append ((Kind => VSS.JSON.Streams.End_Array));

         when VSS.JSON.Streams.Start_Object =>
            Value.Append ((Kind => VSS.JSON.Streams.Start_Object));
            Reader.Read_Next;
            while Success and Reader.Element_Kind = VSS.JSON.Streams.Key_Name
            loop
               Value.Append (Reader.Element);
               Reader.Read_Next;
               Input_Any_Value (Reader, Value, Success);
            end loop;
            Value.Append ((Kind => VSS.JSON.Streams.End_Object));

         when VSS.JSON.Streams.String_Value
            | VSS.JSON.Streams.Number_Value
            | VSS.JSON.Streams.Boolean_Value
            | VSS.JSON.Streams.Null_Value   =>
            Value.Append (Reader.Element);

         when others                        =>
            Success := False;
      end case;
      if Success then
         Reader.Read_Next;
      end if;
   end Input_Any_Value;

   package SetSessionConfigOptionRequest_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["sessionId", "configId", "_meta"]);

   procedure Input_SetSessionConfigOptionRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SetSessionConfigOptionRequest;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 SetSessionConfigOptionRequest_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  sessionId
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.sessionId := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  configId
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.configId := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_SetSessionConfigOptionRequest;

   package LoginAuthRequest_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["methodId", "_meta"]);

   procedure Input_LoginAuthRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out LoginAuthRequest;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 LoginAuthRequest_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  methodId
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.methodId := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_LoginAuthRequest;

   package SessionConfigBoolean_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["currentValue"]);

   procedure Input_SessionConfigBoolean
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SessionConfigBoolean;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 SessionConfigBoolean_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  currentValue
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Boolean_Value then
                           Value.currentValue := Reader.Boolean_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_SessionConfigBoolean;

   package TerminalOutputChunk_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["terminalId", "data", "_meta"]);

   procedure Input_TerminalOutputChunk
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out TerminalOutputChunk;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 TerminalOutputChunk_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  terminalId
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.terminalId := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  data
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.data := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_TerminalOutputChunk;

   package DiffPatch_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["format", "text", "_meta"]);

   procedure Input_DiffPatch
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out DiffPatch;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 DiffPatch_Minimal_Perfect_Hash.Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  format
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.format := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  text
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.text := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_DiffPatch;

   package AgentNotification_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["method", "params"]);

   procedure Input_AgentNotification
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out AgentNotification;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 AgentNotification_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  method
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.method := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  params
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value (Reader, Value.params, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_AgentNotification;

   package ElicitationAcceptAction_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["content"]);

   procedure Input_ElicitationAcceptAction
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ElicitationAcceptAction;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ElicitationAcceptAction_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  content
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.content, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ElicitationAcceptAction;

   procedure Input_UserMessage
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out UserMessage;
      Success : in out Boolean) is
   begin
      Input_Any_Value (Reader, Value, Success);
   end Input_UserMessage;

   package CloseSessionResponse_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["_meta"]);

   procedure Input_CloseSessionResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CloseSessionResponse;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 CloseSessionResponse_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_CloseSessionResponse;

   procedure Input_AgentMessage
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out AgentMessage;
      Success : in out Boolean) is
   begin
      Input_Any_Value (Reader, Value, Success);
   end Input_AgentMessage;

   package ToolCallCancelCapabilities_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["_meta"]);

   procedure Input_ToolCallCancelCapabilities
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ToolCallCancelCapabilities;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ToolCallCancelCapabilities_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ToolCallCancelCapabilities;

   package LogoutAuthRequest_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["_meta"]);

   procedure Input_LogoutAuthRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out LogoutAuthRequest;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 LogoutAuthRequest_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_LogoutAuthRequest;

   package ResumeSessionResponse_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["configOptions", "availableCommands", "_meta"]);

   procedure Input_ResumeSessionResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ResumeSessionResponse;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ResumeSessionResponse_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  configOptions
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Success and Reader.Is_Start_Array then
                           Reader.Read_Next;
                           Value.configOptions.Clear (Is_Null => False);
                           while Success and not Reader.Is_End_Array loop
                              declare
                                 Item : SessionConfigOption;
                              begin
                                 if Reader.Is_Null_Value then
                                    Reader.Read_Next;
                                 else
                                    Input_SessionConfigOption
                                      (Reader, Item, Success);
                                 end if;
                                 Value.configOptions.Append (Item);
                              end;
                           end loop;
                           if Success then
                              Reader.Read_Next;  --  skip End_Array

                           end if;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  availableCommands
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value
                          (Reader, Value.availableCommands, Success);
                     end if;

                  when 3      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ResumeSessionResponse;

   package CloseSessionRequest_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["sessionId", "_meta"]);

   procedure Input_CloseSessionRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CloseSessionRequest;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 CloseSessionRequest_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  sessionId
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.sessionId := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_CloseSessionRequest;

   package DiffChange_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["fileType", "mimeType", "_meta"]);

   procedure Input_DiffChange
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out DiffChange;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 DiffChange_Minimal_Perfect_Hash.Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  fileType
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.fileType := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  mimeType
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.mimeType := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_DiffChange;

   package TerminalCancelCapabilities_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["_meta"]);

   procedure Input_TerminalCancelCapabilities
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out TerminalCancelCapabilities;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 TerminalCancelCapabilities_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_TerminalCancelCapabilities;

   procedure Input_CompactionUpdate
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CompactionUpdate;
      Success : in out Boolean) is
   begin
      Input_Any_Value (Reader, Value, Success);
   end Input_CompactionUpdate;

   package PromptResponse_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["messageId", "_meta"]);

   procedure Input_PromptResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out PromptResponse;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 PromptResponse_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  messageId
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.messageId := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_PromptResponse;

   procedure Input_ToolCallContent
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ToolCallContent;
      Success : in out Boolean) is
   begin
      Input_Any_Value (Reader, Value, Success);
   end Input_ToolCallContent;

   procedure Input_EmbeddedResourceResource
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out EmbeddedResourceResource;
      Success : in out Boolean) is
   begin
      Input_Any_Value (Reader, Value, Success);
   end Input_EmbeddedResourceResource;

   package ClientAuthCapabilities_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["terminal", "_meta"]);

   procedure Input_ClientAuthCapabilities
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ClientAuthCapabilities;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ClientAuthCapabilities_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  terminal
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.terminal := (Is_Set => True, Value => <>);
                        Input_TerminalAuthCapabilities
                          (Reader, Value.terminal.Value, Success);
                     end if;

                  when 2      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ClientAuthCapabilities;

   package McpHttpCapabilities_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["_meta"]);

   procedure Input_McpHttpCapabilities
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out McpHttpCapabilities;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 McpHttpCapabilities_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_McpHttpCapabilities;

   package PromptEmbeddedContextCapabilities_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["_meta"]);

   procedure Input_PromptEmbeddedContextCapabilities
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out PromptEmbeddedContextCapabilities;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 PromptEmbeddedContextCapabilities_Minimal_Perfect_Hash
                   .Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_PromptEmbeddedContextCapabilities;

   procedure Input_AvailableCommandInput
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out AvailableCommandInput;
      Success : in out Boolean) is
   begin
      Input_Any_Value (Reader, Value, Success);
   end Input_AvailableCommandInput;

   package PromptCapabilities_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["image", "audio", "embeddedContext", "_meta"]);

   procedure Input_PromptCapabilities
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out PromptCapabilities;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 PromptCapabilities_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  image
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.image := (Is_Set => True, Value => <>);
                        Input_PromptImageCapabilities
                          (Reader, Value.image.Value, Success);
                     end if;

                  when 2      =>
                     --  audio
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.audio := (Is_Set => True, Value => <>);
                        Input_PromptAudioCapabilities
                          (Reader, Value.audio.Value, Success);
                     end if;

                  when 3      =>
                     --  embeddedContext
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.embeddedContext := (Is_Set => True, Value => <>);
                        Input_PromptEmbeddedContextCapabilities
                          (Reader, Value.embeddedContext.Value, Success);
                     end if;

                  when 4      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_PromptCapabilities;

   package ImageContent_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["data", "mimeType", "uri", "annotations", "_meta"]);

   procedure Input_ImageContent
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ImageContent;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ImageContent_Minimal_Perfect_Hash.Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  data
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.data := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  mimeType
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.mimeType := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  uri
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.uri := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  annotations
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.annotations := (Is_Set => True, Value => <>);
                        Input_Annotations
                          (Reader, Value.annotations.Value, Success);
                     end if;

                  when 5      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ImageContent;

   package SessionCapabilities_Minimal_Perfect_Hash is new
     ACP.Key_Lookups
       (["prompt",
         "mcp",
         "delete",
         "additionalDirectories",
         "systemPrompt",
         "_meta"]);

   procedure Input_SessionCapabilities
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SessionCapabilities;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 SessionCapabilities_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  prompt
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.prompt := (Is_Set => True, Value => <>);
                        Input_PromptCapabilities
                          (Reader, Value.prompt.Value, Success);
                     end if;

                  when 2      =>
                     --  mcp
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.mcp := (Is_Set => True, Value => <>);
                        Input_McpCapabilities
                          (Reader, Value.mcp.Value, Success);
                     end if;

                  when 3      =>
                     --  delete
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.delete := (Is_Set => True, Value => <>);
                        Input_SessionDeleteCapabilities
                          (Reader, Value.delete.Value, Success);
                     end if;

                  when 4      =>
                     --  additionalDirectories
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.additionalDirectories :=
                          (Is_Set => True, Value => <>);
                        Input_SessionAdditionalDirectoriesCapabilities
                          (Reader, Value.additionalDirectories.Value, Success);
                     end if;

                  when 5      =>
                     --  systemPrompt
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.systemPrompt := (Is_Set => True, Value => <>);
                        Input_SessionSystemPromptCapabilities
                          (Reader, Value.systemPrompt.Value, Success);
                     end if;

                  when 6      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_SessionCapabilities;

   package ElicitationRequestScope_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["requestId"]);

   procedure Input_ElicitationRequestScope
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ElicitationRequestScope;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ElicitationRequestScope_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  requestId
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.requestId := (False, Integer => <>);
                        if Reader.Is_String_Value then
                           Value.requestId := (True, Reader.String_Value);
                           Reader.Read_Next;
                        elsif Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           if Reader.Is_Number_Value
                             and then Reader.Number_Value.Kind
                                      = VSS.JSON.JSON_Integer
                           then
                              Value.requestId.Integer :=
                                Reader.Number_Value.Integer_Value;
                              Reader.Read_Next;
                           else
                              Success := False;
                           end if;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ElicitationRequestScope;

   package SessionSystemPromptCapabilities_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["mode", "_meta"]);

   procedure Input_SessionSystemPromptCapabilities
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SessionSystemPromptCapabilities;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 SessionSystemPromptCapabilities_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  mode
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.mode := (Is_Set => True, Value => <>);
                        Input_SessionSystemPromptModeCapabilities
                          (Reader, Value.mode.Value, Success);
                     end if;

                  when 2      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_SessionSystemPromptCapabilities;

   package DiffPathChange_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["path"]);

   procedure Input_DiffPathChange
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out DiffPathChange;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 DiffPathChange_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  path
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.path := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_DiffPathChange;

   package CreateElicitationRequest_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["message", "_meta"]);

   procedure Input_CreateElicitationRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CreateElicitationRequest;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 CreateElicitationRequest_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  message
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.message := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_CreateElicitationRequest;

   package IdleStateUpdate_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["background", "_meta", "stopReason"]);

   procedure Input_IdleStateUpdate
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out IdleStateUpdate;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 IdleStateUpdate_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  background
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value (Reader, Value.background, Success);
                     end if;

                  when 2      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when 3      =>
                     --  stopReason
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.stopReason := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_IdleStateUpdate;

   procedure Input_BackgroundWork
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out BackgroundWork;
      Success : in out Boolean) is
   begin
      Input_Any_Value (Reader, Value, Success);
   end Input_BackgroundWork;

   package SessionNotFoundErrorData_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["sessionId", "_meta"]);

   procedure Input_SessionNotFoundErrorData
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SessionNotFoundErrorData;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 SessionNotFoundErrorData_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  sessionId
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.sessionId := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_SessionNotFoundErrorData;

   package RequestPermissionResponse_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["outcome", "_meta"]);

   procedure Input_RequestPermissionResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out RequestPermissionResponse;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 RequestPermissionResponse_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  outcome
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_RequestPermissionOutcome
                          (Reader, Value.outcome, Success);
                     end if;

                  when 2      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_RequestPermissionResponse;

   package ElicitationUrlMode_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["elicitationId", "url"]);

   procedure Input_ElicitationUrlMode
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ElicitationUrlMode;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ElicitationUrlMode_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  elicitationId
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.elicitationId := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  url
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.url := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ElicitationUrlMode;

   procedure Input_RequestPermissionSubject
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out RequestPermissionSubject;
      Success : in out Boolean) is
   begin
      Input_Any_Value (Reader, Value, Success);
   end Input_RequestPermissionSubject;

   package PromptAudioCapabilities_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["_meta"]);

   procedure Input_PromptAudioCapabilities
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out PromptAudioCapabilities;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 PromptAudioCapabilities_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_PromptAudioCapabilities;

   package ClientRequest_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["id", "method", "params"]);

   procedure Input_ClientRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ClientRequest;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ClientRequest_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  id
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.id := (False, Integer => <>);
                        if Reader.Is_String_Value then
                           Value.id := (True, Reader.String_Value);
                           Reader.Read_Next;
                        elsif Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           if Reader.Is_Number_Value
                             and then Reader.Number_Value.Kind
                                      = VSS.JSON.JSON_Integer
                           then
                              Value.id.Integer :=
                                Reader.Number_Value.Integer_Value;
                              Reader.Read_Next;
                           else
                              Success := False;
                           end if;
                        end if;
                     end if;

                  when 2      =>
                     --  method
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.method := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  params
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value (Reader, Value.params, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ClientRequest;

   procedure Input_ContentBlock
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ContentBlock;
      Success : in out Boolean) is
   begin
      Input_Any_Value (Reader, Value, Success);
   end Input_ContentBlock;

   package RequestPermissionRequest_Minimal_Perfect_Hash is new
     ACP.Key_Lookups
       (["sessionId", "title", "description", "subject", "options", "_meta"]);

   procedure Input_RequestPermissionRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out RequestPermissionRequest;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 RequestPermissionRequest_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  sessionId
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.sessionId := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  title
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.title := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  description
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.description := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  subject
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.subject := (Is_Set => True, Value => <>);
                        Input_RequestPermissionSubject
                          (Reader, Value.subject.Value, Success);
                     end if;

                  when 5      =>
                     --  options
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Success and Reader.Is_Start_Array then
                           Reader.Read_Next;
                           Value.options.Clear (Is_Null => False);
                           while Success and not Reader.Is_End_Array loop
                              declare
                                 Item : PermissionOption;
                              begin
                                 if Reader.Is_Null_Value then
                                    Reader.Read_Next;
                                 else
                                    Input_PermissionOption
                                      (Reader, Item, Success);
                                 end if;
                                 Value.options.Append (Item);
                              end;
                           end loop;
                           if Success then
                              Reader.Read_Next;  --  skip End_Array

                           end if;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 6      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_RequestPermissionRequest;

   package StringPropertySchema_Minimal_Perfect_Hash is new
     ACP.Key_Lookups
       (["title",
         "description",
         "minLength",
         "maxLength",
         "pattern",
         "format",
         "default",
         "enum",
         "oneOf",
         "_meta"]);

   procedure Input_StringPropertySchema
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out StringPropertySchema;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 StringPropertySchema_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  title
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.title := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  description
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.description := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  minLength
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value (Reader, Value.minLength, Success);
                     end if;

                  when 4      =>
                     --  maxLength
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value (Reader, Value.maxLength, Success);
                     end if;

                  when 5      =>
                     --  pattern
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.pattern := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 6      =>
                     --  format
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.format := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 7      =>
                     --  default
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.default := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 8      =>
                     --  enum
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value (Reader, Value.enum, Success);
                     end if;

                  when 9      =>
                     --  oneOf
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value (Reader, Value.oneOf, Success);
                     end if;

                  when 10     =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_StringPropertySchema;

   procedure Input_TerminalUpdate
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out TerminalUpdate;
      Success : in out Boolean) is
   begin
      Input_Any_Value (Reader, Value, Success);
   end Input_TerminalUpdate;

   package DiffPathPairChange_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["oldPath", "path"]);

   procedure Input_DiffPathPairChange
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out DiffPathPairChange;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 DiffPathPairChange_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  oldPath
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.oldPath := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  path
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.path := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_DiffPathPairChange;

   procedure Input_SessionInfoUpdate
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SessionInfoUpdate;
      Success : in out Boolean) is
   begin
      Input_Any_Value (Reader, Value, Success);
   end Input_SessionInfoUpdate;

   package LogoutAuthResponse_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["_meta"]);

   procedure Input_LogoutAuthResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out LogoutAuthResponse;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 LogoutAuthResponse_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_LogoutAuthResponse;

   procedure Input_ErrorCode
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ErrorCode;
      Success : in out Boolean) is
   begin
      Input_Any_Value (Reader, Value, Success);
   end Input_ErrorCode;

   package EmbeddedResource_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["resource", "annotations", "_meta"]);

   procedure Input_EmbeddedResource
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out EmbeddedResource;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 EmbeddedResource_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  resource
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_EmbeddedResourceResource
                          (Reader, Value.resource, Success);
                     end if;

                  when 2      =>
                     --  annotations
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.annotations := (Is_Set => True, Value => <>);
                        Input_Annotations
                          (Reader, Value.annotations.Value, Success);
                     end if;

                  when 3      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_EmbeddedResource;

   package ToolCallContentChunk_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["toolCallId", "content", "_meta"]);

   procedure Input_ToolCallContentChunk
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ToolCallContentChunk;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ToolCallContentChunk_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  toolCallId
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.toolCallId := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  content
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_ToolCallContent (Reader, Value.content, Success);
                     end if;

                  when 3      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ToolCallContentChunk;

   package AgentCapabilities_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["session", "auth", "_meta"]);

   procedure Input_AgentCapabilities
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out AgentCapabilities;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 AgentCapabilities_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  session
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.session := (Is_Set => True, Value => <>);
                        Input_SessionCapabilities
                          (Reader, Value.session.Value, Success);
                     end if;

                  when 2      =>
                     --  auth
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.auth := (Is_Set => True, Value => <>);
                        Input_AgentAuthCapabilities
                          (Reader, Value.auth.Value, Success);
                     end if;

                  when 3      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_AgentCapabilities;

   package AudioContent_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["data", "mimeType", "annotations", "_meta"]);

   procedure Input_AudioContent
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out AudioContent;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 AudioContent_Minimal_Perfect_Hash.Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  data
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.data := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  mimeType
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.mimeType := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  annotations
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.annotations := (Is_Set => True, Value => <>);
                        Input_Annotations
                          (Reader, Value.annotations.Value, Success);
                     end if;

                  when 4      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_AudioContent;

   package RunningStateUpdate_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["background", "_meta"]);

   procedure Input_RunningStateUpdate
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out RunningStateUpdate;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 RunningStateUpdate_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  background
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value (Reader, Value.background, Success);
                     end if;

                  when 2      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_RunningStateUpdate;

   package PlanEntry_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["content", "priority", "status", "_meta"]);

   procedure Input_PlanEntry
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out PlanEntry;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 PlanEntry_Minimal_Perfect_Hash.Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  content
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.content := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  priority
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.priority := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  status
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.status := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_PlanEntry;

   package BackgroundTerminal_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["terminalId", "_meta"]);

   procedure Input_BackgroundTerminal
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out BackgroundTerminal;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 BackgroundTerminal_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  terminalId
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.terminalId := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_BackgroundTerminal;

   package Cost_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["amount", "currency", "_meta"]);

   procedure Input_Cost
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Cost;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 Cost_Minimal_Perfect_Hash.Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  amount
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Number_Value then
                           if Reader.Number_Value.Kind = VSS.JSON.JSON_Integer
                           then
                              Value.amount :=
                                Float_64 (Reader.Number_Value.Integer_Value);
                           elsif Reader.Number_Value.Kind = VSS.JSON.JSON_Float
                           then
                              Value.amount := Reader.Number_Value.Float_Value;
                           else
                              Success := False;
                           end if;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  currency
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.currency := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_Cost;

   package SessionDeleteCapabilities_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["_meta"]);

   procedure Input_SessionDeleteCapabilities
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SessionDeleteCapabilities;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 SessionDeleteCapabilities_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_SessionDeleteCapabilities;

   package NewSessionRequest_Minimal_Perfect_Hash is new
     ACP.Key_Lookups
       (["cwd",
         "additionalDirectories",
         "mcpServers",
         "systemPrompt",
         "_meta"]);

   procedure Input_NewSessionRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out NewSessionRequest;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 NewSessionRequest_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  cwd
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.cwd := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  additionalDirectories
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Success and Reader.Is_Start_Array then
                           Reader.Read_Next;
                           Value.additionalDirectories.Clear;
                           while Success and not Reader.Is_End_Array loop
                              declare
                                 Item : VSS.Strings.Virtual_String;
                              begin
                                 if Reader.Is_Null_Value then
                                    Reader.Read_Next;
                                 else
                                    if Reader.Is_String_Value then
                                       Item := Reader.String_Value;
                                       Reader.Read_Next;
                                    else
                                       Success := False;
                                    end if;
                                 end if;
                                 Value.additionalDirectories.Append (Item);
                              end;
                           end loop;
                           if Success then
                              Reader.Read_Next;  --  skip End_Array

                           end if;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  mcpServers
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value (Reader, Value.mcpServers, Success);
                     end if;

                  when 4      =>
                     --  systemPrompt
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.systemPrompt := (Is_Set => True, Value => <>);
                        Input_SystemPrompt
                          (Reader, Value.systemPrompt.Value, Success);
                     end if;

                  when 5      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_NewSessionRequest;

   package SessionConfigSelectGroup_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["groupId", "name", "options", "_meta"]);

   procedure Input_SessionConfigSelectGroup
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SessionConfigSelectGroup;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 SessionConfigSelectGroup_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  groupId
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.groupId := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  name
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.name := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  options
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Success and Reader.Is_Start_Array then
                           Reader.Read_Next;
                           Value.options.Clear (Is_Null => False);
                           while Success and not Reader.Is_End_Array loop
                              declare
                                 Item : SessionConfigSelectOption;
                              begin
                                 if Reader.Is_Null_Value then
                                    Reader.Read_Next;
                                 else
                                    Input_SessionConfigSelectOption
                                      (Reader, Item, Success);
                                 end if;
                                 Value.options.Append (Item);
                              end;
                           end loop;
                           if Success then
                              Reader.Read_Next;  --  skip End_Array

                           end if;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_SessionConfigSelectGroup;

   package Content_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["content", "_meta"]);

   procedure Input_Content
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Content;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 Content_Minimal_Perfect_Hash.Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  content
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_ContentBlock (Reader, Value.content, Success);
                     end if;

                  when 2      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_Content;

   package IntegerPropertySchema_Minimal_Perfect_Hash is new
     ACP.Key_Lookups
       (["title", "description", "minimum", "maximum", "default", "_meta"]);

   procedure Input_IntegerPropertySchema
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out IntegerPropertySchema;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 IntegerPropertySchema_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  title
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.title := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  description
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.description := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  minimum
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value (Reader, Value.minimum, Success);
                     end if;

                  when 4      =>
                     --  maximum
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value (Reader, Value.maximum, Success);
                     end if;

                  when 5      =>
                     --  default
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value (Reader, Value.default, Success);
                     end if;

                  when 6      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_IntegerPropertySchema;

   package UpdateSessionNotification_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["sessionId", "update", "_meta"]);

   procedure Input_UpdateSessionNotification
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out UpdateSessionNotification;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 UpdateSessionNotification_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  sessionId
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.sessionId := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  update
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_SessionUpdate (Reader, Value.update, Success);
                     end if;

                  when 3      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_UpdateSessionNotification;

   procedure Input_ToolCallUpdate
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ToolCallUpdate;
      Success : in out Boolean) is
   begin
      Input_Any_Value (Reader, Value, Success);
   end Input_ToolCallUpdate;

   package SessionAdditionalDirectoriesCapabilities_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["_meta"]);

   procedure Input_SessionAdditionalDirectoriesCapabilities
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SessionAdditionalDirectoriesCapabilities;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 SessionAdditionalDirectoriesCapabilities_Minimal_Perfect_Hash
                   .Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_SessionAdditionalDirectoriesCapabilities;

   package SessionConfigOption_Minimal_Perfect_Hash is new
     ACP.Key_Lookups
       (["configId", "name", "description", "category", "_meta"]);

   procedure Input_SessionConfigOption
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SessionConfigOption;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 SessionConfigOption_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  configId
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.configId := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  name
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.name := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  description
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.description := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  category
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.category := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 5      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_SessionConfigOption;

   package Annotations_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["audience", "lastModified", "priority", "_meta"]);

   procedure Input_Annotations
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Annotations;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 Annotations_Minimal_Perfect_Hash.Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  audience
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value (Reader, Value.audience, Success);
                     end if;

                  when 2      =>
                     --  lastModified
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.lastModified := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  priority
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value (Reader, Value.priority, Success);
                     end if;

                  when 4      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_Annotations;

   procedure Input_AvailableCommand
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out AvailableCommand;
      Success : in out Boolean) is
   begin
      Input_Any_Value (Reader, Value, Success);
   end Input_AvailableCommand;

   package Diff_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["changes", "patch", "_meta"]);

   procedure Input_Diff
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Diff;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 Diff_Minimal_Perfect_Hash.Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  changes
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Success and Reader.Is_Start_Array then
                           Reader.Read_Next;
                           Value.changes.Clear (Is_Null => False);
                           while Success and not Reader.Is_End_Array loop
                              declare
                                 Item : DiffChange;
                              begin
                                 if Reader.Is_Null_Value then
                                    Reader.Read_Next;
                                 else
                                    Input_DiffChange (Reader, Item, Success);
                                 end if;
                                 Value.changes.Append (Item);
                              end;
                           end loop;
                           if Success then
                              Reader.Read_Next;  --  skip End_Array

                           end if;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  patch
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.patch := (Is_Set => True, Value => <>);
                        Input_DiffPatch (Reader, Value.patch.Value, Success);
                     end if;

                  when 3      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_Diff;

   package AuthMethodTerminal_Minimal_Perfect_Hash is new
     ACP.Key_Lookups
       (["methodId", "name", "description", "args", "env", "_meta"]);

   procedure Input_AuthMethodTerminal
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out AuthMethodTerminal;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 AuthMethodTerminal_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  methodId
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.methodId := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  name
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.name := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  description
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.description := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  args
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Success and Reader.Is_Start_Array then
                           Reader.Read_Next;
                           Value.args.Clear;
                           while Success and not Reader.Is_End_Array loop
                              declare
                                 Item : VSS.Strings.Virtual_String;
                              begin
                                 if Reader.Is_Null_Value then
                                    Reader.Read_Next;
                                 else
                                    if Reader.Is_String_Value then
                                       Item := Reader.String_Value;
                                       Reader.Read_Next;
                                    else
                                       Success := False;
                                    end if;
                                 end if;
                                 Value.args.Append (Item);
                              end;
                           end loop;
                           if Success then
                              Reader.Read_Next;  --  skip End_Array

                           end if;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 5      =>
                     --  env
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Success and Reader.Is_Start_Array then
                           Reader.Read_Next;
                           Value.env.Clear (Is_Null => False);
                           while Success and not Reader.Is_End_Array loop
                              declare
                                 Item : EnvVariable;
                              begin
                                 if Reader.Is_Null_Value then
                                    Reader.Read_Next;
                                 else
                                    Input_EnvVariable (Reader, Item, Success);
                                 end if;
                                 Value.env.Append (Item);
                              end;
                           end loop;
                           if Success then
                              Reader.Read_Next;  --  skip End_Array

                           end if;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 6      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_AuthMethodTerminal;

   package ElicitationCapabilities_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["form", "url", "_meta"]);

   procedure Input_ElicitationCapabilities
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ElicitationCapabilities;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ElicitationCapabilities_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  form
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.form := (Is_Set => True, Value => <>);
                        Input_ElicitationFormCapabilities
                          (Reader, Value.form.Value, Success);
                     end if;

                  when 2      =>
                     --  url
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.url := (Is_Set => True, Value => <>);
                        Input_ElicitationUrlCapabilities
                          (Reader, Value.url.Value, Success);
                     end if;

                  when 3      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ElicitationCapabilities;

   package TerminalExitStatus_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["exitCode", "signal", "_meta"]);

   procedure Input_TerminalExitStatus
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out TerminalExitStatus;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 TerminalExitStatus_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  exitCode
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value (Reader, Value.exitCode, Success);
                     end if;

                  when 2      =>
                     --  signal
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.signal := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_TerminalExitStatus;

   package DeleteSessionRequest_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["sessionId", "_meta"]);

   procedure Input_DeleteSessionRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out DeleteSessionRequest;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 DeleteSessionRequest_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  sessionId
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.sessionId := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_DeleteSessionRequest;

   package SystemPrompt_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["mode", "content", "_meta"]);

   procedure Input_SystemPrompt
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SystemPrompt;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 SystemPrompt_Minimal_Perfect_Hash.Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  mode
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.mode := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  content
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value (Reader, Value.content, Success);
                     end if;

                  when 3      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_SystemPrompt;

   package McpServerHttp_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["name", "url", "headers", "_meta"]);

   procedure Input_McpServerHttp
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out McpServerHttp;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 McpServerHttp_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  name
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.name := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  url
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.url := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  headers
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Success and Reader.Is_Start_Array then
                           Reader.Read_Next;
                           Value.headers.Clear (Is_Null => False);
                           while Success and not Reader.Is_End_Array loop
                              declare
                                 Item : HttpHeader;
                              begin
                                 if Reader.Is_Null_Value then
                                    Reader.Read_Next;
                                 else
                                    Input_HttpHeader (Reader, Item, Success);
                                 end if;
                                 Value.headers.Append (Item);
                              end;
                           end loop;
                           if Success then
                              Reader.Read_Next;  --  skip End_Array

                           end if;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_McpServerHttp;

   package CancelSessionNotification_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["sessionId", "_meta"]);

   procedure Input_CancelSessionNotification
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CancelSessionNotification;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 CancelSessionNotification_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  sessionId
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.sessionId := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_CancelSessionNotification;

   package PromptRequest_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["sessionId", "prompt", "_meta"]);

   procedure Input_PromptRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out PromptRequest;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 PromptRequest_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  sessionId
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.sessionId := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  prompt
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value (Reader, Value.prompt, Success);
                     end if;

                  when 3      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_PromptRequest;

   package CommandPermissionSubject_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["command", "cwd", "toolCallId", "terminalId", "_meta"]);

   procedure Input_CommandPermissionSubject
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CommandPermissionSubject;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 CommandPermissionSubject_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  command
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.command := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  cwd
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.cwd := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  toolCallId
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.toolCallId := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  terminalId
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.terminalId := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 5      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_CommandPermissionSubject;

   procedure Input_RequestPermissionOutcome
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out RequestPermissionOutcome;
      Success : in out Boolean) is
   begin
      Input_Any_Value (Reader, Value, Success);
   end Input_RequestPermissionOutcome;

   package DeleteSessionResponse_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["_meta"]);

   procedure Input_DeleteSessionResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out DeleteSessionResponse;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 DeleteSessionResponse_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_DeleteSessionResponse;

   procedure Input_AgentThought
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out AgentThought;
      Success : in out Boolean) is
   begin
      Input_Any_Value (Reader, Value, Success);
   end Input_AgentThought;

   package NewSessionResponse_Minimal_Perfect_Hash is new
     ACP.Key_Lookups
       (["sessionId", "configOptions", "availableCommands", "_meta"]);

   procedure Input_NewSessionResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out NewSessionResponse;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 NewSessionResponse_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  sessionId
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.sessionId := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  configOptions
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Success and Reader.Is_Start_Array then
                           Reader.Read_Next;
                           Value.configOptions.Clear (Is_Null => False);
                           while Success and not Reader.Is_End_Array loop
                              declare
                                 Item : SessionConfigOption;
                              begin
                                 if Reader.Is_Null_Value then
                                    Reader.Read_Next;
                                 else
                                    Input_SessionConfigOption
                                      (Reader, Item, Success);
                                 end if;
                                 Value.configOptions.Append (Item);
                              end;
                           end loop;
                           if Success then
                              Reader.Read_Next;  --  skip End_Array

                           end if;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  availableCommands
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value
                          (Reader, Value.availableCommands, Success);
                     end if;

                  when 4      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_NewSessionResponse;

   package CancelledPermissionOutcome_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["_meta"]);

   procedure Input_CancelledPermissionOutcome
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CancelledPermissionOutcome;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 CancelledPermissionOutcome_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_CancelledPermissionOutcome;

   package AvailableCommandsUpdate_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["availableCommands", "_meta"]);

   procedure Input_AvailableCommandsUpdate
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out AvailableCommandsUpdate;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 AvailableCommandsUpdate_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  availableCommands
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value
                          (Reader, Value.availableCommands, Success);
                     end if;

                  when 2      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_AvailableCommandsUpdate;

   package TitledMultiSelectItems_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["anyOf", "_meta"]);

   procedure Input_TitledMultiSelectItems
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out TitledMultiSelectItems;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 TitledMultiSelectItems_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  anyOf
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Success and Reader.Is_Start_Array then
                           Reader.Read_Next;
                           Value.anyOf.Clear (Is_Null => False);
                           while Success and not Reader.Is_End_Array loop
                              declare
                                 Item : EnumOption;
                              begin
                                 if Reader.Is_Null_Value then
                                    Reader.Read_Next;
                                 else
                                    Input_EnumOption (Reader, Item, Success);
                                 end if;
                                 Value.anyOf.Append (Item);
                              end;
                           end loop;
                           if Success then
                              Reader.Read_Next;  --  skip End_Array

                           end if;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_TitledMultiSelectItems;

   package McpCapabilities_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["stdio", "http", "_meta"]);

   procedure Input_McpCapabilities
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out McpCapabilities;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 McpCapabilities_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  stdio
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.stdio := (Is_Set => True, Value => <>);
                        Input_McpStdioCapabilities
                          (Reader, Value.stdio.Value, Success);
                     end if;

                  when 2      =>
                     --  http
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.http := (Is_Set => True, Value => <>);
                        Input_McpHttpCapabilities
                          (Reader, Value.http.Value, Success);
                     end if;

                  when 3      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_McpCapabilities;

   package ElicitationSessionScope_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["sessionId", "toolCallId"]);

   procedure Input_ElicitationSessionScope
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ElicitationSessionScope;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ElicitationSessionScope_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  sessionId
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.sessionId := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  toolCallId
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.toolCallId := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ElicitationSessionScope;

   package TerminalSize_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["cols", "rows", "_meta"]);

   procedure Input_TerminalSize
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out TerminalSize;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 TerminalSize_Minimal_Perfect_Hash.Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  cols
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Number_Value
                          and then Reader.Number_Value.Kind
                                   = VSS.JSON.JSON_Integer
                        then
                           Value.cols := Reader.Number_Value.Integer_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  rows
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Number_Value
                          and then Reader.Number_Value.Kind
                                   = VSS.JSON.JSON_Integer
                        then
                           Value.rows := Reader.Number_Value.Integer_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_TerminalSize;

   procedure Input_ElicitationContentValue
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ElicitationContentValue;
      Success : in out Boolean) is
   begin
      Input_Any_Value (Reader, Value, Success);
   end Input_ElicitationContentValue;

   package TextCommandInput_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["hint", "_meta"]);

   procedure Input_TextCommandInput
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out TextCommandInput;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 TextCommandInput_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  hint
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.hint := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_TextCommandInput;

   package ConfigOptionUpdate_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["configOptions", "_meta"]);

   procedure Input_ConfigOptionUpdate
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ConfigOptionUpdate;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ConfigOptionUpdate_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  configOptions
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Success and Reader.Is_Start_Array then
                           Reader.Read_Next;
                           Value.configOptions.Clear (Is_Null => False);
                           while Success and not Reader.Is_End_Array loop
                              declare
                                 Item : SessionConfigOption;
                              begin
                                 if Reader.Is_Null_Value then
                                    Reader.Read_Next;
                                 else
                                    Input_SessionConfigOption
                                      (Reader, Item, Success);
                                 end if;
                                 Value.configOptions.Append (Item);
                              end;
                           end loop;
                           if Success then
                              Reader.Read_Next;  --  skip End_Array

                           end if;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ConfigOptionUpdate;

   package CancelRequestNotification_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["requestId", "_meta"]);

   procedure Input_CancelRequestNotification
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CancelRequestNotification;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 CancelRequestNotification_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  requestId
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.requestId := (False, Integer => <>);
                        if Reader.Is_String_Value then
                           Value.requestId := (True, Reader.String_Value);
                           Reader.Read_Next;
                        elsif Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           if Reader.Is_Number_Value
                             and then Reader.Number_Value.Kind
                                      = VSS.JSON.JSON_Integer
                           then
                              Value.requestId.Integer :=
                                Reader.Number_Value.Integer_Value;
                              Reader.Read_Next;
                           else
                              Success := False;
                           end if;
                        end if;
                     end if;

                  when 2      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_CancelRequestNotification;

   package TerminalAuthCapabilities_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["_meta"]);

   procedure Input_TerminalAuthCapabilities
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out TerminalAuthCapabilities;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 TerminalAuthCapabilities_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_TerminalAuthCapabilities;

   package TextContent_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["text", "annotations", "_meta"]);

   procedure Input_TextContent
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out TextContent;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 TextContent_Minimal_Perfect_Hash.Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  text
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.text := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  annotations
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.annotations := (Is_Set => True, Value => <>);
                        Input_Annotations
                          (Reader, Value.annotations.Value, Success);
                     end if;

                  when 3      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_TextContent;

   package MultiSelectPropertySchema_Minimal_Perfect_Hash is new
     ACP.Key_Lookups
       (["title",
         "description",
         "minItems",
         "maxItems",
         "items",
         "default",
         "_meta"]);

   procedure Input_MultiSelectPropertySchema
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out MultiSelectPropertySchema;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 MultiSelectPropertySchema_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  title
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.title := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  description
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.description := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  minItems
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value (Reader, Value.minItems, Success);
                     end if;

                  when 4      =>
                     --  maxItems
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value (Reader, Value.maxItems, Success);
                     end if;

                  when 5      =>
                     --  items
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_MultiSelectItems (Reader, Value.items, Success);
                     end if;

                  when 6      =>
                     --  default
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value (Reader, Value.default, Success);
                     end if;

                  when 7      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_MultiSelectPropertySchema;

   package ContentChunk_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["messageId", "content", "_meta"]);

   procedure Input_ContentChunk
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ContentChunk;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ContentChunk_Minimal_Perfect_Hash.Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  messageId
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.messageId := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  content
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_ContentBlock (Reader, Value.content, Success);
                     end if;

                  when 3      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ContentChunk;

   package SessionConfigSelect_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["currentValue", "options"]);

   procedure Input_SessionConfigSelect
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SessionConfigSelect;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 SessionConfigSelect_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  currentValue
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.currentValue := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  options
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_SessionConfigSelectOptions
                          (Reader, Value.options, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_SessionConfigSelect;

   package ToolCallLocation_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["path", "line", "_meta"]);

   procedure Input_ToolCallLocation
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ToolCallLocation;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ToolCallLocation_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  path
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.path := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  line
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value (Reader, Value.line, Success);
                     end if;

                  when 3      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ToolCallLocation;

   package BooleanPropertySchema_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["title", "description", "default", "_meta"]);

   procedure Input_BooleanPropertySchema
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out BooleanPropertySchema;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 BooleanPropertySchema_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  title
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.title := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  description
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.description := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  default
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value (Reader, Value.default, Success);
                     end if;

                  when 4      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_BooleanPropertySchema;

   package SessionInfo_Minimal_Perfect_Hash is new
     ACP.Key_Lookups
       (["sessionId",
         "cwd",
         "additionalDirectories",
         "title",
         "updatedAt",
         "_meta"]);

   procedure Input_SessionInfo
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SessionInfo;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 SessionInfo_Minimal_Perfect_Hash.Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  sessionId
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.sessionId := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  cwd
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.cwd := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  additionalDirectories
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Success and Reader.Is_Start_Array then
                           Reader.Read_Next;
                           Value.additionalDirectories.Clear;
                           while Success and not Reader.Is_End_Array loop
                              declare
                                 Item : VSS.Strings.Virtual_String;
                              begin
                                 if Reader.Is_Null_Value then
                                    Reader.Read_Next;
                                 else
                                    if Reader.Is_String_Value then
                                       Item := Reader.String_Value;
                                       Reader.Read_Next;
                                    else
                                       Success := False;
                                    end if;
                                 end if;
                                 Value.additionalDirectories.Append (Item);
                              end;
                           end loop;
                           if Success then
                              Reader.Read_Next;  --  skip End_Array

                           end if;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  title
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.title := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 5      =>
                     --  updatedAt
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.updatedAt := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 6      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_SessionInfo;

   package Error_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["code", "message", "data"]);

   procedure Input_Error
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Error;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 Error_Minimal_Perfect_Hash.Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  code
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_ErrorCode (Reader, Value.code, Success);
                     end if;

                  when 2      =>
                     --  message
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.message := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  data
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.data := (Is_Set => True, Value => <>);
                        Input_ErrorData (Reader, Value.data.Value, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_Error;

   procedure Input_ClientResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ClientResponse;
      Success : in out Boolean) is
   begin
      Input_Any_Value (Reader, Value, Success);
   end Input_ClientResponse;

   package PlanUpdate_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["plan", "_meta"]);

   procedure Input_PlanUpdate
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out PlanUpdate;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 PlanUpdate_Minimal_Perfect_Hash.Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  plan
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_PlanUpdateContent (Reader, Value.plan, Success);
                     end if;

                  when 2      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_PlanUpdate;

   package ElicitationFormMode_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["requestedSchema"]);

   procedure Input_ElicitationFormMode
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ElicitationFormMode;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ElicitationFormMode_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  requestedSchema
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_ElicitationSchema
                          (Reader, Value.requestedSchema, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ElicitationFormMode;

   package ListSessionsRequest_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["cwd", "cursor", "_meta"]);

   procedure Input_ListSessionsRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ListSessionsRequest;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ListSessionsRequest_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  cwd
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.cwd := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  cursor
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.cursor := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ListSessionsRequest;

   package UnsupportedProtocolVersionErrorData_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["requested", "supported", "_meta"]);

   procedure Input_UnsupportedProtocolVersionErrorData
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out UnsupportedProtocolVersionErrorData;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 UnsupportedProtocolVersionErrorData_Minimal_Perfect_Hash
                   .Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  requested
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Number_Value
                          and then Reader.Number_Value.Kind
                                   = VSS.JSON.JSON_Integer
                        then
                           Value.requested :=
                             Reader.Number_Value.Integer_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  supported
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Success and Reader.Is_Start_Array then
                           Reader.Read_Next;
                           Value.supported.Clear (Is_Null => False);
                           while Success and not Reader.Is_End_Array loop
                              declare
                                 Item : Integer_64;
                              begin
                                 if Reader.Is_Null_Value then
                                    Reader.Read_Next;
                                 else
                                    if Reader.Is_Number_Value
                                      and then Reader.Number_Value.Kind
                                               = VSS.JSON.JSON_Integer
                                    then
                                       Item :=
                                         Reader.Number_Value.Integer_Value;
                                       Reader.Read_Next;
                                    else
                                       Success := False;
                                    end if;
                                 end if;
                                 Value.supported.Append (Item);
                              end;
                           end loop;
                           if Success then
                              Reader.Read_Next;  --  skip End_Array

                           end if;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_UnsupportedProtocolVersionErrorData;

   package AgentAuthCapabilities_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["_meta"]);

   procedure Input_AgentAuthCapabilities
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out AgentAuthCapabilities;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 AgentAuthCapabilities_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_AgentAuthCapabilities;

   package CancelToolCallRequest_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["sessionId", "toolCallId", "_meta"]);

   procedure Input_CancelToolCallRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CancelToolCallRequest;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 CancelToolCallRequest_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  sessionId
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.sessionId := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  toolCallId
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.toolCallId := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_CancelToolCallRequest;

   procedure Input_SessionConfigSelectOptions
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SessionConfigSelectOptions;
      Success : in out Boolean) is
   begin
      Input_Any_Value (Reader, Value, Success);
   end Input_SessionConfigSelectOptions;

   package SetSessionConfigOptionResponse_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["configOptions", "_meta"]);

   procedure Input_SetSessionConfigOptionResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SetSessionConfigOptionResponse;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 SetSessionConfigOptionResponse_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  configOptions
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Success and Reader.Is_Start_Array then
                           Reader.Read_Next;
                           Value.configOptions.Clear (Is_Null => False);
                           while Success and not Reader.Is_End_Array loop
                              declare
                                 Item : SessionConfigOption;
                              begin
                                 if Reader.Is_Null_Value then
                                    Reader.Read_Next;
                                 else
                                    Input_SessionConfigOption
                                      (Reader, Item, Success);
                                 end if;
                                 Value.configOptions.Append (Item);
                              end;
                           end loop;
                           if Success then
                              Reader.Read_Next;  --  skip End_Array

                           end if;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_SetSessionConfigOptionResponse;

   procedure Input_AuthMethod
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out AuthMethod;
      Success : in out Boolean) is
   begin
      Input_Any_Value (Reader, Value, Success);
   end Input_AuthMethod;

   package TerminalOutput_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["data", "_meta"]);

   procedure Input_TerminalOutput
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out TerminalOutput;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 TerminalOutput_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  data
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.data := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_TerminalOutput;

   package Command_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["name", "description", "input", "_meta"]);

   procedure Input_Command
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Command;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 Command_Minimal_Perfect_Hash.Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  name
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.name := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  description
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.description := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  input
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.input := (Is_Set => True, Value => <>);
                        Input_AvailableCommandInput
                          (Reader, Value.input.Value, Success);
                     end if;

                  when 4      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_Command;

   package McpStdioCapabilities_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["_meta"]);

   procedure Input_McpStdioCapabilities
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out McpStdioCapabilities;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 McpStdioCapabilities_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_McpStdioCapabilities;

   package ElicitationSchema_Minimal_Perfect_Hash is new
     ACP.Key_Lookups
       (["type", "title", "properties", "required", "description", "_meta"]);

   procedure Input_ElicitationSchema
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ElicitationSchema;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ElicitationSchema_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  type
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_ElicitationSchemaType
                          (Reader, Value.a_type, Success);
                     end if;

                  when 2      =>
                     --  title
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.title := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  properties
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.properties, Success);
                        end if;
                     end if;

                  when 4      =>
                     --  required
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value (Reader, Value.required, Success);
                     end if;

                  when 5      =>
                     --  description
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.description := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 6      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ElicitationSchema;

   package TextResourceContents_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["text", "uri", "mimeType", "_meta"]);

   procedure Input_TextResourceContents
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out TextResourceContents;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 TextResourceContents_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  text
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.text := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  uri
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.uri := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  mimeType
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.mimeType := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_TextResourceContents;

   package ListSessionsResponse_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["sessions", "nextCursor", "_meta"]);

   procedure Input_ListSessionsResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ListSessionsResponse;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ListSessionsResponse_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  sessions
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Success and Reader.Is_Start_Array then
                           Reader.Read_Next;
                           Value.sessions.Clear (Is_Null => False);
                           while Success and not Reader.Is_End_Array loop
                              declare
                                 Item : SessionInfo;
                              begin
                                 if Reader.Is_Null_Value then
                                    Reader.Read_Next;
                                 else
                                    Input_SessionInfo (Reader, Item, Success);
                                 end if;
                                 Value.sessions.Append (Item);
                              end;
                           end loop;
                           if Success then
                              Reader.Read_Next;  --  skip End_Array

                           end if;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  nextCursor
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.nextCursor := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ListSessionsResponse;

   package Terminal_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["terminalId", "_meta"]);

   procedure Input_Terminal
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Terminal;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 Terminal_Minimal_Perfect_Hash.Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  terminalId
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.terminalId := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_Terminal;

   package ClientCapabilities_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["auth", "elicitation", "_meta"]);

   procedure Input_ClientCapabilities
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ClientCapabilities;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ClientCapabilities_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  auth
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.auth := (Is_Set => True, Value => <>);
                        Input_ClientAuthCapabilities
                          (Reader, Value.auth.Value, Success);
                     end if;

                  when 2      =>
                     --  elicitation
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.elicitation := (Is_Set => True, Value => <>);
                        Input_ElicitationCapabilities
                          (Reader, Value.elicitation.Value, Success);
                     end if;

                  when 3      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ClientCapabilities;

   package CancelTerminalResponse_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["_meta"]);

   procedure Input_CancelTerminalResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CancelTerminalResponse;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 CancelTerminalResponse_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_CancelTerminalResponse;

   package EnumOption_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["const", "title", "description", "_meta"]);

   procedure Input_EnumOption
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out EnumOption;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 EnumOption_Minimal_Perfect_Hash.Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  const
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.const := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  title
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.title := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  description
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.description := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_EnumOption;

   package BlobResourceContents_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["blob", "uri", "mimeType", "_meta"]);

   procedure Input_BlobResourceContents
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out BlobResourceContents;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 BlobResourceContents_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  blob
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.blob := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  uri
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.uri := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  mimeType
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.mimeType := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_BlobResourceContents;

   package InitializeResponse_Minimal_Perfect_Hash is new
     ACP.Key_Lookups
       (["protocolVersion", "info", "capabilities", "authMethods", "_meta"]);

   procedure Input_InitializeResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out InitializeResponse;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 InitializeResponse_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  protocolVersion
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Number_Value
                          and then Reader.Number_Value.Kind
                                   = VSS.JSON.JSON_Integer
                        then
                           Value.protocolVersion :=
                             Reader.Number_Value.Integer_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  info
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Implementation (Reader, Value.info, Success);
                     end if;

                  when 3      =>
                     --  capabilities
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.capabilities := (Is_Set => True, Value => <>);
                        Input_AgentCapabilities
                          (Reader, Value.capabilities.Value, Success);
                     end if;

                  when 4      =>
                     --  authMethods
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value (Reader, Value.authMethods, Success);
                     end if;

                  when 5      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_InitializeResponse;

   package CompactionSummaryChunk_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["compactionId", "content", "_meta"]);

   procedure Input_CompactionSummaryChunk
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CompactionSummaryChunk;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 CompactionSummaryChunk_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  compactionId
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.compactionId := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  content
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_ContentBlock (Reader, Value.content, Success);
                     end if;

                  when 3      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_CompactionSummaryChunk;

   package PromptImageCapabilities_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["_meta"]);

   procedure Input_PromptImageCapabilities
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out PromptImageCapabilities;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 PromptImageCapabilities_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_PromptImageCapabilities;

   package ResourceLink_Minimal_Perfect_Hash is new
     ACP.Key_Lookups
       (["name",
         "uri",
         "title",
         "description",
         "icons",
         "mimeType",
         "size",
         "annotations",
         "_meta"]);

   procedure Input_ResourceLink
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ResourceLink;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ResourceLink_Minimal_Perfect_Hash.Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  name
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.name := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  uri
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.uri := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  title
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.title := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  description
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.description := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 5      =>
                     --  icons
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value (Reader, Value.icons, Success);
                     end if;

                  when 6      =>
                     --  mimeType
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.mimeType := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 7      =>
                     --  size
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value (Reader, Value.size, Success);
                     end if;

                  when 8      =>
                     --  annotations
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.annotations := (Is_Set => True, Value => <>);
                        Input_Annotations
                          (Reader, Value.annotations.Value, Success);
                     end if;

                  when 9      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ResourceLink;

   package SelectedPermissionOutcome_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["optionId", "_meta"]);

   procedure Input_SelectedPermissionOutcome
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SelectedPermissionOutcome;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 SelectedPermissionOutcome_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  optionId
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.optionId := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_SelectedPermissionOutcome;

   package SessionSystemPromptModeCapabilities_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["override", "_meta"]);

   procedure Input_SessionSystemPromptModeCapabilities
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SessionSystemPromptModeCapabilities;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 SessionSystemPromptModeCapabilities_Minimal_Perfect_Hash
                   .Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  override
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.override := (Is_Set => True, Value => <>);
                        Input_SessionSystemPromptOverrideCapabilities
                          (Reader, Value.override.Value, Success);
                     end if;

                  when 2      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_SessionSystemPromptModeCapabilities;

   package ToolCallCapabilities_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["cancel", "_meta"]);

   procedure Input_ToolCallCapabilities
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ToolCallCapabilities;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ToolCallCapabilities_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  cancel
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.cancel := (Is_Set => True, Value => <>);
                        Input_ToolCallCancelCapabilities
                          (Reader, Value.cancel.Value, Success);
                     end if;

                  when 2      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ToolCallCapabilities;

   package ElicitationUrlCapabilities_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["_meta"]);

   procedure Input_ElicitationUrlCapabilities
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ElicitationUrlCapabilities;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ElicitationUrlCapabilities_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ElicitationUrlCapabilities;

   package HttpHeader_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["name", "value", "_meta"]);

   procedure Input_HttpHeader
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out HttpHeader;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 HttpHeader_Minimal_Perfect_Hash.Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  name
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.name := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  value
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.value := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_HttpHeader;

   procedure Input_ElicitationSchemaType
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ElicitationSchemaType;
      Success : in out Boolean) is
   begin
      Input_Any_Value (Reader, Value, Success);
   end Input_ElicitationSchemaType;

   package ElicitationFormCapabilities_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["_meta"]);

   procedure Input_ElicitationFormCapabilities
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ElicitationFormCapabilities;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ElicitationFormCapabilities_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ElicitationFormCapabilities;

   procedure Input_StateUpdate
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out StateUpdate;
      Success : in out Boolean) is
   begin
      Input_Any_Value (Reader, Value, Success);
   end Input_StateUpdate;

   package AuthMethodAgent_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["methodId", "name", "description", "_meta"]);

   procedure Input_AuthMethodAgent
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out AuthMethodAgent;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 AuthMethodAgent_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  methodId
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.methodId := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  name
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.name := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  description
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.description := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_AuthMethodAgent;

   package EnvVariable_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["name", "value", "_meta"]);

   procedure Input_EnvVariable
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out EnvVariable;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 EnvVariable_Minimal_Perfect_Hash.Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  name
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.name := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  value
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.value := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_EnvVariable;

   package ClientNotification_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["method", "params"]);

   procedure Input_ClientNotification
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ClientNotification;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ClientNotification_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  method
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.method := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  params
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value (Reader, Value.params, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ClientNotification;

   package ToolCallPermissionSubject_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["toolCall", "_meta"]);

   procedure Input_ToolCallPermissionSubject
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ToolCallPermissionSubject;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ToolCallPermissionSubject_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  toolCall
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_ToolCallUpdate (Reader, Value.toolCall, Success);
                     end if;

                  when 2      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ToolCallPermissionSubject;

   package LoginAuthResponse_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["_meta"]);

   procedure Input_LoginAuthResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out LoginAuthResponse;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 LoginAuthResponse_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_LoginAuthResponse;

   package SessionConfigSelectOption_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["value", "name", "description", "_meta"]);

   procedure Input_SessionConfigSelectOption
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SessionConfigSelectOption;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 SessionConfigSelectOption_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  value
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.value := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  name
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.name := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  description
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.description := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_SessionConfigSelectOption;

   procedure Input_PlanUpdateContent
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out PlanUpdateContent;
      Success : in out Boolean) is
   begin
      Input_Any_Value (Reader, Value, Success);
   end Input_PlanUpdateContent;

   package CancelTerminalRequest_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["sessionId", "terminalId", "_meta"]);

   procedure Input_CancelTerminalRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CancelTerminalRequest;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 CancelTerminalRequest_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  sessionId
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.sessionId := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  terminalId
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.terminalId := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_CancelTerminalRequest;

   package ResumeSessionRequest_Minimal_Perfect_Hash is new
     ACP.Key_Lookups
       (["sessionId",
         "cwd",
         "additionalDirectories",
         "mcpServers",
         "replayFrom",
         "systemPrompt",
         "_meta"]);

   procedure Input_ResumeSessionRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ResumeSessionRequest;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ResumeSessionRequest_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  sessionId
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.sessionId := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  cwd
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.cwd := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  additionalDirectories
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Success and Reader.Is_Start_Array then
                           Reader.Read_Next;
                           Value.additionalDirectories.Clear;
                           while Success and not Reader.Is_End_Array loop
                              declare
                                 Item : VSS.Strings.Virtual_String;
                              begin
                                 if Reader.Is_Null_Value then
                                    Reader.Read_Next;
                                 else
                                    if Reader.Is_String_Value then
                                       Item := Reader.String_Value;
                                       Reader.Read_Next;
                                    else
                                       Success := False;
                                    end if;
                                 end if;
                                 Value.additionalDirectories.Append (Item);
                              end;
                           end loop;
                           if Success then
                              Reader.Read_Next;  --  skip End_Array

                           end if;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  mcpServers
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value (Reader, Value.mcpServers, Success);
                     end if;

                  when 5      =>
                     --  replayFrom
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.replayFrom := (Is_Set => True, Value => <>);
                        Input_ReplayFrom
                          (Reader, Value.replayFrom.Value, Success);
                     end if;

                  when 6      =>
                     --  systemPrompt
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.systemPrompt := (Is_Set => True, Value => <>);
                        Input_SystemPrompt
                          (Reader, Value.systemPrompt.Value, Success);
                     end if;

                  when 7      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ResumeSessionRequest;

   package ErrorStopReason_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["error"]);

   procedure Input_ErrorStopReason
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ErrorStopReason;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ErrorStopReason_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  error
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.error := (Is_Set => True, Value => <>);
                        Input_Error (Reader, Value.error.Value, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ErrorStopReason;

   package PlanItems_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["planId", "entries", "_meta"]);

   procedure Input_PlanItems
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out PlanItems;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 PlanItems_Minimal_Perfect_Hash.Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  planId
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.planId := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  entries
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Success and Reader.Is_Start_Array then
                           Reader.Read_Next;
                           Value.entries.Clear (Is_Null => False);
                           while Success and not Reader.Is_End_Array loop
                              declare
                                 Item : PlanEntry;
                              begin
                                 if Reader.Is_Null_Value then
                                    Reader.Read_Next;
                                 else
                                    Input_PlanEntry (Reader, Item, Success);
                                 end if;
                                 Value.entries.Append (Item);
                              end;
                           end loop;
                           if Success then
                              Reader.Read_Next;  --  skip End_Array

                           end if;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_PlanItems;

   package CompleteElicitationNotification_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["elicitationId", "_meta"]);

   procedure Input_CompleteElicitationNotification
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CompleteElicitationNotification;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 CompleteElicitationNotification_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  elicitationId
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.elicitationId := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_CompleteElicitationNotification;

   procedure Input_ReplayFrom
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ReplayFrom;
      Success : in out Boolean) is
   begin
      Input_Any_Value (Reader, Value, Success);
   end Input_ReplayFrom;

   procedure Input_ErrorData
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ErrorData;
      Success : in out Boolean) is
   begin
      Input_Any_Value (Reader, Value, Success);
   end Input_ErrorData;

   package StringMultiSelectItems_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["enum", "_meta"]);

   procedure Input_StringMultiSelectItems
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out StringMultiSelectItems;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 StringMultiSelectItems_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  enum
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Success and Reader.Is_Start_Array then
                           Reader.Read_Next;
                           Value.enum.Clear;
                           while Success and not Reader.Is_End_Array loop
                              declare
                                 Item : VSS.Strings.Virtual_String;
                              begin
                                 if Reader.Is_Null_Value then
                                    Reader.Read_Next;
                                 else
                                    if Reader.Is_String_Value then
                                       Item := Reader.String_Value;
                                       Reader.Read_Next;
                                    else
                                       Success := False;
                                    end if;
                                 end if;
                                 Value.enum.Append (Item);
                              end;
                           end loop;
                           if Success then
                              Reader.Read_Next;  --  skip End_Array

                           end if;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_StringMultiSelectItems;

   package Icon_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["src", "mimeType", "sizes", "theme", "_meta"]);

   procedure Input_Icon
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Icon;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 Icon_Minimal_Perfect_Hash.Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  src
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.src := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  mimeType
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.mimeType := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  sizes
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value (Reader, Value.sizes, Success);
                     end if;

                  when 4      =>
                     --  theme
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.theme := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 5      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_Icon;

   package NumberPropertySchema_Minimal_Perfect_Hash is new
     ACP.Key_Lookups
       (["title", "description", "minimum", "maximum", "default", "_meta"]);

   procedure Input_NumberPropertySchema
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out NumberPropertySchema;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 NumberPropertySchema_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  title
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.title := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  description
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.description := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  minimum
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value (Reader, Value.minimum, Success);
                     end if;

                  when 4      =>
                     --  maximum
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value (Reader, Value.maximum, Success);
                     end if;

                  when 5      =>
                     --  default
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value (Reader, Value.default, Success);
                     end if;

                  when 6      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_NumberPropertySchema;

   package McpServerStdio_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["name", "command", "args", "env", "_meta"]);

   procedure Input_McpServerStdio
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out McpServerStdio;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 McpServerStdio_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  name
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.name := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  command
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.command := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  args
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Success and Reader.Is_Start_Array then
                           Reader.Read_Next;
                           Value.args.Clear;
                           while Success and not Reader.Is_End_Array loop
                              declare
                                 Item : VSS.Strings.Virtual_String;
                              begin
                                 if Reader.Is_Null_Value then
                                    Reader.Read_Next;
                                 else
                                    if Reader.Is_String_Value then
                                       Item := Reader.String_Value;
                                       Reader.Read_Next;
                                    else
                                       Success := False;
                                    end if;
                                 end if;
                                 Value.args.Append (Item);
                              end;
                           end loop;
                           if Success then
                              Reader.Read_Next;  --  skip End_Array

                           end if;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  env
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Success and Reader.Is_Start_Array then
                           Reader.Read_Next;
                           Value.env.Clear (Is_Null => False);
                           while Success and not Reader.Is_End_Array loop
                              declare
                                 Item : EnvVariable;
                              begin
                                 if Reader.Is_Null_Value then
                                    Reader.Read_Next;
                                 else
                                    Input_EnvVariable (Reader, Item, Success);
                                 end if;
                                 Value.env.Append (Item);
                              end;
                           end loop;
                           if Success then
                              Reader.Read_Next;  --  skip End_Array

                           end if;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 5      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_McpServerStdio;

   package CreateElicitationResponse_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["_meta"]);

   procedure Input_CreateElicitationResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CreateElicitationResponse;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 CreateElicitationResponse_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_CreateElicitationResponse;

   procedure Input_SessionUpdate
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SessionUpdate;
      Success : in out Boolean) is
   begin
      Input_Any_Value (Reader, Value, Success);
   end Input_SessionUpdate;

   procedure Input_AgentResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out AgentResponse;
      Success : in out Boolean) is
   begin
      Input_Any_Value (Reader, Value, Success);
   end Input_AgentResponse;

   package PermissionOption_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["optionId", "name", "kind", "_meta"]);

   procedure Input_PermissionOption
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out PermissionOption;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 PermissionOption_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  optionId
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.optionId := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  name
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.name := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  kind
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.kind := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_PermissionOption;

   package Notice_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["severity", "title", "description", "_meta"]);

   procedure Input_Notice
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Notice;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 Notice_Minimal_Perfect_Hash.Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  severity
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.severity := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  title
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.title := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  description
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.description := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_Notice;

   package InitializeRequest_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["protocolVersion", "info", "capabilities", "_meta"]);

   procedure Input_InitializeRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out InitializeRequest;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 InitializeRequest_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  protocolVersion
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Number_Value
                          and then Reader.Number_Value.Kind
                                   = VSS.JSON.JSON_Integer
                        then
                           Value.protocolVersion :=
                             Reader.Number_Value.Integer_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  info
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Implementation (Reader, Value.info, Success);
                     end if;

                  when 3      =>
                     --  capabilities
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.capabilities := (Is_Set => True, Value => <>);
                        Input_ClientCapabilities
                          (Reader, Value.capabilities.Value, Success);
                     end if;

                  when 4      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_InitializeRequest;

   package SessionSystemPromptOverrideCapabilities_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["_meta"]);

   procedure Input_SessionSystemPromptOverrideCapabilities
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SessionSystemPromptOverrideCapabilities;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 SessionSystemPromptOverrideCapabilities_Minimal_Perfect_Hash
                   .Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_SessionSystemPromptOverrideCapabilities;

   package TerminalCapabilities_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["cancel", "_meta"]);

   procedure Input_TerminalCapabilities
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out TerminalCapabilities;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 TerminalCapabilities_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  cancel
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.cancel := (Is_Set => True, Value => <>);
                        Input_TerminalCancelCapabilities
                          (Reader, Value.cancel.Value, Success);
                     end if;

                  when 2      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_TerminalCapabilities;

   procedure Input_UsageUpdate
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out UsageUpdate;
      Success : in out Boolean) is
   begin
      Input_Any_Value (Reader, Value, Success);
   end Input_UsageUpdate;

   package AgentRequest_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["id", "method", "params"]);

   procedure Input_AgentRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out AgentRequest;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 AgentRequest_Minimal_Perfect_Hash.Get_Index (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  id
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Value.id := (False, Integer => <>);
                        if Reader.Is_String_Value then
                           Value.id := (True, Reader.String_Value);
                           Reader.Read_Next;
                        elsif Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           if Reader.Is_Number_Value
                             and then Reader.Number_Value.Kind
                                      = VSS.JSON.JSON_Integer
                           then
                              Value.id.Integer :=
                                Reader.Number_Value.Integer_Value;
                              Reader.Read_Next;
                           else
                              Success := False;
                           end if;
                        end if;
                     end if;

                  when 2      =>
                     --  method
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.method := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  params
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value (Reader, Value.params, Success);
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_AgentRequest;

   package Implementation_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["name", "title", "version", "_meta"]);

   procedure Input_Implementation
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Implementation;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 Implementation_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  name
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.name := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  title
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.title := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 3      =>
                     --  version
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.version := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 4      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_Implementation;

   procedure Input_McpServer
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out McpServer;
      Success : in out Boolean) is
   begin
      Input_Any_Value (Reader, Value, Success);
   end Input_McpServer;

   package ReplayFromStart_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["_meta"]);

   procedure Input_ReplayFromStart
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ReplayFromStart;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 ReplayFromStart_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_ReplayFromStart;

   procedure Input_ElicitationPropertySchema
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ElicitationPropertySchema;
      Success : in out Boolean) is
   begin
      Input_Any_Value (Reader, Value, Success);
   end Input_ElicitationPropertySchema;

   procedure Input_MultiSelectItems
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out MultiSelectItems;
      Success : in out Boolean) is
   begin
      Input_Any_Value (Reader, Value, Success);
   end Input_MultiSelectItems;

   package CancelToolCallResponse_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["_meta"]);

   procedure Input_CancelToolCallResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CancelToolCallResponse;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 CancelToolCallResponse_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_CancelToolCallResponse;

   package BackgroundToolCall_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["toolCallId", "_meta"]);

   procedure Input_BackgroundToolCall
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out BackgroundToolCall;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 BackgroundToolCall_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  toolCallId
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_String_Value then
                           Value.toolCallId := Reader.String_Value;
                           Reader.Read_Next;
                        else
                           Success := False;
                        end if;
                     end if;

                  when 2      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_BackgroundToolCall;

   package RequiresActionStateUpdate_Minimal_Perfect_Hash is new
     ACP.Key_Lookups (["background", "_meta"]);

   procedure Input_RequiresActionStateUpdate
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out RequiresActionStateUpdate;
      Success : in out Boolean) is
   begin
      if Success and Reader.Is_Start_Object then
         Reader.Read_Next;
      else
         Success := False;
      end if;

      while Success and not Reader.Is_End_Object loop
         if Reader.Is_Key_Name then
            declare
               Index : constant Natural :=
                 RequiresActionStateUpdate_Minimal_Perfect_Hash.Get_Index
                   (Reader.Key_Name);
            begin

               case Index is
                  when 1      =>
                     --  background
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        Input_Any_Value (Reader, Value.background, Success);
                     end if;

                  when 2      =>
                     --  _meta
                     Reader.Read_Next;
                     if Reader.Is_Null_Value then
                        Reader.Read_Next;
                     else
                        if Reader.Is_Null_Value then
                           Reader.Read_Next;
                        else
                           Input_Any_Value (Reader, Value.meta, Success);
                        end if;
                     end if;

                  when others =>
                     Value.Additional_Properties.Append
                       ((VSS.JSON.Streams.Key_Name, Reader.Key_Name));
                     Reader.Read_Next;
                     Input_Any_Value
                       (Reader, Value.Additional_Properties, Success);
               end case;
            end;
         else
            Success := False;
         end if;
      end loop;

      if Success then
         Reader.Read_Next;  --  skip End_Object

      end if;
   end Input_RequiresActionStateUpdate;

end ACP.Types.Inputs;
