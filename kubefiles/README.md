# Opensearch Curator Helm Chart

This directory contains a Kubernetes chart to deploy the <a href="https://pypi.org/project/curator-opensearch/" target="_blank" rel="noopener noreferrer">Opensearch Curator</a>

## Prerequisites

- Helm v3 installed on you laptop
- Existing Opensearch cluster that you want to manage with Curator
- The `opensearch-curator` runs in Kubernetes as cron job

## Chart outcome

This chart will:

- Create a configmap with actions to run
- Create a cronjob that will run the curator

## Customize

In directory `values` you may put custom yaml files for your environments  and you will also refer them in the `generate-manifest.sh` script.

## Generate K8s manifest

Run:

```console
./generate-manifest.sh ENVIRONMENT
```

where ENVIRONMENT is the values filename in values directory (e.g. "dev" for values file dev.yaml)

If the environment values file is provided with valud content the a Kubernetes manifest is generated: opensearch-curator-dev.yaml

## Apply K8s manifest

For de above example (i.e. ENVIRONMENT=dev) run:

```console
kubectl -n admin apply -f opensearch-curator-dev.yaml
```

## Examples

You may find 2 example value files (`dev` and `prod`) and the corresponding Kubernetes manifest files.
