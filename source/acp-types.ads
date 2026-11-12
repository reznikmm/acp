--  SPDX-FileCopyrightText: 2026 Max Reznik <reznikmm@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--
--  Generated from the ACP v2 schema. See schema/README.md.

pragma Ada_2022;
pragma Style_Checks ("M999");  --  suppress style warning unitl gnatpp is fixed
with Ada.Containers.Doubly_Linked_Lists;
with Ada.Finalization;
with Interfaces;
with VSS.JSON.Streams;
with VSS.Strings;
with VSS.String_Vectors;

package ACP.Types is
   subtype Integer_64 is Interfaces.Integer_64;
   subtype Float_64 is Interfaces.IEEE_Float_64;
   package JSON_Event_Lists is new
     Ada.Containers.Doubly_Linked_Lists
       (VSS.JSON.Streams.JSON_Stream_Element,
        VSS.JSON.Streams."=");

   type Any_Value is new JSON_Event_Lists.List with null record;
   type Any_Object is new Any_Value with null record;

   type Optional_Integer_64 (Is_Set : Boolean := False) is record
      case Is_Set is
         when True =>
            Value : Integer_64;

         when False =>
            null;
      end case;
   end record;

   type Optional_Float_64 (Is_Set : Boolean := False) is record
      case Is_Set is
         when True =>
            Value : Float_64;

         when False =>
            null;
      end case;
   end record;

   type Integer_Or_String (Is_String : Boolean := False) is record
      case Is_String is
         when False =>
            Integer : Integer_64;

         when True =>
            String : VSS.Strings.Virtual_String;
      end case;
   end record;

   type Optional_Integer_Or_String (Is_Set : Boolean := False) is record
      case Is_Set is
         when True =>
            Value : Integer_Or_String;

         when False =>
            null;
      end case;
   end record;

   type EnumOption_Vector is tagged private
   with
     Variable_Indexing => Get_EnumOption_Variable_Reference,
     Constant_Indexing => Get_EnumOption_Constant_Reference,
     Aggregate         => (Empty => Empty, Add_Unnamed => Append);

   type SessionConfigSelectOption_Vector is tagged private
   with
     Variable_Indexing => Get_SessionConfigSelectOption_Variable_Reference,
     Constant_Indexing => Get_SessionConfigSelectOption_Constant_Reference,
     Aggregate         => (Empty => Empty, Add_Unnamed => Append);

   type SessionInfo_Vector is tagged private
   with
     Variable_Indexing => Get_SessionInfo_Variable_Reference,
     Constant_Indexing => Get_SessionInfo_Constant_Reference,
     Aggregate         => (Empty => Empty, Add_Unnamed => Append);

   type SessionConfigOption_Vector is tagged private
   with
     Variable_Indexing => Get_SessionConfigOption_Variable_Reference,
     Constant_Indexing => Get_SessionConfigOption_Constant_Reference,
     Aggregate         => (Empty => Empty, Add_Unnamed => Append);

   type PlanEntry_Vector is tagged private
   with
     Variable_Indexing => Get_PlanEntry_Variable_Reference,
     Constant_Indexing => Get_PlanEntry_Constant_Reference,
     Aggregate         => (Empty => Empty, Add_Unnamed => Append);

   type HttpHeader_Vector is tagged private
   with
     Variable_Indexing => Get_HttpHeader_Variable_Reference,
     Constant_Indexing => Get_HttpHeader_Constant_Reference,
     Aggregate         => (Empty => Empty, Add_Unnamed => Append);

   type EnvVariable_Vector is tagged private
   with
     Variable_Indexing => Get_EnvVariable_Variable_Reference,
     Constant_Indexing => Get_EnvVariable_Constant_Reference,
     Aggregate         => (Empty => Empty, Add_Unnamed => Append);

   type DiffChange_Vector is tagged private
   with
     Variable_Indexing => Get_DiffChange_Variable_Reference,
     Constant_Indexing => Get_DiffChange_Constant_Reference,
     Aggregate         => (Empty => Empty, Add_Unnamed => Append);

   type Integer_64_Vector is tagged private
   with
     Variable_Indexing => Get_Integer_64_Variable_Reference,
     Constant_Indexing => Get_Integer_64_Constant_Reference,
     Aggregate         => (Empty => Empty, Add_Unnamed => Append);

   type PermissionOption_Vector is tagged private
   with
     Variable_Indexing => Get_PermissionOption_Variable_Reference,
     Constant_Indexing => Get_PermissionOption_Constant_Reference,
     Aggregate         => (Empty => Empty, Add_Unnamed => Append);

   package Enum is

   end Enum;

   --  Left:#/$defs/SessionId
   --  Left:#/$defs/SessionConfigId
   type SetSessionConfigOptionRequest is record
      sessionId             : VSS.Strings.Virtual_String;
      --  The ID of the session to set the configuration option for.
      configId              : VSS.Strings.Virtual_String;
      --  The ID of the configuration option to set.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   --  Left:#/$defs/AuthMethodId
   type LoginAuthRequest is record
      methodId              : VSS.Strings.Virtual_String;
      --  The ID of the authentication method to use.
      --  Must be one of the methods advertised in the initialize response.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   --  Left:#/$defs/PermissionOptionKind
   type SessionConfigBoolean is record
      currentValue          : Boolean;
      --  The current value of the boolean option.
      Additional_Properties : Any_Object;
   end record;

   --  Left:#/$defs/TerminalId
   type TerminalOutputChunk is record
      terminalId            : VSS.Strings.Virtual_String;
      --  The terminal receiving these bytes.
      data                  : VSS.Strings.Virtual_String;
      --  Independently base64-encoded terminal output bytes.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --  This metadata is scoped to the chunk and does not patch stored metadata.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   --  Left:#/$defs/DiffPatchFormat
   type DiffPatch is record
      format                : VSS.Strings.Virtual_String;
      --  Patch format. The only ACP-defined value is `git_patch`.
      text                  : VSS.Strings.Virtual_String;
      --  Patch text in the format named by `format`.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type Optional_DiffPatch (Is_Set : Boolean := False) is record
      case Is_Set is
         when True =>
            Value : DiffPatch;

         when False =>
            null;
      end case;
   end record;

   --  Left:#/$defs/ToolCallId
   type AgentNotification is record
      method                : VSS.Strings.Virtual_String;
      --  The notification method name.
      params                : Any_Value;
      --  Method-specific notification parameters.
      Additional_Properties : Any_Object;
   end record;

   type ElicitationAcceptAction is record
      content               : Any_Object;
      --  The user-provided content, if any, as an object matching the requested schema.
      --
      --  Omitted and `null` are equivalent and mean no content is provided.
      Additional_Properties : Any_Object;
   end record;

   type UserMessage is new Any_Object with null record;
   type CloseSessionResponse is record
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type AgentMessage is new Any_Object with null record;
   type ToolCallCancelCapabilities is record
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type Optional_ToolCallCancelCapabilities (Is_Set : Boolean := False) is
   record
      case Is_Set is
         when True =>
            Value : ToolCallCancelCapabilities;

         when False =>
            null;
      end case;
   end record;

   --  Left:#/$defs/SessionConfigOptionCategory
   type LogoutAuthRequest is record
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type ResumeSessionResponse is record
      configOptions         : SessionConfigOption_Vector;
      --  Initial session configuration options.
      --
      --  Optional. Omitted or empty means no config options are advertised.
      --  Senders MUST use an array, not `null`. Receivers treat `null` like omission.
      --  Later `config_option_update` notifications replace this list.
      availableCommands     : Any_Value;
      --  Initial commands the agent can execute in this session.
      --
      --  Optional. Omitted or empty means no initial commands are advertised.
      --  Senders MUST use an array, not `null`. Receivers treat `null` like omission.
      --  Later `available_commands_update` notifications replace this list.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type CloseSessionRequest is record
      sessionId             : VSS.Strings.Virtual_String;
      --  The ID of the session to close.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   --  Left:#/$defs/DiffFileType
   --  Left:#/$defs/MediaType
   type DiffChange is record
      fileType              : VSS.Strings.Virtual_String;
      --  File content kind after the operation (for `delete`, of the deleted file).
      --
      --  Omitted and `null` are equivalent and mean the content kind is unknown.
      mimeType              : VSS.Strings.Virtual_String;
      --  MIME type of the file contents after the operation (for `delete`, of the deleted file).
      --
      --  Omitted and `null` are equivalent and mean the MIME type is unknown.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type TerminalCancelCapabilities is record
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type Optional_TerminalCancelCapabilities (Is_Set : Boolean := False) is
   record
      case Is_Set is
         when True =>
            Value : TerminalCancelCapabilities;

         when False =>
            null;
      end case;
   end record;

   type CompactionUpdate is new Any_Object with null record;
   --  Left:#/$defs/MessageId
   type PromptResponse is record
      messageId             : VSS.Strings.Virtual_String;
      --  Identifies the user message inserted into the ACP conversation.
      --
      --  Required and non-null. Omission and explicit `null` are both invalid.
      --
      --  The corresponding user-message session update carries this same identifier and may arrive
      --  before or after this response. Agents must echo the message during the live session, but are
      --  not required to retain it. If retained and replayed, the message keeps this identifier.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   --  Left:#/$defs/ToolKind
   type ToolCallContent is new Any_Object with null record;
   type EmbeddedResourceResource is new Any_Object with null record;
   type TerminalAuthCapabilities is record
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type Optional_TerminalAuthCapabilities (Is_Set : Boolean := False) is record
      case Is_Set is
         when True =>
            Value : TerminalAuthCapabilities;

         when False =>
            null;
      end case;
   end record;

   type ClientAuthCapabilities is record
      terminal              : Optional_TerminalAuthCapabilities;
      --  Whether the client supports `terminal` authentication methods.
      --
      --  Optional. Omitted and `null` are equivalent and mean the client does not advertise support.
      --  The client should supply `{}` only when it can reproduce the configured
      --  agent invocation in an interactive terminal. Supplying `{}` means the
      --  agent may include `terminal` entries in its authentication methods.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type Optional_ClientAuthCapabilities (Is_Set : Boolean := False) is record
      case Is_Set is
         when True =>
            Value : ClientAuthCapabilities;

         when False =>
            null;
      end case;
   end record;

   type McpHttpCapabilities is record
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type Optional_McpHttpCapabilities (Is_Set : Boolean := False) is record
      case Is_Set is
         when True =>
            Value : McpHttpCapabilities;

         when False =>
            null;
      end case;
   end record;

   type PromptEmbeddedContextCapabilities is record
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type Optional_PromptEmbeddedContextCapabilities
     (Is_Set : Boolean := False)
   is record
      case Is_Set is
         when True =>
            Value : PromptEmbeddedContextCapabilities;

         when False =>
            null;
      end case;
   end record;

   --  Left:#/$defs/SessionListCursor
   type AvailableCommandInput is new Any_Object with null record;
   type Optional_AvailableCommandInput (Is_Set : Boolean := False) is record
      case Is_Set is
         when True =>
            Value : AvailableCommandInput;

         when False =>
            null;
      end case;
   end record;

   type PromptImageCapabilities is record
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type Optional_PromptImageCapabilities (Is_Set : Boolean := False) is record
      case Is_Set is
         when True =>
            Value : PromptImageCapabilities;

         when False =>
            null;
      end case;
   end record;

   type PromptAudioCapabilities is record
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type Optional_PromptAudioCapabilities (Is_Set : Boolean := False) is record
      case Is_Set is
         when True =>
            Value : PromptAudioCapabilities;

         when False =>
            null;
      end case;
   end record;

   type PromptCapabilities is record
      image                 : Optional_PromptImageCapabilities;
      --  Agent supports `image` content blocks.
      --
      --  Optional. Omitted and `null` are equivalent and mean the agent does not advertise support.
      --  Supplying `{}` means the agent supports image content in prompts.
      audio                 : Optional_PromptAudioCapabilities;
      --  Agent supports `audio` content blocks.
      --
      --  Optional. Omitted and `null` are equivalent and mean the agent does not advertise support.
      --  Supplying `{}` means the agent supports audio content in prompts.
      embeddedContext       : Optional_PromptEmbeddedContextCapabilities;
      --  Agent supports embedded context in `session/prompt` requests.
      --
      --  When enabled, the Client is allowed to include `resource` content blocks
      --  in prompt requests for pieces of context that are referenced in the message.
      --
      --  Optional. Omitted and `null` are equivalent and mean the agent does not advertise support.
      --  Supplying `{}` means the agent supports embedded context in prompts.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type Optional_PromptCapabilities (Is_Set : Boolean := False) is record
      case Is_Set is
         when True =>
            Value : PromptCapabilities;

         when False =>
            null;
      end case;
   end record;

   type Annotations is record
      audience              : Any_Value;
      --  Intended recipients for this content, such as the user or assistant.
      --
      --  Omitted and `null` are equivalent and mean no audience is specified.
      lastModified          : VSS.Strings.Virtual_String;
      --  Timestamp indicating when the underlying resource was last modified.
      --
      --  Should be an ISO 8601 formatted string (e.g., "2025-01-12T15:00:58Z"), as in MCP.
      --
      --  Omitted and `null` are equivalent and mean the modification time is not reported.
      priority              : Any_Value;
      --  Relative importance of this content when clients choose what to surface, from 0 (least
      --  important) to 1 (most important).
      --
      --  Omitted and `null` are equivalent and mean no priority is specified.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type Optional_Annotations (Is_Set : Boolean := False) is record
      case Is_Set is
         when True =>
            Value : Annotations;

         when False =>
            null;
      end case;
   end record;

   type ImageContent is record
      data                  : VSS.Strings.Virtual_String;
      --  Base64-encoded media payload.
      mimeType              : VSS.Strings.Virtual_String;
      --  MIME type describing the encoded media payload.
      uri                   : VSS.Strings.Virtual_String;
      --  URI associated with this resource or media payload.
      --
      --  Omitted and `null` are equivalent and mean no URI is associated with the image.
      annotations           : Optional_Annotations;
      --  Optional annotations that help clients decide how to display or route this content.
      --
      --  Omitted and `null` are equivalent and mean no annotations are provided.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type McpStdioCapabilities is record
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type Optional_McpStdioCapabilities (Is_Set : Boolean := False) is record
      case Is_Set is
         when True =>
            Value : McpStdioCapabilities;

         when False =>
            null;
      end case;
   end record;

   type McpCapabilities is record
      stdio                 : Optional_McpStdioCapabilities;
      --  Agent supports `stdio` MCP servers.
      --
      --  Optional. Omitted and `null` are equivalent and mean the agent does not advertise support.
      --  Supplying `{}` means the agent supports stdio MCP server transports.
      http                  : Optional_McpHttpCapabilities;
      --  Agent supports `http` MCP servers.
      --
      --  Optional. Omitted and `null` are equivalent and mean the agent does not advertise support.
      --  Supplying `{}` means the agent supports HTTP MCP server transports.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type Optional_McpCapabilities (Is_Set : Boolean := False) is record
      case Is_Set is
         when True =>
            Value : McpCapabilities;

         when False =>
            null;
      end case;
   end record;

   type SessionDeleteCapabilities is record
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type Optional_SessionDeleteCapabilities (Is_Set : Boolean := False) is
   record
      case Is_Set is
         when True =>
            Value : SessionDeleteCapabilities;

         when False =>
            null;
      end case;
   end record;

   type SessionAdditionalDirectoriesCapabilities is record
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type Optional_SessionAdditionalDirectoriesCapabilities
     (Is_Set : Boolean := False)
   is record
      case Is_Set is
         when True =>
            Value : SessionAdditionalDirectoriesCapabilities;

         when False =>
            null;
      end case;
   end record;

   type SessionSystemPromptOverrideCapabilities is record
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type Optional_SessionSystemPromptOverrideCapabilities
     (Is_Set : Boolean := False)
   is record
      case Is_Set is
         when True =>
            Value : SessionSystemPromptOverrideCapabilities;

         when False =>
            null;
      end case;
   end record;

   type SessionSystemPromptModeCapabilities is record
      override              : Optional_SessionSystemPromptOverrideCapabilities;
      --  Whether the agent supports `override` mode.
      --
      --  Optional. Omitted and `null` are equivalent and mean the agent does not advertise support.
      --  Supplying `{}` means the agent supports replacing its built-in default
      --  instructions with the client-provided system prompt.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type Optional_SessionSystemPromptModeCapabilities
     (Is_Set : Boolean := False)
   is record
      case Is_Set is
         when True =>
            Value : SessionSystemPromptModeCapabilities;

         when False =>
            null;
      end case;
   end record;

   type SessionSystemPromptCapabilities is record
      mode                  : Optional_SessionSystemPromptModeCapabilities;
      --  Delivery modes the agent supports in addition to `append`.
      --
      --  Optional. Omitted and `null` are equivalent and mean the agent supports only `append`.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type Optional_SessionSystemPromptCapabilities (Is_Set : Boolean := False) is
   record
      case Is_Set is
         when True =>
            Value : SessionSystemPromptCapabilities;

         when False =>
            null;
      end case;
   end record;

   type SessionCapabilities is record
      prompt                : Optional_PromptCapabilities;
      --  Prompt capabilities supported by the agent in `session/prompt` requests.
      --
      --  Optional. Omitted and `null` are equivalent and mean the agent does not advertise any
      --  prompt extensions beyond the baseline text and resource-link content
      --  required by `session/prompt`.
      mcp                   : Optional_McpCapabilities;
      --  MCP capabilities supported by the agent for session lifecycle requests.
      --
      --  Optional. Omitted and `null` are equivalent and mean the agent does not advertise MCP
      --  server transport support for sessions.
      delete                : Optional_SessionDeleteCapabilities;
      --  Whether the agent supports `session/delete`.
      --
      --  Optional. Omitted and `null` are equivalent and mean the agent does not advertise support.
      --  Supplying `{}` means the agent supports deleting sessions from `session/list`.
      additionalDirectories :
        Optional_SessionAdditionalDirectoriesCapabilities;
      --  Whether the agent supports `additionalDirectories` on supported session lifecycle requests.
      --
      --  Optional. Omitted and `null` are equivalent and mean the agent does not advertise support.
      --  Supplying `{}` means the agent supports `additionalDirectories` on
      --  supported session lifecycle requests.
      --
      --  Agents may return `SessionInfo.additionalDirectories` to report the
      --  complete ordered additional-root list associated with a listed session.
      systemPrompt          : Optional_SessionSystemPromptCapabilities;
      --  Whether the agent supports `systemPrompt` on session lifecycle requests.
      --
      --  Optional. Omitted and `null` are equivalent and mean the agent does not advertise support.
      --  Supplying `{}` means the agent supports `systemPrompt` in `append` mode.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type Optional_SessionCapabilities (Is_Set : Boolean := False) is record
      case Is_Set is
         when True =>
            Value : SessionCapabilities;

         when False =>
            null;
      end case;
   end record;

   --  Left:#/$defs/RequestId
   type ElicitationRequestScope is record
      requestId             : Integer_Or_String;
      --  The pending Client-to-Agent request this elicitation is tied to.
      Additional_Properties : Any_Object;
   end record;

   --  Left:#/$defs/AbsolutePath
   type DiffPathChange is record
      path                  : VSS.Strings.Virtual_String;
      --  Absolute path for the operation.
      Additional_Properties : Any_Object;
   end record;

   type CreateElicitationRequest is record
      message               : VSS.Strings.Virtual_String;
      --  A human-readable message describing what input is needed.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   --  Left:#/$defs/StringFormat
   type IdleStateUpdate is record
      background            : Any_Value;
      --  Work running independently of foreground work, as a complete snapshot.
      --
      --  Optional. Omitted and `null` are equivalent and mean the Agent is not reporting
      --  background work, not that nothing is running. `[]` means no background work is
      --  running. An Agent that reports background work MUST include it on every state
      --  update for the session. A malformed list is treated as not reported.
      --
      --  See protocol docs: [Background Work](https://agentclientprotocol.com/protocol/v2/prompt-lifecycle#background-work)
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      stopReason            : VSS.Strings.Virtual_String;
      --  Why foreground work stopped. The value selects one of this type's variants, which may add fields of their own.
      --
      --  Optional. Omitted and `null` are equivalent and mean the agent is not reporting a stop reason; a malformed value is treated the same way.
      --
      --  See protocol docs: [Stop Reasons](https://agentclientprotocol.com/protocol/v2/prompt-lifecycle#stop-reasons)
      Additional_Properties : Any_Object;
   end record;

   type BackgroundWork is new Any_Object with null record;
   type SessionNotFoundErrorData is record
      sessionId             : VSS.Strings.Virtual_String;
      --  The session ID from the request.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type RequestPermissionOutcome is new Any_Object with null record;
   type RequestPermissionResponse is record
      outcome               : RequestPermissionOutcome;
      --  The user's decision on the permission request.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   --  Left:#/$defs/ElicitationId
   type ElicitationUrlMode is record
      elicitationId         : VSS.Strings.Virtual_String;
      --  The unique identifier for this elicitation.
      url                   : VSS.Strings.Virtual_String;
      --  The URL to direct the user to.
      Additional_Properties : Any_Object;
   end record;

   type RequestPermissionSubject is new Any_Object with null record;
   type Optional_RequestPermissionSubject (Is_Set : Boolean := False) is record
      case Is_Set is
         when True =>
            Value : RequestPermissionSubject;

         when False =>
            null;
      end case;
   end record;

   --  Left:#/$defs/ProtocolVersion
   type ClientRequest is record
      id                    : Integer_Or_String;
      --  The request id used to correlate the matching response.
      method                : VSS.Strings.Virtual_String;
      --  The method name to invoke.
      params                : Any_Value;
      --  Method-specific request parameters.
      Additional_Properties : Any_Object;
   end record;

   type ContentBlock is new Any_Object with null record;
   type RequestPermissionRequest is record
      sessionId             : VSS.Strings.Virtual_String;
      --  The session ID for this request.
      title                 : VSS.Strings.Virtual_String;
      --  Human-readable title for the permission prompt.
      --
      --  This title is specific to the permission prompt and does not update any
      --  subject's displayed title.
      description           : VSS.Strings.Virtual_String;
      --  Optional human-readable explanation of why permission is needed.
      --
      --  This text is specific to the permission prompt and does not update any
      --  subject's displayed content. Omitted and `null` are equivalent and mean no separate
      --  permission description was provided.
      subject               : Optional_RequestPermissionSubject;
      --  Optional structured context about the operation requiring permission.
      --
      --  Omitted and `null` are equivalent and mean no structured subject was provided.
      options               : PermissionOption_Vector;
      --  Available permission options for the user to choose from.
      --  Must contain at least one option.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type StringPropertySchema is record
      title                 : VSS.Strings.Virtual_String;
      --  Optional title for the property.
      --
      --  Optional. Omitted and `null` are equivalent and mean no title is provided.
      description           : VSS.Strings.Virtual_String;
      --  Human-readable description.
      --
      --  Optional. Omitted and `null` are equivalent and mean no description is provided.
      minLength             : Any_Value;
      --  Minimum string length.
      --
      --  Optional. Omitted and `null` are equivalent and mean there is no minimum length constraint.
      maxLength             : Any_Value;
      --  Maximum string length.
      --
      --  Optional. Omitted and `null` are equivalent and mean there is no maximum length constraint.
      pattern               : VSS.Strings.Virtual_String;
      --  Pattern the string must match, in ECMA-262 regular expression syntax.
      --
      --  Optional. Omitted and `null` are equivalent and mean there is no pattern constraint.
      format                : VSS.Strings.Virtual_String;
      --  String format.
      --
      --  Optional. Omitted and `null` are equivalent and mean there is no format constraint.
      default               : VSS.Strings.Virtual_String;
      --  Default value.
      --
      --  Optional. Omitted and `null` are equivalent and mean no default value is provided.
      enum                  : Any_Value;
      --  Enum values for untitled single-select enums.
      --  Must contain at least one value when present.
      --  Optional. Omitted and `null` are equivalent and mean no untitled single-select choices are
      --  declared by `enum`.
      oneOf                 : Any_Value;
      --  Titled enum options for titled single-select enums.
      --  Must contain at least one option when present.
      --  Optional. Omitted and `null` are equivalent and mean no titled single-select choices are
      --  declared by `oneOf`.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type TerminalUpdate is new Any_Object with null record;
   --  Left:#/$defs/IconTheme
   type DiffPathPairChange is record
      oldPath               : VSS.Strings.Virtual_String;
      --  Absolute path before the operation.
      path                  : VSS.Strings.Virtual_String;
      --  Absolute path after the operation.
      Additional_Properties : Any_Object;
   end record;

   type SessionInfoUpdate is new Any_Object with null record;
   type LogoutAuthResponse is record
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   --  Left:#/$defs/Role
   type ErrorCode is new Any_Object with null record;
   type EmbeddedResource is record
      resource              : EmbeddedResourceResource;
      --  Embedded resource payload, either text or binary data.
      annotations           : Optional_Annotations;
      --  Optional annotations that help clients decide how to display or route this content.
      --
      --  Omitted and `null` are equivalent and mean no annotations are provided.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type ToolCallContentChunk is record
      toolCallId            : VSS.Strings.Virtual_String;
      --  The ID of the tool call this content belongs to.
      content               : ToolCallContent;
      --  A single item of content produced by the tool call.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --  This metadata is scoped to the chunk and does not patch stored metadata.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type AgentAuthCapabilities is record
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type Optional_AgentAuthCapabilities (Is_Set : Boolean := False) is record
      case Is_Set is
         when True =>
            Value : AgentAuthCapabilities;

         when False =>
            null;
      end case;
   end record;

   type AgentCapabilities is record
      session               : Optional_SessionCapabilities;
      --  Session capabilities supported by the agent.
      --
      --  Optional. Omitted and `null` are equivalent and mean the agent does not support the
      --  `session/*` methods. Supplying `{}` means the agent supports the
      --  baseline session methods: `session/new`, `session/list`,
      --  `session/resume`, `session/close`, `session/prompt`, `session/cancel`,
      --  and `session/update`.
      auth                  : Optional_AgentAuthCapabilities;
      --  Authentication-related extension capabilities supported by the agent.
      --
      --  Optional. Omitted and `null` are equivalent and mean the agent does not advertise any
      --  authentication-related extensions. This field does not advertise support
      --  for `auth/login` or `auth/logout`. Those methods are advertised by a
      --  non-empty `authMethods` list in the `initialize` response.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type Optional_AgentCapabilities (Is_Set : Boolean := False) is record
      case Is_Set is
         when True =>
            Value : AgentCapabilities;

         when False =>
            null;
      end case;
   end record;

   --  Left:#/$defs/SystemPromptMode
   type AudioContent is record
      data                  : VSS.Strings.Virtual_String;
      --  Base64-encoded media payload.
      mimeType              : VSS.Strings.Virtual_String;
      --  MIME type describing the encoded media payload.
      annotations           : Optional_Annotations;
      --  Optional annotations that help clients decide how to display or route this content.
      --
      --  Omitted and `null` are equivalent and mean no annotations are provided.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type RunningStateUpdate is record
      background            : Any_Value;
      --  Work running independently of foreground work, as a complete snapshot.
      --
      --  Optional. Omitted and `null` are equivalent and mean the Agent is not reporting
      --  background work, not that nothing is running. `[]` means no background work is
      --  running. An Agent that reports background work MUST include it on every state
      --  update for the session. A malformed list is treated as not reported.
      --
      --  See protocol docs: [Background Work](https://agentclientprotocol.com/protocol/v2/prompt-lifecycle#background-work)
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   --  Left:#/$defs/PlanEntryPriority
   --  Left:#/$defs/PlanEntryStatus
   type PlanEntry is record
      content               : VSS.Strings.Virtual_String;
      --  Human-readable description of what this task aims to accomplish.
      priority              : VSS.Strings.Virtual_String;
      --  The relative importance of this task.
      --  Used to indicate which tasks are most critical to the overall goal.
      status                : VSS.Strings.Virtual_String;
      --  Current execution status of this task.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type BackgroundTerminal is record
      terminalId            : VSS.Strings.Virtual_String;
      --  The ID of the listed terminal.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type Cost is record
      amount                : Float_64;
      --  Total cumulative cost for session.
      currency              : VSS.Strings.Virtual_String;
      --  Unit of `amount`: an ISO 4217 currency code (e.g., "USD", "EUR") for money, or another
      --  unit such as "credits".
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type SystemPrompt is record
      mode                  : VSS.Strings.Virtual_String;
      --  How the Agent combines `content` with its own instructions.
      --
      --  Required. Agents MUST return an error for a mode they do not support rather than
      --  treating it as `append` or `override`.
      content               : Any_Value;
      --  The system prompt content.
      --
      --  Agents advertising the capability MUST accept `text` content blocks.
      --  Clients MUST NOT send other content block types until a future
      --  capability allows them, and Agents MUST return an error for content
      --  blocks they do not support, including unknown types.
      --
      --  Clients MUST NOT send an empty array. Agents MAY reject one with
      --  `-32602` without creating or resuming the session.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type Optional_SystemPrompt (Is_Set : Boolean := False) is record
      case Is_Set is
         when True =>
            Value : SystemPrompt;

         when False =>
            null;
      end case;
   end record;

   type NewSessionRequest is record
      cwd                   : VSS.Strings.Virtual_String;
      --  The working directory for this session. Must be an absolute path.
      additionalDirectories : VSS.String_Vectors.Virtual_String_Vector;
      --  Additional workspace roots for this session. Each path must be absolute.
      --
      --  These expand the session's workspace scope without changing `cwd`, which
      --  remains the base for relative paths. When omitted or empty, no
      --  additional roots are activated for the new session.
      mcpServers            : Any_Value;
      --  List of MCP (Model Context Protocol) servers the agent should connect to.
      systemPrompt          : Optional_SystemPrompt;
      --  System-level instructions for the new session.
      --
      --  Optional. Omitted and `null` are equivalent and mean the Agent uses its
      --  own default instructions. Clients MUST only send this when the Agent
      --  advertises `session.systemPrompt`.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   --  Left:#/$defs/SessionConfigGroupId
   type SessionConfigSelectGroup is record
      groupId               : VSS.Strings.Virtual_String;
      --  Unique identifier for this group.
      name                  : VSS.Strings.Virtual_String;
      --  Human-readable label for this group.
      options               : SessionConfigSelectOption_Vector;
      --  The set of option values in this group. MUST contain at least one value.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type Content is record
      content               : ContentBlock;
      --  The actual content block.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type IntegerPropertySchema is record
      title                 : VSS.Strings.Virtual_String;
      --  Optional title for the property.
      --
      --  Optional. Omitted and `null` are equivalent and mean no title is provided.
      description           : VSS.Strings.Virtual_String;
      --  Human-readable description.
      --
      --  Optional. Omitted and `null` are equivalent and mean no description is provided.
      minimum               : Any_Value;
      --  Minimum value (inclusive).
      --
      --  Optional. Omitted and `null` are equivalent and mean there is no inclusive lower bound.
      maximum               : Any_Value;
      --  Maximum value (inclusive).
      --
      --  Optional. Omitted and `null` are equivalent and mean there is no inclusive upper bound.
      default               : Any_Value;
      --  Default value.
      --
      --  Optional. Omitted and `null` are equivalent and mean no default value is provided.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type SessionUpdate is new Any_Object with null record;
   type UpdateSessionNotification is record
      sessionId             : VSS.Strings.Virtual_String;
      --  The ID of the session this update pertains to.
      update                : SessionUpdate;
      --  The actual update content.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type ToolCallUpdate is new Any_Object with null record;
   type SessionConfigOption is record
      configId              : VSS.Strings.Virtual_String;
      --  Unique identifier for the configuration option.
      name                  : VSS.Strings.Virtual_String;
      --  Human-readable label for the option.
      description           : VSS.Strings.Virtual_String;
      --  Optional description for the Client to display to the user.
      --
      --  Omitted and `null` are equivalent and mean no description is provided.
      category              : VSS.Strings.Virtual_String;
      --  Optional semantic category for this option (UX only).
      --
      --  Omitted and `null` are equivalent and mean no category is provided.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type AvailableCommand is new Any_Object with null record;
   type Diff is record
      changes               : DiffChange_Vector;
      --  Structured file changes described by this diff.
      --
      --  Clients can use this field without parsing patch text to determine affected paths.
      patch                 : Optional_DiffPatch;
      --  Renderable patch text for some or all of the structured changes.
      --
      --  Agents SHOULD provide patch text whenever feasible. Omitted and `null` are
      --  equivalent and mean no renderable patch text was provided.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type AuthMethodTerminal is record
      methodId              : VSS.Strings.Virtual_String;
      --  Unique identifier for this authentication method.
      name                  : VSS.Strings.Virtual_String;
      --  Human-readable name of the authentication method.
      description           : VSS.Strings.Virtual_String;
      --  Optional human-readable description of this authentication method.
      --
      --  Omitted and `null` are equivalent and mean no description is provided.
      args                  : VSS.String_Vectors.Virtual_String_Vector;
      --  Additional arguments to append to the configured agent invocation for terminal auth.
      env                   : EnvVariable_Vector;
      --  Additional environment variables to set on the configured agent invocation for terminal auth.
      --  Names MUST be unique. These values override same-named variables in the
      --  base launch configuration.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type ElicitationFormCapabilities is record
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type Optional_ElicitationFormCapabilities (Is_Set : Boolean := False) is
   record
      case Is_Set is
         when True =>
            Value : ElicitationFormCapabilities;

         when False =>
            null;
      end case;
   end record;

   type ElicitationUrlCapabilities is record
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type Optional_ElicitationUrlCapabilities (Is_Set : Boolean := False) is
   record
      case Is_Set is
         when True =>
            Value : ElicitationUrlCapabilities;

         when False =>
            null;
      end case;
   end record;

   type ElicitationCapabilities is record
      form                  : Optional_ElicitationFormCapabilities;
      --  Whether the client supports form-based elicitation.
      --
      --  Optional. Omitted and `null` are equivalent and mean form support is not advertised.
      --  Supplying `{}` explicitly advertises form support.
      url                   : Optional_ElicitationUrlCapabilities;
      --  Whether the client supports URL-based elicitation.
      --
      --  Optional. Omitted and `null` are equivalent and mean the client does not advertise support.
      --  Supplying `{}` means the client supports URL-based elicitation.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type Optional_ElicitationCapabilities (Is_Set : Boolean := False) is record
      case Is_Set is
         when True =>
            Value : ElicitationCapabilities;

         when False =>
            null;
      end case;
   end record;

   type TerminalExitStatus is record
      exitCode              : Any_Value;
      --  Process exit code as the platform reports it, when known. Negative values are
      --  allowed, for example signed Windows exit codes. Omitted and `null` are equivalent.
      signal                : VSS.Strings.Virtual_String;
      --  Signal that terminated the process, when known.
      --
      --  Agents should use the conventional platform signal name. POSIX examples
      --  include `SIGTERM`, `SIGKILL`, and `SIGINT`. Other platforms may use a
      --  platform-specific name. Omitted and `null` are equivalent.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type DeleteSessionRequest is record
      sessionId             : VSS.Strings.Virtual_String;
      --  The ID of the session to delete.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   --  Left:#/$defs/SessionConfigValueId
   type McpServerHttp is record
      name                  : VSS.Strings.Virtual_String;
      --  Human-readable name identifying this MCP server.
      url                   : VSS.Strings.Virtual_String;
      --  URL to the MCP server.
      headers               : HttpHeader_Vector;
      --  HTTP headers to set when making requests to the MCP server. Headers the MCP transport
      --  defines are owned by the transport, and Agents use the transport's values for them.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type CancelSessionNotification is record
      sessionId             : VSS.Strings.Virtual_String;
      --  The ID of the session whose foreground work to cancel.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type PromptRequest is record
      sessionId             : VSS.Strings.Virtual_String;
      --  The ID of the session to send this user message to
      prompt                : Any_Value;
      --  The blocks of content that compose the user's message.
      --
      --  As a baseline, the Agent MUST support `text` and `resource_link` content blocks,
      --  while other variants are optionally enabled via `PromptCapabilities`.
      --
      --  The Client MUST adapt its interface according to `PromptCapabilities`.
      --
      --  The client MAY include referenced pieces of context as either
      --  `resource` or `resource_link` content blocks.
      --
      --  When available, `resource` is preferred
      --  as it avoids extra round-trips and allows the message to include
      --  pieces of context from sources the agent may not have access to.
      --
      --  Clients MUST NOT send an empty array. Agents MAY reject one with `-32602` without
      --  inserting it.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type CommandPermissionSubject is record
      command               : VSS.Strings.Virtual_String;
      --  The command that would be run if permission is granted.
      cwd                   : VSS.Strings.Virtual_String;
      --  The absolute working directory for the command.
      toolCallId            : VSS.Strings.Virtual_String;
      --  The associated tool call, when known. Omitted and `null` are equivalent.
      terminalId            : VSS.Strings.Virtual_String;
      --  The associated terminal, when already known. Omitted and `null` are equivalent.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type DeleteSessionResponse is record
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type AgentThought is new Any_Object with null record;
   type NewSessionResponse is record
      sessionId             : VSS.Strings.Virtual_String;
      --  Unique identifier for the created session.
      --
      --  Used in all subsequent requests for this conversation.
      configOptions         : SessionConfigOption_Vector;
      --  Initial session configuration options.
      --
      --  Optional. Omitted or empty means no config options are advertised.
      --  Senders MUST use an array, not `null`. Receivers treat `null` like omission.
      --  Later `config_option_update` notifications replace this list.
      availableCommands     : Any_Value;
      --  Initial commands the agent can execute in this session.
      --
      --  Optional. Omitted or empty means no initial commands are advertised.
      --  Senders MUST use an array, not `null`. Receivers treat `null` like omission.
      --  Later `available_commands_update` notifications replace this list.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type CancelledPermissionOutcome is record
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type AvailableCommandsUpdate is record
      availableCommands     : Any_Value;
      --  Commands the agent can execute.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type TitledMultiSelectItems is record
      anyOf                 : EnumOption_Vector;
      --  Titled enum options. Must contain at least one option.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type ElicitationSessionScope is record
      sessionId             : VSS.Strings.Virtual_String;
      --  The session this elicitation is tied to.
      toolCallId            : VSS.Strings.Virtual_String;
      --  Optional tool call within the session.
      --
      --  Optional. Omitted and `null` are equivalent and mean the elicitation is scoped to the
      --  session without a specific tool call.
      Additional_Properties : Any_Object;
   end record;

   type TerminalSize is record
      cols                  : Integer_64;
      --  Number of columns.
      rows                  : Integer_64;
      --  Number of rows.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type ElicitationContentValue is new Any_Object with null record;
   type TextCommandInput is record
      hint                  : VSS.Strings.Virtual_String;
      --  A hint to display when the input hasn't been provided yet
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type ConfigOptionUpdate is record
      configOptions         : SessionConfigOption_Vector;
      --  The full set of configuration options and their current values.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type CancelRequestNotification is record
      requestId             : Integer_Or_String;
      --  The ID of the request to cancel: a request that the sender of this notification issued.
      --  Receivers match it only against requests they received from that sender.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type TextContent is record
      text                  : VSS.Strings.Virtual_String;
      --  Text payload carried by this content block.
      annotations           : Optional_Annotations;
      --  Optional annotations that help clients decide how to display or route this content.
      --
      --  Omitted and `null` are equivalent and mean no annotations are provided.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type MultiSelectItems is new Any_Object with null record;
   type MultiSelectPropertySchema is record
      title                 : VSS.Strings.Virtual_String;
      --  Optional title for the property.
      --
      --  Optional. Omitted and `null` are equivalent and mean no title is provided.
      description           : VSS.Strings.Virtual_String;
      --  Human-readable description.
      --
      --  Optional. Omitted and `null` are equivalent and mean no description is provided.
      minItems              : Any_Value;
      --  Minimum number of items to select.
      --
      --  Optional. Omitted and `null` are equivalent and mean there is no minimum selection count.
      maxItems              : Any_Value;
      --  Maximum number of items to select.
      --
      --  Optional. Omitted and `null` are equivalent and mean there is no maximum selection count.
      items                 : MultiSelectItems;
      --  The items definition describing allowed values.
      default               : Any_Value;
      --  Default selected values.
      --
      --  Optional. Omitted and `null` are equivalent and mean no default selections are provided.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type ContentChunk is record
      messageId             : VSS.Strings.Virtual_String;
      --  A unique identifier for the message this chunk belongs to.
      --
      --  All chunks belonging to the same message share the same `messageId`.
      --  Chunks for different messages can interleave.
      content               : ContentBlock;
      --  A single item of content
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --  This metadata is scoped to the chunk and does not patch stored metadata.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type SessionConfigSelectOptions is new Any_Object with null record;
   type SessionConfigSelect is record
      currentValue          : VSS.Strings.Virtual_String;
      --  The currently selected value. MUST be one of the `value`s in `options`.
      options               : SessionConfigSelectOptions;
      --  The set of selectable options. MUST contain at least one value, and each `value` MUST be
      --  unique within the option, including across groups.
      Additional_Properties : Any_Object;
   end record;

   type ToolCallLocation is record
      path                  : VSS.Strings.Virtual_String;
      --  The absolute file path being accessed or modified.
      line                  : Any_Value;
      --  Optional 1-based line number within the file. Omitted and `null` are equivalent and
      --  mean no specific line. `0` is invalid.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type BooleanPropertySchema is record
      title                 : VSS.Strings.Virtual_String;
      --  Optional title for the property.
      --
      --  Optional. Omitted and `null` are equivalent and mean no title is provided.
      description           : VSS.Strings.Virtual_String;
      --  Human-readable description.
      --
      --  Optional. Omitted and `null` are equivalent and mean no description is provided.
      default               : Any_Value;
      --  Default value.
      --
      --  Optional. Omitted and `null` are equivalent and mean no default value is provided.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type SessionInfo is record
      sessionId             : VSS.Strings.Virtual_String;
      --  Unique identifier for the session
      cwd                   : VSS.Strings.Virtual_String;
      --  The working directory for this session. Must be an absolute path.
      additionalDirectories : VSS.String_Vectors.Virtual_String_Vector;
      --  Additional workspace roots reported for this session. Each path must be absolute.
      --
      --  When present, this is the complete ordered additional-root list reported
      --  by the Agent. Omitted and empty values are equivalent: the response
      --  reports no additional roots.
      title                 : VSS.Strings.Virtual_String;
      --  Human-readable title for the session
      --
      --  Omitted and `null` are equivalent and mean no title is provided.
      updatedAt             : VSS.Strings.Virtual_String;
      --  RFC 3339 timestamp of last activity.
      --
      --  Omitted and `null` are equivalent and mean the last activity time is not reported.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type ErrorData is new Any_Object with null record;
   type Optional_ErrorData (Is_Set : Boolean := False) is record
      case Is_Set is
         when True =>
            Value : ErrorData;

         when False =>
            null;
      end case;
   end record;

   type Error is record
      code                  : ErrorCode;
      --  A number indicating the error type that occurred.
      --  This must be an integer as defined in the JSON-RPC specification.
      message               : VSS.Strings.Virtual_String;
      --  A string providing a short description of the error.
      --  The message should be limited to a concise single sentence.
      data                  : Optional_ErrorData;
      --  Optional primitive or structured value that contains additional information about the error.
      --  This may include debugging information or context-specific details.
      --
      --  Omitted and `null` are equivalent and mean no additional data is provided. Some codes
      --  define a shape: [`UnsupportedProtocolVersionErrorData`] for `-32022`, and
      --  [`SessionNotFoundErrorData`] for `-32002` when a session is not found.
      Additional_Properties : Any_Object;
   end record;

   type Optional_Error (Is_Set : Boolean := False) is record
      case Is_Set is
         when True =>
            Value : Error;

         when False =>
            null;
      end case;
   end record;

   type ClientResponse is new Any_Object with null record;
   type PlanUpdateContent is new Any_Object with null record;
   type PlanUpdate is record
      plan                  : PlanUpdateContent;
      --  The updated plan content.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type ElicitationSchemaType is new Any_Object with null record;
   type ElicitationSchema is record
      a_type                : ElicitationSchemaType;
      --  Type discriminator. Always `"object"`. Any other value is rejected.
      title                 : VSS.Strings.Virtual_String;
      --  Optional title for the schema.
      --
      --  Optional. Omitted and `null` are equivalent and mean no title is provided.
      properties            : Any_Object;
      --  Property definitions (must be primitive types).
      required              : Any_Value;
      --  List of required property names.
      --
      --  Optional. Omitted and `null` are equivalent and mean no property names are required.
      description           : VSS.Strings.Virtual_String;
      --  Optional description of what this schema represents.
      --
      --  Optional. Omitted and `null` are equivalent and mean no schema description is provided.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type ElicitationFormMode is record
      requestedSchema       : ElicitationSchema;
      --  A JSON Schema describing the form fields to present to the user.
      Additional_Properties : Any_Object;
   end record;

   type ListSessionsRequest is record
      cwd                   : VSS.Strings.Virtual_String;
      --  Filter sessions by working directory. Must be an absolute path.
      --
      --  Only sessions whose `cwd` is this same directory match. Subdirectories and
      --  `additionalDirectories` don't. Agents MAY normalize paths when comparing.
      --
      --  Omitted and `null` are equivalent and mean sessions are not filtered by working directory.
      cursor                : VSS.Strings.Virtual_String;
      --  Opaque cursor token from a previous response's nextCursor field for cursor-based pagination
      --
      --  Omitted and `null` are equivalent and mean the first page is requested.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type UnsupportedProtocolVersionErrorData is record
      requested             : Integer_64;
      --  The protocol version the Client requested.
      supported             : Integer_64_Vector;
      --  The protocol versions the Agent supports.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   --  Left:#/$defs/NoticeSeverity
   type CancelToolCallRequest is record
      sessionId             : VSS.Strings.Virtual_String;
      --  The ID of the session that owns the tool call.
      toolCallId            : VSS.Strings.Virtual_String;
      --  The ID of the tool call to cancel.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type SetSessionConfigOptionResponse is record
      configOptions         : SessionConfigOption_Vector;
      --  The full set of configuration options and their current values.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   --  Left:#/$defs/CompactionId
   type AuthMethod is new Any_Object with null record;
   type TerminalOutput is record
      data                  : VSS.Strings.Virtual_String;
      --  Base64-encoded replacement terminal output bytes.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type Command is record
      name                  : VSS.Strings.Virtual_String;
      --  Command name without the leading `/` (e.g., `create_plan`, `research_codebase`).
      --
      --  MUST NOT contain whitespace and MUST be unique within the command list.
      description           : VSS.Strings.Virtual_String;
      --  Human-readable description of what the command does.
      input                 : Optional_AvailableCommandInput;
      --  Input for the command if required
      --
      --  Omitted and `null` are equivalent and mean the command takes no input.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   --  Left:#/$defs/ExtRequest
   type TextResourceContents is record
      text                  : VSS.Strings.Virtual_String;
      --  Text payload carried by this content block.
      uri                   : VSS.Strings.Virtual_String;
      --  URI associated with this resource or media payload.
      mimeType              : VSS.Strings.Virtual_String;
      --  MIME type describing the encoded media payload.
      --
      --  Omitted and `null` are equivalent and mean the MIME type is not specified.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type ListSessionsResponse is record
      sessions              : SessionInfo_Vector;
      --  Array of session information objects.
      nextCursor            : VSS.Strings.Virtual_String;
      --  Opaque cursor token. If present, pass this in the next request's cursor parameter
      --  to fetch the next page. Omitted and `null` are equivalent and mean there are no more
      --  results. An empty string is a valid cursor, not the end of results.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type Terminal is record
      terminalId            : VSS.Strings.Virtual_String;
      --  The ID of the terminal to display.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   --  Left:#/$defs/CompactionStatus
   type ClientCapabilities is record
      auth                  : Optional_ClientAuthCapabilities;
      --  Authentication capabilities supported by the client.
      --  Determines which authentication method types the agent may include
      --  in its `InitializeResponse`.
      --
      --  Optional. Omitted and `null` are equivalent and mean the client does not advertise any
      --  authentication-method extensions.
      elicitation           : Optional_ElicitationCapabilities;
      --  Elicitation capabilities supported by the client.
      --  Determines which elicitation modes the agent may use.
      --
      --  Optional. Omitted and `null` are equivalent and mean the client does not advertise
      --  elicitation support.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type Optional_ClientCapabilities (Is_Set : Boolean := False) is record
      case Is_Set is
         when True =>
            Value : ClientCapabilities;

         when False =>
            null;
      end case;
   end record;

   type CancelTerminalResponse is record
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type EnumOption is record
      const                 : VSS.Strings.Virtual_String;
      --  The constant value for this option.
      title                 : VSS.Strings.Virtual_String;
      --  Human-readable title for this option.
      description           : VSS.Strings.Virtual_String;
      --  Human-readable description.
      --
      --  Optional. Omitted and `null` are equivalent and mean no description is provided.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type BlobResourceContents is record
      blob                  : VSS.Strings.Virtual_String;
      --  Base64-encoded bytes for a binary resource payload.
      uri                   : VSS.Strings.Virtual_String;
      --  URI associated with this resource or media payload.
      mimeType              : VSS.Strings.Virtual_String;
      --  MIME type describing the encoded media payload.
      --
      --  Omitted and `null` are equivalent and mean the MIME type is not specified.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type Implementation is record
      name                  : VSS.Strings.Virtual_String;
      --  Intended for programmatic or logical use, but can be used as a display
      --  name fallback if title isn't present.
      title                 : VSS.Strings.Virtual_String;
      --  Intended for UI and end-user contexts and optimized to be human-readable
      --  and easily understood.
      --
      --  If not provided, the name should be used for display.
      --
      --  Omitted and `null` are equivalent and mean the `name` is used for display.
      version               : VSS.Strings.Virtual_String;
      --  Version of the implementation. Can be displayed to the user or used
      --  for debugging or metrics purposes. (e.g. "1.0.0").
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type InitializeResponse is record
      protocolVersion       : Integer_64;
      --  The highest protocol version supported by the agent that is at or below
      --  the version requested by the client. If no such version exists,
      --  initialization fails with error code -32022.
      --
      --  The client must check that it supports this version and should disconnect
      --  if it does not.
      info                  : Implementation;
      --  Information about the implementation sending this initialize response.
      capabilities          : Optional_AgentCapabilities;
      --  Capabilities supported by the agent.
      authMethods           : Any_Value;
      --  Authentication methods supported by the agent.
      --
      --  Optional. Omitted or empty means the agent does not advertise the
      --  `auth/login` and `auth/logout` methods. Supplying one or more methods means
      --  the agent MUST support both `auth/login` and `auth/logout`.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   --  Left:#/$defs/ToolCallStatus
   type CompactionSummaryChunk is record
      compactionId          : VSS.Strings.Virtual_String;
      --  ID of the compaction whose summary receives this content.
      content               : ContentBlock;
      --  One content block to append.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --  This metadata is scoped to the chunk and does not patch stored metadata.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type ResourceLink is record
      name                  : VSS.Strings.Virtual_String;
      --  Human-readable name shown for this protocol object.
      uri                   : VSS.Strings.Virtual_String;
      --  URI associated with this resource or media payload.
      title                 : VSS.Strings.Virtual_String;
      --  Optional display title for end-user UI.
      --
      --  Omitted and `null` are equivalent and mean no title is provided.
      description           : VSS.Strings.Virtual_String;
      --  Optional human-readable details shown with this protocol object.
      --
      --  Omitted and `null` are equivalent and mean no description is provided.
      icons                 : Any_Value;
      --  Optional set of sized icons that the client can display in a user interface.
      --
      --  Omitted and `null` are equivalent and mean no icons are provided.
      mimeType              : VSS.Strings.Virtual_String;
      --  MIME type describing the encoded media payload.
      --
      --  Omitted and `null` are equivalent and mean the MIME type is not specified.
      size                  : Any_Value;
      --  Optional size of the linked resource in bytes, if known.
      --
      --  Omitted and `null` are equivalent and mean the size is not known.
      annotations           : Optional_Annotations;
      --  Optional annotations that help clients decide how to display or route this content.
      --
      --  Omitted and `null` are equivalent and mean no annotations are provided.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   --  Left:#/$defs/PermissionOptionId
   type SelectedPermissionOutcome is record
      optionId              : VSS.Strings.Virtual_String;
      --  The ID of the option the user selected.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type ToolCallCapabilities is record
      cancel                : Optional_ToolCallCancelCapabilities;
      --  Permits the Client to cancel this tool call with `tool_call/cancel`.
      --
      --  Omitted and `null` are equivalent and mean unsupported. An object (including `{}`)
      --  means supported. Agents SHOULD stop advertising it once the tool call reaches a final status.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type HttpHeader is record
      name                  : VSS.Strings.Virtual_String;
      --  The name of the HTTP header.
      value                 : VSS.Strings.Virtual_String;
      --  The value to set for the HTTP header.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type StateUpdate is new Any_Object with null record;
   type AuthMethodAgent is record
      methodId              : VSS.Strings.Virtual_String;
      --  Unique identifier for this authentication method.
      name                  : VSS.Strings.Virtual_String;
      --  Human-readable name of the authentication method.
      description           : VSS.Strings.Virtual_String;
      --  Optional human-readable description of this authentication method.
      --
      --  Omitted and `null` are equivalent and mean no description is provided.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type EnvVariable is record
      name                  : VSS.Strings.Virtual_String;
      --  The name of the environment variable.
      value                 : VSS.Strings.Virtual_String;
      --  The value to set for the environment variable.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type ClientNotification is record
      method                : VSS.Strings.Virtual_String;
      --  The notification method name.
      params                : Any_Value;
      --  Method-specific notification parameters.
      Additional_Properties : Any_Object;
   end record;

   type ToolCallPermissionSubject is record
      toolCall              : ToolCallUpdate;
      --  Details about the tool call requiring permission.
      --
      --  Clients apply this to their stored tool call exactly like a `tool_call_update`
      --  notification, in the order it was received, before showing the prompt. A first-seen
      --  `toolCallId` creates the tool call.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type LoginAuthResponse is record
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type SessionConfigSelectOption is record
      value                 : VSS.Strings.Virtual_String;
      --  Unique identifier for this option value.
      name                  : VSS.Strings.Virtual_String;
      --  Human-readable label for this option value.
      description           : VSS.Strings.Virtual_String;
      --  Optional description for this option value.
      --
      --  Omitted and `null` are equivalent and mean no description is provided.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   --  Left:#/$defs/PlanId
   type CancelTerminalRequest is record
      sessionId             : VSS.Strings.Virtual_String;
      --  The ID of the session that owns the terminal.
      terminalId            : VSS.Strings.Virtual_String;
      --  The ID of the terminal to cancel.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type ReplayFrom is new Any_Object with null record;
   type Optional_ReplayFrom (Is_Set : Boolean := False) is record
      case Is_Set is
         when True =>
            Value : ReplayFrom;

         when False =>
            null;
      end case;
   end record;

   type ResumeSessionRequest is record
      sessionId             : VSS.Strings.Virtual_String;
      --  The ID of the session to resume.
      cwd                   : VSS.Strings.Virtual_String;
      --  The working directory for this session. Must be an absolute path.
      --
      --  Clients MUST send the session's working directory. Agents MAY reject a different directory
      --  with `-32602`, and MAY normalize paths when comparing.
      additionalDirectories : VSS.String_Vectors.Virtual_String_Vector;
      --  Additional workspace roots to activate for this session. Each path must be absolute.
      --
      --  When omitted or empty, no additional roots are activated. When non-empty,
      --  this is the complete resulting additional-root list for the resumed
      --  session. It may differ from any previously used or reported list as long as
      --  the request `cwd` matches the session's `cwd`.
      mcpServers            : Any_Value;
      --  List of MCP servers to connect to for this session.
      --
      --  The complete set of Client-provided servers. Omitted and `[]` mean none. Agents SHOULD
      --  NOT restore servers from earlier requests.
      replayFrom            : Optional_ReplayFrom;
      --  Inclusive cursor describing where conversation replay should begin.
      --
      --  Optional. Omitted and `null` are equivalent and mean the Agent should resume without
      --  replaying previous conversation history. Replay cursors are inclusive:
      --  replay includes the position identified by the cursor. Supplying
      --  `{ "type": "start" }` means the Agent should replay all retained
      --  conversation history before responding.
      --
      --  Agents MUST reject unsupported cursor types or malformed cursor values
      --  with `-32602` (Invalid params), rather than substituting another cursor
      --  or resuming without replay.
      systemPrompt          : Optional_SystemPrompt;
      --  System-level instructions for the resumed session.
      --
      --  Optional. Omitted and `null` are equivalent. The Agent may then keep a
      --  system prompt it stored with the session or use its default instructions.
      --  Clients MUST only send this when the Agent advertises
      --  `session.systemPrompt`, and SHOULD send the same value they used when the
      --  session was created.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type ErrorStopReason is record
      error                 : Optional_Error;
      --  The failure, as a JSON-RPC error object.
      --
      --  Optional. Omitted and `null` are equivalent and mean the agent is not reporting failure details.
      --  Agents SHOULD include it.
      Additional_Properties : Any_Object;
   end record;

   type PlanItems is record
      planId                : VSS.Strings.Virtual_String;
      --  The plan ID to update.
      entries               : PlanEntry_Vector;
      --  The list of tasks to be accomplished.
      --
      --  When updating an item-based plan, the agent must send a complete list of all entries
      --  with their current status. The client replaces that plan with each update.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type CompleteElicitationNotification is record
      elicitationId         : VSS.Strings.Virtual_String;
      --  The ID of the elicitation that completed.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   --  Left:#/$defs/ExtNotification
   type StringMultiSelectItems is record
      enum                  : VSS.String_Vectors.Virtual_String_Vector;
      --  Allowed enum values. Must contain at least one value.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type Icon is record
      src                   : VSS.Strings.Virtual_String;
      --  A standard URI pointing to an icon resource. MUST be an `https:` or `data:` URI.
      --  Clients reject other schemes, fetch without credentials, and do not follow
      --  scheme- or origin-changing redirects.
      mimeType              : VSS.Strings.Virtual_String;
      --  Optional MIME type override if the source MIME type is missing or generic.
      --
      --  Omitted and `null` are equivalent and mean the source MIME type is used.
      sizes                 : Any_Value;
      --  Optional array of strings that specify sizes at which the icon can be used.
      --  Each string should be in `WxH` format (e.g., `"48x48"`, `"96x96"`) or
      --  `"any"` for scalable formats like SVG.
      --
      --  If not provided, the client should assume that the icon can be used at any size.
      --
      --  Omitted and `null` are equivalent and mean no sizes are specified.
      theme                 : VSS.Strings.Virtual_String;
      --  Optional theme this icon is designed for.
      --
      --  Omitted and `null` are equivalent and mean the icon is not theme-specific.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type NumberPropertySchema is record
      title                 : VSS.Strings.Virtual_String;
      --  Optional title for the property.
      --
      --  Optional. Omitted and `null` are equivalent and mean no title is provided.
      description           : VSS.Strings.Virtual_String;
      --  Human-readable description.
      --
      --  Optional. Omitted and `null` are equivalent and mean no description is provided.
      minimum               : Any_Value;
      --  Minimum value (inclusive).
      --
      --  Optional. Omitted and `null` are equivalent and mean there is no inclusive lower bound.
      maximum               : Any_Value;
      --  Maximum value (inclusive).
      --
      --  Optional. Omitted and `null` are equivalent and mean there is no inclusive upper bound.
      default               : Any_Value;
      --  Default value.
      --
      --  Optional. Omitted and `null` are equivalent and mean no default value is provided.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type McpServerStdio is record
      name                  : VSS.Strings.Virtual_String;
      --  Human-readable name identifying this MCP server.
      command               : VSS.Strings.Virtual_String;
      --  Absolute path to the MCP server executable.
      args                  : VSS.String_Vectors.Virtual_String_Vector;
      --  Command-line arguments to pass to the MCP server.
      env                   : EnvVariable_Vector;
      --  Environment variables to set when launching the MCP server. Names SHOULD be unique.
      --  Agents MAY reject duplicates with `-32602`, and otherwise the last entry wins.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type CreateElicitationResponse is record
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type AgentResponse is new Any_Object with null record;
   type PermissionOption is record
      optionId              : VSS.Strings.Virtual_String;
      --  Identifier for this permission option. MUST be unique within the request.
      name                  : VSS.Strings.Virtual_String;
      --  Human-readable label to display to the user.
      kind                  : VSS.Strings.Virtual_String;
      --  Hint about the nature of this permission option.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type Notice is record
      severity              : VSS.Strings.Virtual_String;
      --  Presentation severity hint.
      title                 : VSS.Strings.Virtual_String;
      --  Required non-empty plain-text title that can stand alone.
      description           : VSS.Strings.Virtual_String;
      --  Optional plain-text detail or guidance.
      --
      --  Omitted and `null` are equivalent and mean no description was supplied.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type InitializeRequest is record
      protocolVersion       : Integer_64;
      --  The latest protocol version supported by the client.
      info                  : Implementation;
      --  Information about the implementation sending this initialize request.
      capabilities          : Optional_ClientCapabilities;
      --  Capabilities supported by the client.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type TerminalCapabilities is record
      cancel                : Optional_TerminalCancelCapabilities;
      --  Permits the Client to cancel this terminal with `terminal/cancel`.
      --
      --  Omitted and `null` are equivalent and mean unsupported. An object (including `{}`)
      --  means supported. Agents SHOULD stop advertising it once the terminal reports `exitStatus`.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type UsageUpdate is new Any_Object with null record;
   type AgentRequest is record
      id                    : Integer_Or_String;
      --  The request id used to correlate the matching response.
      method                : VSS.Strings.Virtual_String;
      --  The method name to invoke.
      params                : Any_Value;
      --  Method-specific request parameters.
      Additional_Properties : Any_Object;
   end record;

   type McpServer is new Any_Object with null record;
   type ReplayFromStart is record
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type ElicitationPropertySchema is new Any_Object with null record;
   type CancelToolCallResponse is record
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   type BackgroundToolCall is record
      toolCallId            : VSS.Strings.Virtual_String;
      --  The ID of the listed tool call.
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   --  Left:#/$defs/ExtResponse
   type RequiresActionStateUpdate is record
      background            : Any_Value;
      --  Work running independently of foreground work, as a complete snapshot.
      --
      --  Optional. Omitted and `null` are equivalent and mean the Agent is not reporting
      --  background work, not that nothing is running. `[]` means no background work is
      --  running. An Agent that reports background work MUST include it on every state
      --  update for the session. A malformed list is treated as not reported.
      --
      --  See protocol docs: [Background Work](https://agentclientprotocol.com/protocol/v2/prompt-lifecycle#background-work)
      meta                  : Any_Object;
      --  The _meta property is reserved by ACP to allow clients and agents to attach additional
      --  metadata to their interactions. Omitted and `null` are equivalent and mean no metadata.
      --  Implementations MUST NOT assign meaning to keys they do not recognize.
      --
      --  See protocol docs: [Extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
      Additional_Properties : Any_Object;
   end record;

   function Empty return EnumOption_Vector;

   function Is_Null (Self : EnumOption_Vector) return Boolean;

   function Length (Self : EnumOption_Vector) return Natural;

   procedure Clear
     (Self : in out EnumOption_Vector; Is_Null : Boolean := True);

   procedure Append (Self : in out EnumOption_Vector; Value : EnumOption);

   type EnumOption_Variable_Reference (Element : not null access EnumOption) is
   null record
   with Implicit_Dereference => Element;

   not overriding
   function Get_EnumOption_Variable_Reference
     (Self : aliased in out EnumOption_Vector; Index : Positive)
      return EnumOption_Variable_Reference
   with Inline;

   type EnumOption_Constant_Reference
     (Element : not null access constant EnumOption)
   is null record
   with Implicit_Dereference => Element;

   not overriding
   function Get_EnumOption_Constant_Reference
     (Self : aliased EnumOption_Vector; Index : Positive)
      return EnumOption_Constant_Reference
   with Inline;

   function Empty return SessionConfigSelectOption_Vector;

   function Is_Null (Self : SessionConfigSelectOption_Vector) return Boolean;

   function Length (Self : SessionConfigSelectOption_Vector) return Natural;

   procedure Clear
     (Self    : in out SessionConfigSelectOption_Vector;
      Is_Null : Boolean := True);

   procedure Append
     (Self  : in out SessionConfigSelectOption_Vector;
      Value : SessionConfigSelectOption);

   type SessionConfigSelectOption_Variable_Reference
     (Element : not null access SessionConfigSelectOption)
   is null record
   with Implicit_Dereference => Element;

   not overriding
   function Get_SessionConfigSelectOption_Variable_Reference
     (Self : aliased in out SessionConfigSelectOption_Vector; Index : Positive)
      return SessionConfigSelectOption_Variable_Reference
   with Inline;

   type SessionConfigSelectOption_Constant_Reference
     (Element : not null access constant SessionConfigSelectOption)
   is null record
   with Implicit_Dereference => Element;

   not overriding
   function Get_SessionConfigSelectOption_Constant_Reference
     (Self : aliased SessionConfigSelectOption_Vector; Index : Positive)
      return SessionConfigSelectOption_Constant_Reference
   with Inline;

   function Empty return SessionInfo_Vector;

   function Is_Null (Self : SessionInfo_Vector) return Boolean;

   function Length (Self : SessionInfo_Vector) return Natural;

   procedure Clear
     (Self : in out SessionInfo_Vector; Is_Null : Boolean := True);

   procedure Append (Self : in out SessionInfo_Vector; Value : SessionInfo);

   type SessionInfo_Variable_Reference
     (Element : not null access SessionInfo)
   is null record
   with Implicit_Dereference => Element;

   not overriding
   function Get_SessionInfo_Variable_Reference
     (Self : aliased in out SessionInfo_Vector; Index : Positive)
      return SessionInfo_Variable_Reference
   with Inline;

   type SessionInfo_Constant_Reference
     (Element : not null access constant SessionInfo)
   is null record
   with Implicit_Dereference => Element;

   not overriding
   function Get_SessionInfo_Constant_Reference
     (Self : aliased SessionInfo_Vector; Index : Positive)
      return SessionInfo_Constant_Reference
   with Inline;

   function Empty return SessionConfigOption_Vector;

   function Is_Null (Self : SessionConfigOption_Vector) return Boolean;

   function Length (Self : SessionConfigOption_Vector) return Natural;

   procedure Clear
     (Self : in out SessionConfigOption_Vector; Is_Null : Boolean := True);

   procedure Append
     (Self : in out SessionConfigOption_Vector; Value : SessionConfigOption);

   type SessionConfigOption_Variable_Reference
     (Element : not null access SessionConfigOption)
   is null record
   with Implicit_Dereference => Element;

   not overriding
   function Get_SessionConfigOption_Variable_Reference
     (Self : aliased in out SessionConfigOption_Vector; Index : Positive)
      return SessionConfigOption_Variable_Reference
   with Inline;

   type SessionConfigOption_Constant_Reference
     (Element : not null access constant SessionConfigOption)
   is null record
   with Implicit_Dereference => Element;

   not overriding
   function Get_SessionConfigOption_Constant_Reference
     (Self : aliased SessionConfigOption_Vector; Index : Positive)
      return SessionConfigOption_Constant_Reference
   with Inline;

   function Empty return PlanEntry_Vector;

   function Is_Null (Self : PlanEntry_Vector) return Boolean;

   function Length (Self : PlanEntry_Vector) return Natural;

   procedure Clear (Self : in out PlanEntry_Vector; Is_Null : Boolean := True);

   procedure Append (Self : in out PlanEntry_Vector; Value : PlanEntry);

   type PlanEntry_Variable_Reference (Element : not null access PlanEntry) is
   null record
   with Implicit_Dereference => Element;

   not overriding
   function Get_PlanEntry_Variable_Reference
     (Self : aliased in out PlanEntry_Vector; Index : Positive)
      return PlanEntry_Variable_Reference
   with Inline;

   type PlanEntry_Constant_Reference
     (Element : not null access constant PlanEntry)
   is null record
   with Implicit_Dereference => Element;

   not overriding
   function Get_PlanEntry_Constant_Reference
     (Self : aliased PlanEntry_Vector; Index : Positive)
      return PlanEntry_Constant_Reference
   with Inline;

   function Empty return HttpHeader_Vector;

   function Is_Null (Self : HttpHeader_Vector) return Boolean;

   function Length (Self : HttpHeader_Vector) return Natural;

   procedure Clear
     (Self : in out HttpHeader_Vector; Is_Null : Boolean := True);

   procedure Append (Self : in out HttpHeader_Vector; Value : HttpHeader);

   type HttpHeader_Variable_Reference (Element : not null access HttpHeader) is
   null record
   with Implicit_Dereference => Element;

   not overriding
   function Get_HttpHeader_Variable_Reference
     (Self : aliased in out HttpHeader_Vector; Index : Positive)
      return HttpHeader_Variable_Reference
   with Inline;

   type HttpHeader_Constant_Reference
     (Element : not null access constant HttpHeader)
   is null record
   with Implicit_Dereference => Element;

   not overriding
   function Get_HttpHeader_Constant_Reference
     (Self : aliased HttpHeader_Vector; Index : Positive)
      return HttpHeader_Constant_Reference
   with Inline;

   function Empty return EnvVariable_Vector;

   function Is_Null (Self : EnvVariable_Vector) return Boolean;

   function Length (Self : EnvVariable_Vector) return Natural;

   procedure Clear
     (Self : in out EnvVariable_Vector; Is_Null : Boolean := True);

   procedure Append (Self : in out EnvVariable_Vector; Value : EnvVariable);

   type EnvVariable_Variable_Reference
     (Element : not null access EnvVariable)
   is null record
   with Implicit_Dereference => Element;

   not overriding
   function Get_EnvVariable_Variable_Reference
     (Self : aliased in out EnvVariable_Vector; Index : Positive)
      return EnvVariable_Variable_Reference
   with Inline;

   type EnvVariable_Constant_Reference
     (Element : not null access constant EnvVariable)
   is null record
   with Implicit_Dereference => Element;

   not overriding
   function Get_EnvVariable_Constant_Reference
     (Self : aliased EnvVariable_Vector; Index : Positive)
      return EnvVariable_Constant_Reference
   with Inline;

   function Empty return DiffChange_Vector;

   function Is_Null (Self : DiffChange_Vector) return Boolean;

   function Length (Self : DiffChange_Vector) return Natural;

   procedure Clear
     (Self : in out DiffChange_Vector; Is_Null : Boolean := True);

   procedure Append (Self : in out DiffChange_Vector; Value : DiffChange);

   type DiffChange_Variable_Reference (Element : not null access DiffChange) is
   null record
   with Implicit_Dereference => Element;

   not overriding
   function Get_DiffChange_Variable_Reference
     (Self : aliased in out DiffChange_Vector; Index : Positive)
      return DiffChange_Variable_Reference
   with Inline;

   type DiffChange_Constant_Reference
     (Element : not null access constant DiffChange)
   is null record
   with Implicit_Dereference => Element;

   not overriding
   function Get_DiffChange_Constant_Reference
     (Self : aliased DiffChange_Vector; Index : Positive)
      return DiffChange_Constant_Reference
   with Inline;

   function Empty return Integer_64_Vector;

   function Is_Null (Self : Integer_64_Vector) return Boolean;

   function Length (Self : Integer_64_Vector) return Natural;

   procedure Clear
     (Self : in out Integer_64_Vector; Is_Null : Boolean := True);

   procedure Append (Self : in out Integer_64_Vector; Value : Integer_64);

   type Integer_64_Variable_Reference (Element : not null access Integer_64) is
   null record
   with Implicit_Dereference => Element;

   not overriding
   function Get_Integer_64_Variable_Reference
     (Self : aliased in out Integer_64_Vector; Index : Positive)
      return Integer_64_Variable_Reference
   with Inline;

   type Integer_64_Constant_Reference
     (Element : not null access constant Integer_64)
   is null record
   with Implicit_Dereference => Element;

   not overriding
   function Get_Integer_64_Constant_Reference
     (Self : aliased Integer_64_Vector; Index : Positive)
      return Integer_64_Constant_Reference
   with Inline;

   function Empty return PermissionOption_Vector;

   function Is_Null (Self : PermissionOption_Vector) return Boolean;

   function Length (Self : PermissionOption_Vector) return Natural;

   procedure Clear
     (Self : in out PermissionOption_Vector; Is_Null : Boolean := True);

   procedure Append
     (Self : in out PermissionOption_Vector; Value : PermissionOption);

   type PermissionOption_Variable_Reference
     (Element : not null access PermissionOption)
   is null record
   with Implicit_Dereference => Element;

   not overriding
   function Get_PermissionOption_Variable_Reference
     (Self : aliased in out PermissionOption_Vector; Index : Positive)
      return PermissionOption_Variable_Reference
   with Inline;

   type PermissionOption_Constant_Reference
     (Element : not null access constant PermissionOption)
   is null record
   with Implicit_Dereference => Element;

   not overriding
   function Get_PermissionOption_Constant_Reference
     (Self : aliased PermissionOption_Vector; Index : Positive)
      return PermissionOption_Constant_Reference
   with Inline;

private
   type EnumOption_Array is array (Positive range <>) of aliased EnumOption;
   type EnumOption_Array_Access is access EnumOption_Array;
   type EnumOption_Vector is new Ada.Finalization.Controlled with record
      Data    : EnumOption_Array_Access;
      Length  : Natural := 0;
      Is_Null : Boolean := True;
   end record;

   overriding
   procedure Adjust (Self : in out EnumOption_Vector);

   overriding
   procedure Finalize (Self : in out EnumOption_Vector);

   type SessionConfigSelectOption_Array is
     array (Positive range <>) of aliased SessionConfigSelectOption;
   type SessionConfigSelectOption_Array_Access is
     access SessionConfigSelectOption_Array;
   type SessionConfigSelectOption_Vector is new Ada.Finalization.Controlled
   with record
      Data    : SessionConfigSelectOption_Array_Access;
      Length  : Natural := 0;
      Is_Null : Boolean := True;
   end record;

   overriding
   procedure Adjust (Self : in out SessionConfigSelectOption_Vector);

   overriding
   procedure Finalize (Self : in out SessionConfigSelectOption_Vector);

   type SessionInfo_Array is array (Positive range <>) of aliased SessionInfo;
   type SessionInfo_Array_Access is access SessionInfo_Array;
   type SessionInfo_Vector is new Ada.Finalization.Controlled with record
      Data    : SessionInfo_Array_Access;
      Length  : Natural := 0;
      Is_Null : Boolean := True;
   end record;

   overriding
   procedure Adjust (Self : in out SessionInfo_Vector);

   overriding
   procedure Finalize (Self : in out SessionInfo_Vector);

   type SessionConfigOption_Array is
     array (Positive range <>) of aliased SessionConfigOption;
   type SessionConfigOption_Array_Access is access SessionConfigOption_Array;
   type SessionConfigOption_Vector is new Ada.Finalization.Controlled
   with record
      Data    : SessionConfigOption_Array_Access;
      Length  : Natural := 0;
      Is_Null : Boolean := True;
   end record;

   overriding
   procedure Adjust (Self : in out SessionConfigOption_Vector);

   overriding
   procedure Finalize (Self : in out SessionConfigOption_Vector);

   type PlanEntry_Array is array (Positive range <>) of aliased PlanEntry;
   type PlanEntry_Array_Access is access PlanEntry_Array;
   type PlanEntry_Vector is new Ada.Finalization.Controlled with record
      Data    : PlanEntry_Array_Access;
      Length  : Natural := 0;
      Is_Null : Boolean := True;
   end record;

   overriding
   procedure Adjust (Self : in out PlanEntry_Vector);

   overriding
   procedure Finalize (Self : in out PlanEntry_Vector);

   type HttpHeader_Array is array (Positive range <>) of aliased HttpHeader;
   type HttpHeader_Array_Access is access HttpHeader_Array;
   type HttpHeader_Vector is new Ada.Finalization.Controlled with record
      Data    : HttpHeader_Array_Access;
      Length  : Natural := 0;
      Is_Null : Boolean := True;
   end record;

   overriding
   procedure Adjust (Self : in out HttpHeader_Vector);

   overriding
   procedure Finalize (Self : in out HttpHeader_Vector);

   type EnvVariable_Array is array (Positive range <>) of aliased EnvVariable;
   type EnvVariable_Array_Access is access EnvVariable_Array;
   type EnvVariable_Vector is new Ada.Finalization.Controlled with record
      Data    : EnvVariable_Array_Access;
      Length  : Natural := 0;
      Is_Null : Boolean := True;
   end record;

   overriding
   procedure Adjust (Self : in out EnvVariable_Vector);

   overriding
   procedure Finalize (Self : in out EnvVariable_Vector);

   type DiffChange_Array is array (Positive range <>) of aliased DiffChange;
   type DiffChange_Array_Access is access DiffChange_Array;
   type DiffChange_Vector is new Ada.Finalization.Controlled with record
      Data    : DiffChange_Array_Access;
      Length  : Natural := 0;
      Is_Null : Boolean := True;
   end record;

   overriding
   procedure Adjust (Self : in out DiffChange_Vector);

   overriding
   procedure Finalize (Self : in out DiffChange_Vector);

   type Integer_64_Array is array (Positive range <>) of aliased Integer_64;
   type Integer_64_Array_Access is access Integer_64_Array;
   type Integer_64_Vector is new Ada.Finalization.Controlled with record
      Data    : Integer_64_Array_Access;
      Length  : Natural := 0;
      Is_Null : Boolean := True;
   end record;

   overriding
   procedure Adjust (Self : in out Integer_64_Vector);

   overriding
   procedure Finalize (Self : in out Integer_64_Vector);

   type PermissionOption_Array is
     array (Positive range <>) of aliased PermissionOption;
   type PermissionOption_Array_Access is access PermissionOption_Array;
   type PermissionOption_Vector is new Ada.Finalization.Controlled with record
      Data    : PermissionOption_Array_Access;
      Length  : Natural := 0;
      Is_Null : Boolean := True;
   end record;

   overriding
   procedure Adjust (Self : in out PermissionOption_Vector);

   overriding
   procedure Finalize (Self : in out PermissionOption_Vector);

end ACP.Types;
