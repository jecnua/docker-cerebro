FROM openjdk:8-jre

ENV CEREBRO_VERSION 0.5.0
RUN mkdir /usr/local/lib/cerebro && \
    curl -L https://github.com/lmenezes/cerebro/releases/download/v$CEREBRO_VERSION/cerebro-$CEREBRO_VERSION.tgz | \
      tar xz -C /usr/local/lib/cerebro/ --strip-components 1 && \
    ln -s /usr/local/lib/cerebro/bin/cerebro /usr/local/bin/

COPY config/application.conf /usr/local/lib/cerebro/conf/application.conf

EXPOSE 9000

CMD ["/usr/local/bin/cerebro"]
