#!/bin/bash

apt-get -q update
apt-get -q -y install git gcc g++ make cmake libssl-dev libcurl4-openssl-dev
make -e release
