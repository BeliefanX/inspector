# syntax=docker/dockerfile:1
# ────────────────────────────────────────────────
#   MCP Inspector (beliefan 版)
#   * 默认 UI 端口：5173
#   * 默认代理端口：3000
#   * 始终监听 0.0.0.0
# ────────────────────────────────────────────────
FROM node:20-alpine AS runtime

# 如果日后想锁定版本，在构建时传入：
#   docker build --build-arg INSPECTOR_VERSION=0.10.0 .
ARG INSPECTOR_VERSION=latest

RUN npm install -g @modelcontextprotocol/inspector@${INSPECTOR_VERSION}

# ── 用官方支持的环境变量改端口 ───────────────────
#   README 说明：CLIENT_PORT / SERVER_PORT 可覆盖 6274 / 6277 :contentReference[oaicite:0]{index=0}
ENV CLIENT_PORT=5173 \
    SERVER_PORT=3000

# ── 对外暴露端口 ───────────────────────────────────
EXPOSE 5173 3000

# ── 启动：强制绑定所有网卡 ─────────────────────────
ENTRYPOINT ["mcp-inspector", "--host", "0.0.0.0"]
