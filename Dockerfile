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

# Metadata params
ARG BUILD_DATE
ARG VERSION
ARG VCS_URL
ARG VCS_REF

# Metadata
LABEL org.label-schema.build-date=$BUILD_DATE \
  org.label-schema.name="" \
  org.label-schema.description="" \
  org.label-schema.url="" \
  org.label-schema.vcs-url=$VCS_URL \
  org.label-schema.vcs-ref=$VCS_REF \
  org.label-schema.version=$VERSION \
  jecnua.docker.dockerfile="/Dockerfile" \
  jecnua.docker.license="MIT"

CMD ["./run.sh"]
