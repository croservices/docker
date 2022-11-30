FROM ubuntu:kinetic
MAINTAINER Jonathan Worthington <jonathan@edument.se>

# Native dependencies
RUN apt update && \
    apt install -y curl uuid-dev libpq-dev libssl-dev unzip build-essential && \
    apt purge

# Raku
RUN curl -1sLf \
  'https://dl.cloudsmith.io/public/nxadm-pkgs/rakudo-pkg/setup.deb.sh' \
  | bash
RUN apt-get install -y rakudo-pkg=2022.4.0-02
ENV PATH="/opt/rakudo-pkg/bin:${PATH}"
RUN install-zef

ARG cro_version=0.8.9
RUN ~/.raku/bin/zef install 'Cro::Core:ver<'$cro_version'>'
RUN ~/.raku/bin/zef install --/test 'Cro::HTTP:ver<'$cro_version'>'
RUN ~/.raku/bin/zef install --/test 'Cro::WebSocket:ver<'$cro_version'>'
RUN ~/.raku/bin/zef install --/test 'cro:ver<'$cro_version'>'
