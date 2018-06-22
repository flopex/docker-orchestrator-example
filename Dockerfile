FROM alpine

EXPOSE 3000

ENV GOPATH=/tmp/go

RUN set -ex \
    && apk add --update --no-cache \
    bash \
    curl \
    jq \
    && apk add --update --no-cache --virtual .build-deps \
        rsync \
        git \
        go \
        build-base \
    && cd /tmp \
    && { go get -d github.com/github/orchestrator ; : ; } \
    && cd $GOPATH/src/github.com/github/orchestrator \
    && bash build.sh -b \
    && rsync -av $(find /tmp/orchestrator-release -type d -name orchestrator -maxdepth 2)/ / \
    && rsync -av $(find /tmp/orchestrator-release -type d -name orchestrator-cli -maxdepth 2)/ / \
    && cd / \
    && apk del .build-deps \
    && rm -rf /tmp/*

RUN wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.1/dumb-init_1.2.1_amd64
RUN chmod +x /usr/local/bin/dumb-init

WORKDIR /usr/local/orchestrator
ADD docker/entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/usr/local/bin/dumb-init", "--"]
CMD ["/entrypoint.sh"]
