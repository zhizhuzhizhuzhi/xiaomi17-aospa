#!/usr/bin/env bash
# SPDX-License-Identifier: Apache-2.0
set -eo pipefail
kit=$(cd "$(dirname "$0")/.." && pwd)
tree=$(realpath "${1:?Usage: build.sh ANDROID_TREE [userdebug|user] [jobs]}")
variant=${2:-userdebug}; jobs=${3:-8}
case "$variant" in user|userdebug) ;; *) echo 'Unsupported build variant' >&2; exit 1 ;; esac
[[ "$jobs" =~ ^[1-9][0-9]*$ ]] || { echo 'jobs must be a positive integer' >&2; exit 1; }
cd "$tree"
exec 9>.pudding-build.lock
flock -n 9 || { echo 'Another Pudding build holds this tree' >&2; exit 1; }
python3 "$kit/scripts/apply.py" "$PWD" --verify-applied
python3 "$kit/scripts/fetch-dependencies.py" "$PWD" --verify
export OUT_DIR=${OUT_DIR:-out-pudding-$variant}
case "$OUT_DIR" in /*|..|../*|*/../*|*/..|.) echo 'OUT_DIR must remain relative to the checkout' >&2; exit 1 ;; esac
export TARGET_PRODUCT=aospa_pudding TARGET_RELEASE=cp2a TARGET_BUILD_VARIANT="$variant"
export AOSPA_BUILD=pudding BUILD_USERNAME=nobody BUILD_HOSTNAME=android-build
source build/envsetup.sh
set_stuff_for_environment
m -j"$jobs" target-files-package otatools
