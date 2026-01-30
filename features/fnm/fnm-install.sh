#!/usr/bin/env bash
set -euo pipefail

node_version="${1:?node version required (lts | <version> | none)}"

curl -fsSL https://fnm.vercel.app/install | bash

fnm_dir="$HOME/.local/share/fnm"
export PATH="$fnm_dir:$PATH"

case "$node_version" in
    none) ;;
    lts)  fnm install --lts ;;
    *)    fnm install "$node_version" ;;
esac
