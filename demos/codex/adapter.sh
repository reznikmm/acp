#!/usr/bin/env bash
# SPDX-FileCopyrightText: 2026 Max Reznik <reznikmm@gmail.com>
#
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

set -euo pipefail
adapter=${CODEX_ACP:-codex-acp}
command -v "$adapter" > /dev/null || {
    printf 'ACP adapter not found: %s. Install @agentclientprotocol/codex-acp (see README.md).\n' "$adapter" >&2
    exit 2
}
export INITIAL_AGENT_MODE=${INITIAL_AGENT_MODE:-read-only}
exec "$adapter"
