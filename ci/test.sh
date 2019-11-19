#!/bin/bash

apt-get -q update
apt-get -q -y install libssl1.0.0 libcurl3
./run.sh release test
