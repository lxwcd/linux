Rocky 学习

- 环境：Rocky8.6

# 虚拟机安装带图形界面的 Rocky8.6 
- 环境：VMware 


# 修改密码
- 安装时有设置一个 root 账户，并设置密码

- 利用 `su -` 切换到安装时的 root 账户

- 利用 `passwd -d userName` 删除用户密码
```bash
[root@rocky8 lx]# passwd -d lx
Removing password for user lx.
passwd: Success
[root@rocky8 lx]# passwd -d root
Removing password for user root.
passwd: Success
[root@rocky8 lx]# 
```

- 利用 `passwd userName` 修改密码，这种方式设置密码不会做限制，很简单的密码也可以
```bash
[root@rocky8 lx]# passwd lx
Changing password for user lx.
New password: 
BAD PASSWORD: The password is a palindrome
Retype new password: 
passwd: all authentication tokens updated successfully.
```

- 如果是用户自己修改密码，用 `passwd` 命令，则设置的密码有要求，太简单不能成功
```bash
[lx@rocky8 ~]$ passwd 
Changing password for user lx.
New password: 
BAD PASSWORD: The password is a palindrome
passwd: Authentication token manipulation error
```

# 让用户能用 sudo 命令
- 安装时创建的普通用户默认不能使用 `sudo` 命令，其主要组为和用户名相同的普通组
```bash
[root@rocky8 lx]# id lx
uid=1000(lx) gid=1000(lx) groups=1000(lx)
```

- 用户的权限管理在 `/etc/sudoers` 文件中，有个 `wheel` 组能执行所有命令
可以用 `visudo` 命令打开该文件
```bash
## Allow root to run any commands anywhere
root    ALL=(ALL)       ALL

## Allows members of the 'sys' group to run networking, software,
## service management apps and more.
# %sys ALL = NETWORKING, SOFTWARE, SERVICES, STORAGE, DELEGATING, PROCESSES, LOCATE, DRIVERS

## Allows people in group wheel to run all commands
%wheel  ALL=(ALL)       ALL
```

初始没有以 wheel 组为附加组的用户
```bash
[root@rocky8 lx]# getent group wheel
wheel:x:10:
```

- 切换到 root 用户，将用户加入到 wheel 组中，wheel 作为附加组
```bash
[root@rocky8 lx]# usermod -aG wheel lx
[root@rocky8 lx]# 
[root@rocky8 lx]# id lx
uid=1000(lx) gid=1000(lx) groups=1000(lx),10(wheel)
[root@rocky8 lx]# 
[root@rocky8 lx]# getent group wheel
wheel:x:10:lx
```

# 修改提示符 PS1 
- 初始默认的提示符没有颜色，可以修改 `PS1` 变量来改提示符
默认的提示符格式为：
    - 用户名（\u）
    - @
    - 主机名的简写，只显示第一个点号前的内容(\h) 
    - 空格
    - 当前工作目录的basename，不显示全部路径（\W）

```bash
[root@rocky8 lx]# echo $PS1
[\u@\h \W]\$
```

- 仍使用该格式，只是加个颜色，如青蓝色
  在最前面加上`\e[36m`，其中 `\e[` 为颜色开始，`36` 表示字体颜色为青蓝色
  最后加上 `\e[0m` 表示颜色结束
  最后的格式如下：
```bash
[root@rocky8 lx]# echo -e "\n\nPS1=\"\e[36m${PS1}\e[0m\"" 


PS1="[\u@\h \W]\$ "
```

- 将修改后的 `PS1` 变量放到用户家目录的 `~/.bashrc` 文件最后
```bash
[root@rocky8 lx]# echo -e "\n\nPS1=\"\e[36m${PS1}\e[0m\""  >> ~lx/.bashrc 
[root@rocky8 lx]# echo -e "\n\nPS1=\"\e[36m${PS1}\e[0m\""  >> ~root/.bashrc 
[root@rocky8 lx]# 
[root@rocky8 lx]# tail -n3 ~/.bashrc 


PS1="[\u@\h \W]\$ "
```

- 将修改后的 `PS1` 变量放到 `/etc/skel/.bashrc` 文件最后，这样后面创建的登录用户提示符都会修改
```bash
[root@rocky8 lx]# echo -e "\n\nPS1=\"\e[36m${PS1}\e[0m\""  >> /etc/skel/.bashrc 
```
 
- 利用 `source(.)` 让配置文件生效
```bash
[root@rocky8 lx]# . ~/.bashrc 
```

## 更多自定义设置
> [Controlling-the-Prompt](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Controlling-the-Prompt)
> [环境变量PS1介绍](https://hongjh.blog.csdn.net/article/details/121312038)
> [Bash PS1 customization examples](https://linuxhint.com/bash-ps1-customization/)
> [6.9 Controlling the Prompt](https://www.gnu.org/software/bash/manual/html_node/Controlling-the-Prompt.html)


- `man bash` 帮助文档查看环境变量 `$PS1` 的介绍
![1](https://img-blog.csdnimg.cn/73a3f9095dc1413e8de842dc0318a530.png)

- 提示符说明：`man bash` 搜索 `PROMPTING`
![2](https://img-blog.csdnimg.cn/16d7d4f2437049f485ab801d1a428124.png)

- 注意 `\h` 显示主机名只到第一个 `.`前，之后的不显示，`\H` 显示完整主机名
![3](https://img-blog.csdnimg.cn/5fb00cec78d54535ba7f7a31f42ce3ee.png)

- 示例
![3](https://img-blog.csdnimg.cn/7dd9cc7760b949aabb89c0877902cd49.png)

- 注意该变量设置最好在 `~/.bashrc` 中，如果在 `/etc/profile` 中设置，可能被覆盖
Ubuntu22.04 中 `~/.bashrc` 中会设置 `PS1`，因此覆盖之前的设置
不同 bash 版本可能有差异，注意脚本调用顺序和规则


# 修改主机名
- 主机名命名规则
大小写字母，数字，连字符（-），不能以连字符开头

```bash
[lx@rocky8 ~]$ whatis hostname
hostname (7)         - hostname resolution description
hostname (1)         - show or set the system's host name
hostname (5)         - Local hostname configuration file
[lx@rocky8 ~]$ man 7 hostname
```

```bash
Each  element  of  the hostname must be from 1 to 63 characters long and the entire host‐
       name, including the dots, can be at most 253 characters long.  Valid characters for host‐
       names  are  ASCII(7)  letters from a to z, the digits from 0 to 9, and the hyphen (-).  A
       hostname may not start with a hyphen.
```

- 查看主机名
`hostname` 或 `hostnamectl`

```bash
[root@rocky8 ~]$ hostname
rocky8
[root@rocky8 ~]$ cat /etc/hostname 
rocky8
[root@rocky8 ~]$ 
[root@rocky8 ~]$ hostnamectl --static 
rocky8
[root@rocky8 ~]$ hostnamectl --pretty 

[root@rocky8 ~]$ hostnamectl --transient 
rocky8
```

- 永久修改主机名 hostnamectl set-hostname
修改后提示符中不能立即看到效果，可以用 `bash` 重开一个 shell 进程看到效果
要当前 shell 中主机名生效，需要重启
```bash
[root@rocky8 ~]$ hostnamectl set-hostname "rocky8-1"
[root@rocky8 ~]$ hostname
rocky8-1
[root@rocky8 ~]$ bash
[root@rocky8-1 ~]$ exit
```

# 修改网卡名  
> [NetworkInterfaceNames](https://wiki.debian.org/NetworkInterfaceNames)

## 传统的网卡命名规则
- 传统的网卡命名统一叫 `ethX`，`X`为编号，如 `eth0`，`eth1` 等
- 编号根据启动时内核识别的顺序命名
- CentOS 6 之前版本采用

缺点：
- 如果机器上有多个网卡，一旦移除已存在的网卡或者新增网卡，
  则已存在的旧网卡名可能变化，可能造成安全隐患，如不便于防火墙制定规则管理

## 查看初始网卡名
查询可见初始网卡名为 `ens160`

- ip a
```bash
[root@rocky8 ~]$ ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: ens160: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
    link/ether 00:0c:29:54:b6:1a brd ff:ff:ff:ff:ff:ff
    inet 10.0.0.162/24 brd 10.0.0.255 scope global dynamic noprefixroute ens160
       valid_lft 1759sec preferred_lft 1759sec
    inet6 fe80::20c:29ff:fe54:b61a/64 scope link noprefixroute 
       valid_lft forever preferred_lft forever
3: virbr0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default qlen 1000
    link/ether 52:54:00:96:30:10 brd ff:ff:ff:ff:ff:ff
    inet 192.168.122.1/24 brd 192.168.122.255 scope global virbr0
       valid_lft forever preferred_lft forever
```

- ip link show
```bash
[root@rocky8 ~]$ ip link show 
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
2: ens160: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP mode DEFAULT group default qlen 1000
    link/ether 00:0c:29:54:b6:1a brd ff:ff:ff:ff:ff:ff
3: virbr0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN mode DEFAULT group default qlen 1000
    link/ether 52:54:00:96:30:10 brd ff:ff:ff:ff:ff:ff
```

- nmcli connection
```bash
[root@rocky8 ~]$ nmcli connection 
NAME    UUID                                  TYPE      DEVICE 
ens160  26fbfd70-8518-4b0d-a0bc-69669c59622a  ethernet  ens160 
virbr0  10ddff8f-58f4-45b8-ab58-a3ebd1caf6c5  bridge    virbr0 
```

## 修改网卡命名规则为旧的命名规则
1. 编辑 `etc/default/grub` 文件，在 `GRUB_CMDLINE_LINUX` 的值中加入 `net.ifnames=0`

```bash
GRUB_TIMEOUT=5
GRUB_DISTRIBUTOR="$(sed 's, release .*$,,g' /etc/system-release)"
GRUB_DEFAULT=saved
GRUB_DISABLE_SUBMENU=true
GRUB_TERMINAL_OUTPUT="console"
GRUB_CMDLINE_LINUX="crashkernel=auto resume=/dev/mapper/rl_rocky8-swap rd.lvm.lv=rl_rocky8/root rd.lvm.lv=rl_rocky8/swap rhgb quiet net.ifnames=0"
GRUB_DISABLE_RECOVERY="true"
GRUB_ENABLE_BLSCFG=true
```

可以 `. /etc/default/grub` 该文件查看值

```bash
[root@rocky8 ~]$ . /etc/default/grub 
[root@rocky8 ~]$ 
[root@rocky8 ~]$ echo $GRUB_CMDLINE_LINUX 
crashkernel=auto resume=/dev/mapper/rl_rocky8-swap rd.lvm.lv=rl_rocky8/root rd.lvm.lv=rl_rocky8/swap rhgb quiet net.ifnames=0
```

