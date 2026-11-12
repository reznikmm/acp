
--  SPDX-FileCopyrightText: 2026 Max Reznik <reznikmm@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--
--  Generated from the ACP v2 schema. See schema/README.md.

with VSS.JSON.Content_Handlers;

package ACP.Types.Outputs is

   procedure Output_SetSessionConfigOptionRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SetSessionConfigOptionRequest);

   procedure Output_LoginAuthRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : LoginAuthRequest);

   procedure Output_SessionConfigBoolean
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SessionConfigBoolean);

   procedure Output_TerminalOutputChunk
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : TerminalOutputChunk);

   procedure Output_DiffPatch
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : DiffPatch);

   procedure Output_AgentNotification
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : AgentNotification);

   procedure Output_ElicitationAcceptAction
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ElicitationAcceptAction);

   procedure Output_UserMessage
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : UserMessage);

   procedure Output_CloseSessionResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CloseSessionResponse);

   procedure Output_AgentMessage
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : AgentMessage);

   procedure Output_ToolCallCancelCapabilities
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ToolCallCancelCapabilities);

   procedure Output_LogoutAuthRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : LogoutAuthRequest);

   procedure Output_ResumeSessionResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ResumeSessionResponse);

   procedure Output_CloseSessionRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CloseSessionRequest);

   procedure Output_DiffChange
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : DiffChange);

   procedure Output_TerminalCancelCapabilities
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : TerminalCancelCapabilities);

   procedure Output_CompactionUpdate
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CompactionUpdate);

   procedure Output_PromptResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : PromptResponse);

   procedure Output_ToolCallContent
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ToolCallContent);

   procedure Output_EmbeddedResourceResource
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : EmbeddedResourceResource);

   procedure Output_ClientAuthCapabilities
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ClientAuthCapabilities);

   procedure Output_McpHttpCapabilities
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : McpHttpCapabilities);

   procedure Output_PromptEmbeddedContextCapabilities
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : PromptEmbeddedContextCapabilities);

   procedure Output_AvailableCommandInput
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : AvailableCommandInput);

   procedure Output_PromptCapabilities
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : PromptCapabilities);

   procedure Output_ImageContent
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ImageContent);

   procedure Output_SessionCapabilities
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SessionCapabilities);

   procedure Output_ElicitationRequestScope
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ElicitationRequestScope);

   procedure Output_SessionSystemPromptCapabilities
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SessionSystemPromptCapabilities);

   procedure Output_DiffPathChange
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : DiffPathChange);

   procedure Output_CreateElicitationRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CreateElicitationRequest);

   procedure Output_IdleStateUpdate
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : IdleStateUpdate);

   procedure Output_BackgroundWork
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : BackgroundWork);

   procedure Output_SessionNotFoundErrorData
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SessionNotFoundErrorData);

   procedure Output_RequestPermissionResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : RequestPermissionResponse);

   procedure Output_ElicitationUrlMode
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ElicitationUrlMode);

   procedure Output_RequestPermissionSubject
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : RequestPermissionSubject);

   procedure Output_PromptAudioCapabilities
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : PromptAudioCapabilities);

   procedure Output_ClientRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ClientRequest);

   procedure Output_ContentBlock
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ContentBlock);

   procedure Output_RequestPermissionRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : RequestPermissionRequest);

   procedure Output_StringPropertySchema
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : StringPropertySchema);

   procedure Output_TerminalUpdate
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : TerminalUpdate);

   procedure Output_DiffPathPairChange
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : DiffPathPairChange);

   procedure Output_SessionInfoUpdate
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SessionInfoUpdate);

   procedure Output_LogoutAuthResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : LogoutAuthResponse);

   procedure Output_ErrorCode
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ErrorCode);

   procedure Output_EmbeddedResource
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : EmbeddedResource);

   procedure Output_ToolCallContentChunk
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ToolCallContentChunk);

   procedure Output_AgentCapabilities
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : AgentCapabilities);

   procedure Output_AudioContent
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : AudioContent);

   procedure Output_RunningStateUpdate
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : RunningStateUpdate);

   procedure Output_PlanEntry
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : PlanEntry);

   procedure Output_BackgroundTerminal
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : BackgroundTerminal);

   procedure Output_Cost
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Cost);

   procedure Output_SessionDeleteCapabilities
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SessionDeleteCapabilities);

   procedure Output_NewSessionRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : NewSessionRequest);

   procedure Output_SessionConfigSelectGroup
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SessionConfigSelectGroup);

   procedure Output_Content
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Content);

   procedure Output_IntegerPropertySchema
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : IntegerPropertySchema);

   procedure Output_UpdateSessionNotification
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : UpdateSessionNotification);

   procedure Output_ToolCallUpdate
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ToolCallUpdate);

   procedure Output_SessionAdditionalDirectoriesCapabilities
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SessionAdditionalDirectoriesCapabilities);

   procedure Output_SessionConfigOption
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SessionConfigOption);

   procedure Output_Annotations
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Annotations);

   procedure Output_AvailableCommand
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : AvailableCommand);

   procedure Output_Diff
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Diff);

   procedure Output_AuthMethodTerminal
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : AuthMethodTerminal);

   procedure Output_ElicitationCapabilities
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ElicitationCapabilities);

   procedure Output_TerminalExitStatus
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : TerminalExitStatus);

   procedure Output_DeleteSessionRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : DeleteSessionRequest);

   procedure Output_SystemPrompt
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SystemPrompt);

   procedure Output_McpServerHttp
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : McpServerHttp);

   procedure Output_CancelSessionNotification
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CancelSessionNotification);

   procedure Output_PromptRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : PromptRequest);

   procedure Output_CommandPermissionSubject
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CommandPermissionSubject);

   procedure Output_RequestPermissionOutcome
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : RequestPermissionOutcome);

   procedure Output_DeleteSessionResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : DeleteSessionResponse);

   procedure Output_AgentThought
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : AgentThought);

   procedure Output_NewSessionResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : NewSessionResponse);

   procedure Output_CancelledPermissionOutcome
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CancelledPermissionOutcome);

   procedure Output_AvailableCommandsUpdate
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : AvailableCommandsUpdate);

   procedure Output_TitledMultiSelectItems
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : TitledMultiSelectItems);

   procedure Output_McpCapabilities
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : McpCapabilities);

   procedure Output_ElicitationSessionScope
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ElicitationSessionScope);

   procedure Output_TerminalSize
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : TerminalSize);

   procedure Output_ElicitationContentValue
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ElicitationContentValue);

   procedure Output_TextCommandInput
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : TextCommandInput);

   procedure Output_ConfigOptionUpdate
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ConfigOptionUpdate);

   procedure Output_CancelRequestNotification
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CancelRequestNotification);

   procedure Output_TerminalAuthCapabilities
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : TerminalAuthCapabilities);

   procedure Output_TextContent
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : TextContent);

   procedure Output_MultiSelectPropertySchema
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : MultiSelectPropertySchema);

   procedure Output_ContentChunk
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ContentChunk);

   procedure Output_SessionConfigSelect
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SessionConfigSelect);

   procedure Output_ToolCallLocation
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ToolCallLocation);

   procedure Output_BooleanPropertySchema
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : BooleanPropertySchema);

   procedure Output_SessionInfo
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SessionInfo);

   procedure Output_Error
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Error);

   procedure Output_ClientResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ClientResponse);

   procedure Output_PlanUpdate
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : PlanUpdate);

   procedure Output_ElicitationFormMode
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ElicitationFormMode);

   procedure Output_ListSessionsRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ListSessionsRequest);

   procedure Output_UnsupportedProtocolVersionErrorData
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : UnsupportedProtocolVersionErrorData);

   procedure Output_AgentAuthCapabilities
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : AgentAuthCapabilities);

   procedure Output_CancelToolCallRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CancelToolCallRequest);

   procedure Output_SessionConfigSelectOptions
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SessionConfigSelectOptions);

   procedure Output_SetSessionConfigOptionResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SetSessionConfigOptionResponse);

   procedure Output_AuthMethod
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : AuthMethod);

   procedure Output_TerminalOutput
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : TerminalOutput);

   procedure Output_Command
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Command);

   procedure Output_McpStdioCapabilities
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : McpStdioCapabilities);

   procedure Output_ElicitationSchema
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ElicitationSchema);

   procedure Output_TextResourceContents
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : TextResourceContents);

   procedure Output_ListSessionsResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ListSessionsResponse);

   procedure Output_Terminal
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Terminal);

   procedure Output_ClientCapabilities
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ClientCapabilities);

   procedure Output_CancelTerminalResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CancelTerminalResponse);

   procedure Output_EnumOption
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : EnumOption);

   procedure Output_BlobResourceContents
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : BlobResourceContents);

   procedure Output_InitializeResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : InitializeResponse);

   procedure Output_CompactionSummaryChunk
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CompactionSummaryChunk);

   procedure Output_PromptImageCapabilities
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : PromptImageCapabilities);

   procedure Output_ResourceLink
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ResourceLink);

   procedure Output_SelectedPermissionOutcome
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SelectedPermissionOutcome);

   procedure Output_SessionSystemPromptModeCapabilities
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SessionSystemPromptModeCapabilities);

   procedure Output_ToolCallCapabilities
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ToolCallCapabilities);

   procedure Output_ElicitationUrlCapabilities
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ElicitationUrlCapabilities);

   procedure Output_HttpHeader
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : HttpHeader);

   procedure Output_ElicitationSchemaType
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ElicitationSchemaType);

   procedure Output_ElicitationFormCapabilities
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ElicitationFormCapabilities);

   procedure Output_StateUpdate
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : StateUpdate);

   procedure Output_AuthMethodAgent
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : AuthMethodAgent);

   procedure Output_EnvVariable
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : EnvVariable);

   procedure Output_ClientNotification
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ClientNotification);

   procedure Output_ToolCallPermissionSubject
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ToolCallPermissionSubject);

   procedure Output_LoginAuthResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : LoginAuthResponse);

   procedure Output_SessionConfigSelectOption
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SessionConfigSelectOption);

   procedure Output_PlanUpdateContent
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : PlanUpdateContent);

   procedure Output_CancelTerminalRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CancelTerminalRequest);

   procedure Output_ResumeSessionRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ResumeSessionRequest);

   procedure Output_ErrorStopReason
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ErrorStopReason);

   procedure Output_PlanItems
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : PlanItems);

   procedure Output_CompleteElicitationNotification
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CompleteElicitationNotification);

   procedure Output_ReplayFrom
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ReplayFrom);

   procedure Output_ErrorData
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ErrorData);

   procedure Output_StringMultiSelectItems
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : StringMultiSelectItems);

   procedure Output_Icon
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Icon);

   procedure Output_NumberPropertySchema
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : NumberPropertySchema);

   procedure Output_McpServerStdio
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : McpServerStdio);

   procedure Output_CreateElicitationResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CreateElicitationResponse);

   procedure Output_SessionUpdate
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SessionUpdate);

   procedure Output_AgentResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : AgentResponse);

   procedure Output_PermissionOption
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : PermissionOption);

   procedure Output_Notice
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Notice);

   procedure Output_InitializeRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : InitializeRequest);

   procedure Output_SessionSystemPromptOverrideCapabilities
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : SessionSystemPromptOverrideCapabilities);

   procedure Output_TerminalCapabilities
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : TerminalCapabilities);

   procedure Output_UsageUpdate
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : UsageUpdate);

   procedure Output_AgentRequest
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : AgentRequest);

   procedure Output_Implementation
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : Implementation);

   procedure Output_McpServer
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : McpServer);

   procedure Output_ReplayFromStart
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ReplayFromStart);

   procedure Output_ElicitationPropertySchema
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : ElicitationPropertySchema);

   procedure Output_MultiSelectItems
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : MultiSelectItems);

   procedure Output_CancelToolCallResponse
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : CancelToolCallResponse);

   procedure Output_BackgroundToolCall
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : BackgroundToolCall);

   procedure Output_RequiresActionStateUpdate
     (Handler : in out VSS.JSON.Content_Handlers.JSON_Content_Handler'Class;
      Value   : RequiresActionStateUpdate);

end ACP.Types.Outputs;
