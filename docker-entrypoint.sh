#!/bin/sh
# 作用：
#   1. 固定 host 为 0.0.0.0
#   2. 若用户在 `docker run` 里附加了服务器启动命令，就用 `--` 分隔
#   3. 没有附加命令时，用 `sleep infinity` 站位，避免老版本 CLI
#      在“无服务器命令”场景下触发 `--env` 解析 Bug

set -e

HOST_ARGS="--host 0.0.0.0"

if [ $# -eq 0 ]; then
  # 未给服务器命令，放一个空命令占位，Inspector 仍能正常起 UI
  exec mcp-inspector $HOST_ARGS -- sleep infinity
else
  # 用户传了服务器命令，插入 `--` 正确分隔
  exec mcp-inspector $HOST_ARGS -- "$@"
fi
