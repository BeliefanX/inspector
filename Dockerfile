# Dockerfile
FROM node:20-alpine

ARG INSPECTOR_VERSION=latest
RUN npm i -g @modelcontextprotocol/inspector@$INSPECTOR_VERSION

# ➜ 固定端口
ENV CLIENT_PORT=5173 \
    SERVER_PORT=3000

EXPOSE 5173 3000

# ➜ 固定监听地址
ENTRYPOINT ["mcp-inspector","--host","0.0.0.0"]
