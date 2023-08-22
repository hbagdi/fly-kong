#!/bin/sh

echo "configuring mTLS cert and key..."
mkdir /certs
echo "DP cert is---"
echo -n $KONG_DP_CERT
echo "writing dp-cert to disk"
echo -n "$KONG_DP_CERT" | base64 -d > /certs/dp-cert
echo "writing dp-key to disk"
echo -n "$KONG_DP_KEY"  | base64 -d > /certs/dp-key

echo "running kong's entrypoint.sh..."

/entrypoint.sh kong restart
