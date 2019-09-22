#FROM ubuntu
FROM ubuntu:latest

RUN sed -i 's#archive.ubuntu.com#mirrors.aliyun.com#' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y libevent-2.1-6 libjemalloc1 libmysqlclient20 libpcre3 libpq5 libsqlite3-0 libssl1.1 zlib1g libicu60 \
        --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

COPY bin/driver bin/portbind /usr/bin/

ENTRYPOINT ["/usr/bin/driver"]
