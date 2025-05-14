#!/bin/sh
exec mcp-inspector \
     --host 0.0.0.0 \
     --port  "$CLIENT_PORT" \
     --proxy-port "$SERVER_PORT" \
     "$@"
