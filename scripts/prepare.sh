#!/usr/bin/env bash
# SPDX-License-Identifier: Apache-2.0
set -eo pipefail
kit=$(cd "$(dirname "$0")/.." && pwd)
tree=$(realpath "${1:?Usage: prepare.sh ANDROID_TREE PREPARED_INPUT_ROOT}")
inputs=$(realpath "${2:?Prepared inputs matching dependencies.json are required}")
python3 "$kit/scripts/apply.py" "$tree" --check
python3 "$kit/scripts/fetch-dependencies.py" "$tree" --source "$inputs" --replace-stock-inputs
python3 "$kit/scripts/apply.py" "$tree"
