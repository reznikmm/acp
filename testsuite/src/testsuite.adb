--  SPDX-FileCopyrightText: 2026 Max Reznik <reznikmm@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

with Test_Init;
with Test_JSON;
with Trendy_Test.Reports;

procedure Testsuite is
   Tests : constant Trendy_Test.Test_Group :=
     [Test_Init.Test_Basic_Init'Access,
      Test_JSON.Test_Initialization'Access,
      Test_JSON.Test_Session'Access,
      Test_JSON.Test_Content'Access,
      Test_JSON.Test_Patches'Access,
      Test_JSON.Test_Request_IDs'Access,
      Test_JSON.Test_Invalid_Values'Access];
begin
   Trendy_Test.Register (Tests);
   Trendy_Test.Reports.Print_Basic_Report (Trendy_Test.Run);
end Testsuite;
