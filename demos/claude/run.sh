#!/usr/bin/env bash
# SPDX-FileCopyrightText: 2026 Max Reznik <reznikmm@gmail.com>
#
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

set -euo pipefail
if [[ ${1-} == -h || ${1-} == --help ]]; then
    cat <<'EOF'
Usage: run.sh [--timeout SECONDS] [--] [TEXT]

Run the Ada ACP v2 client against Claude Code. Timeout defaults to 120 seconds.
Install the adapter with ./install.sh; see README.md for authentication.
CLAUDE_ACP selects the adapter executable. ACP_CLAUDE_CWD selects the workspace.
CLAUDE_CODE_EXECUTABLE selects the Claude CLI. OAuth tokens are inherited.
EOF
    exit 0
fi
directory=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
export ACP_CLAUDE_CWD=${ACP_CLAUDE_CWD:-$PWD}
if (( $# == 0 )); then
    set -- 'Відповідай одним коротким реченням українською: привітайся з Ada.'
fi
exec "$directory/../client/run.sh" \
    --server "$directory/adapter.sh" \
    --client "$directory/bin/acp_claude_demo" --timeout 120 "$@"
