#!/usr/bin/env bash
if [ -z "${BASH_VERSION:-}" ] || [ "$(id -un)" != "$_REMOTE_USER" ]; then
  exec su - "$_REMOTE_USER" -c "bash -lc '$0'"
fi

set -euo pipefail

curl -fsSL https://astral.sh/uv/install.sh | sh
. "$HOME/.local/bin/env"

PYTHON_VERSION="${PYTHON_VERSION:-3}"
if [ "$PYTHON_VERSION" != "none" ]; then
  uv python install --default "$PYTHON_VERSION"
fi
