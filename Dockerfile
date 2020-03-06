
ARG VERSION
FROM alpine:$VERSION
LABEL   maintainer="Sangram Chavan <schavan@outlook.com>" \
        architecture="amd64/x86_64" 

ARG VERSION
ARG BUILD_DATE
ARG VCS_REF

LABEL   org.label-schema.schema-version="1.0" \
        org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.name="sangram/alpine-mini" \
        org.label-schema.description="Alpine docker image with runit support for runonce & runalways tasks" \
        org.label-schema.url="https://hub.docker.com/r/sangram/alpine-mini/" \
        org.label-schema.vcs-url="https://github.com/sangram-chavan/alpine-mini.git" \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vendor="Open Source" \
        org.label-schema.version=$VERSION

COPY root/. /

RUN apk --update upgrade --no-cache -U && \
    apk add --no-cache libstdc++ runit && \
    rm -rf /var/cache/apk/*
    
RUN chmod a+x /bin/set_tz && \
    chmod a+x /sbin/start_runit && \
    chmod a+x /etc/run_once/00_dump_info.sh && \
    mkdir -p /etc/BUILDS/ && \
    printf "Build of sangram/alpine-mini:$VERSION, date: %s\n"  `date -u +"%Y-%m-%dT%H:%M:%SZ"` > /etc/BUILDS/alpine-mini

ENV HOME /root

WORKDIR /root

CMD ["/sbin/start_runit"]
