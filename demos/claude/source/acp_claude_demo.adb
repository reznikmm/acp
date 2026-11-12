--  SPDX-FileCopyrightText: 2026 Max Reznik <reznikmm@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

with Demo.Prompt_Client;

procedure ACP_Claude_Demo is
begin
   Demo.Prompt_Client
     (Client_Name        => "ada-acp-claude-demo",
      Program_Name       => "acp_claude_demo",
      Agent_Name         => "Claude Code",
      Directory_Variable => "ACP_CLAUDE_CWD");
end ACP_Claude_Demo;
