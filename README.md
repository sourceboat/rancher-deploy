# sourceboat/rancher-deploy

[![Docker Build Status](https://img.shields.io/docker/cloud/build/sourceboat/rancher-deploy.svg?style=flat-square)](https://hub.docker.com/r/sourceboat/rancher-deploy/builds/)
[![Release](https://img.shields.io/github/release/sourceboat/rancher-deploy.svg?style=flat-square)](https://github.com/sourceboat/rancher-deploy/releases)
[![Docker Pulls](https://img.shields.io/docker/pulls/sourceboat/rancher-deploy.svg?style=flat-square)](https://hub.docker.com/r/sourceboat/rancher-deploy/)
[![MicroBadger Size](https://img.shields.io/microbadger/image-size/sourceboat/rancher-deploy.svg?style=flat-square)](https://microbadger.com/images/sourceboat/rancher-deploy)
[![MicroBadger Layers](https://img.shields.io/microbadger/layers/sourceboat/rancher-deploy.svg?style=flat-square)](https://microbadger.com/images/sourceboat/rancher-deploy)

This docker image enables simple deployments to Rancher.
It is a small alpine image with [Rancher CLI](https://rancher.com/docs/rancher/v2.x/en/cli/) `rancher`
and [Kubernetes CLI](https://kubernetes.io/docs/tasks/tools/install-kubectl/) `kubectl` installed.

It also comes with a custom `rancher-redeploy` and `rancher-exec` command helper (see usage section).

## Usage

### Simple Redeploy via GitLab CI and `rancher-redeploy` helper

To use this image via GitLab CI add the following to the `.gitlab-ci.yml`:

```yml
deploy:
  stage: deploy
  image: sourceboat/rancher-deploy:stable
  variables:
    RANCHER_URL: https://rancher.example.com
    K8S_NAMESPACE: my-namespace-name
    K8S_DEPLOYMENT: my-deployment-name
  script:
    - rancher login $RANCHER_URL --token $RANCHER_TOKEN
    - rancher-redeploy $K8S_NAMESPACE $K8S_DEPLOYMENT
```

Don't forget to provide `$RANCHER_TOKEN` via GitLab CI/CD variable.

This will trigger a redeploy of the given Kubernetes deployment by updating a label
and pull the newest image if configured correctly.

### Execute Command via `rancher-exec` helper

You can also execute commands in pods of your deployment via `rancher-exec $K8S_NAMESPACE $K8S_DEPLOYMENT 'ls'`.
This will execute the given command in the first pod of your deployment.
Currently this is only tested with single container pods.

## Changelog

Check [releases](https://github.com/sourceboat/rancher-deploy/releases) for all notable changes.

## Credits

- [Phil-Bastian Berndt](https://github.com/pehbehbeh)
- [All Contributors](https://github.com/sourceboat/rancher-deploy/graphs/contributors)

## License

The MIT License (MIT). Please see [License File](LICENSE.md) for more information.
