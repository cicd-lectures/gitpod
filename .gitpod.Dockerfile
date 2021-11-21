FROM gitpod/workspace-full

USER root
# hadolint ignore=DL3008
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    cowsay \
    fortune \
    fortunes \
    sl \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Allow "funny" commands to be used from default PATH
RUN for cli in /usr/games/*;do ln -s "$cli" /usr/local/bin/;done \
  && echo "PATH=/usr/games:\$PATH" >> /etc/environment

USER gitpod
