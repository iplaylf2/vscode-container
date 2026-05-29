#!/usr/bin/env bash
set -euo pipefail

node_version="${1:?node version required (lts | latest | <version> | none)}"

curl -fsSL https://get.pnpm.io/install.sh | bash

export PNPM_HOME="${PNPM_HOME:-$HOME/.local/share/pnpm}"
export PATH="$PNPM_HOME/bin:$PATH"

case "$node_version" in
    none) ;;
    *)    pnpm runtime set node "$node_version" -g ;;
esac
