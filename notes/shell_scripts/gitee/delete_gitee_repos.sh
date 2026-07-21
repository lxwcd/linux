#!/bin/bash
#
#********************************************************************
#Author:            lx
#Date:              2025-10-12
#FileName:          check_gitee_repos.sh
#URL:               http://github.com/lxwcd
#Description:       检查 Gitee 仓库状态
#Copyright (C):     2025 All rights reserved
#********************************************************************

# 配置变量
GITEE_USERNAME="cd-00"
GITEE_TOKEN="10b6b444f0b4d869eac67ba6fccab25c"

# 检查是否安装了 jq
if ! command -v jq &> /dev/null; then
    echo "错误: jq 未安装。请先安装 jq 工具。"
    echo "在 Ubuntu/Debian 上: sudo apt-get install jq"
    echo "在 CentOS/RHEL 上: sudo yum install jq"
    echo "或从 https://stedolan.github.io/jq/download/ 下载"
fi

# 获取所有仓库的详细信息
echo "获取 Gitee 仓库详细信息..."
RESPONSE=$(curl -s -w "\nHTTP_CODE:%{http_code}" -H "Authorization: token $GITEE_TOKEN" \
  "https://gitee.com/api/v5/users/$GITEE_USERNAME/repos?type=all&page=1&per_page=100")

# 提取 HTTP 状态码和 JSON 响应
HTTP_CODE=$(echo "$RESPONSE" | grep "HTTP_CODE:" | cut -d':' -f2)
JSON_RESPONSE=$(echo "$RESPONSE" | sed '/HTTP_CODE:/d')

# 检查 API 响应
if [ "$HTTP_CODE" != "200" ]; then
    echo "API 请求失败，HTTP 状态码: $HTTP_CODE"
    echo "响应内容: $JSON_RESPONSE"
fi

# 检查是否有仓库
REPO_COUNT=$(echo "$JSON_RESPONSE" | jq length)
if [ "$REPO_COUNT" -eq 0 ]; then
    echo "账户中没有仓库"
fi

echo "找到 $REPO_COUNT 个仓库:"
echo ""

# 显示所有仓库的详细信息
echo "仓库名称                 | 私有 | 描述"
echo "-------------------------|------|------------------------"
echo "$JSON_RESPONSE" | jq -r '.[] | "\(.name) | \(.private) | \(.description)"' | while read -r line; do
    # 格式化输出
    name=$(echo "$line" | cut -d'|' -f1 | xargs)
    private=$(echo "$line" | cut -d'|' -f2 | xargs)
    desc=$(echo "$line" | cut -d'|' -f3 | xargs)
    
    # 截断过长的描述
    if [ ${#desc} -gt 30 ]; then
        desc="${desc:0:27}..."
    fi
    
    printf "%-23s | %-4s | %s\n" "$name" "$private" "$desc"
done

echo ""
echo "详细分析:"
echo "=========="

# 统计私有仓库数量
PRIVATE_COUNT=$(echo "$JSON_RESPONSE" | jq '[.[] | select(.private == true)] | length')
echo "私有仓库数量: $PRIVATE_COUNT"

# 统计公开仓库数量
PUBLIC_COUNT=$(echo "$JSON_RESPONSE" | jq '[.[] | select(.private == false)] | length')
echo "公开仓库数量: $PUBLIC_COUNT"

# 列出所有私有仓库
if [ "$PRIVATE_COUNT" -gt 0 ]; then
    echo ""
    echo "私有仓库列表:"
    echo "$JSON_RESPONSE" | jq -r '.[] | select(.private == true) | "- \(.name) (\(.description))"'
else
    echo ""
    echo "没有找到私有仓库"
fi

# 检查令牌权限
echo ""
echo "令牌权限检查:"
echo "============="
USER_INFO=$(curl -s -H "Authorization: token $GITEE_TOKEN" "https://gitee.com/api/v5/user")
if echo "$USER_INFO" | jq -e '.login' > /dev/null; then
    USERNAME=$(echo "$USER_INFO" | jq -r '.login')
    echo "令牌有效，当前用户: $USERNAME"
else
    echo "令牌可能无效或权限不足"
    echo "响应: $USER_INFO"
fi
