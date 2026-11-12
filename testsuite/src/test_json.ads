--  SPDX-FileCopyrightText: 2026 Max Reznik <reznikmm@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

with Trendy_Test;

package Test_JSON is

   procedure Test_Initialization (Op : in out Trendy_Test.Operation'Class);
   procedure Test_Session (Op : in out Trendy_Test.Operation'Class);
   procedure Test_Content (Op : in out Trendy_Test.Operation'Class);
   procedure Test_Patches (Op : in out Trendy_Test.Operation'Class);
   procedure Test_Request_IDs (Op : in out Trendy_Test.Operation'Class);
   procedure Test_Invalid_Values (Op : in out Trendy_Test.Operation'Class);

end Test_JSON;
