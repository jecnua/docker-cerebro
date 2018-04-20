FROM openjdk:10-jre-slim

ENV CEREBRO_VER=0.7.3
ENV ELASTICSEARCH_URL='localhost:9200'

WORKDIR /cerebro

COPY run.sh run.sh

RUN apt-get update && \
  apt-get install -y openssl tar bash wget
RUN wget -O - https://github.com/lmenezes/cerebro/releases/download/v${CEREBRO_VER}/cerebro-${CEREBRO_VER}.tgz | tar xzv --strip-components 1
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
