#!/usr/bin/env bash
set -euo pipefail

FEATURE_DIR="$(cd "$(dirname "$0")" && pwd)"
FNM_SCRIPT="$FEATURE_DIR/fnm-install.sh"

NODE_VERSION="${NODE_VERSION:-lts}"

if [[ "$(id -un)" != "$_REMOTE_USER" ]]; then
    su - "$_REMOTE_USER" -c "/bin/bash $(printf '%q ' "$FNM_SCRIPT" "$NODE_VERSION")"
else
    /bin/bash "$FNM_SCRIPT" "$NODE_VERSION"
fi
