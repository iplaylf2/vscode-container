#!/usr/bin/env bash
set -euo pipefail

curl -fsSL https://fnm.vercel.app/install | bash

NODE_VERSION="${NODE_VERSION:-lts}"
if [ "$NODE_VERSION" != "none" ]; then
  fnm install "$NODE_VERSION"
fi
