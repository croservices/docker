FROM rakudo-star:2019.03
MAINTAINER Jonathan Worthington <jonathan@edument.se>

ARG cro_version=0.8.3

RUN apt-get update && \
    apt-get --yes --no-install-recommends install libzmq3-dev && \
    rm -rf /var/lib/apt/lists/* && \
    zef install 'Cro::Core:ver<'$cro_version'>' && \
    zef install --/test 'Cro::ZeroMQ:ver<'$cro_version'>'
