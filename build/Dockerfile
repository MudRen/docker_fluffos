#FROM ubuntu
FROM ubuntu:latest

RUN sed -i 's#archive.ubuntu.com#mirrors.aliyun.com#' /etc/apt/sources.list && \
    apt update && \
    apt install git build-essential bison libevent-dev libjemalloc-dev libmysqlclient-dev libpcre3-dev libpq-dev libsqlite3-dev libssl-dev zlib1g-dev libgtest-dev libicu-dev cmake cargo \
        -y --no-install-recommends --fix-missing && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
