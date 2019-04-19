# A Docker image for better C++ code navigation experience in vim.

FROM ubuntu:18.04

RUN \
    # proxy settings
    echo 'Acquire::http::proxy "http://proxy-chain.intel.com:911";' >> /etc/apt/apt.conf && \
    echo 'Acquire::https::proxy "http://proxy-chain.intel.com:912";' >> /etc/apt/apt.conf && \
    # required packages
    apt-get update && apt-get install -y \
       build-essential python3 git vim tmux cmake zlib1g-dev libncurses-dev clang-7 \
       libclang-7-dev autoconf pkg-config bash-completion unzip wget bison flex \
       gperf libtool-bin libncurses-dev texinfo fonts-powerline locales && \
    # build/install/cleanup universal-ctags
    git clone https://github.com/universal-ctags/ctags.git && \
    cd ctags && \
    ./autogen.sh && ./configure && make && make install && \
    cd .. && rm -rf ctags && \
    # build/install/cleanup GNU global (gtags)
    wget http://tamacom.com/global/global-6.6.3.tar.gz && \
    tar -zxvf global-6.6.3.tar.gz && \
    cd global-6.6.3 && \
    sh ./reconf.sh && ./configure && make -j4 && make install && \
    cp /usr/local/share/gtags/gtags.conf /etc/ && \
    cd .. && rm -rf global-6.6.3 && rm global-6.6.3.tar.gz && \
    # build/install/cleanup ccls
    git clone --depth=1 --recursive https://github.com/MaskRay/ccls && \
    cd ccls && \
    cmake -H. -BRelease -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_PREFIX_PATH=/usr/lib/llvm-7 \
        -DLLVM_INCLUDE_DIR=/usr/lib/llvm-7/include \
        -DLLVM_BUILD_INCLUDE_DIR=/usr/include/llvm-7 && \
    cmake --build Release && cmake --build Release --target install && \
    cd .. && rm -rf ccls && \
    # build/install/cleanup rtags
    git clone --recursive https://github.com/Andersbakken/rtags.git && \
    cd rtags && mkdir build && cd build &&\
    cmake .. -DCMAKE_BUILD_TYPE=Release && \
    make -j4 && make install && \
    cd ../.. && rm -rf rtags && \
    # folder for powerline symbols
    mkdir -p /root/.local/share/fonts && \
    # ripgrep
    wget https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/ripgrep-0.10.0-x86_64-unknown-linux-musl.tar.gz && \
    tar -zxvf ripgrep*.tar.gz && ln -s /ripgrep*/rg /bin/rg && rm -f ripgrep*.tar.gz 

RUN sed -i -e 's/# \(en_US\.UTF-8 .*\)/\1/' /etc/locale.gen && locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

COPY vimrc /root/.vimrc
COPY tmux.conf /root/.tmux.conf
COPY dev-tmux.sh /bin/dev-tmux.sh
COPY settings.json /root/
COPY PowerlineSymbols.otf /root/.local/share/fonts/

ENV http_proxy "http://proxy-chain.intel.com:911"
ENV https_proxy "http://proxy-chain.intel.com:912"

WORKDIR /workspace
CMD ["/bin/bash"]
