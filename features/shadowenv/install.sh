#!/usr/bin/env bash
set -euo pipefail

arch="$(uname -m)"
case "$arch" in
    x86_64|amd64) target="x86_64-unknown-linux-gnu" ;;
    aarch64|arm64) target="aarch64-unknown-linux-gnu" ;;
    *) echo "shadowenv: unsupported arch: $arch" >&2; exit 1 ;;
esac

version="3.4.0"
url="https://github.com/Shopify/shadowenv/releases/download/${version}/shadowenv-${target}"

download_path="$(mktemp)"
trap 'rm -f "$download_path"' EXIT
curl -fsSL "$url" -o "$download_path"

install_path="/usr/local/bin/shadowenv"
install -m 0755 "$download_path" "$install_path"

FEATURE_DIR="$(cd "$(dirname "$0")" && pwd)"
REGISTER_SCRIPT="$FEATURE_DIR/shadowenv-register.sh"

if [[ "$(id -un)" != "$_REMOTE_USER" ]]; then
    su - "$_REMOTE_USER" -c "/bin/bash $(printf '%q' "$REGISTER_SCRIPT")"
else
    /bin/bash "$REGISTER_SCRIPT"
fi
