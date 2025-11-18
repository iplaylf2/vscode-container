FROM mcr.microsoft.com/devcontainers/base:latest

USER vscode
ENV DOTNET_ROOT=/home/vscode/.dotnet
ENV PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools

ARG SDK_VERSION=LTS

RUN curl -fsSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --channel $SDK_VERSION
