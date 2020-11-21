#!/bin/bash

# Build FluffOS
cd /opt/docker/fluffos/
git checkout v2017
cd src && ./build.FluffOS
make install

cp ./{driver,portbind} /opt/docker/docker_fluffos/bin/
