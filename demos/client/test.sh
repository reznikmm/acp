#!/usr/bin/env bash
# SPDX-FileCopyrightText: 2026 Max Reznik <reznikmm@gmail.com>
#
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

set -euo pipefail
directory=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
client="$directory/bin/acp_client_demo"
temporary=$(mktemp -d)
trap 'rm -rf -- "$temporary"' EXIT

for text in 'Привіт 👋 з Ada!' '' $'escaped\n"text"\\'; do
    "$directory/run.sh" -- "$text" > "$temporary/output" 2> "$temporary/report"
    [[ ! -s "$temporary/output" ]]
    grep -Fq 'Protocol: ACP v2' "$temporary/report"
    grep -Fq 'State: idle (end_turn)' "$temporary/report"
done

# Capture real replies, then reorder completion ahead of the prompt response.
# This exercises buffered notifications and the v2 acceptance/completion split.
"$directory/../server/bin/acp_server_demo" \
    < "$directory/../server/requests.jsonl" > "$temporary/replies"
jq -sc '.[0], .[1], .[2], .[3], .[5], .[6], .[4], .[7]' \
    "$temporary/replies" > "$temporary/reordered"
"$client" 'Привіт з Ada!' < "$temporary/reordered" \
    > "$temporary/requests" 2> "$temporary/report"
jq -se '
  map(.method) == ["initialize","session/new","session/prompt","session/close"] and
  .[0].params.protocolVersion == 2 and .[0].params.info.name == "ada-acp-client" and
  .[2].params.prompt == [{type:"text",text:"Привіт з Ada!"}]
' "$temporary/requests" > /dev/null

# Reject a wrong response ID, a remote error, malformed JSON and premature EOF.
for kind in id error malformed eof; do
    case $kind in
        id) printf '%s\n' '{"jsonrpc":"2.0","id":99,"result":{}}' > "$temporary/input" ;;
        error) printf '%s\n' '{"jsonrpc":"2.0","id":1,"error":{"code":-32603,"message":"test error"}}' > "$temporary/input" ;;
        malformed) printf '%s\n' 'not-json' > "$temporary/input" ;;
        eof) : > "$temporary/input" ;;
    esac
    status=0
    "$client" < "$temporary/input" > "$temporary/output" 2> "$temporary/report" || status=$?
    [[ $status != 0 && -s "$temporary/report" ]]
done

# A larger prompt crosses multiple transport buffers in both directions.
text=$(printf 'Ada %.0s' {1..3000})
"$directory/run.sh" -- "$text" > "$temporary/output" 2> "$temporary/report"
[[ ! -s "$temporary/output" ]]
grep -Fq 'State: idle (end_turn)' "$temporary/report"

cat > "$temporary/stalled-agent" <<'EOF'
#!/usr/bin/env bash
printf '%s\n' "$$" > "$0.pid"
exec sleep 60
EOF
chmod +x "$temporary/stalled-agent"
mkdir "$temporary/runtime"
status=0
TMPDIR="$temporary/runtime" "$directory/run.sh" \
    --server "$temporary/stalled-agent" --timeout 0.2 \
    > "$temporary/output" 2> "$temporary/report" || status=$?
[[ $status == 124 ]]
read -r peer_pid < "$temporary/stalled-agent.pid"
! kill -0 "$peer_pid" 2>/dev/null
[[ -z $(find "$temporary/runtime" -mindepth 1 -print -quit) ]]

printf 'Client tests: PASS (exchange, Unicode, text, reordered updates, errors, timeout cleanup)\n'
