# Rancher Deploy

This docker image enables simple deployments to Rancher.
It is a small alpine image with [Rancher CLI](https://rancher.com/docs/rancher/v2.x/en/cli/) `rancher`
and [Kubernetes CLI](https://kubernetes.io/docs/tasks/tools/install-kubectl/) `kubectl` installed.

It also comes with a custom `rancher-redeploy` command (see usage section).

## Usage

### Simple Redeploy via GitLab CI

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

## License

The MIT License (MIT). Please see [License File](LICENSE.md) for more information.
