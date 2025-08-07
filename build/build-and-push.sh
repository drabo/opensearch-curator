#!/bin/bash

source ./config.rc

REPO=YOUR-OWN-REPO-HERE

container_mgr=docker # docker | podman
package=opensearch-curator

${container_mgr} login ${REPO}

${container_mgr} rmi ${REPO}/${package} 2>/dev/null
if [[ "$container_mgr" == "podman" ]]; then
    ${container_mgr} build -t ${package}:ecr --build-arg-file ./config.rc .
else
    ${container_mgr} build -t ${package}:ecr $(sed 's/^/--build-arg /' ./config.rc) .
fi
${container_mgr} tag ${package}:ecr ${REPO}/${package}
${container_mgr} tag ${package}:ecr ${REPO}/${package}:${CURATOR_VER}

${container_mgr} push ${REPO}/${package}
${container_mgr} push ${REPO}/${package}:${CURATOR_VER}

${container_mgr} rmi ${REPO}/${package}:${CURATOR_VER}
${container_mgr} rmi ${REPO}/${package}:latest
${container_mgr} rmi ${package}:ecr
