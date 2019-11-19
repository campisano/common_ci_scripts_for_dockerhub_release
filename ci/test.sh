#!/bin/bash

apt-get -q update
apt-get -q -y install git gcc g++ make cmake libssl-dev libcurl4-openssl-dev
git clone --depth 1 -b master https://github.com/campisano/test_travisci_dockerhub_release.git repository
cd repository
make -e release
