#!/bin/bash
#
#********************************************************************
#Author:            lx
#Date:              2025-10-12
#FileName:          1.sh
#URL:               http://github.com/lxwcd
#Description:       shell script
#Copyright (C):     2025 All rights reserved
#********************************************************************


#!/bin/bash
#
#********************************************************************
#Author:            lx
#Date:              2025-10-12
#FileName:          make_repos_public.sh
#URL:               http://github.com/lxwcd
#Description:       将 Gitee 私有仓库转为公开
#Copyright (C):     2025 All rights reserved
#********************************************************************

# 配置变量
GITEE_USERNAME="cd-00"
GITEE_TOKEN="10b6b444f0b4d869eac67ba6fccab25c"

# 检查是否安装了 jq
if ! command -v jq &> /dev/null; then
    echo "错误: jq 未安装。请先安装 jq 工具。"
fi

# 获取所有私有仓库列表
echo "获取 Gitee 私有仓库列表..."
REPOS=$(curl -s -H "Authorization: token $GITEE_TOKEN" \
  "https://gitee.com/api/v5/users/$GITEE_USERNAME/repos?type=all&page=1&per_page=100" | \
  jq -r '.[] | select(.private == true) | .name')

# 检查是否找到私有仓库
if [ -z "$REPOS" ]; then
    echo "没有找到私有仓库"
fi

echo "找到以下私有仓库:"
echo "$REPOS"
echo ""

# 确认操作
read -p "确认要将这些私有仓库转为公开吗？(y/N): " CONFIRM
if [[ ! $CONFIRM =~ ^[Yy]$ ]]; then
    echo "操作取消"
fi

# 逐个将私有仓库转为公开
for REPO in $REPOS; do
    echo "正在将仓库转为公开: $REPO"
    
    # 使用 PATCH 请求更新仓库可见性
    RESPONSE=$(curl -s -w "%{http_code}" -X PATCH \
      -H "Authorization: token $GITEE_TOKEN" \
      -H "Content-Type: application/json" \
      -d '{"private":false}' \
      "https://gitee.com/api/v5/repos/$GITEE_USERNAME/$REPO")
    
    HTTP_CODE=$(echo "$RESPONSE" | tail -n1)
    if [ "$HTTP_CODE" = "200" ]; then
        echo "✓ 成功转为公开: $REPO"
    else
        echo "✗ 操作失败: $REPO (HTTP: $HTTP_CODE)"
        echo "响应: $(echo "$RESPONSE" | head -n -1)"
    fi
    
    sleep 1  # 避免 API 速率限制
done

echo "所有私有仓库转为公开操作完成"
