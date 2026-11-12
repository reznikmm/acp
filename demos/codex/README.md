# Codex over ACP from Ada

This demo connects an Ada ACP v2 client to
[`@agentclientprotocol/codex-acp`](https://github.com/agentclientprotocol/codex-acp).
The adapter launches the [Codex App Server](https://developers.openai.com/codex/app-server)
and translates its protocol to ACP:

```text
Ada client <-- ACP v2 / stdio --> codex-acp <-- app-server --> Codex
```

The client uses this repository's generated request, response, notification and
content-chunk converters. No MCP dependency or Python is required. Node.js is
needed by the external adapter, not by the Ada library.

## Install and run

Install Node.js with npm, then the adapter. Version **2.6.0** supports ACP v2;
the adapter package version is separate from the protocol version. Older
`@zed-industries/codex-acp` releases are superseded and may support only ACP v1.

```sh
npm install -g @agentclientprotocol/codex-acp@2.6.0
codex-acp --version
codex-acp cli login
```

The adapter includes a compatible Codex dependency. `codex-acp cli login` uses that
Codex installation. Alternatively, use an existing Codex CLI and its login:

```sh
export CODEX_PATH="$(command -v codex)"
codex login
```

Login happens separately from the noninteractive Ada client. The adapter also
documents API-key authentication in its [README](https://github.com/agentclientprotocol/codex-acp#authentication).
The demo does not request, store or print credentials.

From the ACP repository root:

```sh
alr -C demos/codex build
./demos/codex/run.sh "Скажи коротко українською, що таке Ada."
```

The launcher reuses the existing Bash FIFO launcher. It starts the installed
`codex-acp`, connects the Ada executable and sets a 120-second timeout. It
cleans up the processes and pipes on failure or interruption. Both diagnostics
and assembled Codex replies go to stderr; stdout is reserved for JSON-RPC.

Options and environment:

```sh
ACP_CODEX_CWD=/absolute/path/to/project \
  ./demos/codex/run.sh --timeout 180 -- "Поясни структуру цього проєкту."

CODEX_ACP=/absolute/path/to/codex-acp ./demos/codex/run.sh "Hello!"
```

`ACP_CODEX_CWD` defaults to the directory from which the launcher is called.
`CODEX_ACP` selects a single executable, not a shell command with arguments.
The adapter's own settings, such as `CODEX_PATH` and `CODEX_CONFIG`, are passed
through. The launcher defaults `INITIAL_AGENT_MODE` to `read-only`.

## Exchange and scope

1. Negotiate ACP v2 and check the agent's session capability.
2. Create a session in the selected working directory.
3. Submit one text prompt and retain its accepted `messageId`.
4. Receive updates until foreground work becomes idle. Assemble text chunks by
   message ID; apply full-message replacement, omission, null and empty content
   correctly. Completion may arrive before or after the prompt response.
5. Print the assembled messages and close the session.

The demo is noninteractive. Permission requests receive a `cancelled` outcome;
unsupported client requests receive a method-not-found error. It does not
advertise optional client capabilities. It ignores reasoning, tool progress,
nontext content and unknown notifications. An idle error reports a failed turn
even when `session/prompt` was accepted. Cancellation and refusal also return
a nonzero exit status. This is a single-prompt example, not an editor or a
complete agent UI.

## Tests

After building, run offline Bash/jq integration tests:

```sh
alr -C demos/codex test
```

These tests require neither a Codex installation nor login or model access.
They cover interleaved chunks, replacement/clearing semantics, permission
responses, completion ordering, errors and the launcher. A live smoke test is
the `run.sh` command above and uses your configured Codex account.

The live exchange was verified with `@agentclientprotocol/codex-acp` 2.6.0 and
Codex CLI 0.167.2 on Linux: the client received generated text and
`idle (end_turn)` and closed the session successfully.
