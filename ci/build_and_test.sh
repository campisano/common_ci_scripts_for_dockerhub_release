#!/usr/bin/env bash

set -x -o errexit -o nounset -o pipefail

# requisites
sudo ./ci/custom/ci_requisites.sh

# vars
export DOCKER_FROM_IMAGE=$(./ci/custom/get_docker_from_image.sh)

# build and test
docker pull "${DOCKER_FROM_IMAGE}"
docker run --mount type=bind,source="$(pwd)",target=/repository "${DOCKER_FROM_IMAGE}" /bin/bash -c 'cd /repository; ./ci/custom/internal_build.sh release'
docker run --mount type=bind,source="$(pwd)",target=/repository "${DOCKER_FROM_IMAGE}" /bin/bash -c 'cd /repository; ./ci/custom/internal_test.sh release'
