#!/usr/bin/env bash
# SPDX-FileCopyrightText: 2026 Max Reznik <reznikmm@gmail.com>
#
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

set -euo pipefail
directory=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
client="$directory/bin/acp_claude_demo"
temporary=$(mktemp -d)
trap 'rm -rf -- "$temporary"' EXIT

jq -cn '
  def response($id; $result): {jsonrpc:"2.0",id:$id,result:$result};
  def update($value): {jsonrpc:"2.0",method:"session/update",params:{sessionId:"s1",update:$value}};
  response(1; {protocolVersion:2,info:{name:"claude-fixture",version:"0.106.0"},capabilities:{session:{}}}),
  response("new"; {sessionId:"s1"}),
  update({sessionUpdate:"state_update",state:"running"}),
  update({sessionUpdate:"user_message",messageId:"u1",content:[{type:"text",text:"hello"}]}),
  update({sessionUpdate:"notice",message:"optional notice"}),
  update({sessionUpdate:"agent_message_chunk",messageId:"m1",content:{type:"text",text:"Привіт "}}),
  {jsonrpc:"2.0",id:50,method:"session/request_permission",params:{sessionId:"s1",title:"Edit file",options:[{optionId:"yes",name:"Allow",kind:"allow_once"}]}},
  response("prompt"; {messageId:"u1"}),
  update({sessionUpdate:"agent_message_chunk",messageId:"m1",content:{type:"text",text:"від Claude!"}}),
  update({sessionUpdate:"state_update",state:"idle",stopReason:"end_turn"}),
  response("close"; {})
' > "$temporary/replies"

ACP_CLAUDE_CWD="$temporary" "$client" 'hello' < "$temporary/replies" \
    > "$temporary/requests" 2> "$temporary/report"
grep -Fxq 'Привіт від Claude!' "$temporary/report"
grep -Fq 'State: idle (end_turn)' "$temporary/report"
jq -se --arg cwd "$temporary" '
  map(.method // "reply") == ["initialize","session/new","session/prompt","reply","session/close"] and
  .[0].params.info.name == "ada-acp-claude-demo" and .[0].params.protocolVersion == 2 and
  .[1].params.cwd == $cwd and .[2].params.prompt == [{type:"text",text:"hello"}] and
  .[3].id == 50 and .[3].result == {outcome:{outcome:"cancelled"}}
' "$temporary/requests" > /dev/null

# The launcher's adapter inherits credentials and the selected Claude executable.
# Use a dummy token so neither the real credential nor model access is needed.
cat > "$temporary/adapter" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
[[ $CLAUDE_AGENT_ACP_PROTOCOL == v2 ]]
[[ $CLAUDE_CODE_OAUTH_TOKEN == offline-test-token ]]
[[ $CLAUDE_CODE_EXECUTABLE == "$CLAUDE_TEST_EXECUTABLE" ]]
cat "$CLAUDE_TEST_REPLIES"
cat > "$CLAUDE_TEST_REQUESTS"
EOF
chmod +x "$temporary/adapter"
CLAUDE_ACP="$temporary/adapter" CLAUDE_TEST_REPLIES="$temporary/replies" \
    CLAUDE_TEST_REQUESTS="$temporary/requests" CLAUDE_CODE_OAUTH_TOKEN=offline-test-token \
    CLAUDE_CODE_EXECUTABLE="$temporary/claude" CLAUDE_TEST_EXECUTABLE="$temporary/claude" \
    ACP_CLAUDE_CWD="$temporary" \
    "$directory/run.sh" --timeout 5 -- 'hello' \
    > "$temporary/output" 2> "$temporary/report"
[[ ! -s "$temporary/output" ]]
grep -Fxq 'Привіт від Claude!' "$temporary/report"
! grep -Fq 'offline-test-token' "$temporary/report"
jq -se --arg cwd "$temporary" '.[1].params.cwd == $cwd' "$temporary/requests" > /dev/null

# Wrong-session updates and a failed turn must fail the Claude entry point too.
for kind in session error; do
    case $kind in
        session) jq -c 'if .method? == "session/update" then .params.sessionId = "other" else . end' "$temporary/replies" ;;
        error) jq -c 'if .params.update.state? == "idle" then .params.update.stopReason = "error" | .params.update.error = {code:-32000,message:"test failure"} else . end' "$temporary/replies" ;;
    esac > "$temporary/input"
    status=0
    "$client" < "$temporary/input" > "$temporary/requests" 2> "$temporary/report" || status=$?
    [[ $status != 0 ]]
done
grep -Fq 'Claude Code turn failed: test failure' "$temporary/report"

printf 'Claude demo tests: PASS (streaming, notifications, permissions, environment, launcher, errors)\n'
