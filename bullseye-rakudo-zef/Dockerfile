### Dockerfile for building a minimal rakudo with zef

# use base image.
FROM debian:bullseye-slim AS build

# Author
MAINTAINER Nicholas Clark <nick@ccl4.org>

ARG rakudo_version=2021.10
ARG zef_version=v0.13.4
ARG prefix=/opt/rakudo

ARG keep="ca-certificates"
ARG build_only="build-essential git"

# The update-ca-certificates might be cargo-cult.
# Installing ca-certificates is not.

ENV PATH=${prefix}/share/perl6/site/bin:${prefix}/share/perl6/core/bin:${prefix}/bin:$PATH

RUN \
  apt-get update && \
  apt-get --yes --no-install-recommends install ${keep} ${build_only} && \
  update-ca-certificates && \
  git config --global advice.detachedHead false && \
  tmpdir="$(mktemp -d)" && \
  cd ${tmpdir} && \
  git clone --depth=1 --shallow-submodules --branch ${rakudo_version} https://github.com/MoarVM/MoarVM && \
  cd MoarVM && \
  ./Configure.pl --prefix=${prefix} && \
  make -j3 install && \
  tmpdir="$(mktemp -d)" && \
  cd ${tmpdir} && \
  git clone --depth=1 --shallow-submodules --branch ${rakudo_version} https://github.com/Raku/nqp && \
  cd nqp && \
  ./Configure.pl --prefix=${prefix} && \
  make -j3 test install && \
  tmpdir="$(mktemp -d)" && \
  cd ${tmpdir} && \
  git clone --depth=1 --shallow-submodules --branch ${rakudo_version} https://github.com/rakudo/rakudo && \
  cd rakudo && \
  ./Configure.pl --prefix=${prefix} && \
  make -j3 test install HARNESS_TYPE=6 && \
  tmpdir="$(mktemp -d)" && \
  cd ${tmpdir} && \
  git clone --depth=1  --branch ${zef_version} https://github.com/ugexe/zef && \
  cd zef && \
  rakudo -I. bin/zef install . && \
  apt-get purge -y --auto-remove ${build_only} && \
  rm -rf /var/lib/apt/lists/*

# Run when the container launches
CMD ["/opt/rakudo/bin/rakudo"]
