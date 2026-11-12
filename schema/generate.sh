#!/usr/bin/env bash
# SPDX-FileCopyrightText: 2026 Max Reznik <reznikmm@gmail.com>
#
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

set -euo pipefail

repository=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)
if (( $# != 1 )); then
    printf 'Usage: %s /path/to/gen_json\n' "$0" >&2
    exit 2
fi
generator=$(realpath -- "$1")
[[ -x "$generator" ]] || { printf 'Generator not executable: %s\n' "$generator" >&2; exit 1; }
temporary=$(mktemp -d)
trap 'rm -rf -- "$temporary"' EXIT

cd "$repository"
jq -f schema/prepare.jq schema/schema.json > "$temporary/prepared.json"
"$generator" \
    --root-package ACP.Types \
    --enum-package Enum \
    --hash-package ACP.Key_Lookups \
    --additional-properties \
    --header-file schema/header.adt \
    "$temporary/prepared.json" > "$temporary/generated.ada"

alr exec -- gnatchop -w -gnat2022 "$temporary/generated.ada" source
alr exec -- gnatformat --charset=utf-8 --no-subprojects -P acp.gpr
