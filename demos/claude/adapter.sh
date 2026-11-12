#!/usr/bin/env bash
# SPDX-FileCopyrightText: 2026 Max Reznik <reznikmm@gmail.com>
#
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

set -euo pipefail
directory=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
adapter=${CLAUDE_ACP:-}
if [[ -z "$adapter" ]]; then
    if [[ -x "$directory/.adapter/claude-agent-acp" ]]; then
        adapter="$directory/.adapter/claude-agent-acp"
    else
        adapter=claude-agent-acp
    fi
fi
command -v "$adapter" > /dev/null || {
    printf 'ACP adapter not found: %s. Run demos/claude/install.sh (see README.md).\n' "$adapter" >&2
    exit 2
}
if [[ -z ${CLAUDE_CODE_EXECUTABLE:-} ]] && command -v claude > /dev/null; then
    export CLAUDE_CODE_EXECUTABLE
    CLAUDE_CODE_EXECUTABLE=$(command -v claude)
fi
export CLAUDE_AGENT_ACP_PROTOCOL=v2
exec "$adapter"
