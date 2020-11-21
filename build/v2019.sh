#!/bin/bash

# Build FluffOS
cd /opt/docker/fluffos/
git checkout master
rm -rf build/ && mkdir build && cd build/
cmake .. && make install

cp ./bin/{driver,portbind} /opt/docker/docker_fluffos/bin/
