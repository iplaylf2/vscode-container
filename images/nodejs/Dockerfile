FROM mcr.microsoft.com/devcontainers/base:latest


USER vscode
ARG SDK_VERSION=""

RUN curl -fsSL https://fnm.vercel.app/install | bash

RUN if [ -n "$SDK_VERSION" ]; then fnm install "$SDK_VERSION"; fi
