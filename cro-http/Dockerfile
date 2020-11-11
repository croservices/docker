FROM rakudo-star:2020.01
MAINTAINER Jonathan Worthington <jonathan@edument.se>

ARG cro_version=0.8.4

RUN apt-get update && \
    apt-get --yes --no-install-recommends install libssl-dev && \
    rm -rf /var/lib/apt/lists/* && \
    zef upgrade OpenSSL && \
    zef install 'Cro::Core:ver<'$cro_version'>' && \
    zef install 'Cro::TLS:ver<'$cro_version'>' && \
    zef install 'Cro::HTTP:ver<'$cro_version'>'
