# Decision: generate ACP independently of MCP

## Scope

This comparison concerns the ACP v2 draft schema at commit
`f3ed0fca2fd6d85ef7ae77cfd074cc8605e490dc` and the existing Ada MCP binding
targeting MCP 2026-07-28.

The runtime dependency of the ACP library is `vss_extra ^26.2`. There is no
dependency on the MCP Ada crate or a sibling MCP checkout.

## Shared wire shapes do not imply identical Ada types

The [ACP content specification](https://agentclientprotocol.com/protocol/v2/content)
describes `ContentBlock` as compatible with and a superset of MCP 2026-07-28.
Consequently, agents can forward supported MCP content without transforming
its JSON representation. ACP also defines additional fields and open variants.

| Area | ACP v2 difference from the MCP binding |
| --- | --- |
| Image content | Optional `uri` in addition to the base64 data and MIME type |
| Annotations | Additional `_meta` object |
| Icons | Additional `_meta` object |
| Roles and icon themes | Open strings permit custom/future values |
| Content variants | Open `type` fallback preserves unknown/custom payloads |
| Definition layout | Concrete payload records omit the discriminator; the surrounding `ContentBlock` alternatives add it through `allOf` |
| Request metadata and lifecycle | ACP defines its own initialization, sessions and per-method parameter types |
| MCP server configuration | ACP `McpServer*` types contain connection settings, not MCP message implementations |

The downloaded schema has 202 local definitions and no external `$ref`s. It
does not require importing the MCP schema to generate its types.

These differences make direct aliases to `MCP.Types` unsuitable. Reusing a
closed MCP enum, for example, would reject an ACP role or theme extension.
Reusing a generated MCP content record would also couple ACP's public API and
release cycle to a different protocol's schema and generator mapping.

## Decision and consequences

Generate all ACP types and converters into `ACP.Types`, `ACP.Types.Inputs`
and `ACP.Types.Outputs`. Reuse the VSS infrastructure and generator workflow.

- ACP can be installed and updated without the MCP crate.
- ACP-specific data and unknown content variants can be preserved.
- Similar record declarations are generated twice. This is intentional;
  there is no requirement for the two Ada type identities to be the same.
- Wire compatibility does not provide an implicit Ada assignment/conversion.
  An application using both libraries needs an explicit conversion boundary.

If real applications need a bridge, add a separately packaged adapter depending
on both crates. It should convert compatible content explicitly, preserve ACP
extensions, and report unsupported/lossy ACP-to-MCP conversions. It should not
force the core ACP binding to depend on MCP.

A future shared JSON-RPC/transport library could be protocol-neutral if both
implementations need it. Protocol-specific session and cancellation policies
should stay in their respective runtimes.

## Evidence

- [Pinned ACP v2 schema](https://github.com/agentclientprotocol/agent-client-protocol/blob/f3ed0fca2fd6d85ef7ae77cfd074cc8605e490dc/schema/v2/schema.json)
- [ACP content model and MCP compatibility](https://agentclientprotocol.com/protocol/v2/content)
- [ACP v2 extensibility](https://agentclientprotocol.com/protocol/v2/extensibility)
