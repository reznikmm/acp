# ACP client demo

The Ada client constructs generated request parameter records and reads generated
responses and notifications. From the repository root:

```sh
alr -C demos/server build
alr -C demos/client build
./demos/client/run.sh "Привіт з Ada!"
```

The Bash launcher only starts programs and connects pipes. Override the agent
and timeout with:

```sh
./demos/client/run.sh --server /path/to/agent --timeout 10 -- "Hello!"
```

The selected agent must implement the same echo contract. An empty text argument
is valid. Human-readable output goes to stderr; stdout contains only JSON-RPC.
Exiting the client closes the request pipe and signals EOF to the agent.

## Exchange

1. Initialize with version 2 and implementation metadata, then check version,
   agent metadata and the session capability.
2. Create a session with `cwd: "/"` and retain the returned `sessionId`.
3. Send one text block through `session/prompt`. Match the accepted `messageId`
   to the user-message update.
4. Handle interleaved `session/update` notifications and validate the echo.
   Wait for a running-to-idle transition with stop reason `end_turn`, allowing
   completion to precede or follow the prompt response.
5. Close the session.

This is an echo client, not a general ACP UI. It expects one complete text block
per user/agent message and does not assemble streamed chunks or process
permission requests and background work. Future update kinds are ignored.
Bad messages, mismatched IDs, wrong-session updates and remote errors fail with
a diagnostic and nonzero exit status.

## Tests

After building both demos:

```sh
alr -C demos/client test
```

The Bash/jq tests use real peers and controlled replies. They exercise generated
requests, buffered/reordered notifications, Unicode, empty/large text, errors,
premature EOF and timeout cleanup. Python is not required.

See [the server](../server/README.md) and [the overview](../README.md).
