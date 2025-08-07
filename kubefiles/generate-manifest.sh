#!/bin/bash

CHART=opensearch-curator
NAMESPACE=admin

declare -a ENVS=(dev prod)

# Check the number of parameters
if [[ $# -ne 1 ]]; then
  echo -e "\033[1;31mUsage\033[0m: $0 <ENVIRONMENT>"
  echo -e "\033[34mEnvironment:\033[0m ${ENVS[*]}"
  exit 1
else
  ENV=$1
fi

release_name=opensearch-curator

yaml_file=${CHART}-${ENV}.yaml
echo -e "\033[32mCreate ${yaml_file}\033[0m"

helm3 template ${release_name} . --namespace ${NAMESPACE} \
-f values/versions.yaml \
-f values/common.yaml \
-f values/$ENV.yaml \
>${yaml_file}
