FROM kong/kong-gateway:2.8.1.4-alpine
USER root
COPY dp-cert /certs/dp-cert
COPY dp-key /certs/dp-key
