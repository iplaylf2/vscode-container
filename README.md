# VS Code Dev Container Playground

This repository keeps a minimal VS Code Dev Container setup that runs on top of Docker. With parameterized environment variables consumed by `.devcontainer/devcontainer.json`, the same workflow can prepare a baseline container environment for different development needs.

## Getting Started

Prerequisites: Docker is available on the host, and VS Code has the `ms-vscode-remote.remote-containers` extension installed.

1. Download the repository (e.g., `git clone https://github.com/iplaylf2/vscode-container.git`).
2. Set the required environment variables (for example `VSCODE_CONTAINER_PROJECT`, `DOCKER_FILE_PATH`, `SDK_VERSION`).
3. Open the folder in VS Code and run `Dev Containers: Reopen in Container`.

After the container is created, VS Code reopens the workspace inside the container. When the volume is freshly created, that directory starts empty.

## Configuration Notes

- `VSCODE_CONTAINER_PROJECT` controls both the Docker volume name and the `/mnt/<project>` path inside the container.
- Keep `DOCKER_FILE_PATH` and `SDK_VERSION` as environment variables so switching Dockerfiles or toolchains only requires updating those values.
- The default container user is `vscode`; `postCreateCommand` ensures that account owns the workspace directory.
