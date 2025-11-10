FROM mcr.microsoft.com/devcontainers/base:latest AS builder

ARG SDK_VERSION=1.25.4
WORKDIR /builder

ADD https://go.dev/dl/go${SDK_VERSION}.linux-amd64.tar.gz go.tar.gz


FROM mcr.microsoft.com/devcontainers/base:latest

ARG INSTALL_ROOT=/usr/local
ENV PATH=$PATH:$INSTALL_ROOT/go/bin

RUN --mount=type=bind,from=builder,source=/builder/go.tar.gz,target=/builder/go.tar.gz \
    tar -xzf /builder/go.tar.gz -C $INSTALL_ROOT
