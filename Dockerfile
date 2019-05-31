FROM alpine:3.9
LABEL maintainer="Sangram Chavan <schavan@outlook.com>" \
    architecture="amd64/x86_64" \
    alpine-version="3.9" \
    build="29-May-2019" \
    org.opencontainers.image.title="alpine-mod" \
    org.opencontainers.image.description="Alpine docker image with runit support for runonce & runalways tasks" \
    org.opencontainers.image.authors="Sangram Chavan <schavan@outlook.com>" \
    org.opencontainers.image.vendor="Open Source" \
    org.opencontainers.image.version="v3.9" \
    org.opencontainers.image.url="https://hub.docker.com/r/sangram/alpine-mod/" \
    org.opencontainers.image.source="https://github.com/sangram-chavan/docker-images/alpine-mod"


COPY root/. /
RUN chmod a+x /bin/set_tz && \
    chmod a+x /sbin/start_runit && \
    chmod a+x /etc/run_once/00_dump_info.sh && \
    mkdir -p /etc/BUILDS/ && \
    mkdir /etc/service && \
    mkdir /etc/sv && \
    apk --update upgrade && \
    apk add runit && \
    rm -rf /var/cache/apk/* &&\
    printf "Build of sangram/alpine-mod:3.9, date: %s\n"  `date -u +"%Y-%m-%dT%H:%M:%SZ"` > /etc/BUILDS/alpine-mod

ENV HOME /root

WORKDIR /root

CMD ["/sbin/start_runit"]