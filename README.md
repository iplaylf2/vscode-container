# VS Code Dev Container Playground

This repository provides a template-based workflow for VS Code Dev Containers. Each local dev container is created by copying `projects/.template/` into `projects/`.

## Getting Started

Prerequisites: Docker is available on the host, and VS Code has the `ms-vscode-remote.remote-containers` extension installed.

1. Download the repository (e.g., `git clone https://github.com/iplaylf2/vscode-container.git`).
2. Copy `projects/.template/` to `projects/<your-project-name>`.
3. Edit `projects/<your-project-name>/docker-compose.yaml` as needed.
4. Open `projects/<your-project-name>` in VS Code and run `Dev Containers: Reopen in Container`.

After the container is created, VS Code opens the workspace at `/mnt/<your-project-name>`. The data lives in a Docker volume named `<your-project-name>`.
