FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu-22.04

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get upgrade -y \
    && apt-get -y install --no-install-recommends \
    vim \
    neofetch \
    texlive-full \
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*

ARG TARGETARCH
RUN if [ "$TARGETARCH" = "arm64" ]; then \
        wget https://github.com/jgm/pandoc/releases/download/3.8.2.1/pandoc-3.8.2.1-1-arm64.deb \
        && dpkg -i pandoc-3.8.2.1-1-arm64.deb \
        && rm pandoc-3.8.2.1-1-arm64.deb; \
    else \
        wget https://github.com/jgm/pandoc/releases/download/3.8.2.1/pandoc-3.8.2.1-1-amd64.deb \
        && dpkg -i pandoc-3.8.2.1-1-amd64.deb \
        && rm pandoc-3.8.2.1-1-amd64.deb; \
    fi

RUN cd /tmp \
    && if [ "$TARGETARCH" = "arm64" ]; then \
        wget https://github.com/lierdakil/pandoc-crossref/releases/download/v0.3.22a/pandoc-crossref-Linux-ARM64.tar.xz \
        && tar -xf pandoc-crossref-Linux-ARM64.tar.xz \
        && rm pandoc-crossref-Linux-ARM64.tar.xz; \
    else \
        wget https://github.com/lierdakil/pandoc-crossref/releases/download/v0.3.22a/pandoc-crossref-Linux-X64.tar.xz \
        && tar -xf pandoc-crossref-Linux-X64.tar.xz \
        && rm pandoc-crossref-Linux-X64.tar.xz; \
    fi \
    && sudo mv pandoc-crossref /usr/local/bin/ \
    && sudo chmod +x /usr/local/bin/pandoc-crossref
