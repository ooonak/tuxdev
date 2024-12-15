# syntax=docker/dockerfile:1
FROM ubuntu:24.04

ARG KVM_GID=992
ENV KVM_GID=$KVM_GID

RUN apt-get -y update && apt-get install -y --no-install-recommends \
  autotools-dev \
  bash \
  bc \
  binutils \
  build-essential \
  bzip2 \
  ccache \
  chrpath \
  clang \
  cmake \
  cpio \
  cppcheck \
  cscope \
  exuberant-ctags \
  curl \
  debianutils \
  diffstat \
  diffutils \
  file \
  findutils \
  flex \
  g++ \
  g++-multilib \
  gawk \
  gcc \
  gcc-multilib \
  gdb-multiarch \
  gcovr \
  git \
  git-lfs \
  graphviz \
  gzip \
  iputils-ping \
  lcov \
  libacl1 \
  libbfd-dev \
  libbpf-dev \
  libelf-dev \
  libncurses6 \
  libncurses-dev \
  libpcap-dev \
  liblz4-tool \
  linux-tools-common \
  llvm \
  locales \
  make \
  ninja-build \
  pahole \
  patch \
  perl \
  pkg-config \
  python3 \
  python3-git \
  python3-jinja2 \
  python3-pexpect \
  python3-pip \
  python3-subunit \
  qemu-system-x86 \
  rsync \
  screen \
  sed \
  socat \
  tar \
  texinfo \
  tmux \
  tree \
  unzip \
  valgrind \
  vim \
  wget \
  which \
  xz-utils \
  zstd \
  && rm -rf /var/lib/apt/lists/*

RUN locale-gen en_US.UTF-8 \
  && groupadd -g $KVM_GID kvm \
  && usermod -aG kvm ubuntu \
  && mkdir /src

WORKDIR /src

RUN git clone --recurse-submodules https://github.com/libbpf/bpftool.git
RUN cd bpftool/src && make install

ENV TERM=xterm-256color
RUN echo "PS1='\e[31m[TUXDEV] \e[92m\u\e[0m@\e[94m\h\e[0m:\e[35m\w\e[0m$ '" >> /home/ubuntu/.bashrc

WORKDIR /home/ubuntu

USER ubuntu
