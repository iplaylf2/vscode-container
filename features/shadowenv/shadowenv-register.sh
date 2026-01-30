#!/usr/bin/env bash
set -euo pipefail

line='eval "$(shadowenv init bash)"'
bashrc="$HOME/.bashrc"

touch "$bashrc"
grep -Fqx "$line" "$bashrc" || printf '\n%s\n' "$line" >> "$bashrc"
