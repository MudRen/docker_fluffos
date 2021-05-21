#FROM ubuntu:latest
FROM ubuntu:18.04

RUN sed -i 's#archive.ubuntu.com#mirrors.aliyun.com#' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y libevent-2.1-6 libevent-extra-2.1-6 libevent-openssl-2.1-6 libevent-pthreads-2.1-6 libjemalloc1 libpcre3 libssl1.1 zlib1g && \
    #创建 v2017 版镜像可注释下面这一行
    apt-get install -y libpq5 libsqlite3-0 libmysqlclient20 libicu60 && \
    rm -rf /var/lib/apt/lists/*

COPY bin/driver bin/portbind /usr/bin/

ENTRYPOINT ["/usr/bin/driver"]
