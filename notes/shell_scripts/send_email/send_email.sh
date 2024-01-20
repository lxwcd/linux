#!/bin/bash
#
#********************************************************************
#Author:            lx
#Date:              2024-01-20
#FileName:          send_email.sh
#URL:               http://github.com/lxwcd
#Description:       shell script
#Copyright (C):     2024 All rights reserved
#********************************************************************


#!/bin/bash

# 设置发送邮件的参数
sender_email="your_email@example.com"
smtp_server="smtp.example.com"
smtp_port="25" # 25, 465 for ssl
smtp_user="your_email@example.com"
smtp_password="email password"

email_subject="send email subject"

# 用户信息文件 如：Bob, example@163.com
user_file="user.txt" 

msg=""


gen_message() {
    user_name=$1
    msg=$(cat <<EOF 
Dear ${user_name},

  This is a sample email, sent by sendemail command at $(date).

Best regards,
Your Sender
EOF
)
}

# 读取用户信息文件和邮件模板文件
#: <<'END'
while IFS="," read -r name email; do
    if [ -z "${name}" ] || [ -z "${email}" ]; then
        continue
    fi

    # 生成个性化邮件内容
    gen_message ${name} 
    #echo "${name}:${email}"

    # 发送邮件
    sendemail \
        -f "${sender_email}" \
        -t "${email}" \
        -u "${email_subject}" \
        -m "${msg}" \
        -s "${smtp_server}:${smtp_port}" \
        -o message-charset=utf-8 \
        -o tls=yes \
        -xu "${smtp_user}" \
        -xp "${smtp_password}" \
        &> /dev/null

    [ $? -eq 0 ] && echo "send email to ${name}:${email} succeed!"  || echo "send email to ${name}:${email} failed!"

done < "${user_file}"
#END
