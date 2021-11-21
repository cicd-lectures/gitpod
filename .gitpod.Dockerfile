FROM maven:3.8.3-eclipse-temurin-17

# hadolint ignore=DL3008
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    asciidoctor \
    ca-certificates \
    curl \
    cowsay \
    fortune \
    shellcheck \
    sl \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
