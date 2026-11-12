# ACP v2 stdio demos

Two independent Ada executables demonstrate both sides of the generated binding:

| Directory | Role |
| --- | --- |
| [server](server/README.md) | In-memory echo agent with baseline session methods |
| [client](client/README.md) | Client performing initialization, session setup and a prompt |
| `common/` | Shared stdio framing, JSON helpers and generated codec adapters |

From the repository root:

```sh
alr -C demos/server build
alr -C demos/client build
./demos/client/run.sh "Привіт з Ada!"
```

Expected terminal output:

```text
Protocol: ACP v2
Session: session-1
Prompt: user-1
Echo: Привіт з Ada!
State: idle (end_turn)
```

The Bash launcher connects the processes through FIFOs and enforces a timeout.
It removes the FIFOs and remaining processes on failure or interruption.
All protocol parsing, conversion and dispatch run in Ada. Standard output is
reserved for newline-delimited UTF-8 JSON-RPC; terminal reports go to stderr.
Override the programs or timeout with `--server`, `--client` and `--timeout`.

These examples target the pinned **ACP v2 draft** in `schema/schema.json`.
The `session/prompt` response acknowledges insertion with a `messageId`;
`session/update` carries the user echo, agent output and foreground state.
The client handles updates both before and after the response and waits for
`idle` instead of treating the prompt response as completion.

## Requirements and tests

Alire, an Ada 2022 compiler, Bash, GNU `timeout`, jq and standard POSIX utilities
are required. The demos are tested on Linux. No Python or MCP crate is needed.
Build both demos before running their tests:

```sh
alr -C demos/server test
alr -C demos/client test
```

The Bash/jq tests exercise the actual executables, generated values, lifecycle
errors, notifications, Unicode, empty and large text, reordered replies,
malformed messages, EOF, size limits and timeout cleanup.

## Scope and provenance

Sessions last only for the lifetime of the agent process. There is no model,
authentication, MCP server connection, background work or durable history.
Prompt handling is synchronous, so cancellation notifications cannot interrupt
an echo already being processed. Baseline text and resource links are supported;
image/audio and other optional session extensions are not advertised.

The channel retains bytes across reads and limits a message to 1 MiB. It
distinguishes clean EOF from a truncated line. The helpers are demo code,
not a complete protocol validator or reusable ACP runtime API.

The shared stdio implementation and Bash launcher were copied from this
workspace's Ada MCP demos; they introduce no runtime dependency on MCP.
All demo files use Apache-2.0 WITH LLVM-exception, as marked in their sources.
