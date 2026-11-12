# ACP echo agent demo

`acp_server_demo` acts as an ACP v2 agent over stdin/stdout. It decodes method
parameters and encodes results with the generated ACP converters.

From the repository root:

```sh
alr -C demos/server build
./demos/server/bin/acp_server_demo < demos/server/requests.jsonl
alr -C demos/server test
```

The sample initializes the connection, creates a session, submits text and
closes the session. Prompt handling reports the user message, running state,
acceptance response, agent echo and idle state with stop reason `end_turn`.

## Supported methods

- `initialize`: validates the requested version first, negotiates version 2
  and advertises baseline session support.
- `session/new`: creates an active session with an absolute working directory.
- `session/list`: lists retained sessions in one page.
- `session/close`: deactivates a session without discarding it.
- `session/resume`: reactivates it with the same directory and reports its
  current foreground state before the response. No history is retained.
- `session/prompt`: accepts text/resource links, assigns a fresh user-message
  ID and echoes the content in an agent-message update.
- `session/cancel` and `$/cancel_request`: notifications receive no response.
  Synchronous work has already finished before the next input is read.

Unknown notifications are ignored. Malformed JSON, unsupported methods or
extensions, invalid parameters and unknown sessions receive JSON-RPC errors.
This demo does not enforce every schema constraint or all ACP recovery rules.

`source/demo-agent.ad[sb]` contains the connection/session state and dispatch.
`source/acp_server_demo.adb` provides the process loop. Shared framing and JSON
helpers are in `../common/`. `test.sh` exercises lifecycle and failure cases
with Bash/jq.

See [the client](../client/README.md) for a live peer and
[the overview](../README.md) for requirements and limitations.
