#!/usr/bin/env bash

set -e
echo "hosts = [{host = \"$ELASTICSEARCH_URL\"}]" >> /cerebro/conf/application.conf
/cerebro/bin/cerebro
