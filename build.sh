#!/bin/bash

if test $# -ne 0; then
    case $1 in
        "2017")
        echo "开始编译FluffOS v2017"
        docker run --rm -v ~/docker:/opt/docker --entrypoint=/v2017.sh fluffos/build
            ;;
        "2019")
        echo "开始编译FluffOS v2019"
        docker run --rm -v ~/docker:/opt/docker --entrypoint=/v2019.sh fluffos/build
            ;;
        "fluffos")
        echo "开始创建 Fluffos docker 镜像 fluffos/fluffos"
        docker build -t fluffos/fluffos --no-cache .
            ;;
        *)
        echo "进入 fluffos/build docker 镜像"
        docker run --rm -v ~/docker:/opt/docker -it fluffos/build
            ;;
    esac
else
    echo "开始创建 Fluffos 编译环境 docker 镜像 fluffos/build"
    docker build -t fluffos/build ./build
fi
