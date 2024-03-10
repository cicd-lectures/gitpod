FROM gitpod/workspace-full

USER root

# Configure go
ENV GO_VERSION=1.22.0
ENV GOROOT=$HOME/go
ENV PATH=$GOROOT/bin:$GOPATH/bin:$PATH

# hadolint ignore=DL3008
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    cowsay \
    fortune \
    fortunes \
    sl \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && curl -fsSL https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz | tar xzs \
  && printf '%s\n' 'export GOPATH=/workspace/go' \
     'export PATH=$GOPATH/bin:$PATH' \
     'export CGO_ENABLED=0' > $HOME/.bashrc.d/300-go

# Allow "funny" commands to be used from default PATH
RUN for cli in /usr/games/*;do ln -s "$cli" /usr/local/bin/;done \
  && echo "PATH=/usr/games:\$PATH" >> /etc/environment

# Use "main" as default branch for new git repositories
RUN git config --global init.defaultBranch main

USER gitpod
