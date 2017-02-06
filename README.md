# Cerebro docker image

https://github.com/lmenezes/cerebro

## Sources

### First

- https://github.com/orgsync/docker-cerebro

    jecnua/cerebro                                                                     v1                c48ec58596ca        34 hours ago        349 MB

### Second Reduce space

- https://github.com/Global-Solutions/docker-cerebro/blob/master/Dockerfile

    jecnua/cerebro v2 f3d1643a3c37 34 hours ago 149 MB # java:openjdk-8u111-jre-alpine
    jecnua/cerebro v1 c48ec58596ca 34 hours ago 349 MB #

This approach is a much lighter docker image.

### Thirds Problem: change configuration

Solved via this method

https://github.com/orgsync/docker-cerebro/blob/master/bin/pre-start

## Info

Why multiple RUN faster build/debug

## Notes

you need to pass http://
with the url

## Examples

Interactive:

    docker run -it \
    -e ELASTICSEARCH_URL=http://es5.test.co.uk \
    -p 9000:9000 \
    jecnua/cerebro:dev

## TODO

- FIX: [warn] application - Logger configuration in conf files is deprecated and has no effect. Use a logback configuration file instead.
