FROM java:openjdk-8u111-jre-alpine

ENV CEREBRO_VER=0.5.0

RUN apk add --update --no-cache openssl tar bash && \
    wget -O - https://github.com/lmenezes/cerebro/releases/download/v${CEREBRO_VER}/cerebro-${CEREBRO_VER}.tgz | tar xzv --strip-components 1 && \
    apk del openssl tar && \
    rm -rf /var/cache/apk/*

EXPOSE 9000
WORKDIR cerebro

ENTRYPOINT ["/bin/cerebro"]
