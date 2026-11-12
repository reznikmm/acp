ACP
===

[![Build with Alire](https://github.com/reznikmm/acp/actions/workflows/alire.yml/badge.svg)](https://github.com/reznikmm/acp/actions/workflows/alire.yml)
[![REUSE status](https://api.reuse.software/badge/github.com/reznikmm/acp)](https://api.reuse.software/info/github.com/reznikmm/acp)

Ada 2022 types and JSON converters for the **Agent Client Protocol v2 draft**.
The binding is generated from the upstream schema at commit
`f3ed0fca2fd6d85ef7ae77cfd074cc8605e490dc` (202 definitions).

## Packages

- `ACP.Types`: records, optional values, vectors and opaque JSON values.
- `ACP.Types.Inputs`: `Input_<Type>` procedures using VSS JSON pull readers.
- `ACP.Types.Outputs`: `Output_<Type>` procedures using VSS JSON content handlers.
- `ACP.Key_Lookups`: the key lookup generic used by generated readers.

This is the protocol data binding layer. Connection lifecycle, method dispatch
and session state are not implemented yet. Readers are not full schema validators.
See [schema/README.md](schema/README.md) for mapping limitations and regeneration.

## Relationship to MCP

ACP has **no dependency on the MCP Ada crate**. Both libraries use VSS.
ACP's content model extends MCP 2026-07-28: compatible MCP content can be
carried as JSON, while ACP adds fields and open variants that MCP's generated
types do not represent directly. The source schema has only local `$ref`s.

The [dependency decision](schema/MCP_INTEROP.md) records the comparison and the
scope for an optional future adapter. `McpServer` definitions in ACP describe
server connection settings; they do not require an MCP client implementation.

## Build and test

Requirements: Alire and an Ada 2022 toolchain (tested with GNAT 16.1.0).
The library depends on `vss_extra ^26.2`, resolved through Alire.

```sh
alr build
alr test
```

The separate test crate can also be run directly:

```sh
alr -C testsuite run
```

Tests cover initialization, sessions, prompt content, ACP-only fields, unknown
content variants, request IDs and preservation of null/empty patch values.

## Using the converters

Many definitions, such as `InitializeRequest` and `PromptRequest`, describe
method **parameters**. JSON-RPC envelopes are separate definitions; converting
parameters does not add `jsonrpc`, `id` or `method` automatically.

For a reader positioned on an initialization parameters object:

```ada
declare
   Value   : ACP.Types.InitializeRequest;
   Success : Boolean := True;
begin
   ACP.Types.Inputs.Input_InitializeRequest (Reader, Value, Success);
   if Success then
      ACP.Types.Outputs.Output_InitializeRequest (Writer, Value);
   end if;
end;
```

The caller handles document boundaries, reader/writer errors, protocol
validation and dispatch. See [the tests](testsuite/src/test_json.adb) for
complete in-memory conversion examples.

Open unions and updates with patch semantics currently use JSON event storage.
For example, `ToolCallUpdate` preserves the difference between an omitted title
and `"title":null`, and `ContentBlock` preserves ACP's future/custom variants.

## Maintainer and license

[Max Reznik](https://github.com/reznikmm).

Library code: Apache-2.0 WITH LLVM-exception. The upstream schema is Apache-2.0.
See `LICENSES/` and `REUSE.toml`.
