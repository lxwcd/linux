ubuntu 22.04 学习


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


