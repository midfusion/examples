#!/bin/sh
set -e

# Copy gateway.yaml to /tmp for safe processing
cp /app/config/gateway.yaml /tmp/gateway.yaml

# Replace env vars
sed -e "s|\${OPENAI_API_KEY}|$OPENAI_API_KEY|g" \
    -e "s|\${ANTHROPIC_API_KEY}|$ANTHROPIC_API_KEY|g" \
    -e "s|\${API_KEY_HASH_SECRET}|$API_KEY_HASH_SECRET|g" \
    /tmp/gateway.yaml > /tmp/gateway_expanded.yaml

# Run Midfusion Gateway using full path
exec /usr/local/bin/mf serve --config /tmp/gateway_expanded.yaml