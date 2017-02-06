FROM java:openjdk-8u111-jre-alpine

ENV CEREBRO_VER=0.5.0
ENV ELASTICSEARCH_URL='localhost:9200'

WORKDIR /cerebro

COPY run.sh run.sh

RUN apk add --update --no-cache openssl tar bash
RUN wget -O - https://github.com/lmenezes/cerebro/releases/download/v${CEREBRO_VER}/cerebro-${CEREBRO_VER}.tgz | tar xzv --strip-components 1
RUN apk del openssl tar && \
    rm -rf /var/cache/apk/*
RUN chmod 700 run.sh

EXPOSE 9000

CMD ["./run.sh"]
