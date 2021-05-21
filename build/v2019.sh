#!/bin/bash

# Build FluffOS
cd /opt/docker/fluffos/
git checkout master
rm -rf build/ && mkdir build && cd build/
cmake -DPACAKGE_DB=ON -DPACKAGE_DB_MYSQL=1 -DPACKAGE_DB_SQLITE=2 -DPACKAGE_DB_DEFAULT_DB=1 .. && make -j4 install

cp ./bin/{driver,portbind} /opt/docker/docker_fluffos/bin/
