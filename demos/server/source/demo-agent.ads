--  SPDX-FileCopyrightText: 2026 Max Reznik <reznikmm@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

with Ada.Containers.Vectors;
with VSS.Strings;
with Demo.Connection;
with Demo.JSON;

package Demo.Agent is
   type State is private;

   procedure Process
     (Self    : in out State;
      Message : Demo.JSON.Value;
      Channel : in out Demo.Connection.Channel);

private
   type Session is record
      Identifier : VSS.Strings.Virtual_String;
      Directory  : VSS.Strings.Virtual_String;
      Active     : Boolean := True;
   end record;
   package Session_Vectors is new Ada.Containers.Vectors (Positive, Session);
   type State is record
      Initialized  : Boolean := False;
      Sessions     : Session_Vectors.Vector;
      Next_Message : Natural := 0;
   end record;
end Demo.Agent;
