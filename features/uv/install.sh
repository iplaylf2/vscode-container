#!/usr/bin/env bash
set -euo pipefail

FEATURE_DIR="$(cd "$(dirname "$0")" && pwd)"
UV_SCRIPT="$FEATURE_DIR/uv-install.sh"

PYTHON_VERSION="${PYTHON_VERSION:-latest}"

if [[ "$(id -un)" != "$_REMOTE_USER" ]]; then
    su - "$_REMOTE_USER" -c "/bin/bash $(printf '%q ' "$UV_SCRIPT" "$PYTHON_VERSION")"
else
    /bin/bash "$UV_SCRIPT" "$PYTHON_VERSION"
fi
