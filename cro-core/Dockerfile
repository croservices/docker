FROM bullseye-rakudo-zef:2021-10
MAINTAINER Jonathan Worthington <jonathan@edument.se>

ARG cro_version=0.8.7

RUN apt-get update && \
    apt-get --yes --no-install-recommends install curl && \
    zef install 'Cro::Core:ver<'$cro_version'>' && \
    apt-get purge -y --auto-remove curl && \
    rm -rf /var/lib/apt/lists/*
