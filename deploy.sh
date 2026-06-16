#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

if ! command -v gh >/dev/null 2>&1; then
  echo "未找到 gh，请先安装: brew install gh"
  exit 1
fi

if ! gh auth status >/dev/null 2>&1; then
  echo "请先登录 GitHub（在终端中按提示操作）:"
  gh auth login
fi

REPO_OWNER="ZhangRuixiang999"
REPO_NAME="hive-field-namer"

if gh repo view "${REPO_OWNER}/${REPO_NAME}" >/dev/null 2>&1; then
  echo "仓库已存在，正在推送最新代码…"
  git remote remove origin 2>/dev/null || true
  git remote add origin "https://github.com/${REPO_OWNER}/${REPO_NAME}.git"
  git push -u origin main
else
  echo "正在创建 GitHub 仓库并推送…"
  gh repo create "${REPO_NAME}" \
    --public \
    --source=. \
    --remote=origin \
    --description "字段标准化命名工具 - 中英文直译 & snake_case 英文字段名" \
    --push
fi

echo ""
echo "=========================================="
echo "  推送完成！"
echo ""
echo "  1. 打开: https://github.com/${REPO_OWNER}/${REPO_NAME}/settings/pages"
echo "  2. Build and deployment → Source 选择「GitHub Actions」"
echo "  3. 等待 Actions 跑完后访问:"
echo "     https://zhangruixiang999.github.io/${REPO_NAME}/"
echo "=========================================="
