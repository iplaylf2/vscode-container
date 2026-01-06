# VS Code Dev Container Playground

This repository provides a template-based workflow for VS Code Dev Containers. Shared settings live under `compose-base/`, and each local dev container is created by copying `projects/.template/` into `projects/`.

## Getting Started

Prerequisites: Docker is available on the host, and VS Code has the `ms-vscode-remote.remote-containers` extension installed.

1. Download the repository (e.g., `git clone https://github.com/iplaylf2/vscode-container.git`).
2. Copy `projects/.template/` to `projects/<your-project-name>`.
3. Edit `projects/<your-project-name>/docker-compose.yaml` as needed.
4. Set `VSCODE_CONTAINER_PROJECT` in the host environment that will launch VS Code.
5. Open `projects/<your-project-name>` in VS Code and run `Dev Containers: Reopen in Container`.

After the container is created, VS Code opens the workspace at `/mnt/${VSCODE_CONTAINER_PROJECT}`. The data lives in a Docker volume named `${VSCODE_CONTAINER_PROJECT}`.

## Configuration Notes

- `VSCODE_CONTAINER_PROJECT` provides the project identity (volume name and `/mnt/<project>` path); it is an environment variable because `devcontainer.json` cannot pass variables into Docker Compose.
