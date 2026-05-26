# Development Tooling

This directory contains maintainer-facing development helpers.

## Environment

Enter a shell with the repository tools:

```bash
nix develop path:./.nix
```

Inside that shell, run repository scripts as needed, for example:

```bash
.dev/scripts/check.sh
```

For one-off commands without entering an interactive shell, use `nix develop -c`, for example:

```bash
nix develop path:./.nix -c .dev/scripts/check.sh
```

## Tool Links

Build stable repository-local tool entrypoints:

```bash
nix build path:./.nix#tools -o .dev/tools
```

Use this when a tool needs a persistent path instead of an activated Nix shell.
`.dev/tools` is a generated Nix result symlink and is ignored by Git.
