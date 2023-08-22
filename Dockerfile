FROM kong/kong-gateway:3.4
USER root
COPY kong-fly.sh /kong-fly.sh
ENTRYPOINT /kong-fly.sh
