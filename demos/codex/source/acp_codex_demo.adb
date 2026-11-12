--  SPDX-FileCopyrightText: 2026 Max Reznik <reznikmm@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

with Demo.Prompt_Client;

procedure ACP_Codex_Demo is
begin
   Demo.Prompt_Client
     (Client_Name        => "ada-acp-codex-demo",
      Program_Name       => "acp_codex_demo",
      Agent_Name         => "Codex",
      Directory_Variable => "ACP_CODEX_CWD");
end ACP_Codex_Demo;
