# A Docker image with rtags for better C++ code navigation experience in vim.

FROM ubuntu:18.04

RUN \
    echo 'Acquire::http::proxy "http://proxy-chain.intel.com:911";' >> /etc/apt/apt.conf && \
    echo 'Acquire::https::proxy "http://proxy-chain.intel.com:912";' >> /etc/apt/apt.conf && \
    apt-get update && apt-get install -y \
       build-essential git vim cmake clang libclang-dev pkg-config bash-completion && \
    git clone --recursive https://github.com/Andersbakken/rtags.git && \
    cd rtags && mkdir build && cd build &&\
    cmake .. -DCMAKE_BUILD_TYPE=Release && \
    make -j4 && make install && \
    cd ../.. && rm -rf rtags 

COPY .vimrc /root/

WORKDIR /workspace
CMD ["/bin/bash"]
