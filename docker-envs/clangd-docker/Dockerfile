# A Docker image with clangd + vim-lsp client 
# extension for better C++ code navigation experience in vim.

FROM ubuntu:18.04

RUN \
    echo 'Acquire::http::proxy "http://proxy-chain.intel.com:911";' >> /etc/apt/apt.conf && \
    echo 'Acquire::https::proxy "http://proxy-chain.intel.com:912";' >> /etc/apt/apt.conf && \
    apt-get update && apt-get install -y \
       build-essential vim clang-tools-7 && \
    update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-7 100

COPY .vimrc /root/

WORKDIR /workspace
CMD ["/bin/bash"]
