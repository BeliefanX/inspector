# syntax=docker/dockerfile:1
FROM node:20-alpine AS runtime

ARG INSPECTOR_VERSION=latest
RUN npm i -g @modelcontextprotocol/inspector@${INSPECTOR_VERSION}

# ——默认端口——
ENV CLIENT_PORT=5173 \
    SERVER_PORT=3000

# ——暴露端口——
EXPOSE 5173 3000

# ——启动脚本——
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]
