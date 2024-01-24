系统服务（daemon）  
  
> 鸟哥的 Linux 私房菜基础学习篇第四版 第 17 章 认识系统服务（daemon）  
> [第五部分：Linux 系统管理员](http://cn.linux.vbird.org/linux_basic/linux_basic.php#part5)  
  
# daemon 和 service  
- 常驻在内存中的进程且可以提供一些系统或网络功能，即为服务（service）  
- 系统为了某些功能必须提供一些服务（service）  
- service 的提供需要程序运行，完成 service 的程序即为 daemon  
  如完成周期性计划任务 service 的程序为 crond 这个 daemon  
- daemon 即为一个程序执行后的进程  
- rocky8 中通常会在服务的名称后加一个 `d`  
  如计划任务命令建立的 at 和 cron 两个服务的程序名为 atd 和 crond  
  
# 早期的 init 服务  
- 服务启动脚本在 `/etc/init.d/` 目录  
- `/etc/init.d/daemon [start|restart|stop|status]` 启动|重启|关闭|查看状态  
- init 是内核的第一个进程，内核启动后主动调用  
  
## 服务启动的分类  
### 独立启动（stand alone）  
- 常驻内存  
- 提供本机或用户的服务  
- 响应快  
  
  
### 超级守护进程（super daemon）  
> [xinetd](https://en.wikipedia.org/wiki/Xinetd)  
> [inetd](https://en.wikipedia.org/wiki/Inetd)  
  
- xinetd (Extended Internet Service Daemon) 和 inetd (internet service daemon) 两个总管程序提供 socket 对应或端口对应的管理  
- 需要时唤醒，需求结束时服务结束  
- 唤醒可能造成延迟  
  
  
## 服务的依赖性问题  
- 服务可能有依赖性  
- 有些服务可能依赖其他服务  
- init 在管理员手动处理这些有依赖关系的服务时，不能协助唤醒依赖服务  
  
## 运行级别  
- init 启动后可以根据用户自定义的运行级别（runlevel）来唤醒不同的服务  
- 不同的服务会进入不同的操作界面  
- 共 7 个运行级别  
    - 0  
    - 1  
    单人维护模式  
    - 2  
    - 3  
    纯命令模式  
    - 4  
    - 5  
    图形界面，需要安装的操作系统支持图形界面  
    - 6  
```bash  
[root@ubunut22:~]$ init --help  
init [OPTIONS...] COMMAND  
  
Send control commands to the init daemon.  
  
Commands:  
  0              Power-off the machine  
  6              Reboot the machine  
  2, 3, 4, 5     Start runlevelX.target unit  
  1, s, S        Enter rescue mode  
  q, Q           Reload init daemon configuration  
  u, U           Reexecute init daemon  
  
Options:  
     --help      Show this help  
     --no-wall   Don't send wall message before halt/power-off/reboot  
  
See the telinit(8) man page for details.  
```  
### 运行级别对应的启动脚本  
> [What does the "rc" stand for in /etc/rc.d?](https://unix.stackexchange.com/questions/111611/what-does-the-rc-stand-for-in-etc-rc-d)  
> [Chapter 7. The rc.d System](https://www.netbsd.org/docs/guide/en/chap-rc.html)  
  
  
`rc` 可以理解为 `run commands`  
  
```bash  
[09:17:13 root@ubuntu2004 ~]#cd /etc/rc  
rc0.d/ rc1.d/ rc2.d/ rc3.d/ rc4.d/ rc5.d/ rc6.d/ rcS.d/  
```  
例如在图形界面通过 `init 3` 可以进入命令行模式，则运行脚本在 `/etc/rc3.d` 目录中  
目录中每个文件代表要启动的服务，开头的 `S` 表示启动该服务，数字表示启动顺序  
最后的名字为服务名字  
```bash  
[09:17:13 root@ubuntu2004 ~]#cd /etc/rc3.d/  
[09:20:32 root@ubuntu2004 /etc/rc3.d]#ls  
K01speech-dispatcher            S02unattended-upgrades  S03nscd          S04cron           S06gdm3  
README                          S02uuidd                S03rsync         S04firewalld      S06saned  
S01console-setup.sh             S03acpid                S03sphinxsearch  S04lightdm        S07grub-common  
S02apport                       S03anacron              S03ssh           S04postfix        S07ondemand  
S02binfmt-support               S03dbus                 S03thermald      S04spice-vdagent  S07plymouth  
S02lvm2-lvmpolld                S03hddtemp              S03whoopsie      S05openvpn        S07rc.local  
S02pulseaudio-enable-autospawn  S03irqbalance           S04avahi-daemon  S06cups  
S02rsyslog                      S03mysql                S04bluetooth     S06cups-browsed  
```  
  
每个启动脚本连接到 `/etc/init.d/` 目录下对应的 daemon 可执行文件  
```bash  
[09:37:57 root@ubuntu2004 /etc/rc3.d]#ll S02rsyslog  
lrwxrwxrwx 1 root root 17 Oct  8  2020 S02rsyslog -> ../init.d/rsyslog*  
[09:38:21 root@ubuntu2004 /etc/rc3.d]#  
[09:38:24 root@ubuntu2004 /etc/rc3.d]#file S02rsyslog  
S02rsyslog: symbolic link to ../init.d/rsyslog  
```  
  
根据启动的顺序能保证依序执行所有需要的服务，同时解决依赖问题  
  
### chkconfig 制定运行级别默认要启动的服务  
  
### 切换运行级别  
- `init num` 切换运行级别，`num` 为级别数字  
  
  
# systemd 服务  
- centos7 开始使用 `systemd` 这个启动服务管理机制  
- 可以并行处理服务，加速开机流程  
旧的 init 启动脚本时按顺序一项一项启动，但有些服务没有依赖关系  
当前操作系统几乎都支持多内核架构，因此可以同时启动服务  
  
- 一经要求就响应的 on-demand 启动方式  
systemd 只有一个 systemd 服务搭配 systemctl 命令处理，无需额外支持  
systemd 常驻内存  
  
- 服务依赖性自我检查  
如果启动某个服务时需要依赖另一个服务，systemd 会自动启动依赖服务  
  
- 根据 daemon 功能分类  
systemd 中将每个服务称为一个服务单位（unit）  
不同的 unit 归类到不同的服务类型（type）中  
如 service、 socket、 target、 path、 snapshot、 timer 等多个类型（type）  
方便管理  
  
- 多个 daemons 集合成一个群组  
多个功能集合成一个 target 项目  
  
- 向下兼容旧的 init 服务脚本  
    - 但有些功能并非完全对应  
    - 运行级别仅有 1、3、5 对应  
    - systemctl 不可以自定义参数，没有 /etc/init.d/daemon 灵活  
    - 如果某个服务是管理员手动启动，而非通过 systemctl 启动，则 systemd 将无法检查到该服务  
    - systemd 启动过程中无法通过标准输入传递信息，因此自己编写 systemd 的启动设置时要取消交互机制  
  
## systemd 配置文件目录  
  
### /usr/lib/systemd/system/ 启动脚本  
类似 `/etc/init.d/` 目录中的文件  
存放服务最主要的启动脚本  
  
```bash  
[root@rocky8-3 system]$ cd /usr/lib/systemd/system; ls | head -n5  
accounts-daemon.service  
alsa-restore.service  
alsa-state.service  
anaconda-direct.service  
anaconda-fips.service  
```  
  
### /run/systemd/system/ 程序执行过程中产生的服务脚本  
脚本优先级比 `/usr/lib/systemd/system` 高  
  
### /etc/systemd/system 管理员根据需要创建的执行脚本  
- 类似如 `/etc/rc5.d/SXX` 的功能  
- 优先级比 `/run/lib/systemd/system` 高  
- 该目录中很多文件是链接文件，源文件在 `/run/lib/systemd/system` 目录中  
```bash  
[root@rocky8-3 system]$ ll | head -n5  
total 4  
drwxr-xr-x. 2 root root   31 Feb 21 15:24 basic.target.wants  
drwxr-xr-x. 2 root root   31 Feb 21 15:19 bluetooth.target.wants  
lrwxrwxrwx. 1 root root   37 Feb 21 15:19 ctrl-alt-del.target -> /usr/lib/systemd/system/reboot.target  
lrwxrwxrwx. 1 root root   41 Feb 21 15:19 dbus-org.bluez.service -> /usr/lib/systemd/system/bluetooth.service  
```  
  
## systemd 的 unit 类型  
- `/run/lib/systemd/system` 中文件不同的后缀对应不同的类型（type）  
  
### .service 一般服务类型  
- 主要是系统服务  
- 包括服务器本身所需要的本地服务以及网络服务等  
- 最常见的类型  
  
### .socket 内部程序数据交换的 socket 服务  
- 主要是 IPC（Inter-process communication）的传输信息 socket 文件功能  
- 通常用于监控信息传递的 socket 文件中  
  
### .target 执行环境类型  
- 一堆服务的集合  
  
### .mount 文件系统挂载相关的服务  
  
### .automount 文件挂载相关的服务  
  
  
### .path 检测特定文件或目录类型  
- 某些服务需要检测某些特定的目录来提供队列服务  
- 如打印服务，通过检测打印队列目录来启动打印功能  
  
## systemctl 管理服务  
- systemctl 命令来管理 systemd 服务  
- `systemctl [OPTIONS...] {COMMAND}`  
### systemctl start 立即启动服务  
  
### systemctl stop 立即关闭服务  
  
### systemctl restart 立即重启服务  
  
### systemctl reload 重新加载配置文件  
- 不关闭服务  
  
### systemctl enable 设置下次开机启动  
- `systemctl enable --now` 可以设置现在立即生效且以后开机启动  
  
### systemctl disable 设置下次开机不启动  
- `systemctl diabale --now` 可以设置现在立即生效且以后开机不启动  
  
### systemctl status 查看服务的状态  
1. Loaded 中显示的 daemon 状态  
- enabled  
开机启动  
- disabled  
开机不启动  
- static  
不能自动启动，但可能被其他 enabled 的服务唤醒  
如依赖属性的服务  
- mask  
无论如何都不能启动，已被强制注销（非删除）  
可通过 systemctl unmask 改为默认状态  
  
2. Active 状态  
- active (running)  
正在运行  
- active (exited)  
仅执行一次就退出  
- active (waiting)  
需要等待其他事件发生才能继续运行  
- inactive (dead)  
没有运行  
  
```bash  
[root@rocky8-3 system]$ systemctl status firewalld.service  
● firewalld.service - firewalld - dynamic firewall daemon  
   Loaded: loaded (/usr/lib/systemd/system/firewalld.service; disabled; vendor preset: enabled)  
   Active: inactive (dead)  
     Docs: man:firewalld(1)  
```  
```bash  
[root@rocky8-3 system]$ systemctl status httpd  
● httpd.service - The Apache HTTP Server  
   Loaded: loaded (/usr/lib/systemd/system/httpd.service; enabled; vendor preset: disabled)  
  Drop-In: /usr/lib/systemd/system/httpd.service.d  
           └─php-fpm.conf  
   Active: active (running) since Wed 2023-05-03 09:05:41 CST; 2h 8min ago  
     Docs: man:httpd.service(8)  
 Main PID: 1234 (httpd)  
   Status: "Running, listening on: port 80"  
    Tasks: 213 (limit: 11047)  
   Memory: 41.8M  
   CGroup: /system.slice/httpd.service  
           ├─1234 /usr/sbin/httpd -DFOREGROUND  
           ├─1381 /usr/sbin/httpd -DFOREGROUND  
           ├─1390 /usr/sbin/httpd -DFOREGROUND  
           ├─1397 /usr/sbin/httpd -DFOREGROUND  
           └─1402 /usr/sbin/httpd -DFOREGROUND  
  
May 03 09:05:38 rocky8-3 systemd[1]: Starting The Apache HTTP Server...  
May 03 09:05:41 rocky8-3 httpd[1234]: AH00558: httpd: Could not reliably determine the server's fully qualified >  
May 03 09:05:41 rocky8-3 systemd[1]: Started The Apache HTTP Server.  
May 03 09:05:41 rocky8-3 httpd[1234]: Server configured, listening on: port 80  
```  
  
  
### systemctl mask 注销服务  
  
### systemctl is-active 查看是否正在运行  
  
### systemctl is-enable 查看是否默认开机启动  
  
## systemctl 查看系统上的所有服务  
  
### systemctl list-units 显示全部启动的 units  
- 加上 `--all` 将没启动的也显示  
  
### systemctl list-unit-files 文件列表说明  
- 依据 `/usr/lib/systemd/system` 中的文件，对其列出说明  
- `--type=TYPE` 指定 type 类型  
  
```bash  
[root@rocky8-3 system]$ systemctl list-unit-files | head -n 5  
UNIT FILE                                  STATE  
proc-sys-fs-binfmt_misc.automount          static  
-.mount                                    generated  
boot.mount                                 generated  
dev-hugepages.mount                        static  
```  
```bash  
[root@rocky8-3 system]$ systemctl list-unit-files --type=socket | head -n5  
UNIT FILE                               STATE  
avahi-daemon.socket                     enabled  
cni-dhcp.socket                         disabled  
cockpit-wsinstance-http.socket          static  
cockpit-wsinstance-https-factory.socket static  
[root@rocky8-3 system]$  
[root@rocky8-3 system]$ systemctl list-unit-files --type socket | head -n5  
UNIT FILE                               STATE  
avahi-daemon.socket                     enabled  
cni-dhcp.socket                         disabled  
cockpit-wsinstance-http.socket          static  
cockpit-wsinstance-https-factory.socket static  
```  
  
## systemctl 管理不同的环境（target unit）  
```bash  
[root@rocky8-3 system]$ systemctl list-units --type=target --all | head -n5  
  UNIT                      LOAD      ACTIVE   SUB    DESCRIPTION  
  basic.target              loaded    active   active Basic System  
  bluetooth.target          loaded    active   active Bluetooth  
  cryptsetup.target         loaded    active   active Local Encrypted Volumes  
  emergency.target          loaded    inactive dead   Emergency Mode  
[root@rocky8-3 system]$ systemctl list-units --type=target --all | grep shutdown  
  shutdown.target           loaded    inactive dead   Shutdown  
[root@rocky8-3 system]$ systemctl list-units --type=target --all | grep graphic  
  graphical.target          loaded    active   active Graphical Interface  
```  
  
### 常见环境  
- graphical.target 加载图形界面，包含 multi-user.target  
- multi-user.target 纯命令行模式  
- rescue.target 无法使用 root 登录时使用  
- emergency.target 紧急处理系统的错误，需要使用 root 登录  
- shutdown.target 关机  
- getty.target 设置 tty 个数等  
  
```bash  
[root@rocky8-3 system]$ systemctl list-units --type=target | grep graphical  
graphical.target       loaded active active Graphical Interface  
  
[root@rocky8-3 system]$ systemctl list-units --type=target | grep multi-user  
multi-user.target      loaded active active Multi-User System  
  
[root@rocky8-3 system]$ systemctl list-units --type=target --all | grep shutdown  
  shutdown.target           loaded    inactive dead   Shutdown  
  
[root@rocky8-3 system]$ systemctl list-units --type=target --all | grep rescue  
  rescue.target             loaded    inactive dead   Rescue Mode  
  
[root@rocky8-3 system]$ systemctl list-units --type=target --all | grep emergency  
  emergency.target          loaded    inactive dead   Emergency Mode  
  
[root@rocky8-3 system]$ systemctl list-units --type=target --all | grep getty  
  getty-pre.target          loaded    inactive dead   Login Prompts (Pre)  
  getty.target              loaded    active   active Login Prompts  
```  
  
### systemctl get-default 查看当前系统环境  
```bash  
[root@rocky8-3 system]$ systemctl get-default  
graphical.target  
```  
  
### systemctl set-default 设置当前系统默认环境  
- 设置后当前仍是图形环境，不能立刻切换到命令行环境  
```bash  
[root@rocky8-3 system]$ systemctl get-default  
graphical.target  
[root@rocky8-3 system]$  
[root@rocky8-3 system]$ systemctl set-default multi-user.target  
Removed /etc/systemd/system/default.target.  
Created symlink /etc/systemd/system/default.target → /usr/lib/systemd/system/multi-user.target.  
[root@rocky8-3 system]$  
[root@rocky8-3 system]$ systemctl get-default  
multi-user.target  
```  
  
### systemctl isolate 切换操作环境  
- 无需重启即可改变操作环境  
  
```bash  
[root@rocky8-3 system]$ systemctl get-default  
graphical.target  
[root@rocky8-3 system]$  
[root@rocky8-3 system]$ systemctl isolate multi-user.target  
[root@rocky8-3 system]$  
[root@rocky8-3 system]$ systemctl isolate graphical.target  
```  
  
### 命令切换环境  
- systemctl poweroff  
- systemctl reboot  
- systemctl suspend 挂起模式  
系统的状态数据保存到内存  
关闭大部分的系统硬件，但并不实际关机  
唤醒后系统数据从内存中恢复，重新驱动被大部分关闭的硬件  
- systemctl hibernate 休眠模式  
系统状态保存到硬盘，保存完后关闭计算机  
用户唤醒系统时，系统正常运行，将硬盘中的系统状态恢复  
唤醒的性能与硬盘的速度有关  
- systemctl rescue 救援模式  
- systemctl emergency 紧急恢复模式  
  
## systemctl show 显示默认设置  
```bash  
[root@rocky8-3 system]$ systemctl show getty.target | head -n10  
Id=getty.target  
Names=getty.target  
Wants=getty@tty1.service  
WantedBy=multi-user.target  
Conflicts=shutdown.target  
Before=multi-user.target shutdown.target  
After=getty@tty1.service  
Documentation=man:systemd.special(7) man:systemd-getty-generator(8) http://0pointer.de/blog/projects/serial-console.html  
Description=Login Prompts  
LoadState=loaded  
```  
  
## systemctl list-dependencies 分析各服务之间的依赖性  
### 查看某个服务所依赖的服务  
`systemctl list-dependencies` 显示的 default.target 为当前默认的环境，即用 `systemctl get-default` 看到的，这里为 `graphical.target`  
  
列出的部分内容为 default.target 所依赖的服务  
```bash  
[root@rocky8-3 system]$ systemctl list-dependencies | less  
  
default.target  
● ├─accounts-daemon.service  
● ├─gdm.service  
● ├─nvmefc-boot-connections.service  
● ├─rtkit-daemon.service  
● ├─systemd-update-utmp-runlevel.service  
● ├─udisks2.service  
● └─multi-user.target  
●   ├─atd.service  
●   ├─auditd.service  
●   ├─avahi-daemon.service  
●   ├─crond.service  
●   ├─dbus.service  
●   ├─httpd.service  
●   ├─irqbalance.service  
●   ├─kdump.service  
●   ├─libstoragemgmt.service  
●   ├─mcelog.service  
●   ├─mdmonitor.service  
```  
  
```bash  
[root@rocky8-3 system]$ systemctl list-dependencies graphical.target | less  
  
graphical.target  
● ├─accounts-daemon.service  
● ├─gdm.service  
● ├─nvmefc-boot-connections.service  
● ├─rtkit-daemon.service  
● ├─systemd-update-utmp-runlevel.service  
● ├─udisks2.service  
● └─multi-user.target  
●   ├─atd.service  
```  
  
```bash  
[root@rocky8-3 system]$ systemctl list-dependencies sshd.service | less  
  
sshd.service  
● ├─system.slice  
● ├─sshd-keygen.target  
● │ ├─sshd-keygen@ecdsa.service  
● │ ├─sshd-keygen@ed25519.service  
● │ └─sshd-keygen@rsa.service  
● └─sysinit.target  
●   ├─dev-hugepages.mount  
●   ├─dev-mqueue.mount  
●   ├─dracut-shutdown.service  
```  
  
### 查看某个服务被什么服务依赖  
- 加上 `--reverse` 选项  
```bash  
[root@rocky8-3 system]$ systemctl list-dependencies graphical.target --reverse  
graphical.target  
[root@rocky8-3 system]$ systemctl list-dependencies multi-user.target --reverse  
multi-user.target  
● └─graphical.target  
[root@rocky8-3 system]$ systemctl list-dependencies sshd.service --reverse  
sshd.service  
● └─multi-user.target  
●   └─graphical.target  
```  
  
## systemctl list-socket 查看 socket 文件位置  
```bash  
[root@rocky8-3 system]$ systemctl list-sockets | head -n5  
LISTEN                            UNIT                            ACTIVATES  
/run/avahi-daemon/socket          avahi-daemon.socket             avahi-daemon.service  
/run/dbus/system_bus_socket       dbus.socket                     dbus.service  
/run/dmeventd-client              dm-event.socket                 dm-event.service  
/run/dmeventd-server              dm-event.socket                 dm-event.service  
```  
  
## 关闭不必要的网络服务  
- 网络服务可以理解为会产生一个网络监听端口的进程，可以用 `ss` 查看  
`[root@rocky8-3 system]$ ss -tunlp` 查看  
```bash  
[root@rocky8-3 system]$ ss -tunlp | tr -s "[[:blank:]]" "\t"  
Netid   State   Recv-Q  Send-Q  Local   Address:Port    Peer    Address:PortProcess  
udp     UNCONN  0       0       0.0.0.0:5353    0.0.0.0:*       users:(("avahi-daemon",pid=1049,fd=15))  
udp     UNCONN  0       0       0.0.0.0:5355    0.0.0.0:*       users:(("systemd-resolve",pid=1011,fd=12))  
udp     UNCONN  0       0       0.0.0.0:33478   0.0.0.0:*       users:(("avahi-daemon",pid=1049,fd=17))  
udp     UNCONN  0       0       127.0.0.53%lo:53        0.0.0.0:*       users:(("systemd-resolve",pid=1011,fd=17))  
udp     UNCONN  0       0       ::      :5353   ::      :*      users:(("avahi-daemon",pid=1049,fd=16))  
udp     UNCONN  0       0       ::      :5355   ::      :*      users:(("systemd-resolve",pid=1011,fd=14))  
udp     UNCONN  0       0       ::      :35064  ::      :*      users:(("avahi-daemon",pid=1049,fd=18))  
tcp     LISTEN  0       128     0.0.0.0:5355    0.0.0.0:*       users:(("systemd-resolve",pid=1011,fd=13))  
tcp     LISTEN  0       128     0.0.0.0:22      0.0.0.0:*       users:(("sshd",pid=1074,fd=4))  
tcp     LISTEN  0       128     127.0.0.1:6010  0.0.0.0:*       users:(("sshd",pid=2508,fd=15))  
tcp     LISTEN  0       128     *:3306  *:*     users:(("mysqld",pid=1273,fd=34))  
tcp     LISTEN  0       128     ::      :5355   ::      :*      users:(("systemd-resolve",pid=1011,fd=15))  
tcp     LISTEN  0       128     *:80    *:*     users:(("httpd",pid=1402,fd=4),("httpd",pid=1397,fd=4),("httpd",pid=1390,fd=4),("httpd",pid=1234,fd=4))  
tcp     LISTEN  0       128     ::      :22     ::      :*      users:(("sshd",pid=1074,fd=6))  
tcp     LISTEN  0       128     ::1     :6010   ::      :*      users:(("sshd",pid=2508,fd=14))  
tcp     LISTEN  0       70      *:33060 *:*     users:(("mysqld",pid=1273,fd=22))  
```  
  
- 在 systemctl 中查看 avahi-daemon   
```bash  
[root@rocky8-3 system]$ systemctl list-units --all | grep avahi  
avahi-daemon.service loaded active running Avahi mDNS/DNS-SD Stack   
avahi-daemon.socket loaded active running Avahi mDNS/DNS-SD Stack Activation Socket  
```  
  
- 查看该服务的说明  
如果该功能不需要，可以关掉  
```bash  
[root@rocky8-3 system]$ man avahi  
avahi-daemon       avahi-daemon.conf  avahi.hosts        avahi.service  
[root@rocky8-3 system]$ man avahi-daemon  
```  
  
## 与 systemd 的 daemon 运行过程相关的目录  
  
### /usr/lib/systemd/system  
- 启动脚本配置文件  
- 最好不要修改，到 /etc/systemd/system 中修改  
  
  
### /run/systemd/system  
- 系统执行过程产生的服务脚本  
- 优先级比 /usr/lib/systemd/system 高  
  
  
### /etc/systemd/system  
- 管理员根据需要建立的执行脚本  
- 类似 `/etc/rc5.d/SXX` 之类的文件  
- 优先级比 /run/systemd/system 高  
- 有些子目录后缀为 `.wants` 表示启动该服务后，最好再加上该目录内的服务  
```bash  
[root@rocky8-3 system]$ ll multi-user.target.wants/  
total 0  
lrwxrwxrwx. 1 root root 35 Feb 21 15:24  atd.service -> /usr/lib/systemd/system/atd.service  
lrwxrwxrwx. 1 root root 38 Feb 21 15:19  auditd.service -> /usr/lib/systemd/system/auditd.service  
lrwxrwxrwx. 1 root root 44 Feb 21 15:22  avahi-daemon.service -> /usr/lib/systemd/system/avahi-daemon.service  
lrwxrwxrwx. 1 root root 37 Feb 21 15:19  crond.service -> /usr/lib/systemd/system/crond.service  
lrwxrwxrwx  1 root root 37 Apr 24 10:34  httpd.service -> /usr/lib/systemd/system/httpd.service  
lrwxrwxrwx. 1 root root 42 Feb 21 15:24  irqbalance.service -> /usr/lib/systemd/system/irqbalance.service  
lrwxrwxrwx. 1 root root 37 Feb 21 15:22  kdump.service -> /usr/lib/systemd/system/kdump.service  
lrwxrwxrwx. 1 root root 46 Feb 21 15:22  libstoragemgmt.service -> /usr/lib/systemd/system/libstoragemgmt.service  
lrwxrwxrwx. 1 root root 38 Feb 21 15:24  mcelog.service -> /usr/lib/systemd/system/mcelog.service  
lrwxrwxrwx. 1 root root 41 Feb 21 15:22  mdmonitor.service -> /usr/lib/systemd/system/mdmonitor.service  
lrwxrwxrwx. 1 root root 44 Feb 21 15:19  ModemManager.service -> /usr/lib/systemd/system/ModemManager.service  
lrwxrwxrwx. 1 root root 38 Apr 22 21:22  mysqld.service -> /usr/lib/systemd/system/mysqld.service  
lrwxrwxrwx. 1 root root 46 Feb 21 15:19  NetworkManager.service -> /usr/lib/systemd/system/NetworkManager.service  
lrwxrwxrwx. 1 root root 40 Feb 21 15:19  remote-fs.target -> /usr/lib/systemd/system/remote-fs.target  
lrwxrwxrwx. 1 root root 39 Feb 21 15:19  rsyslog.service -> /usr/lib/systemd/system/rsyslog.service  
lrwxrwxrwx. 1 root root 49 Feb 21 15:24 'run-vmblock\x2dfuse.mount' -> '/usr/lib/systemd/system/run-vmblock\x2dfuse.mount'  
lrwxrwxrwx. 1 root root 38 Feb 21 15:24  smartd.service -> /usr/lib/systemd/system/smartd.service  
lrwxrwxrwx. 1 root root 36 Feb 21 15:24  sshd.service -> /usr/lib/systemd/system/sshd.service  
lrwxrwxrwx. 1 root root 36 Feb 21 15:22  sssd.service -> /usr/lib/systemd/system/sssd.service  
lrwxrwxrwx  1 root root 48 Apr 30 10:46  systemd-resolved.service -> /usr/lib/systemd/system/systemd-resolved.service  
lrwxrwxrwx. 1 root root 37 Feb 21 15:24  tuned.service -> /usr/lib/systemd/system/tuned.service  
lrwxrwxrwx. 1 root root 35 Feb 21 15:24  vdo.service -> /usr/lib/systemd/system/vdo.service  
lrwxrwxrwx. 1 root root 40 Feb 21 15:23  vmtoolsd.service -> /usr/lib/systemd/system/vmtoolsd.service  
```  
- 有些子目录后缀为 `.requires`，目录内为依赖服务的链接，表示启动该服务前需要事先启动的依赖服务  
```bash  
[root@rocky8-3 system]$ ll vmtoolsd.service.requires/  
total 0  
lrwxrwxrwx. 1 root root 39 Feb 21 15:23 vgauthd.service -> /usr/lib/systemd/system/vgauthd.service  
```  
  
### /etc/sysconfig/*  
- 几乎所有服务将初始化的一些选项设置写入到该目录  
- 如网卡配置的文件在该目录中 network-scripts 目录中  
  
  
### /var/lib  
- 一些会产生数据的服务将其产生的数据写到该目录  
- 例如数据库管理系统 MariaDB 的数据库默认在该目录的 /var/lib/mysql 中  
  
  
### /run/  
- 放置很多 daemon 的缓存  
- 包括 lock 文件和 PID 文件  
    
  
## systemctl 自定义配置 service 文件  
1. service 文件初始默认在 `/usr/lib/systemd/system/` 目录中  
如想修改 mysqld.service，在该目录中查看 service 文件，部分内容如下：  
```bash  
  1 # It's not recommended to modify this file in-place, because it will be  
  2 # overwritten during package upgrades.  If you want to customize, the  
  3 # best way is to use systemctl edit:  
  4 #  
  5 # $ systemctl edit mysqld.service  
  6 #  
  7 # this will create file  
  8 #  
  9 #  /etc/systemd/system/mysqld.service.d/override.conf  
 10 #  
 11 # which be parsed after the file mysqld.service itself is parsed.  
 12 #  
 13 # For example, if you want to increase mysql's open-files-limit to 20000  
 14 # add following when editing with command above:  
 15 #  
 16 #   [Service]  
 17 #   LimitNOFILE=20000  
 18 #  
 19 # Or if you require to execute pre and post scripts in the unit file as root, set  
 20 #       PermissionsStartOnly=true  
 21 #  
 22 # For more info about custom unit files, see systemd.unit(5) or  
 23 # http://fedoraproject.org/wiki/Systemd#How_do_I_customize_a_unit_file.2F_add_a_custom_unit_file.3F  
 24 #  
 25 # Don't forget to reload systemd daemon after you change unit configuration:  
 26 # root> systemctl --system daemon-reload  
 27  
 28 [Unit]  
 29 Description=MySQL 8.0 database server  
 30 After=syslog.target  
 31 After=network.target  
```  
从官方说明文档可以看到，最好不在该文件中修改  
如果想修改 service 文件，可以执行 `systemctl edit mysqld.service`   
该命令会生成 `/etc/systemd/system/mysqld.service.d/override.conf` 文件  
前面提到过 `/etc/systemd/system/` 目录，该目录中存放管理员建的文件，优先级更高  
该目录下的自定义配置会覆盖默认配置生效  
`override.conf` 可以根据需要改名，后缀为 `.conf`  
在 `mysqld.service.d` 目录中的自定义文件都会被调用  
用命令方式生成目录和文件则默认打开 nano 来编辑自定义文件  
  
2. 根据官方提示让配置文件生效  
```  
 # Don't forget to reload systemd daemon after you change unit configuration:  
 25 # root> systemctl --system daemon-reload  
```  
  
## systemctl 配置文件的设置项目  
> [Common service parameters](https://docs.fedoraproject.org/en-US/quick-docs/understanding-and-administering-systemd/index.html#common-service-parameters)  
  
以 `/usr/lib/systemd/system/sshd.service` 为例：  
```bash  
 1 [Unit]  
  2 Description=OpenSSH server daemon  
  3 Documentation=man:sshd(8) man:sshd_config(5)  
  4 After=network.target sshd-keygen.target  
  5 Wants=sshd-keygen.target  
  6  
  7 [Service]  
  8 Type=notify  
  9 EnvironmentFile=-/etc/crypto-policies/back-ends/opensshserver.config  
 10 EnvironmentFile=-/etc/sysconfig/sshd  
 11 ExecStart=/usr/sbin/sshd -D $OPTIONS $CRYPTO_POLICY  
 12 ExecReload=/bin/kill -HUP $MAINPID  
 13 KillMode=process  
 14 Restart=on-failure  
 15 RestartSec=42s  
 16  
 17 [Install]  
 18 WantedBy=multi-user.target  
```  
  
1. [Unit]   
- Description  
用 `systemctl list-units --all` 时看到的说明，对该服务的介绍  
  
```bash  
[root@rocky8-3 system]$ systemctl list-units --all | grep sshd.service  
sshd.service loaded active running OpenSSH server daemon  
```  
  
- Documentation  
介绍如何查看该服务的帮助文档，说名  
  
- After  
表示此服务在哪些服务启动后才启动  
但并非强制要求一定要在这些服务启动后启动  
  
- Before  
与 After 相反，在哪些服务启动前最好先启动此服务  
非强制要求  
  
- Requires  
依赖服务设置  
必须在这些服务启动后才能启动此服务  
  
- Wants  
与 Requires 相反，在此服务启动后最好再启动这些服务  
非强制要求  
  
- Conflicts  
冲突的服务  
如果此服务与列出的这些服务均启动，则会有冲突  
  
2. [Service]  
> [Service Parameters](https://docs.fedoraproject.org/en-US/quick-docs/understanding-and-administering-systemd/index.html#_service_parameters)  
  
- Type  
daemon 的启动方式，默认 simple  
  
- EnvironmentFile  
环境配置文件  
  
- ExecStart  
实际执行此 daemon 的命令或脚本程序  
  
- ExecStop   
关闭此服务的命令  
与 systemctl stop 相关的命令  
  
- ExecReload  
与 systemctl reload 相关的命令  
  
- Restart  
设置服务进程终止后是否重启该服务  
```bash  
Configures whether to restart the service when the service’s process exits, is killed, or reaches a timeout:  
  
no - The service will not be restarted. This is the default.  
  
on-success - Restart only when the service process exits cleanly (exit code 0).  
  
on-failure - Restart only when the service process does not exit cleanly (node-zero exit code).  
  
on-abnormal - Restart if the process terminates with a signal or when a timeout occurs.  
  
on-abort - Restart if the process exits due to an uncaught signal not specified as a clean exit status.  
  
always - Always restart.  
```  
  
- RemainAfterExit  
当 daemon 所有的进程都终止后，是否重新尝试启动服务  
  
- TimeoutSec  
当服务因为某些原因无法正常启动或关闭时，等待多久强制结束  
  
- KillMode  
> [KillMode](https://manpages.ubuntu.com/manpages/bionic/man5/systemd.kill.5.html)  
  
设置服务终止时终止哪些进程  
    - process  
    daemon 终止时只终止主要的进程  
    ExecStop 设置的命令  
    - control-group  
    daemon 终止时将 daemon 终止时产生的 control-group 的进程都关闭  
    - none  
    不会终止任何进程  
  
- RestartSec  
此服务关闭后，如果需要重启，sleep 多久，默认 100ms  
  
  
3. [Install]  
- WantedBy  
指此服务依附于哪个 target unit  
  
- Also  
Additional units to install or uninstall when this service is installed or uninstalled.  
  
- Alias  
别名  
> A space-separated list of additional names this service shall be installed under.   
> The names listed here must have the same suffix (i.e. type) as the service filename.  
  
## 重要的系统服务  
> [7.3.3 埠口与服务的启动/关闭及开机时状态设定](http://cn.linux.vbird.org/linux_server/0210network-secure_3.php#portlimit_start)  
