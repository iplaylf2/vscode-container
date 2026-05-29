#!/usr/bin/env bash
set -euo pipefail

python_version="${1:?python version required (latest | <version> | none)}"

curl -LsSf https://astral.sh/uv/install.sh | sh
. "$HOME/.local/bin/env"

case "$python_version" in
    none) ;;
    latest) uv python install ;;
    *)    uv python install "$python_version" ;;
esac
