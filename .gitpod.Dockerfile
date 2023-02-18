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

ARG CLOUD_SDK_VERSION=403.0.0

# Install the gcloud sdk.
RUN curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz \
  && tar xzf google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz \
  && rm google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz

ENV PATH /google-cloud-sdk/bin:$PATH

# Allow "funny" commands to be used from default PATH
RUN for cli in /usr/games/*;do ln -s "$cli" /usr/local/bin/;done \
  && echo "PATH=/usr/games:\$PATH" >> /etc/environment

# Use "main" as default branch for new git repositories
RUN git config --global init.defaultBranch main

USER gitpod
