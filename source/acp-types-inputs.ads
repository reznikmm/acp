--  SPDX-FileCopyrightText: 2026 Max Reznik <reznikmm@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--
--  Generated from the ACP v2 schema. See schema/README.md.

with VSS.JSON.Pull_Readers;

package ACP.Types.Inputs is

   procedure Input_SetSessionConfigOptionRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SetSessionConfigOptionRequest;
      Success : in out Boolean);

   procedure Input_LoginAuthRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out LoginAuthRequest;
      Success : in out Boolean);

   procedure Input_SessionConfigBoolean
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SessionConfigBoolean;
      Success : in out Boolean);

   procedure Input_TerminalOutputChunk
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out TerminalOutputChunk;
      Success : in out Boolean);

   procedure Input_DiffPatch
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out DiffPatch;
      Success : in out Boolean);

   procedure Input_AgentNotification
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out AgentNotification;
      Success : in out Boolean);

   procedure Input_ElicitationAcceptAction
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ElicitationAcceptAction;
      Success : in out Boolean);

   procedure Input_UserMessage
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out UserMessage;
      Success : in out Boolean);

   procedure Input_CloseSessionResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CloseSessionResponse;
      Success : in out Boolean);

   procedure Input_AgentMessage
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out AgentMessage;
      Success : in out Boolean);

   procedure Input_ToolCallCancelCapabilities
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ToolCallCancelCapabilities;
      Success : in out Boolean);

   procedure Input_LogoutAuthRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out LogoutAuthRequest;
      Success : in out Boolean);

   procedure Input_ResumeSessionResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ResumeSessionResponse;
      Success : in out Boolean);

   procedure Input_CloseSessionRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CloseSessionRequest;
      Success : in out Boolean);

   procedure Input_DiffChange
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out DiffChange;
      Success : in out Boolean);

   procedure Input_TerminalCancelCapabilities
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out TerminalCancelCapabilities;
      Success : in out Boolean);

   procedure Input_CompactionUpdate
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CompactionUpdate;
      Success : in out Boolean);

   procedure Input_PromptResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out PromptResponse;
      Success : in out Boolean);

   procedure Input_ToolCallContent
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ToolCallContent;
      Success : in out Boolean);

   procedure Input_EmbeddedResourceResource
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out EmbeddedResourceResource;
      Success : in out Boolean);

   procedure Input_ClientAuthCapabilities
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ClientAuthCapabilities;
      Success : in out Boolean);

   procedure Input_McpHttpCapabilities
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out McpHttpCapabilities;
      Success : in out Boolean);

   procedure Input_PromptEmbeddedContextCapabilities
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out PromptEmbeddedContextCapabilities;
      Success : in out Boolean);

   procedure Input_AvailableCommandInput
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out AvailableCommandInput;
      Success : in out Boolean);

   procedure Input_PromptCapabilities
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out PromptCapabilities;
      Success : in out Boolean);

   procedure Input_ImageContent
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ImageContent;
      Success : in out Boolean);

   procedure Input_SessionCapabilities
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SessionCapabilities;
      Success : in out Boolean);

   procedure Input_ElicitationRequestScope
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ElicitationRequestScope;
      Success : in out Boolean);

   procedure Input_SessionSystemPromptCapabilities
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SessionSystemPromptCapabilities;
      Success : in out Boolean);

   procedure Input_DiffPathChange
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out DiffPathChange;
      Success : in out Boolean);

   procedure Input_CreateElicitationRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CreateElicitationRequest;
      Success : in out Boolean);

   procedure Input_IdleStateUpdate
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out IdleStateUpdate;
      Success : in out Boolean);

   procedure Input_BackgroundWork
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out BackgroundWork;
      Success : in out Boolean);

   procedure Input_SessionNotFoundErrorData
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SessionNotFoundErrorData;
      Success : in out Boolean);

   procedure Input_RequestPermissionResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out RequestPermissionResponse;
      Success : in out Boolean);

   procedure Input_ElicitationUrlMode
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ElicitationUrlMode;
      Success : in out Boolean);

   procedure Input_RequestPermissionSubject
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out RequestPermissionSubject;
      Success : in out Boolean);

   procedure Input_PromptAudioCapabilities
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out PromptAudioCapabilities;
      Success : in out Boolean);

   procedure Input_ClientRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ClientRequest;
      Success : in out Boolean);

   procedure Input_ContentBlock
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ContentBlock;
      Success : in out Boolean);

   procedure Input_RequestPermissionRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out RequestPermissionRequest;
      Success : in out Boolean);

   procedure Input_StringPropertySchema
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out StringPropertySchema;
      Success : in out Boolean);

   procedure Input_TerminalUpdate
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out TerminalUpdate;
      Success : in out Boolean);

   procedure Input_DiffPathPairChange
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out DiffPathPairChange;
      Success : in out Boolean);

   procedure Input_SessionInfoUpdate
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SessionInfoUpdate;
      Success : in out Boolean);

   procedure Input_LogoutAuthResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out LogoutAuthResponse;
      Success : in out Boolean);

   procedure Input_ErrorCode
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ErrorCode;
      Success : in out Boolean);

   procedure Input_EmbeddedResource
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out EmbeddedResource;
      Success : in out Boolean);

   procedure Input_ToolCallContentChunk
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ToolCallContentChunk;
      Success : in out Boolean);

   procedure Input_AgentCapabilities
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out AgentCapabilities;
      Success : in out Boolean);

   procedure Input_AudioContent
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out AudioContent;
      Success : in out Boolean);

   procedure Input_RunningStateUpdate
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out RunningStateUpdate;
      Success : in out Boolean);

   procedure Input_PlanEntry
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out PlanEntry;
      Success : in out Boolean);

   procedure Input_BackgroundTerminal
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out BackgroundTerminal;
      Success : in out Boolean);

   procedure Input_Cost
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Cost;
      Success : in out Boolean);

   procedure Input_SessionDeleteCapabilities
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SessionDeleteCapabilities;
      Success : in out Boolean);

   procedure Input_NewSessionRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out NewSessionRequest;
      Success : in out Boolean);

   procedure Input_SessionConfigSelectGroup
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SessionConfigSelectGroup;
      Success : in out Boolean);

   procedure Input_Content
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Content;
      Success : in out Boolean);

   procedure Input_IntegerPropertySchema
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out IntegerPropertySchema;
      Success : in out Boolean);

   procedure Input_UpdateSessionNotification
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out UpdateSessionNotification;
      Success : in out Boolean);

   procedure Input_ToolCallUpdate
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ToolCallUpdate;
      Success : in out Boolean);

   procedure Input_SessionAdditionalDirectoriesCapabilities
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SessionAdditionalDirectoriesCapabilities;
      Success : in out Boolean);

   procedure Input_SessionConfigOption
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SessionConfigOption;
      Success : in out Boolean);

   procedure Input_Annotations
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Annotations;
      Success : in out Boolean);

   procedure Input_AvailableCommand
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out AvailableCommand;
      Success : in out Boolean);

   procedure Input_Diff
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Diff;
      Success : in out Boolean);

   procedure Input_AuthMethodTerminal
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out AuthMethodTerminal;
      Success : in out Boolean);

   procedure Input_ElicitationCapabilities
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ElicitationCapabilities;
      Success : in out Boolean);

   procedure Input_TerminalExitStatus
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out TerminalExitStatus;
      Success : in out Boolean);

   procedure Input_DeleteSessionRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out DeleteSessionRequest;
      Success : in out Boolean);

   procedure Input_SystemPrompt
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SystemPrompt;
      Success : in out Boolean);

   procedure Input_McpServerHttp
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out McpServerHttp;
      Success : in out Boolean);

   procedure Input_CancelSessionNotification
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CancelSessionNotification;
      Success : in out Boolean);

   procedure Input_PromptRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out PromptRequest;
      Success : in out Boolean);

   procedure Input_CommandPermissionSubject
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CommandPermissionSubject;
      Success : in out Boolean);

   procedure Input_RequestPermissionOutcome
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out RequestPermissionOutcome;
      Success : in out Boolean);

   procedure Input_DeleteSessionResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out DeleteSessionResponse;
      Success : in out Boolean);

   procedure Input_AgentThought
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out AgentThought;
      Success : in out Boolean);

   procedure Input_NewSessionResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out NewSessionResponse;
      Success : in out Boolean);

   procedure Input_CancelledPermissionOutcome
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CancelledPermissionOutcome;
      Success : in out Boolean);

   procedure Input_AvailableCommandsUpdate
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out AvailableCommandsUpdate;
      Success : in out Boolean);

   procedure Input_TitledMultiSelectItems
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out TitledMultiSelectItems;
      Success : in out Boolean);

   procedure Input_McpCapabilities
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out McpCapabilities;
      Success : in out Boolean);

   procedure Input_ElicitationSessionScope
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ElicitationSessionScope;
      Success : in out Boolean);

   procedure Input_TerminalSize
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out TerminalSize;
      Success : in out Boolean);

   procedure Input_ElicitationContentValue
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ElicitationContentValue;
      Success : in out Boolean);

   procedure Input_TextCommandInput
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out TextCommandInput;
      Success : in out Boolean);

   procedure Input_ConfigOptionUpdate
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ConfigOptionUpdate;
      Success : in out Boolean);

   procedure Input_CancelRequestNotification
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CancelRequestNotification;
      Success : in out Boolean);

   procedure Input_TerminalAuthCapabilities
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out TerminalAuthCapabilities;
      Success : in out Boolean);

   procedure Input_TextContent
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out TextContent;
      Success : in out Boolean);

   procedure Input_MultiSelectPropertySchema
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out MultiSelectPropertySchema;
      Success : in out Boolean);

   procedure Input_ContentChunk
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ContentChunk;
      Success : in out Boolean);

   procedure Input_SessionConfigSelect
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SessionConfigSelect;
      Success : in out Boolean);

   procedure Input_ToolCallLocation
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ToolCallLocation;
      Success : in out Boolean);

   procedure Input_BooleanPropertySchema
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out BooleanPropertySchema;
      Success : in out Boolean);

   procedure Input_SessionInfo
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SessionInfo;
      Success : in out Boolean);

   procedure Input_Error
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Error;
      Success : in out Boolean);

   procedure Input_ClientResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ClientResponse;
      Success : in out Boolean);

   procedure Input_PlanUpdate
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out PlanUpdate;
      Success : in out Boolean);

   procedure Input_ElicitationFormMode
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ElicitationFormMode;
      Success : in out Boolean);

   procedure Input_ListSessionsRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ListSessionsRequest;
      Success : in out Boolean);

   procedure Input_UnsupportedProtocolVersionErrorData
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out UnsupportedProtocolVersionErrorData;
      Success : in out Boolean);

   procedure Input_AgentAuthCapabilities
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out AgentAuthCapabilities;
      Success : in out Boolean);

   procedure Input_CancelToolCallRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CancelToolCallRequest;
      Success : in out Boolean);

   procedure Input_SessionConfigSelectOptions
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SessionConfigSelectOptions;
      Success : in out Boolean);

   procedure Input_SetSessionConfigOptionResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SetSessionConfigOptionResponse;
      Success : in out Boolean);

   procedure Input_AuthMethod
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out AuthMethod;
      Success : in out Boolean);

   procedure Input_TerminalOutput
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out TerminalOutput;
      Success : in out Boolean);

   procedure Input_Command
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Command;
      Success : in out Boolean);

   procedure Input_McpStdioCapabilities
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out McpStdioCapabilities;
      Success : in out Boolean);

   procedure Input_ElicitationSchema
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ElicitationSchema;
      Success : in out Boolean);

   procedure Input_TextResourceContents
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out TextResourceContents;
      Success : in out Boolean);

   procedure Input_ListSessionsResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ListSessionsResponse;
      Success : in out Boolean);

   procedure Input_Terminal
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Terminal;
      Success : in out Boolean);

   procedure Input_ClientCapabilities
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ClientCapabilities;
      Success : in out Boolean);

   procedure Input_CancelTerminalResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CancelTerminalResponse;
      Success : in out Boolean);

   procedure Input_EnumOption
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out EnumOption;
      Success : in out Boolean);

   procedure Input_BlobResourceContents
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out BlobResourceContents;
      Success : in out Boolean);

   procedure Input_InitializeResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out InitializeResponse;
      Success : in out Boolean);

   procedure Input_CompactionSummaryChunk
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CompactionSummaryChunk;
      Success : in out Boolean);

   procedure Input_PromptImageCapabilities
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out PromptImageCapabilities;
      Success : in out Boolean);

   procedure Input_ResourceLink
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ResourceLink;
      Success : in out Boolean);

   procedure Input_SelectedPermissionOutcome
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SelectedPermissionOutcome;
      Success : in out Boolean);

   procedure Input_SessionSystemPromptModeCapabilities
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SessionSystemPromptModeCapabilities;
      Success : in out Boolean);

   procedure Input_ToolCallCapabilities
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ToolCallCapabilities;
      Success : in out Boolean);

   procedure Input_ElicitationUrlCapabilities
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ElicitationUrlCapabilities;
      Success : in out Boolean);

   procedure Input_HttpHeader
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out HttpHeader;
      Success : in out Boolean);

   procedure Input_ElicitationSchemaType
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ElicitationSchemaType;
      Success : in out Boolean);

   procedure Input_ElicitationFormCapabilities
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ElicitationFormCapabilities;
      Success : in out Boolean);

   procedure Input_StateUpdate
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out StateUpdate;
      Success : in out Boolean);

   procedure Input_AuthMethodAgent
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out AuthMethodAgent;
      Success : in out Boolean);

   procedure Input_EnvVariable
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out EnvVariable;
      Success : in out Boolean);

   procedure Input_ClientNotification
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ClientNotification;
      Success : in out Boolean);

   procedure Input_ToolCallPermissionSubject
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ToolCallPermissionSubject;
      Success : in out Boolean);

   procedure Input_LoginAuthResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out LoginAuthResponse;
      Success : in out Boolean);

   procedure Input_SessionConfigSelectOption
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SessionConfigSelectOption;
      Success : in out Boolean);

   procedure Input_PlanUpdateContent
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out PlanUpdateContent;
      Success : in out Boolean);

   procedure Input_CancelTerminalRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CancelTerminalRequest;
      Success : in out Boolean);

   procedure Input_ResumeSessionRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ResumeSessionRequest;
      Success : in out Boolean);

   procedure Input_ErrorStopReason
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ErrorStopReason;
      Success : in out Boolean);

   procedure Input_PlanItems
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out PlanItems;
      Success : in out Boolean);

   procedure Input_CompleteElicitationNotification
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CompleteElicitationNotification;
      Success : in out Boolean);

   procedure Input_ReplayFrom
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ReplayFrom;
      Success : in out Boolean);

   procedure Input_ErrorData
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ErrorData;
      Success : in out Boolean);

   procedure Input_StringMultiSelectItems
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out StringMultiSelectItems;
      Success : in out Boolean);

   procedure Input_Icon
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Icon;
      Success : in out Boolean);

   procedure Input_NumberPropertySchema
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out NumberPropertySchema;
      Success : in out Boolean);

   procedure Input_McpServerStdio
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out McpServerStdio;
      Success : in out Boolean);

   procedure Input_CreateElicitationResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CreateElicitationResponse;
      Success : in out Boolean);

   procedure Input_SessionUpdate
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SessionUpdate;
      Success : in out Boolean);

   procedure Input_AgentResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out AgentResponse;
      Success : in out Boolean);

   procedure Input_PermissionOption
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out PermissionOption;
      Success : in out Boolean);

   procedure Input_Notice
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Notice;
      Success : in out Boolean);

   procedure Input_InitializeRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out InitializeRequest;
      Success : in out Boolean);

   procedure Input_SessionSystemPromptOverrideCapabilities
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out SessionSystemPromptOverrideCapabilities;
      Success : in out Boolean);

   procedure Input_TerminalCapabilities
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out TerminalCapabilities;
      Success : in out Boolean);

   procedure Input_UsageUpdate
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out UsageUpdate;
      Success : in out Boolean);

   procedure Input_AgentRequest
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out AgentRequest;
      Success : in out Boolean);

   procedure Input_Implementation
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out Implementation;
      Success : in out Boolean);

   procedure Input_McpServer
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out McpServer;
      Success : in out Boolean);

   procedure Input_ReplayFromStart
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ReplayFromStart;
      Success : in out Boolean);

   procedure Input_ElicitationPropertySchema
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out ElicitationPropertySchema;
      Success : in out Boolean);

   procedure Input_MultiSelectItems
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out MultiSelectItems;
      Success : in out Boolean);

   procedure Input_CancelToolCallResponse
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out CancelToolCallResponse;
      Success : in out Boolean);

   procedure Input_BackgroundToolCall
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out BackgroundToolCall;
      Success : in out Boolean);

   procedure Input_RequiresActionStateUpdate
     (Reader  : in out VSS.JSON.Pull_Readers.JSON_Pull_Reader'Class;
      Value   : out RequiresActionStateUpdate;
      Success : in out Boolean);

end ACP.Types.Inputs;
