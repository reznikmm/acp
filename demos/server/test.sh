#!/usr/bin/env bash
# SPDX-FileCopyrightText: 2026 Max Reznik <reznikmm@gmail.com>
#
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

set -euo pipefail
directory=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
server="$directory/bin/acp_server_demo"
temporary=$(mktemp -d)
trap 'rm -rf -- "$temporary"' EXIT

"$server" < "$directory/requests.jsonl" > "$temporary/example" 2> "$temporary/errors"
[[ ! -s "$temporary/errors" ]]
jq -se '
  length == 8 and
  .[0].result.protocolVersion == 2 and .[0].result.capabilities.session == {} and
  .[1].result.sessionId == "session-1" and
  [.[2:7][] | .params.update.sessionUpdate // "response"] ==
    ["user_message","state_update","response","agent_message","state_update"] and
  .[2].params.update.messageId == .[4].result.messageId and
  .[5].params.update.content == [{type:"text",text:"Привіт з Ada!"}] and
  .[6].params.update.state == "idle" and .[6].params.update.stopReason == "end_turn" and
  .[7].id == "close" and .[7].result == {}
' "$temporary/example" > /dev/null

# Recover from malformed input, reject bad versions, negotiate a higher version.
{
    printf '%s\n' '{"broken":' '[]'
    jq -cn '[
      {jsonrpc:"2.0",id:1,method:"initialize",params:{protocolVersion:"2"}},
      {jsonrpc:"2.0",id:2,method:"initialize",params:{protocolVersion:1}},
      {jsonrpc:"2.0",id:3,method:"initialize",params:{protocolVersion:3,info:{name:"test",version:"1"}}},
      {jsonrpc:"2.0",id:4,method:"unknown",params:{}},
      {jsonrpc:"2.0",id:5,method:"session/new",params:{cwd:"relative"}},
      {jsonrpc:"2.0",id:6,method:"session/prompt",params:{sessionId:"missing",prompt:[]}},
      {jsonrpc:"2.0",method:"session/cancel",params:{sessionId:"missing"}}
    ][]'
} | "$server" > "$temporary/recovery" 2> "$temporary/errors"
[[ ! -s "$temporary/errors" ]]
jq -se '
  length == 8 and
  [.[0:4][].error.code] == [-32700,-32600,-32602,-32022] and
  .[0].id == null and .[3].error.data == {requested:1,supported:[2]} and
  .[4].result.protocolVersion == 2 and
  [.[5:8][].error.code] == [-32601,-32602,-32002] and
  .[7].error.data.sessionId == "missing"
' "$temporary/recovery" > /dev/null

# Baseline session methods and resource links; each prompt has a fresh message ID.
{
    head -n 2 "$directory/requests.jsonl"
    jq -cn '[
      {jsonrpc:"2.0",id:"list",method:"session/list",params:{}},
      {jsonrpc:"2.0",id:"close",method:"session/close",params:{sessionId:"session-1"}},
      {jsonrpc:"2.0",id:"closed",method:"session/prompt",params:{sessionId:"session-1",prompt:[{type:"text",text:"no"}]}},
      {jsonrpc:"2.0",id:"resume",method:"session/resume",params:{sessionId:"session-1",cwd:"/"}},
      {jsonrpc:"2.0",id:"bad",method:"session/prompt",params:{sessionId:"session-1",prompt:[]}},
      {jsonrpc:"2.0",id:"image",method:"session/prompt",params:{sessionId:"session-1",prompt:[{type:"image",data:"aGk=",mimeType:"image/png"}]}},
      {jsonrpc:"2.0",id:"options",method:"session/new",params:{cwd:"/",mcpServers:false}},
      {jsonrpc:"2.0",id:"link",method:"session/prompt",params:{sessionId:"session-1",prompt:[{type:"resource_link",uri:"file:///demo",name:"demo"}]}},
      {jsonrpc:"2.0",id:"text",method:"session/prompt",params:{sessionId:"session-1",prompt:[{type:"text",text:""}]}}
    ][]'
} | "$server" > "$temporary/sessions"
jq -se '
  (map(select(.id == "list"))[0].result.sessions[0] | .sessionId == "session-1" and .cwd == "/") and
  map(select(.id == "closed"))[0].error.code == -32002 and
  map(select(.id == "resume"))[0].result == {} and
  map(select(.id == "bad"))[0].error.code == -32602 and
  map(select(.id == "image"))[0].error.code == -32602 and
  map(select(.id == "options"))[0].error.code == -32602 and
  (map(select(.id == "link"))[0].result.messageId != map(select(.id == "text"))[0].result.messageId) and
  (map(select(.params.update.sessionUpdate? == "agent_message")) | length == 2) and
  map(select(.params.update.sessionUpdate? == "agent_message"))[0].params.update.content[0].type == "resource_link"
' "$temporary/sessions" > /dev/null

# Truncated input and messages exceeding the demo's framing limit fail on stderr.
status=0
printf '%s' '{"unfinished":' | "$server" > "$temporary/output" 2> "$temporary/errors" || status=$?
[[ $status != 0 && ! -s "$temporary/output" && -s "$temporary/errors" ]]

status=0
head -c 1048577 /dev/zero | tr '\0' ' ' | "$server" \
    > "$temporary/output" 2> "$temporary/errors" || status=$?
[[ $status != 0 && ! -s "$temporary/output" ]]
grep -Fq 'message exceeds 1 MiB' "$temporary/errors"

printf 'Server tests: PASS (handshake, sessions, notifications, errors, EOF)\n'
