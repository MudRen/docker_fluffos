# FROM ubuntu:latest
FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive
RUN sed -i 's#archive.ubuntu.com#mirrors.aliyun.com#' /etc/apt/sources.list && \
    apt-get update && apt-get upgrade -y && \
    apt-get install -y --fix-missing git build-essential clang-6.0 autoconf automake bison libevent-dev libjemalloc-dev libpcre3-dev libssl-dev zlib1g-dev libtool cmake libpq-dev libsqlite3-dev libmysqlclient-dev libicu-dev && \
    rm -rf /var/lib/apt/lists/*

COPY v2017.sh /v2017.sh
RUN chmod +x /v2017.sh

COPY v2019.sh /v2019.sh
RUN chmod +x /v2019.sh

ENTRYPOINT ["/bin/bash"]
