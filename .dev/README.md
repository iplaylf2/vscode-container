# Development Tooling

This directory contains development helpers for repository maintenance.

## Environment

Start a shell with the repository tools available:

```bash
nix develop path:./.nix
```

From that shell, run maintenance scripts as needed:

```bash
.dev/scripts/check.sh
```

For a one-off command, run the script through `nix develop -c`:

```bash
nix develop path:./.nix -c .dev/scripts/check.sh
```

## Tool Links

Build stable repository-local tool entrypoints:

```bash
nix build path:./.nix#tools -o .dev/tools
```

Use this when a tool needs a persistent path instead of an activated Nix shell.
