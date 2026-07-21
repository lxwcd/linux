#!/bin/bash
#
#********************************************************************
#Author:            lx
#Date:              2025-10-12
#FileName:          gitee_private_repos_manager.sh
#URL:               http://github.com/lxwcd
#Description:       Gitee 私有仓库管理脚本（安全版本，不使用exit）
#Copyright (C):     2025 All rights reserved
#********************************************************************

# 配置变量
GITEE_USERNAME="cd-00"
GITEE_TOKEN="10b6b444f0b4d869eac67ba6fccab25c"
GITHUB_USERNAME="lxwcd"
TEMP_DIR="./gitee_temp"
LOG_FILE="./gitee_operation.log"

# 初始化日志
init_log() {
    echo "=== Gitee 私有仓库操作日志 ===" > "$LOG_FILE"
    echo "开始时间: $(date)" >> "$LOG_FILE"
    echo "" >> "$LOG_FILE"
}

# 记录日志
log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

# 安全错误处理
safe_error() {
    log "错误: $1"
    return 1
}

# 检查必要工具
check_dependencies() {
    local missing_tools=()
    
    if ! command -v curl &> /dev/null; then
        missing_tools+=("curl")
    fi
    
    if ! command -v jq &> /dev/null; then
        missing_tools+=("jq")
    fi
    
    if ! command -v git &> /dev/null; then
        missing_tools+=("git")
    fi
    
    if [ ${#missing_tools[@]} -gt 0 ]; then
        safe_error "缺少必要工具: ${missing_tools[*]}"
        echo "请安装缺少的工具后重试:"
        for tool in "${missing_tools[@]}"; do
            case $tool in
                "curl") echo "  - Ubuntu/Debian: sudo apt-get install curl" ;;
                "jq") echo "  - Ubuntu/Debian: sudo apt-get install jq" ;;
                "git") echo "  - Ubuntu/Debian: sudo apt-get install git" ;;
            esac
        done
        return 1
    fi
    
    log "所有必要工具已安装"
    return 0
}

# 测试 API 连通性
test_api_connectivity() {
    log "测试 Gitee API 连通性..."
    
    local response
    response=$(curl -s -w "\nHTTP_CODE:%{http_code}" -H "Authorization: token $GITEE_TOKEN" \
        "https://gitee.com/api/v5/user")
    
    local http_code
    http_code=$(echo "$response" | grep "HTTP_CODE:" | cut -d':' -f2)
    local json_response
    json_response=$(echo "$response" | sed '/HTTP_CODE:/d')
    
    if [ "$http_code" != "200" ]; then
        safe_error "API 连通性测试失败: HTTP $http_code"
        echo "响应内容: $json_response"
        return 1
    fi
    
    local username
    username=$(echo "$json_response" | jq -r '.login' 2>/dev/null)
    
    if [ -z "$username" ] || [ "$username" = "null" ]; then
        safe_error "无法解析 API 响应或令牌无效"
        return 1
    fi
    
    log "API 连通性正常，当前用户: $username"
    return 0
}

# 获取所有私有仓库（分页处理）
get_all_private_repos() {
    log "开始获取所有私有仓库（分页处理）..."
    
    local page=1
    local per_page=100
    local all_repos=""
    local total_pages=0
    
    while true; do
        log "获取第 $page 页..."
        
        local api_url
        api_url="https://gitee.com/api/v5/users/$GITEE_USERNAME/repos?type=all&page=$page&per_page=$per_page"
        
        local response
        response=$(curl -s -w "\nPAGE_HTTP_CODE:%{http_code}" -H "Authorization: token $GITEE_TOKEN" "$api_url")
        
        local page_http_code
        page_http_code=$(echo "$response" | grep "PAGE_HTTP_CODE:" | cut -d':' -f2)
        local json_data
        json_data=$(echo "$response" | sed '/PAGE_HTTP_CODE:/d')
        
        if [ "$page_http_code" != "200" ]; then
            log "第 $page 页请求失败: HTTP $page_http_code"
            break
        fi
        
        # 检查 JSON 是否有效
        if ! echo "$json_data" | jq -e '.' >/dev/null 2>&1; then
            log "第 $page 页响应不是有效 JSON"
            break
        fi
        
        # 获取当前页的仓库数量
        local page_count
        page_count=$(echo "$json_data" | jq length)
        if [ "$page_count" -eq 0 ]; then
            log "第 $page 页没有仓库，停止获取"
            break
        fi
        
        log "第 $page 页有 $page_count 个仓库"
        
        # 提取私有仓库
        local private_repos
        private_repos=$(echo "$json_data" | jq -r '.[] | select(.private == true) | .name' 2>/dev/null)
        
        if [ $? -eq 0 ] && [ -n "$private_repos" ]; then
            log "第 $page 页找到私有仓库: $(echo "$private_repos" | tr '\n' ' ')"
            all_repos="$all_repos"$'\n'"$private_repos"
        else
            log "第 $page 页没有私有仓库"
        fi
        
        # 检查是否还有更多页
        if [ "$page_count" -lt "$per_page" ]; then
            total_pages=$page
            log "已获取所有页面，总共 $total_pages 页"
            break
        fi
        
        page=$((page + 1))
        sleep 0.5
    done
    
    # 返回去重后的列表
    echo "$all_repos" | grep -v '^$' | sort -u
}

# 同步单个仓库到 GitHub
sync_repo_to_github() {
    local repo_name="$1"
    log "开始同步仓库: $repo_name"
    
    # 创建临时目录
    mkdir -p "$TEMP_DIR"
    cd "$TEMP_DIR" || return 1
    
    # 克隆或更新本地仓库
    if [ -d "$repo_name" ]; then
        log "更新现有仓库: $repo_name"
        cd "$repo_name" || return 1
        git pull origin main 2>/dev/null || git pull origin master 2>/dev/null
    else
        log "克隆新仓库: $repo_name"
        git clone "https://gitee.com/$GITEE_USERNAME/$repo_name.git" "$repo_name"
        cd "$repo_name" || return 1
    fi
    
    # 添加 GitHub 远程（如果不存在）
    if ! git remote | grep -q github; then
        git remote add github "https://github.com/$GITHUB_USERNAME/$repo_name.git"
    fi
    
    # 获取最新代码
    git fetch github
    
    # 获取当前分支
    local current_branch
    current_branch=$(git branch --show-current)
    
    # 尝试合并
    if git merge "github/$current_branch" --no-edit; then
        # 推送到 Gitee
        if git push origin "$current_branch"; then
            log "成功同步: $repo_name ($current_branch 分支)"
            cd ..
            return 0
        else
            log "推送失败: $repo_name"
            cd ..
            return 1
        fi
    else
        log "合并冲突: $repo_name (需要手动解决)"
        cd ..
        return 1
    fi
}

# 批量同步所有私有仓库
sync_all_private_repos() {
    log "开始批量同步所有私有仓库..."
    
    local private_repos
    private_repos=$(get_all_private_repos)
    
    if [ -z "$private_repos" ]; then
        log "没有找到需要同步的私有仓库"
        return 0
    fi
    
    local repo_count
    repo_count=$(echo "$private_repos" | wc -l)
    log "找到 $repo_count 个私有仓库需要同步"
    echo "$private_repos"
    
    # 确认操作
    echo ""
    read -r -p "确认要同步这些私有仓库吗？(y/N): " confirm
    if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
        log "操作已取消"
        return 0
    fi
    
    # 同步每个仓库
    local success_count=0
    local fail_count=0
    
    while IFS= read -r repo; do
        if [ -n "$repo" ]; then
            if sync_repo_to_github "$repo"; then
                success_count=$((success_count + 1))
            else
                fail_count=$((fail_count + 1))
            fi
            echo "" # 空行分隔
        fi
    done <<< "$private_repos"
    
    log "同步完成: 成功 $success_count 个, 失败 $fail_count 个"
    return $((fail_count > 0))
}

# 将私有仓库转为公开
make_repos_public() {
    log "开始将私有仓库转为公开..."
    
    local private_repos
    private_repos=$(get_all_private_repos)
    
    if [ -z "$private_repos" ]; then
        log "没有找到需要转换的私有仓库"
        return 0
    fi
    
    local repo_count
    repo_count=$(echo "$private_repos" | wc -l)
    log "找到 $repo_count 个私有仓库需要转为公开"
    echo "$private_repos"
    
    # 确认操作
    echo ""
    read -r -p "确认要将这些私有仓库转为公开吗？(y/N): " confirm
    if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
        log "操作已取消"
        return 0
    fi
    
    # 转换每个仓库
    local success_count=0
    local fail_count=0
    
    while IFS= read -r repo; do
        if [ -n "$repo" ]; then
            log "正在将仓库转为公开: $repo"
            
            local response
            response=$(curl -s -w "\nHTTP_CODE:%{http_code}" -X PATCH \
                -H "Authorization: token $GITEE_TOKEN" \
                -H "Content-Type: application/json" \
                -d '{"private": false}' \
                "https://gitee.com/api/v5/repos/$GITEE_USERNAME/$repo")
            
            local http_code
            http_code=$(echo "$response" | grep "HTTP_CODE:" | cut -d':' -f2)
            local json_response
            json_response=$(echo "$response" | sed '/HTTP_CODE:/d')
            
            if [ "$http_code" = "200" ]; then
                log "成功转为公开: $repo"
                success_count=$((success_count + 1))
            else
                log "操作失败: $repo (HTTP: $http_code)"
                echo "响应: $json_response"
                fail_count=$((fail_count + 1))
            fi
            
            sleep 1 # 避免 API 速率限制
        fi
    done <<< "$private_repos"
    
    log "转换完成: 成功 $success_count 个, 失败 $fail_count 个"
    return $((fail_count > 0))
}

# 显示菜单
show_menu() {
    echo ""
    echo "=== Gitee 私有仓库管理菜单 ==="
    echo "1. 测试 API 连通性"
    echo "2. 获取所有私有仓库列表"
    echo "3. 同步私有仓库到 GitHub"
    echo "4. 将私有仓库转为公开"
    echo "5. 查看操作日志"
    echo "6. 退出"
    echo ""
}

# 主函数
main() {
    # 初始化
    init_log
    log "脚本启动"
    
    # 检查依赖
    if ! check_dependencies; then
        log "依赖检查失败，脚本终止"
        return 1
    fi
    
    # 创建临时目录
    mkdir -p "$TEMP_DIR"
    
    # 主循环
    while true; do
        show_menu
        read -r -p "请选择操作 (1-6): " choice
        
        case $choice in
            1)
                test_api_connectivity
                ;;
            2)
                log "获取私有仓库列表操作"
                private_repos=$(get_all_private_repos)
                if [ -n "$private_repos" ]; then
                    echo "找到的私有仓库:"
                    echo "$private_repos"
                    log "找到 $(echo "$private_repos" | wc -l) 个私有仓库"
                else
                    echo "没有找到私有仓库"
                    log "没有找到私有仓库"
                fi
                ;;
            3)
                log "开始同步私有仓库到 GitHub"
                sync_all_private_repos
                ;;
            4)
                log "开始将私有仓库转为公开"
                make_repos_public
                ;;
            5)
                echo "=== 操作日志 ==="
                cat "$LOG_FILE"
                ;;
            6)
                log "用户选择退出脚本"
                echo "再见!"
                break
                ;;
            *)
                echo "无效选择，请重新输入"
                ;;
        esac
        
        echo ""
        read -r -p "按回车键继续..."
    done
    
    # 清理临时目录
    if [ -d "$TEMP_DIR" ]; then
        rm -rf "$TEMP_DIR"
        log "清理临时目录: $TEMP_DIR"
    fi
    
    log "脚本执行完成"
    return 0
}

# 运行主函数
main
