#!/usr/bin/env bash
set -euo pipefail

oxfmt --write .
treefmt .
