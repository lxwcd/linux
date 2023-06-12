实验记录

# 实验一 LVS + Nginx 提供 Web 服务
- 打算将两个笔记本用上，一个 ubuntu20.04 物理机，一个 windows11 上装虚拟机
- 未完成：网络原因，ubuntu20.04 用 windows 笔记本的热点，网段和 windows 上的虚拟机不同
- ubuntu20.04 是原来的 windows 系统改的，后来厂家说该笔记本不支持 linux 系统，
  没有 以太网接口，用 usb 转换也无法上网，可能没配置好？
  开机按 F12 进入 BIOS 无法使用方向键，即无法进入 BIOS 界面菜单进行操作等
- windows 上如果要能为热点分配指定 IP 则需要借助第三方软件，目前使用的 360 免费wifi 不能指定 IP

*****************

- 让 ubuntu20.04 笔记本和 windows11 笔记本连接同一个 wifi，两个笔记本网段相同
- 虚拟机中增加一个桥接网卡，桥接时选择桥接到 wifi 的那个虚拟网络适配器（Intel(R) Wi-Fi 6E AX211 160MHz）
- windows 的文件夹可以共享给虚拟机
- windows11 上安装了 WSL，可以用 showmount -e 查看远程的共享文件，但不能挂载

```bash
root@LAPTOP-VB238NKA:~# mount.
mount.drvfs       mount.lowntfs-3g  mount.nfs4        mount.ntfs-3g
mount.fuse        mount.nfs         mount.ntfs        mount.vmhgfs
root@LAPTOP-VB238NKA:~# mount -a
mount.nfs: No such device
```


## 实验目的
将学习过程中学到的一些服务搭建一起使用，尽可能做个有点意义的实验
加深对各服务的理解，熟悉各服务搭建的操作


## 实验环境
1. 笔记本1，win11 系统，安装一个 WLS（ubuntu 20.04），安装 VMware 
内存：32G
实验主要在虚拟机中做
本机以太网 IP: 172.18.0.69
```bash
6: wifi2: <BROADCAST,MULTICAST,UP> mtu 1500 group default qlen 1
link/ieee802.11 7e:b5:66:5f:41:aa
inet 192.168.137.1/24 brd 192.168.137.255 scope global dynamic
    valid_lft forever preferred_lft forever
inet6 fe80::abf7:ab8c:1b65:326a/64 scope link dynamic
    valid_lft forever preferred_lft forever
```

本机全部网络接口：
```bash
➜  ~ hostname -I
172.18.0.69 192.168.10.1 10.0.0.1 192.168.253.1
```
其中第一个为以太网 IP，第二个为 VMnet1 (虚拟机网桥模式的虚拟适配器) 的 IP
第三个为 VMnet8（虚拟机 NAT 模式的虚拟适配器）的 IP
第四个为热点所使用的虚拟网络适配器（Microsoft Wi-Fi Direct Virtual Adapter #4）的 IP



2. 笔记本2，ubuntu 20.04 系统，8G 内存（5G 可用）
内存：8G
连接笔记本1 的热点
    
有 kvm 模块，但是需要硬件开启虚拟化，可能原始是 windows 10 操作系统，硬件不支持 linux,
进入 BIOS 后无法开启硬件虚拟化，按不了方向键选择菜单
```bash
[21:20:52 root@ubuntu2004 /var/log/libvirt]#kvm-ok
INFO: /dev/kvm does not exist
HINT:   sudo modprobe kvm_amd
INFO: Your CPU supports KVM extensions
INFO: KVM (svm) is disabled by your BIOS
HINT: Enter your BIOS setup and enable Virtualization Technology (VT),
      and then hard oweroff/poweron your system
KVM acceleration can NOT be used
```

- 网络问题
初始笔记本的 IP 连接的是笔记本2 的热点，IP 为 193.168.137.17
![](img/2023-06-09-20-35-29.png)

windows 上开启热点后用的是虚拟网络适配器来分配分享的 WiFi，查看设备管理器
![](img/2023-06-10-19-07-00.png)

在控制面版中可看见一个名字为 `本地连接* 12` 的设备，将该设备的 IP 改为其他网段后，不能用
网上有人说该 IP 不能修改，除非装第三方工具可以创建虚拟网桥，分享 wifi 且自己设置 IP


将该设备右键 `禁用` 后看不到该设备，以太网右键选择属性后，查看共享的设备也无虚拟网络适配器，
在设备管理器中查看网络适配器，不显示虚拟网络适配器，显示隐藏的设备后才显示，重启设备后依旧不行；
虚拟网络适配器不能用，则热点无法使用

用 360 免费wifi 后又出现一个新的虚拟网络适配器，适配器的 IP 地址变为 192.168.253.1/24

- 最终网络环境
笔记本的 IP 最新：192.168.253.2
笔记本2不能与笔记本1以太网的 IP（172.18.0.69）通信，也不能和虚拟机通信
虚拟机可以和笔记本2通信

<font color=red>虚拟机 (10.0.0.203，NAT 模式) 有时可以 ping 通笔记本2，有时不可以？？ </font>


## 实验框架
1. 客户端
客户端网络和 Web 服务端网络隔离，客户端不能访问服务端内部网络
用 rocky8.6 系统
添加一块网卡，选择仅主机模式


5. NFS1

- 网络问题
初始用笔记本1，该笔记本的 IP 连接的是笔记本2 的热点，IP 为 193.168.137.17
![](img/2023-06-09-20-35-29.png)

windows 上开启热点后用的是虚拟网络适配器来分配分享的 WiFi，查看设备管理器
![](img/2023-06-10-19-07-00.png)

在控制面版中可看见一个名字为 `本地连接* 12` 的设备，将该设备的 IP 改为其他网段后，不能用
网上有人说该 IP 不能修改，除非装第三方工具可以创建虚拟网桥，分享 wifi 且自己设置 IP


将该设备右键 `禁用` 后看不到该设备，以太网右键选择属性后，查看共享的设备也无虚拟网络适配器，
在设备管理器中查看网络适配器，不显示虚拟网络适配器，显示隐藏的设备后才显示，重启设备后依旧不行；
虚拟网络适配器不能用，则热点无法使用

用 360 免费wifi 后又出现一个新的虚拟网络适配器，适配器的 IP 地址变为 192.168.253.1/24





## 安装 NFS1
- 笔记本1 

### 安装服务端工具
```bash
[19:34:36 root@ubuntu2004 ~]#apt update; apt install -y nfs-kernel-server
```

```bash
[19:34:36 root@ubuntu2004 ~]#systemctl status nfs-
nfs-blkmap.service         nfs-config.service         nfs-mountd.service
nfs-client.target          nfs-idmapd.service         nfs-server.service
nfs-common.service         nfs-kernel-server.service  nfs-utils.service
[19:34:36 root@ubuntu2004 ~]#systemctl status nfs-server.service
● nfs-server.service - NFS server and services
     Loaded: loaded (/lib/systemd/system/nfs-server.service; enabled; vendor preset: enabled)
     Active: active (exited) since Sat 2023-06-10 16:42:59 CST; 2h 52min ago
   Main PID: 12130 (code=exited, status=0/SUCCESS)
      Tasks: 0 (limit: 8141)
     Memory: 0B
     CGroup: /system.slice/nfs-server.service

Jun 10 16:42:58 ubuntu2004 systemd[1]: Starting NFS server and services...
Jun 10 16:42:59 ubuntu2004 systemd[1]: Finished NFS server and services.
```


### 客户端配置
客户端查看是否能看到看到远程主机的 NFS 共享

windows11 上的 WSL ubuntu20.04 能 ping 通 nfs 服务端，但用 rpcinfo 和 showmount -e 不能看到结果
windows11 上的虚拟机 ubuntu22.04 (10.0.0.203) 同样

```bash
[root@ubuntu22-c3 netplan]$ rpcinfo -p 192.168.253.2
192.168.253.2: RPC: Remote system error - No route to host
```
```bash
[root@ubuntu22-c3 netplan]$ ping 192.168.253.2
PING 192.168.253.2 (192.168.253.2) 56(84) bytes of data.
64 bytes from 192.168.253.2: icmp_seq=1 ttl=128 time=235 ms
64 bytes from 192.168.253.2: icmp_seq=2 ttl=128 time=155 ms
^C
--- 192.168.253.2 ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 1001ms
rtt min/avg/max/mdev = 155.256/195.132/235.009/39.876 ms
```

# 实验二 LVS-NAT + Nginx 搭建 wordpress
实验目的和实验一相同
全部实验主机在 windows11 中 通过VMware 创建虚拟机完成
windows11 和 ubuntu20.04 两个笔记本均连接同一个 wifi
windows11 的 IP 为：192.168.137.123
ubuntu20.04 的 IP：192.168.137.191

## 实验环境
VMWare 创建虚拟机，NAT 模式只能在一个网段，网关为 10.0.0.2/24
windows11 上 NAT 模式的虚拟网络适配器的 IP 为 10.0.0.1/24



## 实验框架

### 客户端
模拟互联网上的客户端
客户端只能与 LVS 的 VIP 的通信，不能与服务端内部主机通信
客户端虚拟机用仅主机模式
客户端 IP：192.168.10.2/24
网关：指向路由器 192.168.10.1/24

### 路由器
实际场景应是客户端连一个路由器，路由器有公网 IP 与互联网通信，再到达服务端的路由器
与服务端通信，这里为了减少虚拟机的数量，用一个路由器代替
路由器的一个网络接口与客户端通信，一个网络接口与服务器端通信

路由器添加一个仅主机模式网卡，与客户端通信，IP：
路由器添加一个桥接模式网卡，与 LVS 的 VIP 端通信，IP：192.168.137.202


```bash
[root@router ~]$ route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
0.0.0.0         192.168.137.1   0.0.0.0         UG    101    0        0 eth1
192.168.10.0    0.0.0.0         255.255.255.0   U     100    0        0 eth0
192.168.10.0    192.168.10.1    255.255.255.0   UG    100    0        0 eth0
192.168.137.0   0.0.0.0         255.255.255.0   U     101    0        0 eth1
```


路由器开启转发的功能
初始默认未开启转发
```bash
[root@router ~]$ cat /proc/sys/net/ipv4/ip_forward
0
```

永久生效修改 `/etc/sysctl.conf` 配置文件
```bash
1 # Uncomment the next line to enable packet forwarding for IPv4
28  net.ipv4.ip_forward=1
```

查看
```bash
[root@router ~]$ sysctl -p
net.ipv4.ip_forward = 1
[root@router ~]$ cat /proc/sys/net/ipv4/ip_forward
1
```



### LVS
使用两个网卡
- LVS VIP
一个桥接模式网卡，对外通信，和路由器能连通，IP 为 192.168.137.203


- LVS DIP
一个仅主机模式网卡，对内通信，不能连外网，IP 为 10.0.1.203


```bash
[root@lvs netplan]$ route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
0.0.0.0         192.168.137.202 0.0.0.0         UG    100    0        0 eth0
10.0.1.0        0.0.0.0         255.255.255.0   U     101    0        0 eth1
192.168.10.0    192.168.10.3    255.255.255.0   UG    100    0        0 eth0
192.168.10.3    0.0.0.0         255.255.255.255 UH    100    0        0 eth0
192.168.137.0   0.0.0.0         255.255.255.0   U     100    0        0 eth0
```



### Nginx1 
- NAT 模式，可以用仅主机模式与客户端隔离，但需要上网安装软件
- IP：10.0.0.204
- 安装软件时默认路由指向 10.0.0.2
- 安装软件完成后默认路由指向 10.0.0.203 (LVS DIP)
- 编译安装 


#### 安装 php-fpm
- 包安装，安装会新建系统用户 www-data
- 要搭 wordpress，需要安装 php-mysqlnd 和 php-json 
不装时网页访问服务器时进入 wordpress 安装界面会提示需要安装数据库



#### 安装 nginx
- 编译安装 
- 指定 owner 和 group 和 php-fpm 的用户相同，即 www-data
- 修改 nginx 安装目录中的文件 owner 和 group 均为 www
```bash
[root@nginx1 nginx]$ ps auxf | head -n1; ps auxf | grep -i "nginx" | tr -s " "
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root 14067 0.0 0.1 9564 2220 pts/1 S+ 20:38 0:00 \_ grep --color=auto -i nginx
root 7001 0.0 0.0 10156 940 ? Ss 19:52 0:00 nginx: master process /usr/local/nginx/sbin/nginx
www-data 7002 0.0 0.1 10892 3680 ? S 19:52 0:00 \_ nginx: worker process
www-data 7003 0.0 0.1 10892 3680 ? S 19:52 0:00 \_ nginx: worker process
```
- 安装路径为默认路径，即 `/usr/local/nginx`
- 编译安装的选项为：
```bash
[root@nginx1 nginx]$ nginx -V
nginx version: nginx/1.22.1
built by gcc 11.3.0 (Ubuntu 11.3.0-1ubuntu1~22.04.1)
built with OpenSSL 3.0.2 15 Mar 2022
TLS SNI support enabled
configure arguments: --user=www-data --group=www-data --with-http_ssl_module --with-http_v2_module --with-http_realip_module --with-http_stub_status_module --with-http_gzip_static_module --with-pcre --with-stream --with-stream_ssl_module --with-stream_realip_module
```


#### 为 nginx 创建 service 文件
创建 `nginx.service` 文件，用 systemctl 来管理 nginx 服务
```bash
[root@nginx1 nginx]$ vim /lib/systemd/system/nginx.service
```

```bash
[Unit]
Description=The nginx HTTP and reverse proxy server
After=network.target remote-fs.target nss-lookup.target

[Service]
Type=forking
PIDFile=/usr/local/nginx/run/nginx.pid
ExecStartPre=/bin/rm -f /usr/local/nginx/run/nginx.pid
ExecStartPre=/usr/local/nginx/sbin/nginx -t
ExecStart=/usr/local/nginx/sbin/nginx
ExecReload=/bin/kill -s HUP \$MAINPID
KillSignal=SIGQUIT
TimeoutStopSec=5
KillMode=process
PrivateTmp=true
LimitNOFILE=100000

[Install]
WantedBy=multi-user.target
```

默认 PIDFile 路径在 `/usr/local/nginx/logs` 文件中，
如果 nginx.service 文件中指定路径在 `/usr/local/nginx/run` 目录下，
则需要创建 `/usr/local/nginx/run` 目录


- service 文件的路径可以随便找一个已有的服务查看其状态，会显示出路径
```bash
[root@nginx1 nginx]$ systemctl status sshd.service
● ssh.service - OpenBSD Secure Shell server
     Loaded: loaded (/lib/systemd/system/ssh.service; enabled; vendor preset: enabled)
     Active: active (running) since Mon 2023-06-12 08:12:57 CST; 13h ago
       Docs: man:sshd(8)
             man:sshd_config(5)
    Process: 947 ExecStartPre=/usr/sbin/sshd -t (code=exited, status=0/SUCCESS)
   Main PID: 982 (sshd)
      Tasks: 1 (limit: 2193)
     Memory: 15.2M
        CPU: 1.756s
     CGroup: /system.slice/ssh.service
             └─982 "sshd: /usr/sbin/sshd -D [listener] 0 of 10-100 startups"

Jun 12 19:35:20 nginx1 sshd[6350]: pam_unix(sshd:session): session opened for user root(uid=0) by (uid=0)
Jun 12 19:35:20 nginx1 sshd[6352]: pam_unix(sshd:auth): authentication failure; logname= uid=0 euid=0 tty=ssh ruse>
Jun 12 19:35:20 nginx1 sshd[6370]: pam_unix(sshd:auth): authentication failure; logname= uid=0 euid=0 tty=ssh ruse>
Jun 12 19:35:24 nginx1 sshd[6352]: Accepted password for root from 10.0.0.1 port 54981 ssh2
Jun 12 19:35:24 nginx1 sshd[6352]: pam_unix(sshd:session): session opened for user root(uid=0) by (uid=0)
Jun 12 19:35:24 nginx1 sshd[6370]: Accepted password for root from 10.0.0.1 port 54982 ssh2
Jun 12 19:35:24 nginx1 sshd[6370]: pam_unix(sshd:session): session opened for user root(uid=0) by (uid=0)
Jun 12 19:35:24 nginx1 sshd[6512]: pam_unix(sshd:auth): authentication failure; logname= uid=0 euid=0 tty=ssh ruse>
Jun 12 19:35:26 nginx1 sshd[6512]: Accepted password for root from 10.0.0.1 port 54984 ssh2
Jun 12 19:35:26 nginx1 sshd[6512]: pam_unix(sshd:session): session opened for user root(uid=0) by (uid=0)
```

- service 文件的格式参考官方的例子，或者通过包安装后参考其格式
> [NGINX systemd service file](https://www.nginx.com/resources/wiki/start/topics/examples/systemd/)

官方的例子入下：
```bash
[Unit]
Description=The NGINX HTTP and reverse proxy server
After=syslog.target network-online.target remote-fs.target nss-lookup.target
Wants=network-online.target

[Service]
Type=forking
PIDFile=/run/nginx.pid
ExecStartPre=/usr/sbin/nginx -t
ExecStart=/usr/sbin/nginx
ExecReload=/usr/sbin/nginx -s reload
ExecStop=/bin/kill -s QUIT $MAINPID
PrivateTmp=true

[Install]
WantedBy=multi-user.target
```

- 如果执行 nginx 来启动 nginx 服务，则不能通过 systemctl 来管理其状态，不能查看状态和停止服务等


#### nginx 配置
- 为 nginx 二进制程序创建软连接，软链接的路径设置在 PATH 变量中
```bash
[root@nginx1 nginx]$ ln -s /usr/local/nginx/sbin/nginx /usr/sbin/nginx
[root@nginx1 nginx]$
[root@nginx1 nginx]$ ll /usr/sbin/nginx
lrwxrwxrwx 1 root root 27 Jun 11 21:21 /usr/sbin/nginx -> /usr/local/nginx/sbin/nginx*
```
```bash
[root@nginx1 nginx]$ echo $PATH
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
```
这样在任何目录中可以执行 nginx 命令




- 修改 nginx 配置文件
默认配置文件为 `/usr/local/nginx/conf/nginx.conf`，修改内容如下

1) 修改 user group
2) worker_processes 为 auto
3) 和 nginx.service 中一致，修改 pid 文件的路径
4) 修改字符集为 utf-8 编码
5) 修改 http 指令块中的默认 server 指令块
指定数据的根为 /data/www，该目录是挂载在 NFS 服务器上，为全部数据的路径
将 php 脚本传递给 fastcgi 服务器处理，但 php-fpm 也装在本服务器上，因此通过
本地的 9000 端口通信
php 文件和静态的文件都应在一个目录中，全部指定为 /data/www 目录

```bash
user  www-data www-data;
worker_processes  auto;

#error_log  logs/error.log;
#error_log  logs/error.log  notice;
#error_log  logs/error.log  info;

pid        run/nginx.pid;

server {
        listen       80;
        server_name  localhost;

        charset utf-8;

        #access_log  logs/host.access.log  main;

        root /data/www;

        client_max_body_size 100M;

        location / {
            index  index.php index.html index.htm;
        }

        error_page  404              /404.html;

        # redirect server error pages to the static page /50x.html
        #
        error_page   500 502 503 504  /50x.html;
        location = /50x.html {
            root   /data/www;
        }

        # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
        #
        location ~ \.php$|^/(pm_status|ping)$ {
            root           /data/www;
            fastcgi_pass   127.0.0.1:9000;
            fastcgi_index  index.php;
            fastcgi_param  SCRIPT_FILENAME    $document_root$fastcgi_script_name;
            include        fastcgi_params;
        }
```

- 修改 php-fpm 配置文件
由于 php 程序交给 php-fpm 服务器处理，该服务器默认用 socket 文件通信，而 nginx 中指定监听 9000 端口，
因此需要修改配置文件

1) 修改 `/etc/php/8.1/fpm/pool.d/www.conf` 配置文件的下面几项：
修改监听方式为本地的 9000 端口
将 `ping.path` 的设置取消注释，则访问 `/ping` 路径时，如果 FPM 连接正常，则返回结果 `pong`
将 `pm.status_path` 取消注释，修改路径为 `/pm_status`，该路径可以显示 FPM 的状态，
因为 nginx 本身也有一个状态页，路径为 `/status`，防止冲突，将其改下名为 `/pm_status`
```bash
;listen = /run/php/php8.1-fpm.sock
listen = 127.0.0.1:9000

ping.path = /ping

ping.response = pong

pm.status_path = /pm_status
```

2) 优化 php-fpm，修改配置文件 `/etc/php/8.1/fpm/php.ini`
修改时区，上传和下载的最大文件限制
```bash
date.timezone = Asia/Shanghai
post_max_size = 100M
upload_max_filesize = 100M
```

修改上传文件的最大限制，还需要修改 nginx 的配置
对于指令 `client_max_body_size`，查看官方的文档，默认的为 1M，可以在配置文件中修改
> [client_max_body_size](https://nginx.org/en/docs/http/ngx_http_core_module.html#client_max_body_size)

```bash
Syntax:	client_max_body_size size;
Default:	
client_max_body_size 1m;
Context:	http, server, location
```


`/usr/local/nginx/conf/nginx.conf`
```bash
client_max_body_size 100M;
```




### Nginx2 
- 和 Nginx1 环境相同，仅 IP 不同
- NAT 模式，可以用仅主机模式与客户端隔离，但需要上网安装软件
- IP：10.0.0.205
- 安装软件时默认路由指向 10.0.0.2
- 安装软件完成后默认路由指向 10.0.0.203 (LVS DIP)



### NFS-1 + Mysql-1 
- 为了节省虚拟机，将 NFS 和 MySQL 装在一个虚拟机
- 网络配置和 Nginx 相同
- ubuntu22.04
- IP：10.0.0.206


#### NFS 配置
- 存放 web 服务的数据
- 安装 NFS 服务端
- 创建系统 www-data，指定 id 和 nginx 服务器中的 www-data UID 相同
- 创建文件夹 `/data/www`，并指定 owner 和 group 为 www-data


#### Mysql 配置
- 包安装 MySQL 服务端和 Mycli 客户端管理工具
- 修改 MySQL 监听端口
- 为 wordpress 创建数据库和用户




### 共享配置文件设置
- 确定一个和客户端都有的账号：root
