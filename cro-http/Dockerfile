FROM bullseye-rakudo-zef:2021-10
MAINTAINER Jonathan Worthington <jonathan@edument.se>

ARG cro_version=0.8.7

ARG keep="libssl-dev"
ARG build_only="curl git"

RUN apt-get update && \
    apt-get --yes --no-install-recommends install ${keep} ${build_only} && \
    zef install OpenSSL && \
    zef install 'Cro::Core:ver<'$cro_version'>' && \
    zef install 'Cro::TLS:ver<'$cro_version'>' && \
    zef install 'Cro::HTTP:ver<'$cro_version'>' && \
    apt-get purge -y --auto-remove ${build_only} && \
    rm -rf /var/lib/apt/lists/*
