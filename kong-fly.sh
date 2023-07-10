#!/bin/sh

echo "configuring mTLS cert and key..."
mkdir /certs
echo $KONG_DP_CERT | base64 -d > /certs/dp-cert
echo $KONG_DP_KEY  | base64 -d > /certs/dp-key

echo "running kong's entrypoint.sh..."

/entrypoint.sh kong restart
