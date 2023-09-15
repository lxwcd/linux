# 查看操作系统版本
## cat /etc/os-release
```bash
[root@ubuntu22-c0 ~]$ cat /etc/os-release
PRETTY_NAME="Ubuntu 22.04.1 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.1 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=jammy
```
```bash
[root@mysql ~]$ cat /etc/os-release
NAME="Rocky Linux"
VERSION="8.7 (Green Obsidian)"
ID="rocky"
ID_LIKE="rhel centos fedora"
VERSION_ID="8.7"
PLATFORM_ID="platform:el8"
PRETTY_NAME="Rocky Linux 8.7 (Green Obsidian)"
ANSI_COLOR="0;32"
LOGO="fedora-logo-icon"
CPE_NAME="cpe:/o:rocky:rocky:8:GA"
HOME_URL="https://rockylinux.org/"
BUG_REPORT_URL="https://bugs.rockylinux.org/"
ROCKY_SUPPORT_PRODUCT="Rocky-Linux-8"
ROCKY_SUPPORT_PRODUCT_VERSION="8.7"
REDHAT_SUPPORT_PRODUCT="Rocky Linux"
REDHAT_SUPPORT_PRODUCT_VERSION="8.7"
```

# 查看内核版本
## uname -vr
```bash
[root@mysql shell_scripts]$ uname -vr
4.18.0-425.19.2.el8_7.x86_64 #1 SMP Tue Apr 4 22:38:11 UTC 2023
```
```bash
[root@mysql ~]$ uname -rv
4.18.0-425.19.2.el8_7.x86_64 #1 SMP Tue Apr 4 22:38:11 UTC 2023
```

# 查看根文件系统的利用率
## df + awk
```bash
[root@zabbix ~]$ df
Filesystem                        1K-blocks    Used Available Use% Mounted on
tmpfs                                198824    1324    197500   1% /run
/dev/mapper/ubuntu--vg-ubuntu--lv 101590008 6435248  89948132   7% /
tmpfs                                994116       0    994116   0% /dev/shm
tmpfs                                  5120       0      5120   0% /run/lock
/dev/sda2                           1992552  258188   1613124  14% /boot
tmpfs                                198820       0    198820   0% /run/user/0
[root@zabbix ~]$ df | awk -F' +|%' '$7 == "/" {print $5}'
7
```

# 查看文件或文件夹的大小

```bash
[root@zabbix boot]$ du -sh
253M    .
[root@zabbix boot]$ du -h
16K     ./lost+found
2.3M    ./grub/fonts
2.5M    ./grub/i386-pc
4.0K    ./grub/locale
7.1M    ./grub
253M    .
[root@zabbix boot]$ du -h vmlinuz-5.15.0-72-generic
12M     vmlinuz-5.15.0-72-generic
```

# 查看内核中是否有某个模块
```bash
[root@zabbix boot]$ uname -r
5.15.0-73-generic
[root@zabbix boot]$ pwd
/boot
[root@zabbix boot]$ ls
config-5.15.0-72-generic  initrd.img-5.15.0-72-generic  System.map-5.15.0-72-generic  vmlinuz-5.15.0-73-generic
config-5.15.0-73-generic  initrd.img-5.15.0-73-generic  System.map-5.15.0-73-generic  vmlinuz.old
grub                      initrd.img.old                vmlinuz
initrd.img                lost+found                    vmlinuz-5.15.0-72-generic
```

```bash
[root@zabbix boot]$ grep -i "kvm" /boot/config-5.15.0-73-generic
```


# 统计字符串在文件中出现的次数
1. vim
例如匹配 nologin，标识符 n 表示只匹配不替换
```bash
: %s/nologin//gn
```

2. grep
grep -o 仅显示匹配的内容，且一行中的多个匹配分开成多行显示
```bash
[root@ubuntu22-c0 ~]$ grep -o "nologin" /etc/passwd  | wc -l
30
```
```bash
[root@ubuntu22-c0 ~]$ grep -Eo "nologin|sh" /etc/passwd | wc -l
34
```

# 查看某个进程
```bash
[root@ubuntu22-c0 ~]$ alias ps_v
alias ps_v='ps auxf | head -n1; ps auxf | grep -i '
[root@ubuntu22-c0 ~]$ ps_v sshd
```

# 查看 tcp 的连接信息
- state 按照 tcp 状态筛选
tcp 的状态如下：
```bash
All standard TCP states: established, syn-sent, syn-recv, fin-wait-1, fin-wait-2, time-wait, closed,
         close-wait, last-ack, listening and closing.

all - for all the states

connected - all the states except for listening and closed

synchronized - all the connected states except for syn-sent

bucket - states, which are maintained as minisockets, i.e.  time-wait and syn-recv

big - opposite to bucket
``` 

```bash
[root@ubuntu22-c0 ~]$ ss -tnp state established
```

- 或者用 grep 过滤，ss -a 显示全部
```bash
[root@ubuntu22-c0 ~]$ ss -atnp | grep -i estab
```

- ss -tnlp 查看处于 listening 状态的连接

# 查看磁盘的使用情况
```bash
[root@ubuntu22-c0 ~]$ df -h /dev/sda2
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda2       2.0G  252M  1.6G  14% /boot
[root@ubuntu22-c0 ~]$ df -h
Filesystem                         Size  Used Avail Use% Mounted on
tmpfs                              193M  1.4M  192M   1% /run
/dev/mapper/ubuntu--vg-ubuntu--lv   97G  5.7G   87G   7% /
tmpfs                              965M     0  965M   0% /dev/shm
tmpfs                              5.0M     0  5.0M   0% /run/lock
/dev/sda2                          2.0G  252M  1.6G  14% /boot
tmpfs                              193M     0  193M   0% /run/user/0
```

# 查看文件或文件夹的大小
```bash
[root@ubuntu22-c0 ~]$ mkdir shell_scripts/1
[root@ubuntu22-c0 ~]$ du -h shell_scripts/
4.0K    shell_scripts/1
28K     shell_scripts/
[root@ubuntu22-c0 ~]$ du -sh .
152K    .
[root@ubuntu22-c0 ~]$ du -h .
4.0K    ./shell_scripts/1
28K     ./shell_scripts
20K     ./.ssh
8.0K    ./.vim
4.0K    ./snap/lxd/common
4.0K    ./snap/lxd/22923
12K     ./snap/lxd
16K     ./snap
4.0K    ./.cache
152K    .
```

# 查看当前用户和登录用户
- whoami 查看当前用户
```bash
[lx@ubuntu22-c0 ~]$ whoami
lx
[lx@ubuntu22-c0 ~]$ whatis whoami
whoami (1)           - print effective userid
```
- id 显示当前用户 
```bash
[lx@ubuntu22-c0 ~]$ id
uid=1001(lx) gid=1001(lx) groups=1001(lx),27(sudo)
```
- who am i 显示当前登录用户
```bash
[lx@ubuntu22-c0 ~]$ who am i
root     pts/4        2023-09-15 20:00 (10.0.0.1)
```
- who 显示全部登录用户
```bash
[lx@ubuntu22-c0 ~]$ who
root     pts/1        2023-09-15 17:25 (10.0.0.1)
root     pts/2        2023-09-15 17:26 (10.0.0.1)
root     pts/3        2023-09-15 20:00 (10.0.0.1)
root     pts/4        2023-09-15 20:00 (10.0.0.1)
```
- w 显示全部登录用户
```bash
[lx@ubuntu22-c0 ~]$ w
 20:53:28 up  3:21,  4 users,  load average: 0.11, 0.14, 0.17
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
root     pts/1    10.0.0.1         17:25    2:44m  0.16s  0.02s pager
root     pts/2    10.0.0.1         17:26    2:42m  0.01s  0.01s -bash
root     pts/3    10.0.0.1         20:00   35:44   0.04s  0.04s -bash
root     pts/4    10.0.0.1         20:00    0.00s  0.18s  0.00s w
```

# 查看进程状态
## 显示最近一次进程的全部状态
- `-b` 显示全部进程
- `-n` 刷新多少次后退出
```bash
[root@es ~]$ top -b -n 1
```

## 查看特定进程并持续刷新
- `-d` 刷新间隔
- `-p` 指定 PID

```bash
[root@es ~]$ top -d 1 -p 991
```