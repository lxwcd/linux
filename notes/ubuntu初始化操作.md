ubuntu 22.04 初始化操作  
      
# 环境准备  
1. vmware 中安装 ubuntu22.04 无图形界面系统  
2. 准备好一个版本做好基本初始化操作，保存快照  
3. 做实验学习时复制初始化版本文件夹，修改 IP 和主机名，保存各自的初始化好的快照  
4. 每次实验前恢复到初始化完成后状态  
      
# bug  
## `/etc/bash_completion` 配置文件调用问题  
- 为了测试，在 `/etc/bash_completion` 的最上方写个说明  
```bash  
echo "/usr/share/bash-completion/bash_completion/bash_completion"  
```  
      
      
### root 以 interactive non-login shell 登录时不执行 `/etc/bash_completion`  
root 用户的 `~/.bashrc` 中对 `/etc/bash_completion` 的调用被注释  
```bash  
94  # enable programmable completion features (you don't need to enable  
  1 # this, if it's already enabled in /etc/bash.bashrc and /etc/profile  
  2 # sources /etc/bash.bashrc).  
  3 #if [ -f /etc/bash_completion ] && ! shopt -oq posix; then  
  4 #    . /etc/bash_completion  
  5 #fi  
```  
      
```bash  
[root@client2:~]$ su root  
[root@client2:~]$ echo $0  
bash  
```  
      
```bash  
[root@client2:~]$ su - root  
/usr/share/bash-completion/bash_completion/bash_completion  
[root@client2:~]$  
[root@client2:~]$ echo $0  
-bash  
```  
      
      
普通用户的 `~/.bashrc` 和 `/etc/skel/.bashrc` 中该部分没有注释，因此会调用执行  
      
```bash  
108 # enable programmable completion features (you don't need to enable  
  1 # this, if it's already enabled in /etc/bash.bashrc and /etc/profile  
  2 # sources /etc/bash.bashrc).  
  3 if ! shopt -oq posix; then  
  4   if [ -f /usr/share/bash-completion/bash_completion ]; then  
  5     . /usr/share/bash-completion/bash_completion  
  6   elif [ -f /etc/bash_completion ]; then  
  7     . /etc/bash_completion  
  8   fi  
  9 fi  
```  
```bash  
[root@client2:~]$ su lx  
/usr/share/bash-completion/bash_completion/bash_completion  
[lx@client2:root]$  
[lx@client2:root]$ echo $0  
bash  
```  
      
测试：  
```bash  
[root@client2:~]$ su - root  
/usr/share/bash-completion/bash_completion/bash_completion  
[root@client2:~]$  
[root@client2:~]$ echo $0  
-bash  
```  
      
      
      
### 普通用户以 interactive login shell 登录时执行两次 `/etc/bash_completion`  
- 在 `~lx/.bashrc` 中加上 `echo "~/.bashrc"` 来测试  
```bash  
echo "~/.bashrc"  
# enable programmable completion features (you don't need to enable  
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile  
# sources /etc/bash.bashrc).  
if ! shopt -oq posix; then  
  if [ -f /usr/share/bash-completion/bash_completion ]; then  
    . /usr/share/bash-completion/bash_completion  
  elif [ -f /etc/bash_completion ]; then  
    . /etc/bash_completion  
  fi  
fi  
```  
      
- 测试效果  
可以看见普通用户 lx 执行了脚本两次，第二次是在 `~lx/.bashrc` 中执行  
root 以 login shell 登录只执行一次  
      
```bash  
[root@client2:~]$ su - root  
/usr/share/bash-completion/bash_completion/bash_completion  
[root@client2:~]$  
[root@client2:~]$ su - lx  
/usr/share/bash-completion/bash_completion/bash_completion  
~/.bashrc  
/usr/share/bash-completion/bash_completion/bash_completion  
```  
      
- 查看其他执行 `bash_completion` 脚本的位置  
```bash  
[root@client2:~]$ dpkg -S bash_completion  
bash-completion: /usr/share/bash-completion/bash_completion  
bash-completion: /etc/profile.d/bash_completion.sh  
bash-completion: /usr/share/doc/bash/README.md.bash_completion.gz  
git: /etc/bash_completion.d/git-prompt  
apport: /etc/bash_completion.d/apport_completion  
bash-completion: /etc/bash_completion  
bash-completion: /usr/share/perl5/Debian/Debhelper/Sequence/bash_completion.pm  
apport, git: /etc/bash_completion.d  
```  
      
在 `/etc/profile.d/bash_completion.sh` 中也调用该脚本  
```bash  
# shellcheck shell=sh disable=SC1091,SC2039,SC2166  
# Check for interactive bash and that we haven't already been sourced.  
if [ "x${BASH_VERSION-}" != x -a "x${PS1-}" != x -a "x${BASH_COMPLETION_VERSINFO-}" = x ]; then  
      
    # Check for recent enough version of bash.  
    if [ "${BASH_VERSINFO[0]}" -gt 4 ] ||  
        [ "${BASH_VERSINFO[0]}" -eq 4 -a "${BASH_VERSINFO[1]}" -ge 2 ]; then  
        [ -r "${XDG_CONFIG_HOME:-$HOME/.config}/bash_completion" ] &&  
            . "${XDG_CONFIG_HOME:-$HOME/.config}/bash_completion"  
        if shopt -q progcomp && [ -r /usr/share/bash-completion/bash_completion ]; then  
            # Source completion code.  
            . /usr/share/bash-completion/bash_completion  
        fi  
    fi  
      
fi  
```  
      
- 总结  
      
1) 以 interactive login shell 登录时先通过 `/etc/profile` 调用 `/etc/profile.d` 目录中  
的 `bash_completion.sh` 脚本，该脚本调用 `/usr/share/bash-completion/bash_completion`  
      
因此，普通用户和root 都会执行该脚本一次  
      
      
2) 执行家目录中的 `.bashrc` 时，普通用户从 `/etc/skel` 目录中复制，又会调用该脚本，  
因此执行两次  
```bash  
echo "~/.bashrc"  
# enable programmable completion features (you don't need to enable  
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile  
# sources /etc/bash.bashrc).  
if ! shopt -oq posix; then  
  if [ -f /usr/share/bash-completion/bash_completion ]; then  
    . /usr/share/bash-completion/bash_completion  
  elif [ -f /etc/bash_completion ]; then  
    . /etc/bash_completion  
  fi  
fi  
```  
      
root 家目录的 `.bashrc` 没有注释该脚本的调用，因此只执行一次  
      
      
### 解决  
- root 家目录的 `.bashrc` 中取消对 `/etc/bash_completion` 脚本调用的注释  
防止 non-login shell 登录不执行该脚本  
```bash  
# enable programmable completion features (you don't need to enable  
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile  
# sources /etc/bash.bashrc).  
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then  
    . /etc/bash_completion  
fi  
```  
      
- 在脚本中加入防止执行两次的处理  
参考 rocky8 防止两次执行 `/etc/bashrc` 脚本的方案  
      
在 `/usr/share/bash-completion/bash_completion` 脚本中命令前加上如下判断：  
```bash  
ubuntu@VM-ubuntu22:~$ sudo vim $(cut /etc/bash_completion -d ' ' -f2)  
```  
```bash  
# Prevent doublesourcing  
if [ -z "$COMPLETION_SOURCED" ]; then  
  COMPLETION_SOURCED="Y"  
else  
  return  
fi  
```  
      
      
# 初始化操作  
初始化脚本为 [init.sh](https://github.com/lxwcd/linux/blob/main/notes/shell_scripts/ubuntu2204/init.sh)  
      
## 确认语言环境  
- 查看当前支持语言列表  
```bash  
[root@ubunut22:~]$ localectl list-locales  
C.UTF-8  
en_AG.UTF-8  
en_AU.UTF-8  
en_BW.UTF-8  
en_CA.UTF-8  
en_DK.UTF-8  
en_GB.UTF-8  
en_HK.UTF-8  
en_IE.UTF-8  
en_IL.UTF-8  
en_IN.UTF-8  
en_NG.UTF-8  
en_NZ.UTF-8  
en_PH.UTF-8  
en_SG.UTF-8  
en_US.UTF-8  
en_ZA.UTF-8  
en_ZM.UTF-8  
en_ZW.UTF-8  
zh_CN.UTF-8  
```  
- 查看当前使用的语言环境  
```bash  
[root@ubuntu2204 ~]#echo $LANG  
en_US.UTF-8  
```  
- 修改语言环境  
```bash  
[root@ubunut22:~]$ localectl set-locale LANG=en_US.UTF-8  
```  
- 修改完后重启  
      
## 修改软件源  
```bash  
sed -i.orig 's/cn.archive.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list  
```  
## 修改系统时区  
      
### 利用 timedatectl 修改时区  
不记得时补全  
```bash  
[root@docker Asia]$ timedatectl set-timezone Asia/Shanghai  
```  
      
### 利用 tzdata 修改时区  
安装 tzdata，该软件是交互安装，第一次选择 Asia(6)，第二次选择 Shanghai(70)  
用下面方式安装不用交互  
```bash  
echo -e "6\n70" | sudo apt install -y tzdata  
```  
      
## 检查系统时间  
- 查看系统的时区是否正确  
1) `date` 查看时区，如中国应为 CST  
```bash  
[root@ubuntu22 ~]#date  
Tue May  9 07:26:48 PM CST 2023  
```  
      
2) 或者 `timedatectl` 查看  
RTC 为 real time clock，为硬件时钟  
Local time 为设置的时区所在的软件时钟  
UTC 为 universal time clock，为格林威治标准时间，以及地球旋转计算的时间  
      
```bash  
[root@ubuntu22 ~]#timedatectl status  
               Local time: Tue 2023-05-09 19:37:45 CST  
           Universal time: Tue 2023-05-09 11:37:45 UTC  
                 RTC time: Tue 2023-05-09 11:37:45  
                Time zone: Asia/Shanghai (CST, +0800)  
System clock synchronized: yes  
              NTP service: active  
          RTC in local TZ: no  
```  
      
- 检查时间是否正确  
`hwclock` 检查硬件时钟  
`date` 查看软件时间  
或者用 `timedatectl status` 查看  
      
      
- 如果硬件时间和软件时间不相同，则用 hwclock 来设置  
```bash  
Usage:  
 hwclock [function] [option...]  
      
Time clocks utility.  
      
Functions:  
 -r, --show           display the RTC time  
     --get            display drift corrected RTC time  
     --set            set the RTC according to --date  
 -s, --hctosys        set the system time from the RTC  
 -w, --systohc        set the RTC from the system time  
```  
      
- date 修改软件时间  
如果手动修改软件时间，可以用 `date -s`  
      
      
## 创建 root 密码  
- Ubuntu 安装时为设置 root 密码，创建的用户默认在 sudo 组中  
- 用安装时创建的用户修改 root 密码 `sudo passwd root`  
      
      
## 创建自定义设置脚本  
- 需要考虑 interactive login shell 和 interactive non-login shell 两种登录  
- 两种登录均会调用的 shell 脚本  
- 将自定义设置写在脚本中  
      
1. interactive login shell 执行顺序  
- `/etc/profile`  
    - `/etc/bash.bashrc`  
    - `/etc/profile.d/*.sh`  
- `~/.profile`  
    - `~/.bashrc`  
    - `~/.bash_aliases`  
2. interactive non-login shell 执行顺序  
- `~/.profile`  
    - `~/.bashrc`  
    - `~/.bash_aliases`  
      
因此两种方式最后都会执行 `~/.bashrc`，在用户家目录的 `.bashrc` 和 `/etc/skel/.bashrc` 中追加对自定义脚本 `bash_custom.sh` 的调用，如下：  
```bash  
#!/bin/bash  
#  
#Description:       创建自定义脚本 为了让 interactive login 和 non-login 用户都生效，放在 ~/bash_custom  
#                   在 ~/.bashrc 中添加对 ~/bash_custom.sh 的调用  
  
custom_script="bash_custom.sh"  
skel_script="/etc/skel/${custom_script}"  
  
# 检查skel_script文件是否存在 存在则覆盖，可以用于更新脚本  
# [ -f "${skel_script}" ] && return  
  
# ~/.bashrc 添加自定义脚本的调用  
modify_bashrc () {  
    if grep -q "${custom_script}" "$1"; then   
        return;   
    fi  
  
    cat <<EOF >> $1  
if [ -f ~/bash_custom.sh ]; then  
    . ~/bash_custom.sh  
fi  
EOF  
}  
  
# 修改 /etc/skel/.bashrc  
modify_bashrc "/etc/skel/.bashrc"  
  
sudo cp ${custom_script} /etc/skel/  
  
# 拷贝到已有的用户家目录   
for user_home in /home/*; do  
    if [ -d "${user_home}" ]; then  
        user_script="${user_home}/${custom_script}"  
  
        modify_bashrc "${user_home}/.bashrc"  
        # 检查用户目录中是否已存在bash_custom.sh文件  
        if [ ! -f "${user_script}" ]; then  
            # 文件不存在，执行拷贝和设置所有者的操作  
            cp "${skel_script}" "${user_script}"  
            chown $(basename ${user_home}):$(basename ${user_home}) "${user_script}"  
            echo "bash_custom.sh copied to $user_home"  
        fi  
    fi  
done  
  
  
# 拷贝到 root 家目录  
modify_bashrc "/root/.bashrc"  
if [ ! -f "/root/${custom_script}" ]; then  
    cp ${custom_script} /root/${custom_script}  
fi  
  
# 让当前用户配置生效  
. ~/${custom_script}  
```  
      
## 创建自定义 vim 配置文件  
- vim 版本为 `version 8.2.4919`  
      
- vimrc 文件如下  
输入 `vim` 后命令行输入 `:version` 查看  
```bash  
   system vimrc file: "$VIM/vimrc"  
     user vimrc file: "$HOME/.vimrc"  
 2nd user vimrc file: "~/.vim/vimrc"  
      user exrc file: "$HOME/.exrc"  
       defaults file: "$VIMRUNTIME/defaults.vim"  
  fall-back for $VIM: "/usr/share/vim"  
```  
      
- 系统 vimrc 文件为 `/$VIM/vimrc`，初始执行的文件，后面执行的文件中有相同配置会覆盖此文件的设置  
命令行输入 `:echo $VIM` 查看变量值  
```bash  
/usr/share/vim  
```  
      
`/usr/share/vim/vimrc` 是 `/etc/vim/vimrc` 的软链接文件  
```bash  
[root@ubuntu22-c0 ~]$ ll /usr/share/vim/vimrc  
lrwxrwxrwx 1 root root 14 Apr 18 19:40 /usr/share/vim/vimrc -> /etc/vim/vimrc  
```  
      
`/etc/vim/vimrc` 中调用 `/etc/vim/vimrc.local`，默认没有该文件，可创建来定义全局的配置  
```bash  
" Source a global configuration file if available  
if filereadable("/etc/vim/vimrc.local")  
  source /etc/vim/vimrc.local  
endif  
```  
      
- 执行完系统 vimrc 配置文件后，加载用户各自的配置文件  
默认没有该文件，为用户创建的自定义配置，有两种路径  
    - `$HOME/.vimrc`  
    - `~/.vim/vimrc`  
      
- 如果没有自定义的 vimrc 文件，则会执行 `$VIMRUNTIME/defaults.vim`  
该文件执行规则可以在 vim 的命令行输入 `:h defaults.vim` 查看：  
```  
If Vim is started normally and no user vimrc file is found, the  
$VIMRUNTIME/defaults.vim script is loaded.  This will set 'compatible' off,  
switch on syntax highlighting and a few more things.  See the script for  
details.  NOTE: this is done since Vim 8.0, not in Vim 7.4. (it was added in  
patch 7.4.2111 to be exact).  
      
This should work well for new Vim users.  If you create your own .vimrc, it is  
recommended to add these lines somewhere near the top: >  
        unlet! skip_defaults_vim  
        source $VIMRUNTIME/defaults.vim  
Then Vim works like before you had a .vimrc. Copying $VIMRUNTIME/vimrc_example  
is way to do this.  Alternatively, you can copy defaults.vim to your .vimrc  
and modify it (but then you won't get updates when it changes).  
      
If you don't like some of the defaults, you can still source defaults.vim and  
revert individual settings.  See the defaults.vim file for hints on how to  
revert each item.  
      
If you use a system-wide vimrc and don't want defaults.vim to change settings,  
set the "skip_defaults_vim" variable.  If this was set and you want to load  
defaults.vim from your .vimrc, first unlet skip_defaults_vim, as in the  
example above.  
```  
      
- 方案  
因此，想自定义 vimrc 全局生效，可以创建  `/etc/vim/vimrc.local` 文件  
然后禁用 `$VIMRUNTIME/defaults.vim` 文件，  
可以在 `$VIMRUNTIME/defaults.vim` 文件的最上面设置变量 `skip_defaults_vim` 变量，即 `let g:skip_defaults_vim = 1`  
      
`$VIMRUNTIME` 的位置为 `/usr/share/vim/vim82`  
`$VIMRUNTIME/defaults.vim` 部分内容如下：  
```  
" The default vimrc file.  
"  
" Maintainer:   Bram Moolenaar <Bram@vim.org>  
" Last change:  2021 Nov 17  
"  
" This is loaded if no vimrc file was found.  
" Except when Vim is run with "-u NONE" or "-C".  
" Individual settings can be reverted with ":set option&".  
" Other commands can be reverted as mentioned below.  
      
let g:skip_defaults_vim = 1  
      
" When started as "evim", evim.vim will already have done these settings.  
if v:progname =~? "evim"  
  finish  
endif  
      
" Bail out if something that ran earlier, e.g. a system wide vimrc, does not  
" want Vim to use these default values.  
if exists('skip_defaults_vim')  
  finish  
endif  
```  
      
      
## 关闭 SELinux 和防火墙  
ubuntu22.04 默认没装 SELinux，其防火墙 UFW 也未开启  
      
```bash  
[root@ubuntu22-c0 ~]$ ufw status  
Status: inactive  
[root@ubuntu22-c0 ~]$ man selinux  
No manual entry for selinux  
```  
      
      
## 指定创建用户时是否创建 mail spool  
- ubuntu 22.04 默认不创建 mail spool，rocky 8.6 默认创建  
- 将 ubuntu 22.04 `/etc/default/useradd` 文件中的 `CREATE_MAIL_SPOOL` 那行取消注释则  
在 `/var/mail/` 目录中为用户创建邮件文件  
      
从 `/etc/login.defs` 说明，ubuntu22.04 不再将 `MAIL_DIR` 作为环境变量，  
该变量修改后仅在 `useradd/userdel/usermod` 命令中使用  
      
如果不创建邮件文件，用 `userdel -rf` 删除用户时会提示没有邮件文件  
      
```bash  
 13 # REQUIRED for useradd/userdel/usermod  
 14 #   Directory where mailboxes reside, _or_ name of file, relative to the  
 15 #   home directory.  If you _do_ define MAIL_DIR and MAIL_FILE,  
 16 #   MAIL_DIR takes precedence.  
 17 #  
 18 #   Essentially:  
 19 #      - MAIL_DIR defines the location of users mail spool files  
 20 #        (for mbox use) by appending the username to MAIL_DIR as defined  
 21 #        below.  
 22 #      - MAIL_FILE defines the location of the users mail spool files as the  
 23 #        fully-qualified filename obtained by prepending the user home  
 24 #        directory before $MAIL_FILE  
 25 #  
 26 # NOTE: This is no more used for setting up users MAIL environment variable  
 27 #       which is, starting from shadow 4.0.12-1 in Debian, entirely the  
 28 #       job of the pam_mail PAM modules  
 29 #       See default PAM configuration files provided for  
 30 #       login, su, etc.  
 31 #  
 32 # This is a temporary situation: setting these variables will soon  
 33 # move to /etc/default/useradd and the variables will then be  
 34 # no more supported  
 35 MAIL_DIR        /var/mail  
 36 #MAIL_FILE      .mail  
```  
      
`/etc/default/useradd` 文件中取消注释  
```bash  
  2 # Defines whether the mail spool should be created while  
  1 # creating the account  
36  CREATE_MAIL_SPOOL=yes  
```  
      
      
## 邮件配置  
> [安装 sendemail shell 脚本](shell_scripts/send_email/install_sendemail.sh)  
> [发送邮件 shell 脚本](shell_scripts/send_email/send_email.sh)  
    
利用 sendemail 发送邮件  
      
- 发送邮件的邮箱开启 SMTP 服务  
![](img/2023-08-29-18-39-55.png)  
      
- 安装 sendemail  
```bash  
apt update; apt install -y libio-socket-ssl-perl libnet-ssleay-perl sendemail  
```  
      
- 利用 sendemail 发送邮件  
可以写到脚本中，脚本放在 PATH 环境变量中，如 /usr/local/bin 目录下  
      
```bash  
#!/bin/bash  
#  
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
```  
      
      
## 安全设置  
- 可以设置 `set -u` 当使用错误变量时认为出错  
```bash  
 -u  Treat unset variables as an error when substituting.  
```  
      
      
## ssh 远程登录设置  
初始先安装 ssh 服务端  
```bash  
apt update && apt install -y openssh-server  
```  
  
### 查看 ssh 配置文件  
`dpkg` 找到 ssh 服务端包名  
```bash  
root@ubuntu22 ~ $ dpkg -l | grep -i ssh | tr -s "[[:blank:]]" " "  
ii libssh-4:amd64 0.9.6-2build1 amd64 tiny C SSH library (OpenSSL flavor)  
ii openssh-client 1:8.9p1-3ubuntu0.1 amd64 secure shell (SSH) client, for secure access to remote machines  
ii openssh-server 1:8.9p1-3ubuntu0.1 amd64 secure shell (SSH) server, for secure access from remote machines  
ii openssh-sftp-server 1:8.9p1-3ubuntu0.1 amd64 secure shell (SSH) sftp server module, for SFTP access from remote machines  
ii ssh-import-id 5.11-0ubuntu1 all securely retrieve an SSH public key and install it locally  
```  
查看配置文件，在 `/etc/` 目录下，服务端配置文件名有 `d`，为 `/etc/ssh/sshd_config.d`  
```bash  
root@ubuntu22 ~ $ dpkg -L openssh-server  | grep -i "\/etc" | tr -s "[[:blank:]]" " "  
/etc  
/etc/default  
/etc/default/ssh  
/etc/init.d  
/etc/init.d/ssh  
/etc/pam.d  
/etc/pam.d/sshd  
/etc/ssh  
/etc/ssh/moduli  
/etc/ssh/sshd_config.d  
/etc/ufw  
/etc/ufw/applications.d  
/etc/ufw/applications.d/openssh-server  
```  
      
      
### 允许 root 远程登录  
编辑 `/etc/ssh/sshd_config` 文件，做下面修改：  
```bash  
#PermitRootLogin prohibit-password  
PermitRootLogin yes  
```  
      
### 允许空密码远程登录  
```bash  
#PermitEmptyPasswords no  
PermitEmptyPasswords yes  
```  
      
### 第一次 ssh 连接服务端时跳过 yes 输入  
本机作为客户端要连接另一个服务端时，第一次连接会显示指纹，需要手动输入 `yes`  
```bash  
[root@client2:.ssh]$ ssh 10.0.0.83  
The authenticity of host '10.0.0.83 (10.0.0.83)' can't be established.  
ED25519 key fingerprint is SHA256:79+7Kl1TAiNCPzDdmMcgKetf3vADMOxOS+lKRDsss9s.  
This key is not known by any other names  
Are you sure you want to continue connecting (yes/no/[fingerprint])?  
```  
      
1. 修改客户端配置文件永久生效  
如果想跳过直接连接，可以修改 ssh 客户端配置文件  
用 `man ssh_config` 查看帮助文档  
```bash  
StrictHostKeyChecking  
  If this flag is set to yes, ssh(1) will never automatically add host keys to the  
  ~/.ssh/known_hosts file, and refuses to connect to hosts whose host key has changed.  This pro‐  
  vides maximum protection against man-in-the-middle (MITM) attacks, though it can be annoying when  
  the /etc/ssh/ssh_known_hosts file is poorly maintained or when connections to new hosts are fre‐  
  quently made.  This option forces the user to manually add all new hosts.  
      
  If this flag is set to accept-new then ssh will automatically add new host keys to the user's  
  known_hosts file, but will not permit connections to hosts with changed host keys.  If this flag  
  is set to no or off, ssh will automatically add new host keys to the user known hosts files and  
  allow connections to hosts with changed hostkeys to proceed, subject to some restrictions.  If  
  this flag is set to ask (the default), new host keys will be added to the user known host files  
  only after the user has confirmed that is what they really want to do, and ssh will refuse to  
  connect to hosts whose host key has changed.  The host keys of known hosts will be verified auto‐  
  matically in all cases.  
```  
CheckHostIP  
  If set to yes ssh(1) will additionally check the host IP address in the known_hosts file.  This  
  allows it to detect if a host key changed due to DNS spoofing and will add addresses of destina‐  
  tion hosts to ~/.ssh/known_hosts in the process, regardless of the setting of  
  StrictHostKeyChecking.  If the option is set to no (the default), the check will not be executed.  
```  
      
编辑 `/etc/ssh/ssh_config` 文件，做下面修改：  
```bash  
 1 #   StrictHostKeyChecking ask  
36      StrictHostKeyChecking no  
```  
修改后直接就能生效  
      
2. 命令行设置选项临时生效  
```bash  
[root@client2:.ssh]$ ssh -o StrictHostKeyChecking=no root@10.0.0.83  
Warning: Permanently added '10.0.0.83' (ED25519) to the list of known hosts.  
Activate the web console with: systemctl enable --now cockpit.socket  
      
Last login: Sat May 13 13:24:09 2023 from 10.0.0.83  
```  
      
3. 设置别名，根据情况选择命令选项  
设置别名为了永久生效，放到之前建立的  `/etc/bash_custom` 文件中  
```bash  
alias ssh_noask='ssh -o StrictHostKeyChecking=no '  
```  
使配置生效：  
```bash  
[root@ubuntu22-c0 ~]$ . /etc/bash_custom  
[root@ubuntu22-c0 ~]$ alias ssh_noask  
alias ssh_noask='ssh -o StrictHostKeyChecking=no '  
```  
测试：  
```bash  
[root@ubuntu22-c0 ~]$ ssh 10.0.0.160  
The authenticity of host '10.0.0.160 (10.0.0.160)' can't be established.  
ED25519 key fingerprint is SHA256:mIKaNdEZjhLK4lSyWlVtBy/tJ1KNmM9413+abzPl7gw.  
This key is not known by any other names  
Are you sure you want to continue connecting (yes/no/[fingerprint])? no  
Host key verification failed.  
[root@ubuntu22-c0 ~]$ ssh_noask 10.0.0.160  
Warning: Permanently added '10.0.0.160' (ED25519) to the list of known hosts.  
Welcome to Ubuntu 22.04 LTS (GNU/Linux 5.15.0-71-generic x86_64)  
```  
      
如果想将配置文件改为 `no`，可以再定义一个别名，临时使用验证：  
```bash  
alias ssh_ask="ssh -o StrictHostKeyChecking=ask "  
```  
      
      
      
### ssh 基于密钥连接  
1. 用 `ssh-keygen` 生成密钥对，算法用默认选项，不设置密码  
```bash  
[root@ubuntu22-c0 ~]$ ssh-keygen  
Generating public/private rsa key pair.  
Enter file in which to save the key (/root/.ssh/id_rsa):  
/root/.ssh/id_rsa already exists.  
Overwrite (y/n)? y  
Enter passphrase (empty for no passphrase):  
Enter same passphrase again:  
Your identification has been saved in /root/.ssh/id_rsa  
Your public key has been saved in /root/.ssh/id_rsa.pub  
The key fingerprint is:  
SHA256:7Ukvg66IKyOurjCrtfJF0FzZ/jfzSoeLTuHdD8ZLp6s root@ubuntu22-c0  
The key's randomart image is:  
+---[RSA 3072]----+  
|      .o         |  
|   o .. .        |  
|  . o  .         |  
|   .    ..       |  
|    .   S.+      |  
|   .     =.=++   |  
|o . .   . B.=+B .|  
|*+ + . . . = =.* |  
|%B=.. ....o Eo+..|  
+----[SHA256]-----+  
```  
      
2. 查看 `~/.ssh` 可以看到生成的密钥对文件  
```bash  
[root@ubuntu22-c0 .ssh]$ pwd  
/root/.ssh  
[root@ubuntu22-c0 .ssh]$ ls -a  
.  ..  authorized_keys  id_rsa  id_rsa.pub  known_hosts  
[root@ubuntu22-c0 .ssh]$ ll  
total 20  
drwx------ 2 root root 4096 May 11 20:04 ./  
drwx------ 5 root root 4096 May 11 20:07 ../  
-rw------- 1 root root    0 Feb 21 08:28 authorized_keys  
-rw------- 1 root root 2602 May 11 20:02 id_rsa  
-rw-r--r-- 1 root root  570 May 11 20:02 id_rsa.pub  
-rw------- 1 root root    1 May 11 20:04 known_hosts  
```  
      
3. 在 mobaxterm 上导入公钥  
      
      
## 安装 network-manager  
1. 安装包  
```bash  
sudo apt install -y network-manager  
```  
      
2. 修改网卡配置文件  
> netplan 官网：[netplan](https://netplan.io/)  
> ubuntu 网卡配置文件参数介绍：[netplan.5.html](https://manpages.ubuntu.com/manpages/bionic/man5/netplan.5.html)  
> [Netplan network configuration tutorial for beginners](https://linuxconfig.org/netplan-network-configuration-tutorial-for-beginners)  
      
在 `/etc/netplan` 目录下的 `/.yaml` 网卡配置文件中指定 `renderer` 为 `NetworkManager`  
```bash  
  # This file describes the network interfaces available on your system  
1 # For more information, see netplan(5).  
2 network:  
3   version: 2  
4  #renderer: networkd  
5   renderer: NetworkManager  
```  
      
## 修改网卡名  
- Ubuntu中如果只有一个网卡，其名字改为旧的明明方式后，如果改为 `eth1` 则不能生效，  
  设置为 `eth0` 才能正常用？（网卡配置文件设置，网卡配置文件名均修改）  
      
### 查看启动方式 BIOS 还是 UEFI  
> [Guide To Check UEFI or BIOS In Windows/Linux System](https://servonode.com/check-uefi-or-bios-in-widows-or-linux)  
      
- 查看 /sys/firmware/efi 目录  
`/sys/firmware/efi` 目录存在则为 UEFI 启动  
      
```bash  
[root@ubuntu22-c0 ~]$ ls /sys/firmware/  
acpi/   dmi/    memmap/  
```  
      
从结果可知改启动方式为 BIOS  
      
## 修改网卡命名规则  
      
1. 查看初始网卡名  
`ip a` 或者 `ip link` 查看初始网卡名为 ens33：  
```bash  
root@ubuntu22 init.d $ ip a  
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000  
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00  
    inet 127.0.0.1/8 scope host lo  
       valid_lft forever preferred_lft forever  
    inet6 ::1/128 scope host  
       valid_lft forever preferred_lft forever  
2: ens33: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000  
    link/ether 00:0c:29:e7:c8:8e brd ff:ff:ff:ff:ff:ff  
    altname enp2s1  
    inet 10.0.0.157/24 metric 100 brd 10.0.0.255 scope global dynamic ens33  
       valid_lft 921sec preferred_lft 921sec  
    inet6 fe80::20c:29ff:fee7:c88e/64 scope link  
       valid_lft forever preferred_lft forever  
```  
      
2. 修改 /etc/default/grub 配置文件  
```bash  
root@ubuntu22 init.d $ vim /etc/default/grub  
      
# If you change this file, run 'update-grub' afterwards to update  
# /boot/grub/grub.cfg.  
# For full documentation of the options in this file, see:  
#   info -f grub -n 'Simple configuration'  
      
GRUB_DEFAULT=0  
GRUB_TIMEOUT_STYLE=hidden  
GRUB_TIMEOUT=0  
GRUB_DISTRIBUTOR=`lsb_release -i -s 2> /dev/null || echo Debian`  
GRUB_CMDLINE_LINUX_DEFAULT=""  
#GRUB_CMDLINE_LINUX="" #默认该变量为空  
      
# 新增两个内核参数  
GRUB_CMDLINE_LINUX=" net.ifnames=0"  
```  
      
3. 更新 /boot/grub/grub.cfg  
系统为 BIOS 引导方式  
      
- 方法一：执行 update-grub 命令更新 /boot/grub/grub.cfg  
```bash  
[root@ubuntu22-c0 ~]$ whatis update-grub  
update-grub (8)      - stub for grub-mkconfig  
```  
```bash  
root@ubuntu22 init.d $ update-grub  
Sourcing file `/etc/default/grub'  
Sourcing file `/etc/default/grub.d/init-select.cfg'  
Generating grub configuration file ...  
Found linux image: /boot/vmlinuz-5.15.0-69-generic  
Found initrd image: /boot/initrd.img-5.15.0-69-generic  
Found linux image: /boot/vmlinuz-5.15.0-67-generic  
Found initrd image: /boot/initrd.img-5.15.0-67-generic  
Warning: os-prober will not be executed to detect other bootable partitions.  
Systems on them will not be added to the GRUB boot configuration.  
Check GRUB_DISABLE_OS_PROBER documentation entry.  
done  
```  
      
- 方法二： 执行命令 `grub-mkconfig -o /boot/grub/grub.cfg`  
结果和上面方法相同  
      
4. 修改网卡配置文件  
- 需要在 `/etc/netplan` 目录下的 `.yaml` 网卡配置文件中的网卡名改为新的网卡名  
- 可以将网卡配置名字改为新网卡名，如 `eth0.yaml`  
- 和 rocky8 不同，所有网卡配置（除了环回网络接口）都可写到一个配置文件中  
- 和 rocky8 不同，网卡配置文件的名字不需要和网卡的设备名相同，如全部网卡配置一个文件 `00-network-manager.yaml`  
- 让网卡配置文件生效 `netplan apply`  
- 可以将原始配置文件放在一个备份目录中  
- 注意指明默认网关时的参数 `gateway4` 已经被弃用，用新用法代替：  
```bash  
gateway4, gateway6 (scalar)  
  Deprecated, see Default routes.  Set default gateway for IPv4/6, for manual  address  configura‐  
  tion.   This  requires  setting  addresses too.  Gateway IPs must be in a form recognized by in‐  
  et_pton(3).  There should only be a single gateway per IP address family set in your global con‐  
  fig,  to make it unambiguous.  If you need multiple default routes, please define them via rout‐  
  ing-policy.  
      
  Example for IPv4: gateway4: 172.16.0.1 Example for IPv6: gateway6: "2001:4::1"  
```  
```bash  
Default routes  
  The most common need for routing concerns the definition of default routes to reach the wider Internet.  
  Those default routes can only defined once per IP family and routing table.  A  typical  example  would  
  look like the following:  
      
        eth0:  
          [...]  
          routes:  
          - to: default # could be 0/0 or 0.0.0.0/0 optionally  
            via: 10.0.0.1  
            metric: 100  
            on-link: true  
          - to: default # could be ::/0 optionally  
            via: cf02:de:ad:be:ef::2  
        eth1:  
          [...]  
          routes:  
          - to: default  
            via: 172.134.67.1  
            metric: 100  
            on-link: true  
            table: 76 # Not on the main routing table, does not conflict with the eth0 default route  
```  
- 修改配置文件中的 `match` 的 `name` 并不会修改 `nmcli connection` 看到的 NAME 字段  
```bash  
    # This file describes the network interfaces available on your system  
  1 # For more information, see netplan(5).  
  2 network:  
  3   version: 2  
  4  #renderer: networkd  
  5   renderer: NetworkManager  
  6   ethernets:  
  7     eth0:  
  8       match:  
  9         name: eth0  
 10       addresses:  
 11       - 10.0.0.200/24  
 12      #gateway4: 10.0.0.2  
 13       routes:  
 14       - to: default  
 15         via: 10.0.0.2  
```  
`NAME` 字段的结果为 `netplan-eth0` 非 `eth0`，和 rocky8 不同  
```bash  
[root@ubuntu22-c0 ~]$ nmcli connection  
NAME                UUID                                  TYPE      DEVICE  
netplan-eth0        626dd384-8b3d-3690-9511-192b2c79b3fd  ethernet  eth0  
Wired connection 1  30df2f20-c39d-3ccf-86aa-efc296ba006b  ethernet  --  
```  
可用 `nmcli connection delete` 删除第二个连接  
```bash  
[root@ubuntu22-c0 netplan]$ nmcli connection delete Wired\ connection\ 1  
Connection 'Wired connection 1' (30df2f20-c39d-3ccf-86aa-efc296ba006b) successfully deleted.  
[root@ubuntu22-c0 netplan]$ nmcli connection  
NAME          UUID                                  TYPE      DEVICE  
netplan-eth0  626dd384-8b3d-3690-9511-192b2c79b3fd  ethernet  eth0  
[root@ubuntu22-c0 netplan]$ nmcli connection reload  
[root@ubuntu22-c0 netplan]$ nmcli connection show  
NAME          UUID                                  TYPE      DEVICE  
netplan-eth0  626dd384-8b3d-3690-9511-192b2c79b3fd  ethernet  eth0  
```  
      
5. reboot  
此时用 `ip a` 或 `ip link` 可看到网卡名已修改，变为 `eth0`  
```bash  
[root@ubuntu22-c0 netplan]$ ip link  
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000  
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00  
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP mode DEFAULT group default qlen 1000  
    link/ether 00:0c:29:98:e3:96 brd ff:ff:ff:ff:ff:ff  
    altname enp2s1  
    altname ens33  
```  
      
## 修改 IP  
> [Netplan network configuration tutorial for beginners](https://linuxconfig.org/netplan-network-configuration-tutorial-for-beginners)  
      
准备多个虚拟供学习用，一个虚拟机 ip 为 `10.0.0.200`，作为初始化虚拟机  
实际使用时将初始好的虚拟机文件夹复制一份，修改 IP 为 `10.0.0.201`，后面的依次递增  
      
1. 修改网卡配置文件中的 `addresses`  
```bash  
    # This file describes the network interfaces available on your system  
  1 # For more information, see netplan(5).  
  2 network:  
  3   version: 2  
  4  #renderer: networkd  
  5   renderer: NetworkManager  
  6   ethernets:  
  7     eth0:  
  8       match:  
  9         name: eth0  
 10       addresses:  
 11       - 10.0.0.201/24  
 12      #gateway4: 10.0.0.2  
 13       routes:  
 14       - to: default  
 15         via: 10.0.0.2  
```  
      
2. netplan apply 使其生效  
```bash  
[root@ubuntu22-c1 ~]$ ip a  
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000  
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00  
    inet 127.0.0.1/8 scope host lo  
       valid_lft forever preferred_lft forever  
    inet6 ::1/128 scope host  
       valid_lft forever preferred_lft forever  
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000  
    link/ether 00:0c:29:98:e3:96 brd ff:ff:ff:ff:ff:ff  
    altname enp2s1  
    altname ens33  
    inet 10.0.0.201/24 brd 10.0.0.255 scope global noprefixroute eth0  
       valid_lft forever preferred_lft forever  
    inet6 fe80::20c:29ff:fe98:e396/64 scope link  
       valid_lft forever preferred_lft forever  
```  
      
## 修改主机名  
`hostnamectl set-hostname` 修改主机名，重启后生效  
或者重新开一个 shell 看到效果  
```bash  
[root@ubuntu22-c1 netplan]$  
[root@ubuntu22-c1 netplan]$ hostnamectl set-hostname "ubuntu22-c0"  
[root@ubuntu22-c0 netplan]$ bash  
```  
      
# 配置代理  
```bash  
#!/bin/bash  
#  
#Description:       虚拟机配置主机代理 代理放在 /etc/profile.d/bash_custom.sh 中  
  
proxy_file="/etc/profile.d/bash_proxy.sh"  
  
answer=""  
  
# 主机 ip 变化后更新  
if [ -f "${proxy_file}" ]; then  
    read -p "Do you want to update proxy? (y/n): " answer  
else  
    read -p "Do you want to configure a proxy? (y/n): " answer  
fi  
  
answer_lower=$(echo "$answer" | tr '[:upper:]' '[:lower:]')  
  
[ "${config_proxy}" != "true" ] && return  
  
  
if [ "${answer_lower}" == "y" ]; then  
    # 用户输入host IP  
    read -p "Enter the host IP: " host_ip  
    if ! [[ "$host_ip" =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]]; then  
        echo "Invalid IP address."  
        return  
    fi  
  
    # 用户输入proxy port  
    read -p "Enter the proxy port: " proxy_port  
    if ! [[ "$proxy_port" =~ ^[0-9]+$ ]]; then  
        echo "Invalid port number."  
        return  
    fi  
  
    # 将变量保存到文件中  
    cat <<EOF > ${proxy_file}  
export HOST_IP=$host_ip  
export PROXY_PORT=$proxy_port  
  
export HTTP_PROXY="http://$host_ip:$proxy_port"  
export HTTPS_PROXY="http://$host_ip:$proxy_port"  
export NO_PROXY="localhost,127.0.0.0/8,::1"  
EOF  
  
    . ${proxy_file}  
  
    echo "Proxy configuration saved to ${proxy_file}"  
fi  
```  
      
# 安装配置 git  
```bash  
#!/bin/bash  
#  
#********************************************************************  
#Author:            lx  
#Date:              2023-11-22  
#FileName:          git_config.sh  
#URL:               http://github.com/lxwcd  
#Description:       install and config git   
#Copyright (C):     2023 All rights reserved  
#********************************************************************  
  
# install git  
if ! dpkg -V git; then  
	apt update && apt install -y git  
fi  
  
# config git  
name="name"  
email="email@163.com"  
  
git config --global user.name "${name}"  
git config --global user.email "${email}"  
  
# config proxy  
. set_proxy.sh  
. /etc/profile.d/bash_proxy.sh  
  
git config --global http.proxy http://${HOST_IP}:${PROXY_PORT}  
git config --global https.proxy https://${HOST_IP}:${PROXY_PORT}  
  
  
# delete tempory variable  
unset name  
unset email  
unset host_ip  
unset proxy_port  
```  
  
      
      
      
      
      
# ubuntu server 最小化安装  
- ubuntu22.04 最小化安装  
      
      
      
## 安装必要的工具包  
      
## 安装 iputils-ping 来用 ping 探测网络  

