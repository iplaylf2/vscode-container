FROM mcr.microsoft.com/devcontainers/base:latest AS builder

WORKDIR /builder

ADD --chown=vscode:vscode --chmod=500 https://dot.net/v1/dotnet-install.sh .


FROM mcr.microsoft.com/devcontainers/base:latest

USER vscode
ENV DOTNET_ROOT=/home/vscode/.dotnet
ENV PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools

ARG SDK_VERSION=LTS

RUN --mount=type=bind,from=builder,source=/builder/dotnet-install.sh,target=/builder/dotnet-install.sh \
    /builder/dotnet-install.sh --channel $SDK_VERSION