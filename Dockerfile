FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && \
    apt install -y rpm2cpio cpio wget gfortran gcc ragel libssl-dev make cmake g++ git autogen \
    pkg-config valgrind libboost-all-dev language-pack-en-base libboost-python-dev python3-dev \
    libsuperlu-dev libopenblas-dev sshpass zlib1g-dev\
    clang-tidy clang libboost-all-dev wget valgrind python-yaml fontconfig python-pip python3-pip\
    libeigen3-dev libsdl2-dev libglew-dev curl \
 && rm -rf /var/lib/apt/lists/* 
RUN apt-get update && \
    apt-get install -y qt5-qmake qt5-default openssh-client && \
    apt-get clean && \
    strip --remove-section=.note.ABI-tag /usr/lib/x86_64-linux-gnu/libQt5Core.so.5 && \
    rm -rf /var/lib/apt/lists/*
    
RUN apt update && apt install -y libopenblas-base libsuperlu-dev && \
    wget -q -O worhp_1.14-0~ubuntu2004.deb https://seafile.zfn.uni-bremen.de/f/0171f8b47c114aa282a5/?dl=1 && \
    chmod +x worhp_1.14-0~ubuntu2004.deb && apt-get install -y ./worhp_1.14-0~ubuntu2004.deb
RUN pip3 install conan
ENV LANG en_US.utf-8
