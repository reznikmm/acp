--  SPDX-FileCopyrightText: 2026 Max Reznik <reznikmm@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--
--  Generated from the ACP v2 schema. See schema/README.md.

package body ACP.Types.Outputs is
   pragma Style_Checks (Off);
   use type Integer_64;
   procedure Output_Any_Value
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Any_Value'Class) is
   begin
      for Item of Value loop
         case Item.Kind is
            when VSS.JSON.Streams.Start_Array    =>
               Handler.Start_Array;

            when VSS.JSON.Streams.End_Array      =>
               Handler.End_Array;

            when VSS.JSON.Streams.Start_Object   =>
               Handler.Start_Object;

            when VSS.JSON.Streams.End_Object     =>
               Handler.End_Object;

            when VSS.JSON.Streams.Key_Name       =>
               Handler.Key_Name (Item.Key_Name);

            when VSS.JSON.Streams.String_Value   =>
               Handler.String_Value (Item.String_Value);

            when VSS.JSON.Streams.Number_Value   =>
               Handler.Number_Value (Item.Number_Value);

            when VSS.JSON.Streams.Boolean_Value  =>
               Handler.Boolean_Value (Item.Boolean_Value);

            when VSS.JSON.Streams.Null_Value     =>
               Handler.Null_Value;

            when VSS.JSON.Streams.None           =>
               null;

            when VSS.JSON.Streams.Invalid        =>
               raise Program_Error;

            when VSS.JSON.Streams.Start_Document =>
               raise Program_Error;

            when VSS.JSON.Streams.End_Document   =>
               raise Program_Error;

            when VSS.JSON.Streams.Comment        =>
               raise Program_Error;
         end case;
      end loop;
   end Output_Any_Value;

   procedure Output_SetSessionConfigOptionRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SetSessionConfigOptionRequest) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("sessionId");
      Handler.String_Value (Value.sessionId);
      Handler.Key_Name ("configId");
      Handler.String_Value (Value.configId);
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_SetSessionConfigOptionRequest;

   procedure Output_LoginAuthRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : LoginAuthRequest) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("methodId");
      Handler.String_Value (Value.methodId);
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_LoginAuthRequest;

   procedure Output_SessionConfigBoolean
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SessionConfigBoolean) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("currentValue");
      Handler.Boolean_Value (Value.currentValue);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_SessionConfigBoolean;

   procedure Output_TerminalOutputChunk
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : TerminalOutputChunk) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("terminalId");
      Handler.String_Value (Value.terminalId);
      Handler.Key_Name ("data");
      Handler.String_Value (Value.data);
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_TerminalOutputChunk;

   procedure Output_DiffPatch
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : DiffPatch) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("format");
      Handler.String_Value (Value.format);
      Handler.Key_Name ("text");
      Handler.String_Value (Value.text);
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_DiffPatch;

   procedure Output_AgentNotification
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : AgentNotification) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("method");
      Handler.String_Value (Value.method);
      if not Value.params.Is_Empty then
         Handler.Key_Name ("params");
         Output_Any_Value (Handler, Value.params);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_AgentNotification;

   procedure Output_ElicitationAcceptAction
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ElicitationAcceptAction) is
   begin
      Handler.Start_Object;
      if not Value.content.Is_Empty then
         Handler.Key_Name ("content");
         Output_Any_Value (Handler, Value.content);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ElicitationAcceptAction;

   procedure Output_UserMessage
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : UserMessage) is
   begin
      Output_Any_Value (Handler, Value);
   end Output_UserMessage;

   procedure Output_CloseSessionResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CloseSessionResponse) is
   begin
      Handler.Start_Object;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_CloseSessionResponse;

   procedure Output_AgentMessage
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : AgentMessage) is
   begin
      Output_Any_Value (Handler, Value);
   end Output_AgentMessage;

   procedure Output_ToolCallCancelCapabilities
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ToolCallCancelCapabilities) is
   begin
      Handler.Start_Object;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ToolCallCancelCapabilities;

   procedure Output_LogoutAuthRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : LogoutAuthRequest) is
   begin
      Handler.Start_Object;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_LogoutAuthRequest;

   procedure Output_ResumeSessionResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ResumeSessionResponse) is
   begin
      Handler.Start_Object;
      if not Value.configOptions.Is_Null then
         Handler.Key_Name ("configOptions");
         Handler.Start_Array;
         for J in 1 .. Value.configOptions.Length loop
            Output_SessionConfigOption (Handler, Value.configOptions (J));
         end loop;
         Handler.End_Array;
      end if;
      if not Value.availableCommands.Is_Empty then
         Handler.Key_Name ("availableCommands");
         Output_Any_Value (Handler, Value.availableCommands);
      end if;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ResumeSessionResponse;

   procedure Output_CloseSessionRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CloseSessionRequest) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("sessionId");
      Handler.String_Value (Value.sessionId);
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_CloseSessionRequest;

   procedure Output_DiffChange
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : DiffChange) is
   begin
      Handler.Start_Object;
      if not Value.fileType.Is_Null then
         Handler.Key_Name ("fileType");
         Handler.String_Value (Value.fileType);
      end if;
      if not Value.mimeType.Is_Null then
         Handler.Key_Name ("mimeType");
         Handler.String_Value (Value.mimeType);
      end if;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_DiffChange;

   procedure Output_TerminalCancelCapabilities
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : TerminalCancelCapabilities) is
   begin
      Handler.Start_Object;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_TerminalCancelCapabilities;

   procedure Output_CompactionUpdate
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CompactionUpdate) is
   begin
      Output_Any_Value (Handler, Value);
   end Output_CompactionUpdate;

   procedure Output_PromptResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : PromptResponse) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("messageId");
      Handler.String_Value (Value.messageId);
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_PromptResponse;

   procedure Output_ToolCallContent
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ToolCallContent) is
   begin
      Output_Any_Value (Handler, Value);
   end Output_ToolCallContent;

   procedure Output_EmbeddedResourceResource
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : EmbeddedResourceResource) is
   begin
      Output_Any_Value (Handler, Value);
   end Output_EmbeddedResourceResource;

   procedure Output_ClientAuthCapabilities
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ClientAuthCapabilities) is
   begin
      Handler.Start_Object;
      if Value.terminal.Is_Set then
         Handler.Key_Name ("terminal");
         Output_TerminalAuthCapabilities (Handler, Value.terminal.Value);
      end if;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ClientAuthCapabilities;

   procedure Output_McpHttpCapabilities
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : McpHttpCapabilities) is
   begin
      Handler.Start_Object;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_McpHttpCapabilities;

   procedure Output_PromptEmbeddedContextCapabilities
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : PromptEmbeddedContextCapabilities) is
   begin
      Handler.Start_Object;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_PromptEmbeddedContextCapabilities;

   procedure Output_AvailableCommandInput
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : AvailableCommandInput) is
   begin
      Output_Any_Value (Handler, Value);
   end Output_AvailableCommandInput;

   procedure Output_PromptCapabilities
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : PromptCapabilities) is
   begin
      Handler.Start_Object;
      if Value.image.Is_Set then
         Handler.Key_Name ("image");
         Output_PromptImageCapabilities (Handler, Value.image.Value);
      end if;
      if Value.audio.Is_Set then
         Handler.Key_Name ("audio");
         Output_PromptAudioCapabilities (Handler, Value.audio.Value);
      end if;
      if Value.embeddedContext.Is_Set then
         Handler.Key_Name ("embeddedContext");
         Output_PromptEmbeddedContextCapabilities
           (Handler, Value.embeddedContext.Value);
      end if;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_PromptCapabilities;

   procedure Output_ImageContent
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ImageContent) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("data");
      Handler.String_Value (Value.data);
      Handler.Key_Name ("mimeType");
      Handler.String_Value (Value.mimeType);
      if not Value.uri.Is_Null then
         Handler.Key_Name ("uri");
         Handler.String_Value (Value.uri);
      end if;
      if Value.annotations.Is_Set then
         Handler.Key_Name ("annotations");
         Output_Annotations (Handler, Value.annotations.Value);
      end if;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ImageContent;

   procedure Output_SessionCapabilities
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SessionCapabilities) is
   begin
      Handler.Start_Object;
      if Value.prompt.Is_Set then
         Handler.Key_Name ("prompt");
         Output_PromptCapabilities (Handler, Value.prompt.Value);
      end if;
      if Value.mcp.Is_Set then
         Handler.Key_Name ("mcp");
         Output_McpCapabilities (Handler, Value.mcp.Value);
      end if;
      if Value.delete.Is_Set then
         Handler.Key_Name ("delete");
         Output_SessionDeleteCapabilities (Handler, Value.delete.Value);
      end if;
      if Value.additionalDirectories.Is_Set then
         Handler.Key_Name ("additionalDirectories");
         Output_SessionAdditionalDirectoriesCapabilities
           (Handler, Value.additionalDirectories.Value);
      end if;
      if Value.systemPrompt.Is_Set then
         Handler.Key_Name ("systemPrompt");
         Output_SessionSystemPromptCapabilities
           (Handler, Value.systemPrompt.Value);
      end if;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_SessionCapabilities;

   procedure Output_ElicitationRequestScope
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ElicitationRequestScope) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("requestId");
      if Value.requestId.Is_String then
         Handler.String_Value (Value.requestId.String);
      else
         Handler.Integer_Value (Value.requestId.Integer);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ElicitationRequestScope;

   procedure Output_SessionSystemPromptCapabilities
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SessionSystemPromptCapabilities) is
   begin
      Handler.Start_Object;
      if Value.mode.Is_Set then
         Handler.Key_Name ("mode");
         Output_SessionSystemPromptModeCapabilities
           (Handler, Value.mode.Value);
      end if;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_SessionSystemPromptCapabilities;

   procedure Output_DiffPathChange
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : DiffPathChange) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("path");
      Handler.String_Value (Value.path);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_DiffPathChange;

   procedure Output_CreateElicitationRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CreateElicitationRequest) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("message");
      Handler.String_Value (Value.message);
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_CreateElicitationRequest;

   procedure Output_IdleStateUpdate
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : IdleStateUpdate) is
   begin
      Handler.Start_Object;
      if not Value.background.Is_Empty then
         Handler.Key_Name ("background");
         Output_Any_Value (Handler, Value.background);
      end if;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      if not Value.stopReason.Is_Null then
         Handler.Key_Name ("stopReason");
         Handler.String_Value (Value.stopReason);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_IdleStateUpdate;

   procedure Output_BackgroundWork
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : BackgroundWork) is
   begin
      Output_Any_Value (Handler, Value);
   end Output_BackgroundWork;

   procedure Output_SessionNotFoundErrorData
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SessionNotFoundErrorData) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("sessionId");
      Handler.String_Value (Value.sessionId);
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_SessionNotFoundErrorData;

   procedure Output_RequestPermissionResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : RequestPermissionResponse) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("outcome");
      Output_RequestPermissionOutcome (Handler, Value.outcome);
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_RequestPermissionResponse;

   procedure Output_ElicitationUrlMode
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ElicitationUrlMode) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("elicitationId");
      Handler.String_Value (Value.elicitationId);
      Handler.Key_Name ("url");
      Handler.String_Value (Value.url);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ElicitationUrlMode;

   procedure Output_RequestPermissionSubject
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : RequestPermissionSubject) is
   begin
      Output_Any_Value (Handler, Value);
   end Output_RequestPermissionSubject;

   procedure Output_PromptAudioCapabilities
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : PromptAudioCapabilities) is
   begin
      Handler.Start_Object;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_PromptAudioCapabilities;

   procedure Output_ClientRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ClientRequest) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("id");
      if Value.id.Is_String then
         Handler.String_Value (Value.id.String);
      else
         Handler.Integer_Value (Value.id.Integer);
      end if;
      Handler.Key_Name ("method");
      Handler.String_Value (Value.method);
      if not Value.params.Is_Empty then
         Handler.Key_Name ("params");
         Output_Any_Value (Handler, Value.params);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ClientRequest;

   procedure Output_ContentBlock
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ContentBlock) is
   begin
      Output_Any_Value (Handler, Value);
   end Output_ContentBlock;

   procedure Output_RequestPermissionRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : RequestPermissionRequest) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("sessionId");
      Handler.String_Value (Value.sessionId);
      Handler.Key_Name ("title");
      Handler.String_Value (Value.title);
      if not Value.description.Is_Null then
         Handler.Key_Name ("description");
         Handler.String_Value (Value.description);
      end if;
      if Value.subject.Is_Set then
         Handler.Key_Name ("subject");
         Output_RequestPermissionSubject (Handler, Value.subject.Value);
      end if;
      Handler.Key_Name ("options");
      Handler.Start_Array;
      for J in 1 .. Value.options.Length loop
         Output_PermissionOption (Handler, Value.options (J));
      end loop;
      Handler.End_Array;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_RequestPermissionRequest;

   procedure Output_StringPropertySchema
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : StringPropertySchema) is
   begin
      Handler.Start_Object;
      if not Value.title.Is_Null then
         Handler.Key_Name ("title");
         Handler.String_Value (Value.title);
      end if;
      if not Value.description.Is_Null then
         Handler.Key_Name ("description");
         Handler.String_Value (Value.description);
      end if;
      if not Value.minLength.Is_Empty then
         Handler.Key_Name ("minLength");
         Output_Any_Value (Handler, Value.minLength);
      end if;
      if not Value.maxLength.Is_Empty then
         Handler.Key_Name ("maxLength");
         Output_Any_Value (Handler, Value.maxLength);
      end if;
      if not Value.pattern.Is_Null then
         Handler.Key_Name ("pattern");
         Handler.String_Value (Value.pattern);
      end if;
      if not Value.format.Is_Null then
         Handler.Key_Name ("format");
         Handler.String_Value (Value.format);
      end if;
      if not Value.default.Is_Null then
         Handler.Key_Name ("default");
         Handler.String_Value (Value.default);
      end if;
      if not Value.enum.Is_Empty then
         Handler.Key_Name ("enum");
         Output_Any_Value (Handler, Value.enum);
      end if;
      if not Value.oneOf.Is_Empty then
         Handler.Key_Name ("oneOf");
         Output_Any_Value (Handler, Value.oneOf);
      end if;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_StringPropertySchema;

   procedure Output_TerminalUpdate
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : TerminalUpdate) is
   begin
      Output_Any_Value (Handler, Value);
   end Output_TerminalUpdate;

   procedure Output_DiffPathPairChange
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : DiffPathPairChange) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("oldPath");
      Handler.String_Value (Value.oldPath);
      Handler.Key_Name ("path");
      Handler.String_Value (Value.path);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_DiffPathPairChange;

   procedure Output_SessionInfoUpdate
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SessionInfoUpdate) is
   begin
      Output_Any_Value (Handler, Value);
   end Output_SessionInfoUpdate;

   procedure Output_LogoutAuthResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : LogoutAuthResponse) is
   begin
      Handler.Start_Object;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_LogoutAuthResponse;

   procedure Output_ErrorCode
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ErrorCode) is
   begin
      Output_Any_Value (Handler, Value);
   end Output_ErrorCode;

   procedure Output_EmbeddedResource
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : EmbeddedResource) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("resource");
      Output_EmbeddedResourceResource (Handler, Value.resource);
      if Value.annotations.Is_Set then
         Handler.Key_Name ("annotations");
         Output_Annotations (Handler, Value.annotations.Value);
      end if;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_EmbeddedResource;

   procedure Output_ToolCallContentChunk
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ToolCallContentChunk) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("toolCallId");
      Handler.String_Value (Value.toolCallId);
      Handler.Key_Name ("content");
      Output_ToolCallContent (Handler, Value.content);
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ToolCallContentChunk;

   procedure Output_AgentCapabilities
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : AgentCapabilities) is
   begin
      Handler.Start_Object;
      if Value.session.Is_Set then
         Handler.Key_Name ("session");
         Output_SessionCapabilities (Handler, Value.session.Value);
      end if;
      if Value.auth.Is_Set then
         Handler.Key_Name ("auth");
         Output_AgentAuthCapabilities (Handler, Value.auth.Value);
      end if;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_AgentCapabilities;

   procedure Output_AudioContent
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : AudioContent) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("data");
      Handler.String_Value (Value.data);
      Handler.Key_Name ("mimeType");
      Handler.String_Value (Value.mimeType);
      if Value.annotations.Is_Set then
         Handler.Key_Name ("annotations");
         Output_Annotations (Handler, Value.annotations.Value);
      end if;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_AudioContent;

   procedure Output_RunningStateUpdate
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : RunningStateUpdate) is
   begin
      Handler.Start_Object;
      if not Value.background.Is_Empty then
         Handler.Key_Name ("background");
         Output_Any_Value (Handler, Value.background);
      end if;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_RunningStateUpdate;

   procedure Output_PlanEntry
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : PlanEntry) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("content");
      Handler.String_Value (Value.content);
      Handler.Key_Name ("priority");
      Handler.String_Value (Value.priority);
      Handler.Key_Name ("status");
      Handler.String_Value (Value.status);
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_PlanEntry;

   procedure Output_BackgroundTerminal
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : BackgroundTerminal) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("terminalId");
      Handler.String_Value (Value.terminalId);
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_BackgroundTerminal;

   procedure Output_Cost
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Cost) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("amount");
      Handler.Float_Value (Value.amount);
      Handler.Key_Name ("currency");
      Handler.String_Value (Value.currency);
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_Cost;

   procedure Output_SessionDeleteCapabilities
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SessionDeleteCapabilities) is
   begin
      Handler.Start_Object;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_SessionDeleteCapabilities;

   procedure Output_NewSessionRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : NewSessionRequest) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("cwd");
      Handler.String_Value (Value.cwd);
      if not Value.additionalDirectories.Is_Empty then
         Handler.Key_Name ("additionalDirectories");
         Handler.Start_Array;
         for J in 1 .. Value.additionalDirectories.Length loop
            Handler.String_Value (Value.additionalDirectories (J));
         end loop;
         Handler.End_Array;
      end if;
      if not Value.mcpServers.Is_Empty then
         Handler.Key_Name ("mcpServers");
         Output_Any_Value (Handler, Value.mcpServers);
      end if;
      if Value.systemPrompt.Is_Set then
         Handler.Key_Name ("systemPrompt");
         Output_SystemPrompt (Handler, Value.systemPrompt.Value);
      end if;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_NewSessionRequest;

   procedure Output_SessionConfigSelectGroup
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SessionConfigSelectGroup) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("groupId");
      Handler.String_Value (Value.groupId);
      Handler.Key_Name ("name");
      Handler.String_Value (Value.name);
      Handler.Key_Name ("options");
      Handler.Start_Array;
      for J in 1 .. Value.options.Length loop
         Output_SessionConfigSelectOption (Handler, Value.options (J));
      end loop;
      Handler.End_Array;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_SessionConfigSelectGroup;

   procedure Output_Content
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Content) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("content");
      Output_ContentBlock (Handler, Value.content);
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_Content;

   procedure Output_IntegerPropertySchema
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : IntegerPropertySchema) is
   begin
      Handler.Start_Object;
      if not Value.title.Is_Null then
         Handler.Key_Name ("title");
         Handler.String_Value (Value.title);
      end if;
      if not Value.description.Is_Null then
         Handler.Key_Name ("description");
         Handler.String_Value (Value.description);
      end if;
      if not Value.minimum.Is_Empty then
         Handler.Key_Name ("minimum");
         Output_Any_Value (Handler, Value.minimum);
      end if;
      if not Value.maximum.Is_Empty then
         Handler.Key_Name ("maximum");
         Output_Any_Value (Handler, Value.maximum);
      end if;
      if not Value.default.Is_Empty then
         Handler.Key_Name ("default");
         Output_Any_Value (Handler, Value.default);
      end if;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_IntegerPropertySchema;

   procedure Output_UpdateSessionNotification
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : UpdateSessionNotification) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("sessionId");
      Handler.String_Value (Value.sessionId);
      Handler.Key_Name ("update");
      Output_SessionUpdate (Handler, Value.update);
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_UpdateSessionNotification;

   procedure Output_ToolCallUpdate
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ToolCallUpdate) is
   begin
      Output_Any_Value (Handler, Value);
   end Output_ToolCallUpdate;

   procedure Output_SessionAdditionalDirectoriesCapabilities
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SessionAdditionalDirectoriesCapabilities) is
   begin
      Handler.Start_Object;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_SessionAdditionalDirectoriesCapabilities;

   procedure Output_SessionConfigOption
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SessionConfigOption) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("configId");
      Handler.String_Value (Value.configId);
      Handler.Key_Name ("name");
      Handler.String_Value (Value.name);
      if not Value.description.Is_Null then
         Handler.Key_Name ("description");
         Handler.String_Value (Value.description);
      end if;
      if not Value.category.Is_Null then
         Handler.Key_Name ("category");
         Handler.String_Value (Value.category);
      end if;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_SessionConfigOption;

   procedure Output_Annotations
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Annotations) is
   begin
      Handler.Start_Object;
      if not Value.audience.Is_Empty then
         Handler.Key_Name ("audience");
         Output_Any_Value (Handler, Value.audience);
      end if;
      if not Value.lastModified.Is_Null then
         Handler.Key_Name ("lastModified");
         Handler.String_Value (Value.lastModified);
      end if;
      if not Value.priority.Is_Empty then
         Handler.Key_Name ("priority");
         Output_Any_Value (Handler, Value.priority);
      end if;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_Annotations;

   procedure Output_AvailableCommand
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : AvailableCommand) is
   begin
      Output_Any_Value (Handler, Value);
   end Output_AvailableCommand;

   procedure Output_Diff
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Diff) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("changes");
      Handler.Start_Array;
      for J in 1 .. Value.changes.Length loop
         Output_DiffChange (Handler, Value.changes (J));
      end loop;
      Handler.End_Array;
      if Value.patch.Is_Set then
         Handler.Key_Name ("patch");
         Output_DiffPatch (Handler, Value.patch.Value);
      end if;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_Diff;

   procedure Output_AuthMethodTerminal
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : AuthMethodTerminal) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("methodId");
      Handler.String_Value (Value.methodId);
      Handler.Key_Name ("name");
      Handler.String_Value (Value.name);
      if not Value.description.Is_Null then
         Handler.Key_Name ("description");
         Handler.String_Value (Value.description);
      end if;
      if not Value.args.Is_Empty then
         Handler.Key_Name ("args");
         Handler.Start_Array;
         for J in 1 .. Value.args.Length loop
            Handler.String_Value (Value.args (J));
         end loop;
         Handler.End_Array;
      end if;
      if not Value.env.Is_Null then
         Handler.Key_Name ("env");
         Handler.Start_Array;
         for J in 1 .. Value.env.Length loop
            Output_EnvVariable (Handler, Value.env (J));
         end loop;
         Handler.End_Array;
      end if;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_AuthMethodTerminal;

   procedure Output_ElicitationCapabilities
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ElicitationCapabilities) is
   begin
      Handler.Start_Object;
      if Value.form.Is_Set then
         Handler.Key_Name ("form");
         Output_ElicitationFormCapabilities (Handler, Value.form.Value);
      end if;
      if Value.url.Is_Set then
         Handler.Key_Name ("url");
         Output_ElicitationUrlCapabilities (Handler, Value.url.Value);
      end if;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ElicitationCapabilities;

   procedure Output_TerminalExitStatus
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : TerminalExitStatus) is
   begin
      Handler.Start_Object;
      if not Value.exitCode.Is_Empty then
         Handler.Key_Name ("exitCode");
         Output_Any_Value (Handler, Value.exitCode);
      end if;
      if not Value.signal.Is_Null then
         Handler.Key_Name ("signal");
         Handler.String_Value (Value.signal);
      end if;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_TerminalExitStatus;

   procedure Output_DeleteSessionRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : DeleteSessionRequest) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("sessionId");
      Handler.String_Value (Value.sessionId);
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_DeleteSessionRequest;

   procedure Output_SystemPrompt
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SystemPrompt) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("mode");
      Handler.String_Value (Value.mode);
      Handler.Key_Name ("content");
      Output_Any_Value (Handler, Value.content);
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_SystemPrompt;

   procedure Output_McpServerHttp
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : McpServerHttp) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("name");
      Handler.String_Value (Value.name);
      Handler.Key_Name ("url");
      Handler.String_Value (Value.url);
      if not Value.headers.Is_Null then
         Handler.Key_Name ("headers");
         Handler.Start_Array;
         for J in 1 .. Value.headers.Length loop
            Output_HttpHeader (Handler, Value.headers (J));
         end loop;
         Handler.End_Array;
      end if;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_McpServerHttp;

   procedure Output_CancelSessionNotification
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CancelSessionNotification) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("sessionId");
      Handler.String_Value (Value.sessionId);
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_CancelSessionNotification;

   procedure Output_PromptRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : PromptRequest) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("sessionId");
      Handler.String_Value (Value.sessionId);
      Handler.Key_Name ("prompt");
      Output_Any_Value (Handler, Value.prompt);
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_PromptRequest;

   procedure Output_CommandPermissionSubject
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CommandPermissionSubject) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("command");
      Handler.String_Value (Value.command);
      Handler.Key_Name ("cwd");
      Handler.String_Value (Value.cwd);
      if not Value.toolCallId.Is_Null then
         Handler.Key_Name ("toolCallId");
         Handler.String_Value (Value.toolCallId);
      end if;
      if not Value.terminalId.Is_Null then
         Handler.Key_Name ("terminalId");
         Handler.String_Value (Value.terminalId);
      end if;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_CommandPermissionSubject;

   procedure Output_RequestPermissionOutcome
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : RequestPermissionOutcome) is
   begin
      Output_Any_Value (Handler, Value);
   end Output_RequestPermissionOutcome;

   procedure Output_DeleteSessionResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : DeleteSessionResponse) is
   begin
      Handler.Start_Object;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_DeleteSessionResponse;

   procedure Output_AgentThought
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : AgentThought) is
   begin
      Output_Any_Value (Handler, Value);
   end Output_AgentThought;

   procedure Output_NewSessionResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : NewSessionResponse) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("sessionId");
      Handler.String_Value (Value.sessionId);
      if not Value.configOptions.Is_Null then
         Handler.Key_Name ("configOptions");
         Handler.Start_Array;
         for J in 1 .. Value.configOptions.Length loop
            Output_SessionConfigOption (Handler, Value.configOptions (J));
         end loop;
         Handler.End_Array;
      end if;
      if not Value.availableCommands.Is_Empty then
         Handler.Key_Name ("availableCommands");
         Output_Any_Value (Handler, Value.availableCommands);
      end if;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_NewSessionResponse;

   procedure Output_CancelledPermissionOutcome
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CancelledPermissionOutcome) is
   begin
      Handler.Start_Object;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_CancelledPermissionOutcome;

   procedure Output_AvailableCommandsUpdate
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : AvailableCommandsUpdate) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("availableCommands");
      Output_Any_Value (Handler, Value.availableCommands);
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_AvailableCommandsUpdate;

   procedure Output_TitledMultiSelectItems
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : TitledMultiSelectItems) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("anyOf");
      Handler.Start_Array;
      for J in 1 .. Value.anyOf.Length loop
         Output_EnumOption (Handler, Value.anyOf (J));
      end loop;
      Handler.End_Array;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_TitledMultiSelectItems;

   procedure Output_McpCapabilities
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : McpCapabilities) is
   begin
      Handler.Start_Object;
      if Value.stdio.Is_Set then
         Handler.Key_Name ("stdio");
         Output_McpStdioCapabilities (Handler, Value.stdio.Value);
      end if;
      if Value.http.Is_Set then
         Handler.Key_Name ("http");
         Output_McpHttpCapabilities (Handler, Value.http.Value);
      end if;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_McpCapabilities;

   procedure Output_ElicitationSessionScope
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ElicitationSessionScope) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("sessionId");
      Handler.String_Value (Value.sessionId);
      if not Value.toolCallId.Is_Null then
         Handler.Key_Name ("toolCallId");
         Handler.String_Value (Value.toolCallId);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ElicitationSessionScope;

   procedure Output_TerminalSize
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : TerminalSize) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("cols");
      Handler.Integer_Value (Value.cols);
      Handler.Key_Name ("rows");
      Handler.Integer_Value (Value.rows);
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_TerminalSize;

   procedure Output_ElicitationContentValue
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ElicitationContentValue) is
   begin
      Output_Any_Value (Handler, Value);
   end Output_ElicitationContentValue;

   procedure Output_TextCommandInput
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : TextCommandInput) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("hint");
      Handler.String_Value (Value.hint);
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_TextCommandInput;

   procedure Output_ConfigOptionUpdate
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ConfigOptionUpdate) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("configOptions");
      Handler.Start_Array;
      for J in 1 .. Value.configOptions.Length loop
         Output_SessionConfigOption (Handler, Value.configOptions (J));
      end loop;
      Handler.End_Array;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ConfigOptionUpdate;

   procedure Output_CancelRequestNotification
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CancelRequestNotification) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("requestId");
      if Value.requestId.Is_String then
         Handler.String_Value (Value.requestId.String);
      else
         Handler.Integer_Value (Value.requestId.Integer);
      end if;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_CancelRequestNotification;

   procedure Output_TerminalAuthCapabilities
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : TerminalAuthCapabilities) is
   begin
      Handler.Start_Object;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_TerminalAuthCapabilities;

   procedure Output_TextContent
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : TextContent) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("text");
      Handler.String_Value (Value.text);
      if Value.annotations.Is_Set then
         Handler.Key_Name ("annotations");
         Output_Annotations (Handler, Value.annotations.Value);
      end if;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_TextContent;

   procedure Output_MultiSelectPropertySchema
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : MultiSelectPropertySchema) is
   begin
      Handler.Start_Object;
      if not Value.title.Is_Null then
         Handler.Key_Name ("title");
         Handler.String_Value (Value.title);
      end if;
      if not Value.description.Is_Null then
         Handler.Key_Name ("description");
         Handler.String_Value (Value.description);
      end if;
      if not Value.minItems.Is_Empty then
         Handler.Key_Name ("minItems");
         Output_Any_Value (Handler, Value.minItems);
      end if;
      if not Value.maxItems.Is_Empty then
         Handler.Key_Name ("maxItems");
         Output_Any_Value (Handler, Value.maxItems);
      end if;
      Handler.Key_Name ("items");
      Output_MultiSelectItems (Handler, Value.items);
      if not Value.default.Is_Empty then
         Handler.Key_Name ("default");
         Output_Any_Value (Handler, Value.default);
      end if;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_MultiSelectPropertySchema;

   procedure Output_ContentChunk
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ContentChunk) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("messageId");
      Handler.String_Value (Value.messageId);
      Handler.Key_Name ("content");
      Output_ContentBlock (Handler, Value.content);
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ContentChunk;

   procedure Output_SessionConfigSelect
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SessionConfigSelect) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("currentValue");
      Handler.String_Value (Value.currentValue);
      Handler.Key_Name ("options");
      Output_SessionConfigSelectOptions (Handler, Value.options);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_SessionConfigSelect;

   procedure Output_ToolCallLocation
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ToolCallLocation) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("path");
      Handler.String_Value (Value.path);
      if not Value.line.Is_Empty then
         Handler.Key_Name ("line");
         Output_Any_Value (Handler, Value.line);
      end if;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ToolCallLocation;

   procedure Output_BooleanPropertySchema
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : BooleanPropertySchema) is
   begin
      Handler.Start_Object;
      if not Value.title.Is_Null then
         Handler.Key_Name ("title");
         Handler.String_Value (Value.title);
      end if;
      if not Value.description.Is_Null then
         Handler.Key_Name ("description");
         Handler.String_Value (Value.description);
      end if;
      if not Value.default.Is_Empty then
         Handler.Key_Name ("default");
         Output_Any_Value (Handler, Value.default);
      end if;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_BooleanPropertySchema;

   procedure Output_SessionInfo
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SessionInfo) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("sessionId");
      Handler.String_Value (Value.sessionId);
      Handler.Key_Name ("cwd");
      Handler.String_Value (Value.cwd);
      if not Value.additionalDirectories.Is_Empty then
         Handler.Key_Name ("additionalDirectories");
         Handler.Start_Array;
         for J in 1 .. Value.additionalDirectories.Length loop
            Handler.String_Value (Value.additionalDirectories (J));
         end loop;
         Handler.End_Array;
      end if;
      if not Value.title.Is_Null then
         Handler.Key_Name ("title");
         Handler.String_Value (Value.title);
      end if;
      if not Value.updatedAt.Is_Null then
         Handler.Key_Name ("updatedAt");
         Handler.String_Value (Value.updatedAt);
      end if;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_SessionInfo;

   procedure Output_Error
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Error) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("code");
      Output_ErrorCode (Handler, Value.code);
      Handler.Key_Name ("message");
      Handler.String_Value (Value.message);
      if Value.data.Is_Set then
         Handler.Key_Name ("data");
         Output_ErrorData (Handler, Value.data.Value);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_Error;

   procedure Output_ClientResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ClientResponse) is
   begin
      Output_Any_Value (Handler, Value);
   end Output_ClientResponse;

   procedure Output_PlanUpdate
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : PlanUpdate) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("plan");
      Output_PlanUpdateContent (Handler, Value.plan);
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_PlanUpdate;

   procedure Output_ElicitationFormMode
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ElicitationFormMode) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("requestedSchema");
      Output_ElicitationSchema (Handler, Value.requestedSchema);
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ElicitationFormMode;

   procedure Output_ListSessionsRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ListSessionsRequest) is
   begin
      Handler.Start_Object;
      if not Value.cwd.Is_Null then
         Handler.Key_Name ("cwd");
         Handler.String_Value (Value.cwd);
      end if;
      if not Value.cursor.Is_Null then
         Handler.Key_Name ("cursor");
         Handler.String_Value (Value.cursor);
      end if;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ListSessionsRequest;

   procedure Output_UnsupportedProtocolVersionErrorData
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : UnsupportedProtocolVersionErrorData) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("requested");
      Handler.Integer_Value (Value.requested);
      Handler.Key_Name ("supported");
      Handler.Start_Array;
      for J in 1 .. Value.supported.Length loop
         Handler.Integer_Value (Value.supported (J));
      end loop;
      Handler.End_Array;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_UnsupportedProtocolVersionErrorData;

   procedure Output_AgentAuthCapabilities
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : AgentAuthCapabilities) is
   begin
      Handler.Start_Object;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_AgentAuthCapabilities;

   procedure Output_CancelToolCallRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CancelToolCallRequest) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("sessionId");
      Handler.String_Value (Value.sessionId);
      Handler.Key_Name ("toolCallId");
      Handler.String_Value (Value.toolCallId);
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_CancelToolCallRequest;

   procedure Output_SessionConfigSelectOptions
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SessionConfigSelectOptions) is
   begin
      Output_Any_Value (Handler, Value);
   end Output_SessionConfigSelectOptions;

   procedure Output_SetSessionConfigOptionResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SetSessionConfigOptionResponse) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("configOptions");
      Handler.Start_Array;
      for J in 1 .. Value.configOptions.Length loop
         Output_SessionConfigOption (Handler, Value.configOptions (J));
      end loop;
      Handler.End_Array;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_SetSessionConfigOptionResponse;

   procedure Output_AuthMethod
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : AuthMethod) is
   begin
      Output_Any_Value (Handler, Value);
   end Output_AuthMethod;

   procedure Output_TerminalOutput
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : TerminalOutput) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("data");
      Handler.String_Value (Value.data);
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_TerminalOutput;

   procedure Output_Command
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Command) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("name");
      Handler.String_Value (Value.name);
      Handler.Key_Name ("description");
      Handler.String_Value (Value.description);
      if Value.input.Is_Set then
         Handler.Key_Name ("input");
         Output_AvailableCommandInput (Handler, Value.input.Value);
      end if;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_Command;

   procedure Output_McpStdioCapabilities
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : McpStdioCapabilities) is
   begin
      Handler.Start_Object;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_McpStdioCapabilities;

   procedure Output_ElicitationSchema
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ElicitationSchema) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("type");
      Output_ElicitationSchemaType (Handler, Value.a_type);
      if not Value.title.Is_Null then
         Handler.Key_Name ("title");
         Handler.String_Value (Value.title);
      end if;
      Handler.Key_Name ("properties");
      Output_Any_Value (Handler, Value.properties);
      if not Value.required.Is_Empty then
         Handler.Key_Name ("required");
         Output_Any_Value (Handler, Value.required);
      end if;
      if not Value.description.Is_Null then
         Handler.Key_Name ("description");
         Handler.String_Value (Value.description);
      end if;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ElicitationSchema;

   procedure Output_TextResourceContents
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : TextResourceContents) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("text");
      Handler.String_Value (Value.text);
      Handler.Key_Name ("uri");
      Handler.String_Value (Value.uri);
      if not Value.mimeType.Is_Null then
         Handler.Key_Name ("mimeType");
         Handler.String_Value (Value.mimeType);
      end if;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_TextResourceContents;

   procedure Output_ListSessionsResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ListSessionsResponse) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("sessions");
      Handler.Start_Array;
      for J in 1 .. Value.sessions.Length loop
         Output_SessionInfo (Handler, Value.sessions (J));
      end loop;
      Handler.End_Array;
      if not Value.nextCursor.Is_Null then
         Handler.Key_Name ("nextCursor");
         Handler.String_Value (Value.nextCursor);
      end if;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ListSessionsResponse;

   procedure Output_Terminal
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Terminal) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("terminalId");
      Handler.String_Value (Value.terminalId);
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_Terminal;

   procedure Output_ClientCapabilities
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ClientCapabilities) is
   begin
      Handler.Start_Object;
      if Value.auth.Is_Set then
         Handler.Key_Name ("auth");
         Output_ClientAuthCapabilities (Handler, Value.auth.Value);
      end if;
      if Value.elicitation.Is_Set then
         Handler.Key_Name ("elicitation");
         Output_ElicitationCapabilities (Handler, Value.elicitation.Value);
      end if;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ClientCapabilities;

   procedure Output_CancelTerminalResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CancelTerminalResponse) is
   begin
      Handler.Start_Object;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_CancelTerminalResponse;

   procedure Output_EnumOption
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : EnumOption) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("const");
      Handler.String_Value (Value.const);
      Handler.Key_Name ("title");
      Handler.String_Value (Value.title);
      if not Value.description.Is_Null then
         Handler.Key_Name ("description");
         Handler.String_Value (Value.description);
      end if;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_EnumOption;

   procedure Output_BlobResourceContents
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : BlobResourceContents) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("blob");
      Handler.String_Value (Value.blob);
      Handler.Key_Name ("uri");
      Handler.String_Value (Value.uri);
      if not Value.mimeType.Is_Null then
         Handler.Key_Name ("mimeType");
         Handler.String_Value (Value.mimeType);
      end if;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_BlobResourceContents;

   procedure Output_InitializeResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : InitializeResponse) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("protocolVersion");
      Handler.Integer_Value (Value.protocolVersion);
      Handler.Key_Name ("info");
      Output_Implementation (Handler, Value.info);
      if Value.capabilities.Is_Set then
         Handler.Key_Name ("capabilities");
         Output_AgentCapabilities (Handler, Value.capabilities.Value);
      end if;
      if not Value.authMethods.Is_Empty then
         Handler.Key_Name ("authMethods");
         Output_Any_Value (Handler, Value.authMethods);
      end if;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_InitializeResponse;

   procedure Output_CompactionSummaryChunk
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CompactionSummaryChunk) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("compactionId");
      Handler.String_Value (Value.compactionId);
      Handler.Key_Name ("content");
      Output_ContentBlock (Handler, Value.content);
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_CompactionSummaryChunk;

   procedure Output_PromptImageCapabilities
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : PromptImageCapabilities) is
   begin
      Handler.Start_Object;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_PromptImageCapabilities;

   procedure Output_ResourceLink
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ResourceLink) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("name");
      Handler.String_Value (Value.name);
      Handler.Key_Name ("uri");
      Handler.String_Value (Value.uri);
      if not Value.title.Is_Null then
         Handler.Key_Name ("title");
         Handler.String_Value (Value.title);
      end if;
      if not Value.description.Is_Null then
         Handler.Key_Name ("description");
         Handler.String_Value (Value.description);
      end if;
      if not Value.icons.Is_Empty then
         Handler.Key_Name ("icons");
         Output_Any_Value (Handler, Value.icons);
      end if;
      if not Value.mimeType.Is_Null then
         Handler.Key_Name ("mimeType");
         Handler.String_Value (Value.mimeType);
      end if;
      if not Value.size.Is_Empty then
         Handler.Key_Name ("size");
         Output_Any_Value (Handler, Value.size);
      end if;
      if Value.annotations.Is_Set then
         Handler.Key_Name ("annotations");
         Output_Annotations (Handler, Value.annotations.Value);
      end if;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ResourceLink;

   procedure Output_SelectedPermissionOutcome
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SelectedPermissionOutcome) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("optionId");
      Handler.String_Value (Value.optionId);
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_SelectedPermissionOutcome;

   procedure Output_SessionSystemPromptModeCapabilities
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SessionSystemPromptModeCapabilities) is
   begin
      Handler.Start_Object;
      if Value.override.Is_Set then
         Handler.Key_Name ("override");
         Output_SessionSystemPromptOverrideCapabilities
           (Handler, Value.override.Value);
      end if;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_SessionSystemPromptModeCapabilities;

   procedure Output_ToolCallCapabilities
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ToolCallCapabilities) is
   begin
      Handler.Start_Object;
      if Value.cancel.Is_Set then
         Handler.Key_Name ("cancel");
         Output_ToolCallCancelCapabilities (Handler, Value.cancel.Value);
      end if;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ToolCallCapabilities;

   procedure Output_ElicitationUrlCapabilities
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ElicitationUrlCapabilities) is
   begin
      Handler.Start_Object;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ElicitationUrlCapabilities;

   procedure Output_HttpHeader
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : HttpHeader) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("name");
      Handler.String_Value (Value.name);
      Handler.Key_Name ("value");
      Handler.String_Value (Value.value);
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_HttpHeader;

   procedure Output_ElicitationSchemaType
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ElicitationSchemaType) is
   begin
      Output_Any_Value (Handler, Value);
   end Output_ElicitationSchemaType;

   procedure Output_ElicitationFormCapabilities
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ElicitationFormCapabilities) is
   begin
      Handler.Start_Object;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ElicitationFormCapabilities;

   procedure Output_StateUpdate
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : StateUpdate) is
   begin
      Output_Any_Value (Handler, Value);
   end Output_StateUpdate;

   procedure Output_AuthMethodAgent
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : AuthMethodAgent) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("methodId");
      Handler.String_Value (Value.methodId);
      Handler.Key_Name ("name");
      Handler.String_Value (Value.name);
      if not Value.description.Is_Null then
         Handler.Key_Name ("description");
         Handler.String_Value (Value.description);
      end if;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_AuthMethodAgent;

   procedure Output_EnvVariable
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : EnvVariable) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("name");
      Handler.String_Value (Value.name);
      Handler.Key_Name ("value");
      Handler.String_Value (Value.value);
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_EnvVariable;

   procedure Output_ClientNotification
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ClientNotification) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("method");
      Handler.String_Value (Value.method);
      if not Value.params.Is_Empty then
         Handler.Key_Name ("params");
         Output_Any_Value (Handler, Value.params);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ClientNotification;

   procedure Output_ToolCallPermissionSubject
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ToolCallPermissionSubject) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("toolCall");
      Output_ToolCallUpdate (Handler, Value.toolCall);
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ToolCallPermissionSubject;

   procedure Output_LoginAuthResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : LoginAuthResponse) is
   begin
      Handler.Start_Object;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_LoginAuthResponse;

   procedure Output_SessionConfigSelectOption
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SessionConfigSelectOption) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("value");
      Handler.String_Value (Value.value);
      Handler.Key_Name ("name");
      Handler.String_Value (Value.name);
      if not Value.description.Is_Null then
         Handler.Key_Name ("description");
         Handler.String_Value (Value.description);
      end if;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_SessionConfigSelectOption;

   procedure Output_PlanUpdateContent
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : PlanUpdateContent) is
   begin
      Output_Any_Value (Handler, Value);
   end Output_PlanUpdateContent;

   procedure Output_CancelTerminalRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CancelTerminalRequest) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("sessionId");
      Handler.String_Value (Value.sessionId);
      Handler.Key_Name ("terminalId");
      Handler.String_Value (Value.terminalId);
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_CancelTerminalRequest;

   procedure Output_ResumeSessionRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ResumeSessionRequest) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("sessionId");
      Handler.String_Value (Value.sessionId);
      Handler.Key_Name ("cwd");
      Handler.String_Value (Value.cwd);
      if not Value.additionalDirectories.Is_Empty then
         Handler.Key_Name ("additionalDirectories");
         Handler.Start_Array;
         for J in 1 .. Value.additionalDirectories.Length loop
            Handler.String_Value (Value.additionalDirectories (J));
         end loop;
         Handler.End_Array;
      end if;
      if not Value.mcpServers.Is_Empty then
         Handler.Key_Name ("mcpServers");
         Output_Any_Value (Handler, Value.mcpServers);
      end if;
      if Value.replayFrom.Is_Set then
         Handler.Key_Name ("replayFrom");
         Output_ReplayFrom (Handler, Value.replayFrom.Value);
      end if;
      if Value.systemPrompt.Is_Set then
         Handler.Key_Name ("systemPrompt");
         Output_SystemPrompt (Handler, Value.systemPrompt.Value);
      end if;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ResumeSessionRequest;

   procedure Output_ErrorStopReason
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ErrorStopReason) is
   begin
      Handler.Start_Object;
      if Value.error.Is_Set then
         Handler.Key_Name ("error");
         Output_Error (Handler, Value.error.Value);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ErrorStopReason;

   procedure Output_PlanItems
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : PlanItems) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("planId");
      Handler.String_Value (Value.planId);
      Handler.Key_Name ("entries");
      Handler.Start_Array;
      for J in 1 .. Value.entries.Length loop
         Output_PlanEntry (Handler, Value.entries (J));
      end loop;
      Handler.End_Array;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_PlanItems;

   procedure Output_CompleteElicitationNotification
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CompleteElicitationNotification) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("elicitationId");
      Handler.String_Value (Value.elicitationId);
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_CompleteElicitationNotification;

   procedure Output_ReplayFrom
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ReplayFrom) is
   begin
      Output_Any_Value (Handler, Value);
   end Output_ReplayFrom;

   procedure Output_ErrorData
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ErrorData) is
   begin
      Output_Any_Value (Handler, Value);
   end Output_ErrorData;

   procedure Output_StringMultiSelectItems
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : StringMultiSelectItems) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("enum");
      Handler.Start_Array;
      for J in 1 .. Value.enum.Length loop
         Handler.String_Value (Value.enum (J));
      end loop;
      Handler.End_Array;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_StringMultiSelectItems;

   procedure Output_Icon
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Icon) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("src");
      Handler.String_Value (Value.src);
      if not Value.mimeType.Is_Null then
         Handler.Key_Name ("mimeType");
         Handler.String_Value (Value.mimeType);
      end if;
      if not Value.sizes.Is_Empty then
         Handler.Key_Name ("sizes");
         Output_Any_Value (Handler, Value.sizes);
      end if;
      if not Value.theme.Is_Null then
         Handler.Key_Name ("theme");
         Handler.String_Value (Value.theme);
      end if;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_Icon;

   procedure Output_NumberPropertySchema
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : NumberPropertySchema) is
   begin
      Handler.Start_Object;
      if not Value.title.Is_Null then
         Handler.Key_Name ("title");
         Handler.String_Value (Value.title);
      end if;
      if not Value.description.Is_Null then
         Handler.Key_Name ("description");
         Handler.String_Value (Value.description);
      end if;
      if not Value.minimum.Is_Empty then
         Handler.Key_Name ("minimum");
         Output_Any_Value (Handler, Value.minimum);
      end if;
      if not Value.maximum.Is_Empty then
         Handler.Key_Name ("maximum");
         Output_Any_Value (Handler, Value.maximum);
      end if;
      if not Value.default.Is_Empty then
         Handler.Key_Name ("default");
         Output_Any_Value (Handler, Value.default);
      end if;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_NumberPropertySchema;

   procedure Output_McpServerStdio
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : McpServerStdio) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("name");
      Handler.String_Value (Value.name);
      Handler.Key_Name ("command");
      Handler.String_Value (Value.command);
      if not Value.args.Is_Empty then
         Handler.Key_Name ("args");
         Handler.Start_Array;
         for J in 1 .. Value.args.Length loop
            Handler.String_Value (Value.args (J));
         end loop;
         Handler.End_Array;
      end if;
      if not Value.env.Is_Null then
         Handler.Key_Name ("env");
         Handler.Start_Array;
         for J in 1 .. Value.env.Length loop
            Output_EnvVariable (Handler, Value.env (J));
         end loop;
         Handler.End_Array;
      end if;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_McpServerStdio;

   procedure Output_CreateElicitationResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CreateElicitationResponse) is
   begin
      Handler.Start_Object;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_CreateElicitationResponse;

   procedure Output_SessionUpdate
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SessionUpdate) is
   begin
      Output_Any_Value (Handler, Value);
   end Output_SessionUpdate;

   procedure Output_AgentResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : AgentResponse) is
   begin
      Output_Any_Value (Handler, Value);
   end Output_AgentResponse;

   procedure Output_PermissionOption
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : PermissionOption) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("optionId");
      Handler.String_Value (Value.optionId);
      Handler.Key_Name ("name");
      Handler.String_Value (Value.name);
      Handler.Key_Name ("kind");
      Handler.String_Value (Value.kind);
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_PermissionOption;

   procedure Output_Notice
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Notice) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("severity");
      Handler.String_Value (Value.severity);
      Handler.Key_Name ("title");
      Handler.String_Value (Value.title);
      if not Value.description.Is_Null then
         Handler.Key_Name ("description");
         Handler.String_Value (Value.description);
      end if;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_Notice;

   procedure Output_InitializeRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : InitializeRequest) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("protocolVersion");
      Handler.Integer_Value (Value.protocolVersion);
      Handler.Key_Name ("info");
      Output_Implementation (Handler, Value.info);
      if Value.capabilities.Is_Set then
         Handler.Key_Name ("capabilities");
         Output_ClientCapabilities (Handler, Value.capabilities.Value);
      end if;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_InitializeRequest;

   procedure Output_SessionSystemPromptOverrideCapabilities
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SessionSystemPromptOverrideCapabilities) is
   begin
      Handler.Start_Object;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_SessionSystemPromptOverrideCapabilities;

   procedure Output_TerminalCapabilities
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : TerminalCapabilities) is
   begin
      Handler.Start_Object;
      if Value.cancel.Is_Set then
         Handler.Key_Name ("cancel");
         Output_TerminalCancelCapabilities (Handler, Value.cancel.Value);
      end if;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_TerminalCapabilities;

   procedure Output_UsageUpdate
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : UsageUpdate) is
   begin
      Output_Any_Value (Handler, Value);
   end Output_UsageUpdate;

   procedure Output_AgentRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : AgentRequest) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("id");
      if Value.id.Is_String then
         Handler.String_Value (Value.id.String);
      else
         Handler.Integer_Value (Value.id.Integer);
      end if;
      Handler.Key_Name ("method");
      Handler.String_Value (Value.method);
      if not Value.params.Is_Empty then
         Handler.Key_Name ("params");
         Output_Any_Value (Handler, Value.params);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_AgentRequest;

   procedure Output_Implementation
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Implementation) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("name");
      Handler.String_Value (Value.name);
      if not Value.title.Is_Null then
         Handler.Key_Name ("title");
         Handler.String_Value (Value.title);
      end if;
      Handler.Key_Name ("version");
      Handler.String_Value (Value.version);
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_Implementation;

   procedure Output_McpServer
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : McpServer) is
   begin
      Output_Any_Value (Handler, Value);
   end Output_McpServer;

   procedure Output_ReplayFromStart
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ReplayFromStart) is
   begin
      Handler.Start_Object;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_ReplayFromStart;

   procedure Output_ElicitationPropertySchema
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ElicitationPropertySchema) is
   begin
      Output_Any_Value (Handler, Value);
   end Output_ElicitationPropertySchema;

   procedure Output_MultiSelectItems
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : MultiSelectItems) is
   begin
      Output_Any_Value (Handler, Value);
   end Output_MultiSelectItems;

   procedure Output_CancelToolCallResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CancelToolCallResponse) is
   begin
      Handler.Start_Object;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_CancelToolCallResponse;

   procedure Output_BackgroundToolCall
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : BackgroundToolCall) is
   begin
      Handler.Start_Object;
      Handler.Key_Name ("toolCallId");
      Handler.String_Value (Value.toolCallId);
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_BackgroundToolCall;

   procedure Output_RequiresActionStateUpdate
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : RequiresActionStateUpdate) is
   begin
      Handler.Start_Object;
      if not Value.background.Is_Empty then
         Handler.Key_Name ("background");
         Output_Any_Value (Handler, Value.background);
      end if;
      if not Value.meta.Is_Empty then
         Handler.Key_Name ("_meta");
         Output_Any_Value (Handler, Value.meta);
      end if;
      Output_Any_Value (Handler, Value.Additional_Properties);
      Handler.End_Object;
   end Output_RequiresActionStateUpdate;

end ACP.Types.Outputs;
