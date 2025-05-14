# syntax=docker/dockerfile:1
# ---------- 运行时镜像 ----------
FROM node:20-alpine AS runtime

# 接收一个版本参数；默认始终装 latest
ARG INSPECTOR_VERSION=latest
RUN npm install -g @modelcontextprotocol/inspector@${INSPECTOR_VERSION}

# Inspector UI 默认 5173，代理默认 3000
EXPOSE 5173 3000

# 允许把真正要测试的 MCP 服务器命令作为参数传进来
ENTRYPOINT ["mcp-inspector"]
# 例如：
#   docker run ... mcp-inspector node build/index.js
