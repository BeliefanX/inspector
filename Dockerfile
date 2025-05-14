# syntax=docker/dockerfile:1
# ───────────────────────────────────
#  MCP Inspector  —— beliefan 专用
#     • UI   : 5173
#     • Proxy: 3000
#     • Host : 0.0.0.0
# ───────────────────────────────────
FROM node:20-alpine

ARG INSPECTOR_VERSION=0.12.0       # 如需跟随最新，可改 latest
RUN npm i -g @modelcontextprotocol/inspector@${INSPECTOR_VERSION}

# ——官方 README 支持的环境变量覆盖端口——
ENV CLIENT_PORT=5173 \
    SERVER_PORT=3000

EXPOSE 5173 3000

# ——入口脚本——
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]
