FROM rancher/cli:v2.2.0

# install dependencies
RUN apk update \
    && apk add --no-cache \
        ca-certificates \
        curl \
        git \
        bash

# change default shell
SHELL ["/bin/bash", "-c"]

# install sentry-cli
RUN curl -sL https://sentry.io/get-cli/ | bash

# install kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.12.0/bin/linux/amd64/kubectl \
    && mv ./kubectl /usr/local/bin/kubectl

# add helper scripts
COPY bin/ /usr/local/bin/

## make all binaries executable
RUN chmod +x /usr/local/bin/*

# reset entrypoint
ENTRYPOINT []
