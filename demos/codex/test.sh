#!/usr/bin/env bash
# SPDX-FileCopyrightText: 2026 Max Reznik <reznikmm@gmail.com>
#
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

set -euo pipefail
directory=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
client="$directory/bin/acp_codex_demo"
temporary=$(mktemp -d)
trap 'rm -rf -- "$temporary"' EXIT

# Real adapter shapes: streamed content, permission requests, state transitions.
jq -cn '
  def response($id; $result): {jsonrpc:"2.0",id:$id,result:$result};
  def update($value): {jsonrpc:"2.0",method:"session/update",params:{sessionId:"s1",update:$value}};
  response(1; {protocolVersion:2,info:{name:"codex-fixture",version:"2.6.0"},capabilities:{session:{}}}),
  {jsonrpc:"2.0",method:"_auth/status_update",params:{}},
  response("new"; {sessionId:"s1"}),
  update({sessionUpdate:"state_update",state:"running"}),
  update({sessionUpdate:"user_message_chunk",messageId:"u1",content:{type:"text",text:"hello"}}),
  {jsonrpc:"2.0",id:"permission",method:"session/request_permission",params:{sessionId:"s1",title:"Run a command",options:[{optionId:"yes",name:"Allow",kind:"allow_once"}]}},
  update({sessionUpdate:"state_update",state:"requires_action"}),
  update({sessionUpdate:"state_update",state:"running"}),
  update({sessionUpdate:"agent_message_chunk",messageId:"m1",content:{type:"text",text:"stale"}}),
  update({sessionUpdate:"agent_message_chunk",messageId:"m2",content:{type:"text",text:"other"}}),
  update({sessionUpdate:"agent_message",messageId:"m1",content:[{type:"text",text:"Привіт"}]}),
  update({sessionUpdate:"agent_message",messageId:"m1"}),
  update({sessionUpdate:"agent_message_chunk",messageId:"m1",content:{type:"text",text:" 👋!"}}),
  update({sessionUpdate:"agent_message",messageId:"m2",content:null}),
  update({sessionUpdate:"agent_message_chunk",messageId:"m2",content:{type:"text",text:"discard"}}),
  update({sessionUpdate:"agent_message",messageId:"m2",content:[]}),
  update({sessionUpdate:"_future_update",anything:true}),
  response("prompt"; {messageId:"u1"}),
  update({sessionUpdate:"state_update",state:"idle",stopReason:"end_turn"}),
  response("close"; {})
' > "$temporary/replies"

ACP_CODEX_CWD="$temporary" "$client" 'hello' < "$temporary/replies" \
    > "$temporary/requests" 2> "$temporary/report"
grep -Fxq 'Привіт 👋!' "$temporary/report"
grep -Fq 'State: idle (end_turn)' "$temporary/report"
! grep -Eq 'stale|other|discard' "$temporary/report"
jq -se --arg cwd "$temporary" '
  map(.method // "reply") == ["initialize","session/new","session/prompt","reply","session/close"] and
  .[0].params.protocolVersion == 2 and .[0].params.info.name == "ada-acp-codex-demo" and
  .[1].params.cwd == $cwd and
  .[2].params.prompt == [{type:"text",text:"hello"}] and
  .[3].id == "permission" and .[3].result == {outcome:{outcome:"cancelled"}}
' "$temporary/requests" > /dev/null

# Completion is independent of the prompt response, including when it is earlier.
jq -sc '.[:17][], .[18], .[17], .[19]' "$temporary/replies" > "$temporary/reordered"
"$client" < "$temporary/reordered" > "$temporary/requests" 2> "$temporary/report"
grep -Fxq 'Привіт 👋!' "$temporary/report"

# EOF after acceptance cannot be mistaken for completion.
head -n 18 "$temporary/replies" > "$temporary/input"
status=0
"$client" < "$temporary/input" > "$temporary/requests" 2> "$temporary/report" || status=$?
[[ $status != 0 ]]

# A structured idle error is a failed turn even after successful acceptance.
jq -c 'if .params.update.state? == "idle" then
  .params.update.stopReason = "error" | .params.update.error = {code:-32000,message:"test failure"}
  else . end' "$temporary/replies" > "$temporary/input"
status=0
"$client" < "$temporary/input" > "$temporary/requests" 2> "$temporary/report" || status=$?
[[ $status != 0 ]]
grep -Fq 'Codex turn failed: test failure' "$temporary/report"

for kind in version session id malformed; do
    case $kind in
        version) jq -c 'if .id? == 1 then .result.protocolVersion = 1 else . end' "$temporary/replies" ;;
        session) jq -c 'if .method? == "session/update" then .params.sessionId = "other" else . end' "$temporary/replies" ;;
        id) printf '%s\n' '{"jsonrpc":"2.0","id":99,"result":{}}' ;;
        malformed) printf '%s\n' 'not-json' ;;
    esac > "$temporary/input"
    status=0
    "$client" < "$temporary/input" > "$temporary/requests" 2> "$temporary/report" || status=$?
    [[ $status != 0 ]]
done

# Exercise the same wrapper and FIFO launcher used for Codex, without a model.
cat > "$temporary/adapter" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
[[ $INITIAL_AGENT_MODE == read-only ]]
cat "$CODEX_TEST_REPLIES"
cat > "$CODEX_TEST_REQUESTS"
EOF
chmod +x "$temporary/adapter"
CODEX_ACP="$temporary/adapter" CODEX_TEST_REPLIES="$temporary/replies" \
    CODEX_TEST_REQUESTS="$temporary/requests" INITIAL_AGENT_MODE=read-only \
    "$directory/run.sh" --timeout 5 -- 'hello' \
    > "$temporary/output" 2> "$temporary/report"
[[ ! -s "$temporary/output" ]]
grep -Fxq 'Привіт 👋!' "$temporary/report"

printf 'Codex demo tests: PASS (streaming, patches, permissions, completion, errors, launcher)\n'
