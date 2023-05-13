ubuntu 22.04 学习

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
- root 家目录的 `.bashrc` 中取消注释
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
# Prevent doublesourcing
if [ -z "$COMPLETION_SOURCED" ]; then
  COMPLETION_SOURCED="Y"
else
  return
fi
```


# 初始化操作
- 学习环境初始化
 

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

因此两种方式最后都会执行 `~/.bashrc`，而该脚本会调用 `.bash_aliaes`，
该文件默认没有，用于自定义一些别名时使用

将 `/root/.bashrc` 和 `/etc/skel/.bashrc` 中的 `.bash_aliases` 改为 `/etc/bash_custom`
将 `/etc/skel/.bashrc` 复制到登录用户家目录中覆盖
然后创建 `bash_custom` 放到 `/etc` 目录
注意复制时的属性和权限，复制到家目录中时 owner 和 group 改为该用户

```bash
if [ -f /etc/bash_custom ]; then
    . /etc/bash_custom
fi
````

`/etc/bashrc_custom` 对普通用户只读，不可写，可以执行该脚本但需要 root 修改
```bash
[root@ubuntu22-c0 ~]$ ll /etc/bash_*
-rw-r--r-- 1 root root   45 Nov 11  2021 /etc/bash_completion
-rw-r--r-- 1 root root  497 May 11 14:37 /etc/bash_custom
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


## 安装邮件服务器 postfix
> [How To Install and Configure Postfix on Ubuntu 22.04](https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-postfix-on-ubuntu-22-04)
> [Install Postfix on Ubuntu 22.04](https://itslinuxfoss.com/install-postfix-ubuntu-22-04/)


## ssh 远程登录设置
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




# 安装 git 
```bash
sudo apt update && apt install -y git
```