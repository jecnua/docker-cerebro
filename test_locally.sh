#!/bin/sh
# No need to expose any port :)

export GOSS_WAIT_OPTS="-r 90s -s 1s > /dev/null"

# Run es but disable xpack.security
docker stop es.local
docker rm es.local
docker run -d \
  -p 9200:9200 \
  --name es.local \
  -e "xpack.security.enabled=false" \
  -e "http.host=0.0.0.0" \
  -e "transport.host=127.0.0.1" \
  docker.elastic.co/elasticsearch/elasticsearch:6.2.4

# Wait until it responds
echo "Waiting for elasticsearch to start up..."
until $(curl --output /dev/null --silent --head --fail http://localhost:9200); do
    printf '.'
    sleep 2
done
echo " "

docker run -it \
  -e ELASTICSEARCH_URL='http://localhost:9200' \
  -p 9000:9000 \
  jecnua/cerebro:dev-latest
