FROM maven:3.8.3-eclipse-temurin-17

# hadolint ignore=DL3008
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    asciidoctor \
    ca-certificates \
    curl \
    cowsay \
    fortune \
    fortunes \
    shellcheck \
    sl \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Allow "funny" commands to be used from default PATH
RUN for cli in /usr/games/*;do ln -s "$cli" /usr/local/bin/;done
RUN echo 'PATH=/usr/games:$PATH' >> /etc/environment
