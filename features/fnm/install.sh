#!/usr/bin/env bash
if [ -z "${BASH_VERSION:-}" ] || [ "$(id -un)" != "$_REMOTE_USER" ]; then
  exec su "$_REMOTE_USER" -c "bash -lc '$0'"
fi

set -euo pipefail

curl -fsSL https://fnm.vercel.app/install | bash

FNM_PATH="$HOME/.local/share/fnm"
export PATH="$FNM_PATH:$PATH"

NODE_VERSION="${NODE_VERSION:-lts}"
if [ "$NODE_VERSION" != "none" ]; then
  if [ "$NODE_VERSION" = "lts" ]; then
    fnm install --lts
  else
    fnm install "$NODE_VERSION"
  fi
fi
