--  SPDX-FileCopyrightText: 2026 Max Reznik <reznikmm@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

with VSS.Strings;

procedure Demo.Prompt_Client
  (Client_Name        : VSS.Strings.Virtual_String;
   Program_Name       : String;
   Agent_Name         : String;
   Directory_Variable : String);
--  Run a single text prompt over ACP v2 stdio and print assembled agent text
--  to stderr. The optional command-line argument is the prompt; the directory
--  comes from Directory_Variable or the current directory.
