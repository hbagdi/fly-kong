FROM kong/kong-gateway:2.4.1.1-alpine

COPY ca-cert /certs/ca-cert
COPY dp-cert /certs/dp-cert
COPY dp-key /certs/dp-key
