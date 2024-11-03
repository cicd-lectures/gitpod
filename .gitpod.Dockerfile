FROM gitpod/workspace-full

USER root

# Configure go
# hadolint ignore=DL3008
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    cowsay \
    fortune \
    fortunes \
    sl \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Use "main" as default branch for new git repositories
RUN git config --global init.defaultBranch main

USER gitpod
