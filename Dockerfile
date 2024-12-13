# syntax=docker/dockerfile:1
FROM ubuntu:24.04

RUN apt-get -y update && apt-get install -y --no-install-recommends \
  bash \
  bc \
  binutils \
  build-essential \
  bzip2 \
  chrpath \
  clang \
  cmake \
  cpio \
  cppcheck \
  cscope \
  ctags \
  curl \
  debianutils \
  diffstat \
  diffutils \
  file \
  findutils \
  g++ \
  gawk \
  gcc \
  gdb-multiarch \
  git \
  graphviz \
  gzip \
  iputils-ping \
  libacl1 \
  libbpf-dev \
  liblz4-tool \
  linux-tools-common \
  llvm \
  locales \
  make \
  ninja-build \
  pahole \
  patch \
  perl \
  python3 \
  python3-git \
  python3-jinja2 \
  python3-pexpect \
  python3-pip \
  python3-subunit \
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

RUN locale-gen en_US.UTF-8

WORKDIR /home/ubuntu

USER ubuntu
