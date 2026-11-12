# ACP v2 schema and generation

## Upstream snapshot

- Protocol: **Agent Client Protocol v2 draft**, not the v1 stable schema.
- Repository: <https://github.com/agentclientprotocol/agent-client-protocol>.
- Commit: `f3ed0fca2fd6d85ef7ae77cfd074cc8605e490dc`.
- Path: `schema/v2/schema.json`.
- Definitions: 202; all `$ref`s are local.
- SHA-256: `99814f2ca08cd41810284761f1844daa6b47b2882ff495332db25bdccf413a46`.
- Upstream license: Apache-2.0.

The checked-in `schema.json` is the original upstream file. It is not modified
by generation. To download this exact snapshot:

```sh
curl -fsSL \
  https://raw.githubusercontent.com/agentclientprotocol/agent-client-protocol/f3ed0fca2fd6d85ef7ae77cfd074cc8605e490dc/schema/v2/schema.json \
  -o schema/schema.json
sha256sum schema/schema.json
```

## Regeneration

Use the VSS JSON Schema generator with `--hash-package` support and the
anonymous-array, primitive-type-order, anonymous-additional-properties and
integer-operator fixes used by the MCP binding. The generator used for this
snapshot is the existing `vss-extra` development checkout at commit `dc6ac18`.
The published runtime VSS dependency and the development generator are separate
requirements; consumers of the generated library do not need the generator.

Build that generator with Alire in its `tools/json_schema` crate. From the ACP
root, run `alr build` once to create the project configuration, then:

```sh
./schema/generate.sh /absolute/path/to/gen_json
alr build
alr test
```

The script requires Bash, jq, `gnatchop` and `gnatformat` in the Alire environment.
It takes an explicit executable path and assumes no sibling checkout location.
It prepares a temporary generator schema, runs the generator and replaces:

- `source/acp-types.ads` and `.adb`;
- `source/acp-types-inputs.ads` and `.adb`;
- `source/acp-types-outputs.ads` and `.adb`.

`ACP.Key_Lookups` implements the key lookup generic without importing MCP.

## Generator preparation

`prepare.jq` adapts schema forms that this generator does not handle directly:

1. Annotation-only `allOf: [{"$ref": ...}]` wrappers become direct references.
   For example, session IDs then map to strings and implementation metadata
   maps to its record type rather than an untyped value.
2. Object compositions merge the referenced payload properties and required
   fields with the local discriminator. Composition over another object union
   (`StateUpdate`) remains opaque rather than assuming a single record layout.
3. Open string unions become strings, preserving future roles, themes and enum
   values. `RequestId`'s integer/string union becomes `Integer_Or_String`.
4. Eight patch-bearing object types remain opaque JSON objects:
   `ToolCallUpdate`, `UserMessage`, `AgentMessage`, `AgentThought`,
   `TerminalUpdate`, `SessionInfoUpdate`, `UsageUpdate` and `CompactionUpdate`.
   This preserves omitted fields, explicit nulls, empty strings/arrays and
   metadata patches until the generator supports presence-aware typed fields.

This preparation is a code-generation mapping, not a replacement validation
schema. Use the original `schema.json` to validate protocol messages.

## Current limitations

- Open object unions and unions without a supported constant discriminator
  use JSON event storage. `ContentBlock`, JSON-RPC responses, `McpServer` and
  several session-update variants are examples. Arrays of opaque elements,
  including `PromptRequest.prompt`, can be represented as one `Any_Value`.
- Named opaque types derive from `Any_Object`; their generated converters
  currently accept arbitrary JSON values despite that type name.
- Simple aliases have no dedicated Ada declaration. `SessionId`, `Role` and
  `IconTheme` fields use virtual strings; request IDs use `Integer_Or_String`.
- Most `x-method` definitions are method parameter records. JSON-RPC message
  envelopes are separate; no transport or method dispatcher is generated.
- Readers check encountered field types but do not enforce all required
  properties, bounds, formats, `not` or other JSON Schema 2020-12 constraints.
- The `x-deserialize-*` recovery/default rules are not implemented. Malformed
  optional fields may be rejected instead of ignored or defaulted as described
  by ACP. Optional booleans and empty optional string arrays can lose presence
  outside the explicitly opaque patch types.
- For ordinary optional nullable fields where ACP equates null and absence,
  output may omit an explicit null. The opaque patch records preserve it.
- This is a data binding, not yet a complete, conformant ACP runtime.

## Tests and MCP interoperability

The Ada tests cover typed initialization and sessions, both request ID kinds,
prompt arrays, ACP-only image URIs and annotation metadata, open content
variants, MCP-compatible wire content, invalid field types and patch round trips.
They are examples and regression checks, not a protocol conformance suite.

See [MCP_INTEROP.md](MCP_INTEROP.md) for the decision to keep ACP independent
of the MCP crate.
