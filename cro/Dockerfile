FROM rakudo-star:2019.03
MAINTAINER Jonathan Worthington <jonathan@edument.se>

ARG cro_version=0.8.2

RUN apt-get update && \
    apt-get --yes --no-install-recommends install libssl1.0-dev build-essential && \
    zef install 'Cro::Core:ver<'$cro_version'>' && \
    zef install 'Cro::TLS:ver<'$cro_version'>' && \
    zef install 'Cro::HTTP:ver<'$cro_version'>' && \
    zef install 'Cro::WebSocket:ver<'$cro_version'>' && \
    zef install 'cro:ver<'$cro_version'>' && \
    apt-get purge -y --auto-remove build-essential && \
    rm -rf /var/lib/apt/lists/*
