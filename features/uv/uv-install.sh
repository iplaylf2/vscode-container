#!/usr/bin/env bash
set -euo pipefail

python_version="${1:?python version required (e.g. 3 | 3.12 | none)}"

curl -LsSf https://astral.sh/uv/install.sh | sh
. "$HOME/.local/bin/env"

case "$python_version" in
    none) ;;
    *) uv python install "$python_version" --default ;;
esac
