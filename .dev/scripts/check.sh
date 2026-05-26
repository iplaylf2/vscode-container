#!/usr/bin/env bash
set -euo pipefail

oxfmt --check .
treefmt --ci .
cspell lint .
