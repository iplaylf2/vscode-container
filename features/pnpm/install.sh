#!/usr/bin/env bash
set -euo pipefail

FEATURE_DIR="$(cd "$(dirname "$0")" && pwd)"
PNPM_SCRIPT="$FEATURE_DIR/pnpm-install.sh"

NODE_VERSION="${NODE_VERSION:-lts}"

if [[ "$(id -un)" != "$_REMOTE_USER" ]]; then
    su - "$_REMOTE_USER" -c "/bin/bash $(printf '%q ' "$PNPM_SCRIPT" "$NODE_VERSION")"
else
    /bin/bash "$PNPM_SCRIPT" "$NODE_VERSION"
fi
