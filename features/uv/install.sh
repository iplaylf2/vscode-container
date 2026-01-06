#!/usr/bin/env bash
set -euo pipefail

curl -LsSf https://astral.sh/uv/install.sh | sh

PYTHON_VERSION="${PYTHON_VERSION:-3}"
if [ "$PYTHON_VERSION" != "none" ]; then
  uv python install --default "$PYTHON_VERSION"
fi
