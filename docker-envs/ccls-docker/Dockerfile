# A Docker image with ccls LSP server + vim-lsp client
# extension for better C++ code navigation experience in vim.

FROM ubuntu:18.04

RUN \
    echo 'Acquire::http::proxy "http://proxy-chain.intel.com:911";' >> /etc/apt/apt.conf && \
    echo 'Acquire::https::proxy "http://proxy-chain.intel.com:912";' >> /etc/apt/apt.conf && \
    apt-get update && apt-get install -y \
       build-essential git vim cmake zlib1g-dev libncurses-dev clang-7 libclang-7-dev && \
    git clone --depth=1 --recursive https://github.com/MaskRay/ccls && \
    cd ccls && \
    cmake -H. -BRelease -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_PREFIX_PATH=/usr/lib/llvm-7 \
        -DLLVM_INCLUDE_DIR=/usr/lib/llvm-7/include \
        -DLLVM_BUILD_INCLUDE_DIR=/usr/include/llvm-7 && \
    cmake --build Release && cmake --build Release --target install && \
    cd .. && rm -rf ccls

COPY .vimrc /root/

WORKDIR /workspace
CMD ["/bin/bash"]
