--  SPDX-FileCopyrightText: 2026 Max Reznik <reznikmm@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

with VSS.Strings;

with ACP.Types.Inputs;
with ACP.Types.Outputs;

with JSON_Codecs;

package body Test_JSON is

   package Initialization is new
     JSON_Codecs
       (ACP.Types.InitializeRequest,
        ACP.Types.Inputs.Input_InitializeRequest,
        ACP.Types.Outputs.Output_InitializeRequest);

   package Sessions is new
     JSON_Codecs
       (ACP.Types.NewSessionRequest,
        ACP.Types.Inputs.Input_NewSessionRequest,
        ACP.Types.Outputs.Output_NewSessionRequest);

   package Prompts is new
     JSON_Codecs
       (ACP.Types.PromptRequest,
        ACP.Types.Inputs.Input_PromptRequest,
        ACP.Types.Outputs.Output_PromptRequest);

   package Content is new
     JSON_Codecs
       (ACP.Types.ContentBlock,
        ACP.Types.Inputs.Input_ContentBlock,
        ACP.Types.Outputs.Output_ContentBlock);

   package Images is new
     JSON_Codecs
       (ACP.Types.ImageContent,
        ACP.Types.Inputs.Input_ImageContent,
        ACP.Types.Outputs.Output_ImageContent);

   package Annotations is new
     JSON_Codecs
       (ACP.Types.Annotations,
        ACP.Types.Inputs.Input_Annotations,
        ACP.Types.Outputs.Output_Annotations);

   package Tool_Patches is new
     JSON_Codecs
       (ACP.Types.ToolCallUpdate,
        ACP.Types.Inputs.Input_ToolCallUpdate,
        ACP.Types.Outputs.Output_ToolCallUpdate);

   package Message_Patches is new
     JSON_Codecs
       (ACP.Types.UserMessage,
        ACP.Types.Inputs.Input_UserMessage,
        ACP.Types.Outputs.Output_UserMessage);

   package Terminal_Patches is new
     JSON_Codecs
       (ACP.Types.TerminalUpdate,
        ACP.Types.Inputs.Input_TerminalUpdate,
        ACP.Types.Outputs.Output_TerminalUpdate);

   package Requests is new
     JSON_Codecs
       (ACP.Types.ClientRequest,
        ACP.Types.Inputs.Input_ClientRequest,
        ACP.Types.Outputs.Output_ClientRequest);

   -------------------------
   -- Test_Initialization --
   -------------------------

   procedure Test_Initialization (Op : in out Trendy_Test.Operation'Class) is
      use type ACP.Types.Integer_64;
      use type VSS.Strings.Virtual_String;
      JSON  : constant String :=
        "{""protocolVersion"":2,""info"":{""name"":""ada-acp"","
        & """version"":""0.1""},""capabilities"":{},"
        & """_meta"":{""vendor"":true}}";
      Value : ACP.Types.InitializeRequest;
   begin
      Op.Register (Parallelize => False);
      Op.Assert (Initialization.Parse (JSON, Value));
      Op.Assert (Value.protocolVersion = 2);
      Op.Assert (Value.info.name = "ada-acp");
      Op.Assert (Value.capabilities.Is_Set);
      Initialization.Round_Trip (JSON);
   end Test_Initialization;

   ------------------
   -- Test_Session --
   ------------------

   procedure Test_Session (Op : in out Trendy_Test.Operation'Class) is
      use type VSS.Strings.Virtual_String;
      Value : ACP.Types.PromptRequest;
      JSON  : constant String :=
        "{""sessionId"":""session-1"",""prompt"":["
        & "{""type"":""text"",""text"":""Hello!""},"
        & "{""type"":""image"",""data"":""aGk="",""mimeType"":""image/png"","
        & """uri"":""file:///image.png""}]}";
   begin
      Op.Register (Parallelize => False);
      Sessions.Round_Trip
        ("{""cwd"":""/workspace"",""mcpServers"":[{""type"":""stdio"","
         & """name"":""example"",""command"":""server"",""args"":[""--demo""],"
         & """env"":[]}]}");
      Op.Assert (Prompts.Parse (JSON, Value));
      Op.Assert (Value.sessionId = "session-1");
      Prompts.Round_Trip (JSON);
   end Test_Session;

   ------------------
   -- Test_Content --
   ------------------

   procedure Test_Content (Op : in out Trendy_Test.Operation'Class) is
      use type VSS.Strings.Virtual_String;
      Image : ACP.Types.ImageContent;
   begin
      Op.Register (Parallelize => False);
      --  Baseline MCP wire content can be carried unchanged.
      Content.Round_Trip ("{""type"":""text"",""text"":""Hello!""}");
      Content.Round_Trip
        ("{""type"":""audio"",""data"":""aGk="",""mimeType"":""audio/wav""}");
      --  ACP's image URI and extension metadata are preserved too.
      Op.Assert
        (Images.Parse
           ("{""data"":""aGk="",""mimeType"":""image/png"","
            & """uri"":""file:///image.png""}",
            Image));
      Op.Assert (Image.uri = "file:///image.png");
      Images.Round_Trip
        ("{""data"":""aGk="",""mimeType"":""image/png"","
         & """uri"":""file:///image.png"",""_meta"":{""custom"":null},"
         & """type"":""image""}");
      Annotations.Round_Trip
        ("{""audience"":[""user"",""_reviewer""],""_meta"":{""hint"":false}}");
      Content.Round_Trip
        ("{""type"":""_future"",""payload"":{""values"":[null,false,[]]}}");
   end Test_Content;

   ------------------
   -- Test_Patches --
   ------------------

   procedure Test_Patches (Op : in out Trendy_Test.Operation'Class) is
   begin
      Op.Register (Parallelize => False);
      Tool_Patches.Round_Trip ("{""toolCallId"":""t1""}");
      Tool_Patches.Round_Trip
        ("{""toolCallId"":""t1"",""title"":null,""name"":"""","
         & """content"":[],""capabilities"":null,""rawOutput"":false,"
         & """_meta"":{""remove"":null}}");
      Message_Patches.Round_Trip
        ("{""messageId"":""m1"",""content"":null,""_meta"":null}");
      Terminal_Patches.Round_Trip
        ("{""terminalId"":""term-1"",""exitStatus"":null,""_meta"":{}}");
   end Test_Patches;

   ----------------------
   -- Test_Request_IDs --
   ----------------------

   procedure Test_Request_IDs (Op : in out Trendy_Test.Operation'Class) is
      use type ACP.Types.Integer_64;
      use type VSS.Strings.Virtual_String;
      Value : ACP.Types.ClientRequest;
   begin
      Op.Register (Parallelize => False);
      Op.Assert
        (Requests.Parse ("{""id"":42,""method"":""initialize""}", Value));
      Op.Assert (not Value.id.Is_String and then Value.id.Integer = 42);
      Op.Assert
        (Requests.Parse
           ("{""id"":""request-1"",""method"":""session/prompt""}", Value));
      Op.Assert (Value.id.Is_String and then Value.id.String = "request-1");
      Requests.Round_Trip
        ("{""id"":0,""method"":""initialize"",""params"":{""custom"":null},"
         & """jsonrpc"":""2.0""}");
   end Test_Request_IDs;

   -------------------------
   -- Test_Invalid_Values --
   -------------------------

   procedure Test_Invalid_Values (Op : in out Trendy_Test.Operation'Class) is
      Initialize : ACP.Types.InitializeRequest;
      Request    : ACP.Types.ClientRequest;
      pragma Unreferenced (Initialize, Request);
   begin
      Op.Register (Parallelize => False);
      Op.Assert
        (not Initialization.Parse
               ("{""protocolVersion"":""2"",""info"":{""name"":""x"","
                & """version"":""1""}}",
                Initialize));
      Op.Assert
        (not Requests.Parse
               ("{""id"":true,""method"":""initialize""}", Request));
   end Test_Invalid_Values;

end Test_JSON;
