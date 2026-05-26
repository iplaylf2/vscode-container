# VS Code Dev Container Playground

This repository provides a template-based workflow for VS Code Dev Containers. Each local workspace starts from `projects/.template/` and lives under `projects/`.

## Prerequisites

- Docker is available on the host.
- VS Code has the `ms-vscode-remote.remote-containers` extension installed.

## Create a Workspace

1. Download the repository (e.g., `git clone https://github.com/iplaylf2/vscode-container.git`).
2. Create `projects/<your-project-name>` from `projects/.template/`.
   - On Windows, use the `robocopy` command in [Windows Symlinks](#windows-symlinks) instead of a normal copy.
3. Edit `projects/<your-project-name>/docker-compose.yaml` as needed.
4. Open `projects/<your-project-name>` in VS Code and run `Dev Containers: Reopen in Container`.

After the container is created, VS Code opens the workspace at `/src/<your-project-name>`. The data lives in a Docker volume named `<your-project-name>_workspace`.

## Windows Symlinks

`projects/.template` uses symlinks for shared configuration. On Windows, run the setup commands from an Administrator PowerShell so Git and `robocopy` preserve those links.

From a normal PowerShell window at the repository root, run one of the following commands to open an elevated shell in the same directory:

```powershell
# Windows PowerShell
Start-Process powershell -Verb RunAs -WorkingDirectory (Get-Location)

# PowerShell 7+
Start-Process pwsh -Verb RunAs -WorkingDirectory (Get-Location)
```

Then run the setup commands in the Administrator PowerShell:

```powershell
# Enable symlink support in this repo.
git config --local core.symlinks true

# Restore symlinks if Git checked them out as regular files (destructive: discards local changes).
git checkout -f

# Copy the template while preserving symlinks and skipping unchanged files.
robocopy projects/.template projects/<your-project-name> /E /SL /XC /XN /XO
```
