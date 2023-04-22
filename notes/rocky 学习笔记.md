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

- 以身份执行，普通用户有些操作需要 sudo 命令执行
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

## 查看启动方式 BIOS 还是 UEFI
> [Guide To Check UEFI or BIOS In Windows/Linux System](https://servonode.com/check-uefi-or-bios-in-widows-or-linux)


### 方法一：查看 /sys/firmware/efi 目录

`/sys/firmware/efi` 目录存在则为 UEFI 启动

- ubuntu20.04 UEFI 启动
```bash
[10:17:49 root@ubuntu2004 /sys/firmware]#ls
acpi  dmi  efi  memmap
[10:17:50 root@ubuntu2004 /sys/firmware]#
```

- rocky8.6 BIOS 启动
```bash
root@rocky86 ~ $ cd /sys/firmware/
root@rocky86 firmware $ ls
acpi  dmi  memmap  qemu_fw_cfg
```

### 方法二：dmesg

- ubuntu20.04 UEFI 启动
```bash
root@ubuntu2004 ~# dmesg | grep efi:
[    0.000000] efi: EFI v2.60 by HUAWEI
[    0.000000] efi:  ACPI 2.0=0x8f7fe014  SMBIOS=0x8c4ed000  SMBIOS 3.0=0x8c4eb000  ESRT=0x8c4e9c18  MEMATTR=0x88fd9018  MOKvar=0x88fd7000 
```

- rocky8.6 BIOS 启动
```bash
root@rocky86 firmware $ dmesg | grep efi
[    0.000000] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1910969940391419 ns
[    5.408252] tsc: Refined TSC clocksource calibration: 2918.420 MHz
root@rocky86 firmware $ 
root@rocky86 firmware $ dmesg | grep efi:
```


### 方法三：适合虚拟机安装查看
- VMware ---> 虚拟机 ---> 设置 ---> 选项 ---> 高级
![](img/2023-04-02-15-27-03.png)


## 修改网卡命名规则为旧的命名规则
> [CentOS / RHEL 7 : How to modify Network Interface names](https://www.thegeekdiary.com/centos-rhel-7-how-to-modify-network-interface-names/)
> [Linux kernel parameters: what is the difference of net.ifnames=0 and biosdevname=0](https://unix.stackexchange.com/questions/637295/linux-kernel-parameters-what-is-the-difference-of-net-ifnames-0-and-biosdevname)
> [11.6. Consistent Network Device Naming Using biosdevname](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/networking_guide/sec-consistent_network_device_naming_using_biosdevname)

### 编辑内核 boot 参数让网卡命名规则改为旧规则
- 编辑 `etc/default/grub` 文件，在 `GRUB_CMDLINE_LINUX` 的值中加入内核参数 `net.ifnames=0`
- 有的文档写的还要写一项 `biosdevname=0` ，rocky8.6 测试未写这个修改网卡名成功，具体含义见参考文档 

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


### 重新生成新的 GRUB 配置文件并使其生效
需要先查询系统启动方式是 BIOS 还是 UEFI

- BIOS 启动

```bash
[root@rocky8-1 ~]$ grub2-mkconfig -o /boot/grub2/grub.cfg 
Generating grub configuration file ...
done
```

- UEFI 启动

未测试该情况，只需要将 grub.cfg 文件的路径修改一下，如 Ubuntu20.04 的路径为
```bash
root@ubuntu2004 ~# ls /boot/efi/EFI/
BOOT  ubuntu
root@ubuntu2004 ~# ls /boot/efi/EFI/ubuntu/grub.cfg 
/boot/efi/EFI/ubuntu/grub.cfg
```

rocky8.6 的路径为 `/boot/efi/EFI/redhat/grub.cfg`

### 修改 ifcfg 网卡配置文件

- 每个网卡的配置，包括 IP 地址等有一个单独的配置文件
- 配置文件的命名格式固定，前缀为 `ifcfg-`，后缀为网卡的设备名，即该配置文件中 `DEVICE` 变量的值
- 配置文件在 `/etc/sysconfig/network-scripts/` 目录中

```bash
[root@rocky8-1 ~]$ cd /etc/sysconfig/network-scripts/
[root@rocky8-1 network-scripts]$ ls
ifcfg-ens160
[root@rocky8-1 network-scripts]$ mv ifcfg-ens160 ifcfg-eth0
[root@rocky8-1 network-scripts]$ vim ifcfg-eth0
```

- 修改网卡配置文件中 `DEVICE` 和 `NAME`
- `DEVICE` 为网卡的设备名 
- `NAME` 为这个网卡整个配置的名字，用 `nmcli` 操作该网卡时使用的名字，`man nmcli` 查看帮助
- `NAME` 可以和 `DEVICE` 不同
- `DEVICE` 的名字必须和网卡配置文件名字的后缀相同
```bash
name
               if specified, the connection will use the name (else NM creates a name itself).
```
```bash
lx@rocky86 firmware $ nmcli connection 
NAME    UUID                                  TYPE      DEVICE 
eth1    9c92fad9-6ecb-3e6c-eb4d-8a47c6f50c04  ethernet  eth1   
virbr0  0aab604c-fa07-4672-9588-1cb101daaded  bridge    virbr0 
ens160  c2ef03db-c87c-4a0a-b30b-609635ecccdf  ethernet  --     
```

- `ifcfg-eth0` 配置文件内容如下：
```bash
TYPE=Ethernet
PROXY_METHOD=none
BROWSER_ONLY=no
BOOTPROTO=dhcp
DEFROUTE=yes
IPV4_FAILURE_FATAL=no
IPV6INIT=yes
IPV6_AUTOCONF=yes
IPV6_DEFROUTE=yes
IPV6_FAILURE_FATAL=no
NAME=eth0
UUID=26fbfd70-8518-4b0d-a0bc-69669c59622a
DEVICE=eth0
ONBOOT=yes
```

### 重启系统
- 有的文中写在重启前先禁用网卡：`systemctl disable NetworkManager`，测试时未禁用重启后也能生效
- reboot
- 重启后查看网卡名是否生效
    - `ip a` 查看网卡是否生效
    - `ping` 测试网络是否正常

```bash
[lx@rocky8-1 ~]$ ip link
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP mode DEFAULT group default qlen 1000
    link/ether 00:0c:29:54:b6:1a brd ff:ff:ff:ff:ff:ff
    altname enp3s0
    altname ens160
3: virbr0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN mode DEFAULT group default qlen 1000
    link/ether 52:54:00:96:30:10 brd ff:ff:ff:ff:ff:ff
[lx@rocky8-1 ~]$ 
[lx@rocky8-1 ~]$ ip addr show eth0
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
    link/ether 00:0c:29:54:b6:1a brd ff:ff:ff:ff:ff:ff
    altname enp3s0
    altname ens160
    inet 10.0.0.162/24 brd 10.0.0.255 scope global dynamic noprefixroute eth0
       valid_lft 1592sec preferred_lft 1592sec
    inet6 fe80::20c:29ff:fe54:b61a/64 scope link noprefixroute 
       valid_lft forever preferred_lft forever
[lx@rocky8-1 ~]$ 
[lx@rocky8-1 ~]$ nmcli connection 
NAME    UUID                                  TYPE      DEVICE 
eth0    26fbfd70-8518-4b0d-a0bc-69669c59622a  ethernet  eth0   
virbr0  9eac4062-fdc2-4208-9aba-f053addb47bc  bridge    virbr0 
```

```bash
[lx@rocky8-1 ~]$ ping 10.0.0.111
PING 10.0.0.111 (10.0.0.111) 56(84) bytes of data.
64 bytes from 10.0.0.111: icmp_seq=1 ttl=64 time=1.73 ms
64 bytes from 10.0.0.111: icmp_seq=2 ttl=64 time=1.17 ms
64 bytes from 10.0.0.111: icmp_seq=3 ttl=64 time=0.700 ms
```

# 修改网卡 IP 
- 在 xshell 中使用多个虚拟机时，为了查看方便，将 IP 修改为方便辨认的格式
- 如 `rocky8.6` 安装多个虚拟机，第二个虚拟机该名字为 `10.0.0.82`

## 修改网卡配置文件
> [Understanding the Network interface configuration file /etc/sysconfig/network-scripts/ifcfg-eth#](https://www.thegeekdiary.com/understanding-the-network-interface-configuration-file-etc-sysconfig-network-scripts-ifcfg-eth/)
> [11.2. Interface Configuration Files](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/deployment_guide/s1-networkscripts-interfaces)
> [Understanding the Network interface configuration file /etc/sysconfig/network-scripts/ifcfg-eth#](https://www.thegeekdiary.com/understanding-the-network-interface-configuration-file-etc-sysconfig-network-scripts-ifcfg-eth/)
> [Chapter 13. Network Scripts](https://mirror.apps.cam.ac.uk/pub/doc/redhat/redhat7.3/rhl-rg-en-7.3/ch-networkscripts.html)
> [nm-settings-ifcfg-rh](https://developer-old.gnome.org/NetworkManager/stable/nm-settings-ifcfg-rh.html)


### 查看默认网络参数
- `ip a` 查看 IP 地址，子网掩码，广播地址等

```bash
[root@rocky8-1 network-scripts]$ ip addr show eth0
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
    link/ether 00:0c:29:54:b6:1a brd ff:ff:ff:ff:ff:ff
    altname enp3s0
    altname ens160
    inet 10.0.0.162/24 brd 10.0.0.255 scope global dynamic noprefixroute eth0
       valid_lft 1467sec preferred_lft 1467sec
    inet6 fe80::20c:29ff:fe54:b61a/64 scope link noprefixroute 
       valid_lft forever preferred_lft forever
```

1. 上面 IPv4 地址为 `10.0.0.162`
2. PREFIX 为 24，即子网掩码为 `255.255.255.0`

- `route -n` 查看默认路由

```bash
[root@rocky8-1 network-scripts]$ route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
0.0.0.0         10.0.0.2        0.0.0.0         UG    100    0        0 eth0
10.0.0.0        0.0.0.0         255.255.255.0   U     100    0        0 eth0
192.168.122.0   0.0.0.0         255.255.255.0   U     0      0        0 virbr0
```

1. 上面可看到默认路由为 `10.0.0.2`

- 从虚拟机中查看（这里使用的是 NAT 网络）
编辑 ---> 虚拟网络编辑器 ---> NAT 设置

![](img/2023-04-22-14-31-57.png)


### 修改配置文件的参数
- BOOTPROTO
    - 地址配置协议，默认 dhcp
    - 需要修改为 none

- IPADDR
    - 指明 IP 地址，默认没有，由 DHCP 自动分配
    - 如果配置多个 IP，则第二个 IP 用 `IPADDR2`

- PREFIX 
    - 指定子网掩码位数，和 `NETMASK` 作用相同
    - 如 24 则子网掩码为 `255.255.255.0`

- GATEWAY
    - 默认网关
    - 可用 `route -n` 查看，`Destination` 为 `0.0.0.0` 对应的 `Gateway` 即为默认网关

- IPV4_FAILURE_FATAL
    - no
    This interface is not disabled if configuration fails
    - yes
    This interface is disabled if IPv4 or IPv6 configuration failes

```bash
TYPE=Ethernet
PROXY_METHOD=none
BROWSER_ONLY=no
BOOTPROTO=none
DEFROUTE=yes
IPADDR=10.0.0.82
PREFIX=24
GATEWAY=10.0.0.2
IPV4_FAILURE_FATAL=no
IPV6INIT=yes
IPV6_AUTOCONF=yes
IPV6_DEFROUTE=yes
IPV6_FAILURE_FATAL=no
NAME=eth0
UUID=26fbfd70-8518-4b0d-a0bc-69669c59622a
DEVICE=eth0
ONBOOT=yes
```

### 让新网卡配置文件生效
修改网卡配置文件后保存，并不能让配置立刻生效

- `nmcli connection down NAME`
`NAME` 为网卡配置文件中定义的 `NAME`
- `nmcli connection reload`
- `nmmcli connection up NAME`

```bash
[root@rocky8-1 network-scripts]$ nmcli connection down eth0
Connection 'eth0' successfully deactivated (D-Bus active path: /org/freedesktop/NetworkManager/ActiveConnection/2)


[root@rocky8-1 network-scripts]$ nmcli connection 
NAME    UUID                                  TYPE      DEVICE 
virbr0  9eac4062-fdc2-4208-9aba-f053addb47bc  bridge    virbr0 
eth0    26fbfd70-8518-4b0d-a0bc-69669c59622a  ethernet  --     


[root@rocky8-1 network-scripts]$ nmcli connection reload 

[root@rocky8-1 network-scripts]$ nmcli connection up eth0
Connection successfully activated (D-Bus active path: /org/freedesktop/NetworkManager/ActiveConnection/3)
```

检查新的 IP 是否生效
```bash
[root@rocky8-1 network-scripts]$ nmcli connection 
NAME    UUID                                  TYPE      DEVICE 
eth0    26fbfd70-8518-4b0d-a0bc-69669c59622a  ethernet  eth0   
virbr0  9eac4062-fdc2-4208-9aba-f053addb47bc  bridge    virbr0 

[root@rocky8-1 network-scripts]$ ip addr show eth0
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
    link/ether 00:0c:29:54:b6:1a brd ff:ff:ff:ff:ff:ff
    altname enp3s0
    altname ens160
    inet 10.0.0.82/24 brd 10.0.0.255 scope global noprefixroute eth0
       valid_lft forever preferred_lft forever
    inet6 fe80::20c:29ff:fe54:b61a/64 scope link noprefixroute 
       valid_lft forever preferred_lft forever
```