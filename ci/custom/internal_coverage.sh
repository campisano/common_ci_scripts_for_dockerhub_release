#!/usr/bin/env bash

set -x -o errexit -o nounset -o pipefail

TARGET="$1"
TOKEN="$2"

apt-get -qq -y update
apt-get -qq -y install curl git lcov > /dev/null
apt-get -qq -y clean

for F in `find . | egrep '\.cpp'`;
do
  gcov -n -o . "${F}" > /dev/null;
done

lcov --directory "build/${TARGET}" --capture --output-file coverage.info
ls -alt --color
lcov --remove coverage.info "/usr/*" "`pwd`/external/*" "`pwd`/src/test/*" --output-file coverage.info
lcov --list coverage.info

bash <(curl -s https://codecov.io/bash) -f coverage.info -t "${TOKEN}"
