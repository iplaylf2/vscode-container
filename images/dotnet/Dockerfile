FROM mcr.microsoft.com/devcontainers/base:latest

USER vscode
ENV DOTNET_ROOT=/home/vscode/.dotnet
ENV PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools

WORKDIR /tmp/dotnet-install-temp

ADD --chown=vscode:vscode https://dot.net/v1/dotnet-install.sh .

RUN chmod +x dotnet-install.sh

ARG SDK_VERSION=LTS

RUN ./dotnet-install.sh --channel $SDK_VERSION
RUN rm -rf /tmp/dotnet-install-temp