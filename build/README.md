# Opensearch Curator Build Image

## Build your own image

Customize:

- `config.rc` - versions
  - base image: **PY_VER** - <a href="https://hub.docker.com/_/python" target="_blank" rel="noopener noreferrer">Debian slim image with Python</a>
  - opensearch-curator: **CURATOR_VER** - <a href="https://pypi.org/project/curator-opensearch/" target="_blank" rel="noopener noreferrer">Curator Python module</a>

- `build-and-push.sh` - build image and push it to your own repository
  - repo name: **REPO** - set your own repository
  - container management: **container_mgr** - set it to `docker` or `podman`
  - package name: **package** - set it to `opensearch-curator` or a name that you prefer

Run:

```console
./build-and-push.sh
```

## Use your image

The `opensearch-curator` image that you built and pushed to your repository will be used to deploy in your Kubernetes cluster as a CronJob and it will run according to your needs.

See the [kubefiles](../kubefiles/README.md)
