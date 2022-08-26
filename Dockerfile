FROM kong/kong-gateway:2.8.1.4-alpine
USER root
COPY kong-fly.sh /kong-fly.sh
ENTRYPOINT /kong-fly.sh
