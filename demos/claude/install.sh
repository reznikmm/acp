#!/usr/bin/env bash
# SPDX-FileCopyrightText: 2026 Max Reznik <reznikmm@gmail.com>
#
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

set -euo pipefail
directory=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
version=0.106.0
case "$(uname -s)-$(uname -m)" in
    Linux-x86_64)
        platform=linux-x64
        digest=7d27db341f2a09bd64e54465de8409c624c92827d19f2065f32c599377727c6e
        ;;
    Linux-aarch64)
        platform=linux-arm64
        digest=04390d95545916b21df886e92ff24538f7d71a86f657556704747f07de18422d
        ;;
    *)
        printf 'This installer supports Linux with glibc on x86_64/aarch64. See README.md for other platforms.\n' >&2
        exit 2
        ;;
esac
temporary=$(mktemp -d)
trap 'rm -rf -- "$temporary"' EXIT
archive="$temporary/adapter.tar.gz"
curl --fail --location --silent --show-error \
    "https://github.com/agentclientprotocol/claude-agent-acp/releases/download/v$version/claude-agent-acp-$platform.tar.gz" \
    --output "$archive"
printf '%s  %s\n' "$digest" "$archive" | sha256sum --check -
tar -xzf "$archive" -C "$temporary"
mkdir -p "$directory/.adapter"
install -m 755 "$temporary/claude-agent-acp" "$directory/.adapter/claude-agent-acp"
install -m 755 "$temporary/claude" "$directory/.adapter/claude"
printf 'Installed claude-agent-acp %s in %s/.adapter\n' "$version" "$directory"
