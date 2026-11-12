# Claude Code over ACP from Ada

This demo connects an Ada client to
[`claude-agent-acp`](https://github.com/agentclientprotocol/claude-agent-acp),
which runs Claude Code through the Claude Agent SDK. Adapter version **0.106.0**
supports the ACP v2 draft used by this repository.

```text
Ada client <-- ACP v2 / stdio --> claude-agent-acp <-- Agent SDK --> Claude Code
```

## Install and run

From the ACP repository root on Linux with glibc (x86_64 or aarch64):

```sh
./demos/claude/install.sh
alr -C demos/claude build
./demos/claude/run.sh "Скажи коротко українською, що таке Ada."
```

The Bash installer downloads the pinned upstream release, verifies its SHA-256
and places the adapter and its bundled Claude CLI in `demos/claude/.adapter/`,
which Git ignores. Neither Node.js nor Python is needed for this installation.
It requires curl, sha256sum, tar and install. To update the pinned version,
update the release number and checksums in `install.sh` together.

If `claude` is already on PATH, the launcher uses that installation. Otherwise
the standalone adapter uses its bundled CLI. Set `CLAUDE_CODE_EXECUTABLE` to
select another Claude executable.

Exported `CLAUDE_CODE_OAUTH_TOKEN` is inherited by the adapter and Claude Code;
no separate ACP login is required. Alternatively, log in with the selected
Claude CLI before starting the demo. The scripts pass the token through the
environment without displaying or saving its value.

On other platforms, download the appropriate
[standalone release](https://github.com/agentclientprotocol/claude-agent-acp/releases/tag/v0.106.0)
and keep `claude-agent-acp` and `claude` together. Alternatively, with Node.js 22
or newer and npm:

```sh
npm install -g @agentclientprotocol/claude-agent-acp@0.106.0
CLAUDE_ACP="$(command -v claude-agent-acp)" ./demos/claude/run.sh "Hello!"
```

`CLAUDE_ACP` selects a single executable, not a shell command with arguments.
Without it, the wrapper prefers `.adapter/claude-agent-acp`, then searches PATH.
It forces `CLAUDE_AGENT_ACP_PROTOCOL=v2`.

The working directory defaults to the directory from which `run.sh` is called.
Override it and the default 120-second timeout with:

```sh
ACP_CLAUDE_CWD=/absolute/path/to/project \
  ./demos/claude/run.sh --timeout 180 -- "Поясни структуру цього проєкту."
```

## Behavior and scope

The Ada client initializes ACP v2, creates a session, sends one text prompt,
assembles streamed text by message ID, waits for foreground `idle`, then closes
the session. It accepts notifications before and after the prompt response and
applies whole-message replacement, omission, null and empty content correctly.
Generated ACP converters handle the parameters, replies, notifications and
content chunks. `Demo.Prompt_Client` in `../common/` is shared with the Codex demo.

The Bash launcher connects the processes using FIFOs and cleans up on timeout
or failure. JSON-RPC uses stdout; assembled replies and diagnostics use stderr.
The demo is noninteractive: permission requests receive `cancelled`, and
unsupported client requests receive method-not-found errors. Claude Code's own
settings still determine which operations need permission. The demo does not
enable permission bypass or advertise optional client capabilities.

Reasoning, tool progress, nontext content and unknown notifications are ignored.
An idle error, cancellation or refusal yields a failed exit status. This is a
single-session text example, not a complete editor or agent UI.

## Tests

After building:

```sh
alr -C demos/claude test
```

The offline Bash/jq tests need no Claude installation, adapter or credentials.
They cover streamed replies, notifications, permission responses, errors and
the launcher's environment forwarding with a dummy token. Shared content
replacement and completion-ordering tests remain in `../codex/test.sh`.
Use `run.sh` for a live smoke test with your configured Claude account.

The live exchange was verified on Linux with adapter 0.106.0, the installed
Claude Code 2.1.322 and an exported OAuth token: the Ada client received
`Привіт від Claude через ACP!`, observed `idle (end_turn)` and closed the session.
