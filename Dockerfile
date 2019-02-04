FROM rancher/cli:v2.0.4

# install dependencies
RUN apk add --no-cache curl

# install kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.12.0/bin/linux/amd64/kubectl \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin/kubectl

# add rancher-redeploy script
COPY bin/rancher-redeploy /usr/local/bin/
RUN chmod +x /usr/local/bin/rancher-redeploy

# reset entrypoint
ENTRYPOINT []
