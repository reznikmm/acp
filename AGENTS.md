# AGENTS.md

## Purpose

ACP is an Ada 2022 data binding for the Agent Client Protocol v2 draft.
It generates independent ACP types and JSON converters; MCP wire-content
compatibility does not introduce an MCP crate dependency.

## Repository Map

- `source/`: Core library logic (`ACP.*` packages)
- `schema/`: Pinned upstream schema, jq preparation, generator script and notes
- `testsuite/`: Separate test suite crate
- `demos/server/`: Ada stdio echo agent with in-memory sessions
- `demos/client/`: Ada client, Bash launcher and integration tests
- `demos/codex/`: Ada client for the external Codex ACP v2 adapter
- `demos/common/`: Shared stdio, JSON helpers and generated codec adapters
- `config/`: Build-time configuration artifacts written by Alire (do not edit manually)
- `.obj/`, `.lib/`: Build outputs (do not edit manually)

## Ground Rules

- Don't suppress exception with `null;` exception handler
   (one exception is `Libadalang.Common.Property_Error`).
- Don't introduce extra (sub-)type conversions, like Integer to Natural.
- Preserve existing style and naming conventions in nearby code. Don't use abbreviations.
- Keep protocol logic in Ada and use Bash/jq for generation and simple tooling.
- Do not add an MCP dependency to the core crate; see `schema/MCP_INTEROP.md`.
- Regenerate `source/acp-types*.ad[sb]` instead of editing generated units.
- Preserve patch semantics: omission, null and empty values can be distinct.
- Keep demo protocol stdout limited to JSON-RPC messages; report to stderr.

## Build And Test Commands

Run from repository root unless noted otherwise.

- Compile core library:
  - `alr build`
- Compile/check one file (`<unit>.adb`):
  - `alr exec -- gprbuild -q -f -c -u -gnatc -P acp.gpr <unit>.adb '-cargs:ada' -gnatef`
- Fix code style warnings, force code style after edit:
  - `alr exec -- gnatformat --charset=utf-8 --no-subprojects -P acp.gpr`
- Build and run testsuite:
  - `alr -C testsuite/ run`
- Regenerate using an explicit VSS generator executable (Bash and jq required):
  - `./schema/generate.sh /absolute/path/to/gen_json`
  - Follow `schema/README.md` for generator prerequisites and mapping limits.
- Build both demos and run their Bash/jq integration tests:
  - `alr -C demos/server build`
  - `alr -C demos/client build`
  - `./demos/client/run.sh "Привіт з Ada!"`
  - `alr -C demos/server test`
  - `alr -C demos/client test`
- Format the demos after Ada edits:
  - `alr -C demos/server exec -- gnatformat --charset=utf-8 --no-subprojects -P acp_server_demo.gpr`
  - `alr -C demos/client exec -- gnatformat --charset=utf-8 --no-subprojects -P acp_client_demo.gpr`
  - `alr -C demos/codex exec -- gnatformat --charset=utf-8 --no-subprojects -P acp_codex_demo.gpr`
- Build and test the Codex demo without model access:
  - `alr -C demos/codex build`
  - `alr -C demos/codex test`
  - For live runs, install the adapter and log in as described in `demos/codex/README.md`.

## Change Workflow For Agents

1. Read relevant package spec/body before editing. Read `*.adb` only if reading of corresponding `*.ads` is not enough.
2. Implement the smallest viable patch.
3. Re-run compile check for touched units.
4. Run targeted runtime/test command when behavior changes.
   Rebuild all demos for changes in `demos/common/`.
5. Report exactly what changed and what was validated.

## Ada-Specific Notes

- Use predefined Ada container packages
  (for example, `Ada.Containers.Hashed_Sets`). Don't use Indefinite containers.
- Use Ada 2022 syntax if you can.

## Output And Error Handling Expectations

- Diagnostics should be actionable and include path/context when possible.

## When Unsure

- Prefer conservative changes.
- Ask for clarification before large architectural rewrites.
- Document assumptions in the final update.
