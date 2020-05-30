#!/bin/bash

if [ ! -d "/fluffos-build.lock" ]; then
    # Build FluffOS
    cd /opt/docker/fluffos/
    # git checkout v2019
    rm -rf build/ && mkdir build && cd build
    cmake ..
    make

    cp ./src/{driver,portbind} /opt/docker/docker_fluffos/bin/

    touch /fluffos-build.lock
fi
