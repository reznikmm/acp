--  SPDX-FileCopyrightText: 2026 Max Reznik <reznikmm@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

with Ada.Command_Line;
with Ada.Exceptions;
with Ada.IO_Exceptions;
with Ada.Text_IO;
with ACP.Types;
with VSS.Stream_Element_Vectors;
with Demo.Agent;
with Demo.Connection;
with Demo.JSON;

procedure ACP_Server_Demo is
   use type ACP.Types.Integer_64;
   State   : Demo.Agent.State;
   Channel : Demo.Connection.Channel;
   Message : Demo.JSON.Value;
begin
   loop
      declare
         Data : constant VSS.Stream_Element_Vectors.Stream_Element_Vector :=
           Demo.Connection.Receive (Channel);
      begin
         if Demo.JSON.Parse (Data, Message) then
            Demo.Agent.Process (State, Message, Channel);
         else
            Demo.Connection.Send
              (Channel,
               Demo.JSON.Encode
                 (Demo.JSON.Error_Response
                    (Demo.JSON.Null_Value, -32700, "Parse error")));
         end if;
      end;
   end loop;
exception
   when Ada.IO_Exceptions.End_Error =>
      Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Success);
   when Error : others =>
      Ada.Text_IO.Put_Line
        (Ada.Text_IO.Standard_Error,
         "acp_server_demo: " & Ada.Exceptions.Exception_Message (Error));
      Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Failure);
end ACP_Server_Demo;
