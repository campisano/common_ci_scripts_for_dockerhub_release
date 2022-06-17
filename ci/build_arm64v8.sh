#!/usr/bin/env bash

set -x -o errexit -o nounset -o pipefail

# vars
export DOCKER_IMAGE=$(./ci/custom/get_docker_image_build.sh)

# get image
docker pull "${DOCKER_IMAGE}"

# build code isolatedly
docker buildx ls
docker buildx create --use
docker buildx build --platform=linux/arm64/v8 --tag tmp_image --file - .  << EOF
FROM --platform=linux/arm64/v8 ${DOCKER_IMAGE}
COPY ${CACHE_DIR}/. /srv/cache
COPY . /srv/repo
RUN bash -c "cd /srv/repo; ./ci/custom/internal_build.sh"
EOF

CONTAINER=$(docker create --platform linux/arm64/v8 tmp_image)

docker cp ${CONTAINER}:/srv/cache/. ${CACHE_DIR}
docker cp ${CONTAINER}:/srv/build/. ${BUILD_DIR}
docker rm --volumes ${CONTAINER}
docker image rm tmp_image
