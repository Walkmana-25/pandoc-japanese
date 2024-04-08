FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu-22.04

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get upgrade -y \
    && apt-get -y install --no-install-recommends \
    vim \
    neofetch \
    texlive-full \
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/jgm/pandoc/releases/download/3.1.12.3/pandoc-3.1.12.3-amd64.deb \
    && dpkg -i pandoc-3.1.12.3-amd64.deb \
    && rm pandoc-3.1.12.3-amd64.deb

RUN cd /tmp \\
    && wget https://github.com/lierdakil/pandoc-crossref/releases/download/v0.3.17.0f/pandoc-crossref-Linux.tar.xz \
    && tar -xf pandoc-crossref-Linux.tar.xz \
    && sudo mv pandoc-crossref /usr/local/bin/ \
    && sudo chmod +x /usr/local/bin/pandoc-crossref \
    && rm pandoc-crossref-Linux.tar.xz
