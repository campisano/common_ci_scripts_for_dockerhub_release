#!/usr/bin/env bash

set -x -o errexit -o nounset -o pipefail

CACHE_DIR=/srv/cache
BUILD_DIR=/srv/build

mkdir -p ${CACHE_DIR}/var/cache/apt
cp -aT ${CACHE_DIR}/var/cache/apt /var/cache/apt
rm -f /etc/apt/apt.conf.d/docker*

export DEBIAN_FRONTEND=noninteractive
apt-get -qq -y update
apt-get -qq -y install --no-install-recommends apt-utils > /dev/null
apt-get -qq -y install --no-install-recommends gcc g++ make cmake libssl1.0-dev libcurl4-openssl-dev > /dev/null

mv -n /var/cache/apt/* ${CACHE_DIR}/var/cache/apt/

make -e release

mkdir -p ${BUILD_DIR}
cp -a ./build ./external ${BUILD_DIR}
