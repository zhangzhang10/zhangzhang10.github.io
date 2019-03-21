# A Docker image with cquery LSP server + vim-lsp client + vim-lsp-cquery
# extension for better C++ code navigation experience in vim.

FROM ubuntu:18.04

RUN \
    echo 'Acquire::http::proxy "http://proxy-chain.intel.com:911";' >> /etc/apt/apt.conf && \
    echo 'Acquire::https::proxy "http://proxy-chain.intel.com:912";' >> /etc/apt/apt.conf && \
    apt-get update && apt-get install -y \
       build-essential git vim cmake llvm && \
    git clone --recursive https://github.com/cquery-project/cquery.git && \
    cd cquery && \
    git submodule update --init && \
    mkdir build && cd build && \
    cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/opt/cquery -DCMAKE_EXPORT_COMPILE_COMMANDS=YES && \
    cmake --build . && cmake --build . --target install && \
    cd ../.. && rm -rf cquery

COPY .vimrc /root/

ENV PATH="/opt/cquery/bin:$PATH"
WORKDIR /workspace
CMD ["/bin/bash"]
