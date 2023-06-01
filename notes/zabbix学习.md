Zabbix 学习笔记

# 资源
> [zabbix](https://www.zabbix.com/manuals)


# 安装
安装由 三 部分组成
- Zabbix server
用于监控的监控端

- Frontend
提供前端管理页面的 web server，如 nginx 和 php 组成的 LNP

- Database
数据库，存放 zabbix server 监控的数据，如 mysql
可以单独一个服务器作为 mysql 服务器，或者和 zabbix server 放一个服务器

- Agent
被 zabbix 监控的主机
zabbix server 上也要安装 zabbix-agent，因为要监控自己的状态


安装环境为：
- ubuntu22.04 10.0.0.201 安装 zabbix server 和 frontend
- ubuntu22.04 10.0.0.202 安装 mysql server

## 查看安装要求
> [requirements](https://www.zabbix.com/documentation/6.0/en/manual/installation/requirements)

- 进入官网找到想装的 zabbix 版本，最好装 LTS 长期支持版
- 如选择 zabbix 6.0，查看需求中对数据库，web-server 等的安装要求
 
## 选择对应版本安装
> [Download and install Zabbix](https://www.zabbix.com/download?zabbix=6.0&os_distribution=ubuntu&os_version=22.04&components=server_frontend_agent&db=mysql&ws=nginx)

- 选择好安装版本后，按照官方生成的命令安装
- 注意 mysql 如果单独装在一个服务器上，需要另外改一些配置

### Install Zabbix repository
```bash
# wget https://repo.zabbix.com/zabbix/6.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.0-4+ubuntu22.04_all.deb
# dpkg -i zabbix-release_6.0-4+ubuntu22.04_all.deb
# apt update
```

安装完成后可以在 `/etc/apt/sources.list.d` 中看见生成的 zabbix 仓库配置文件
```bash
[root@zabbix sources.list.d]$ ls
zabbix-agent2-plugins.list  zabbix.list  
[root@zabbix sources.list.d]$ pwd
/etc/apt/sources.list.d
```

```bash
[root@zabbix sources.list.d]$ cat zabbix.list.bak
# Zabbix main repository
deb https://repo.zabbix.com/zabbix/6.0/ubuntu jammy main
deb-src https://repo.zabbix.com/zabbix/6.0/ubuntu jammy main

# Zabbix unstable repository
#deb https://repo.zabbix.com/zabbix/5.5/ubuntu jammy main
#deb-src https://repo.zabbix.com/zabbix/5.5/ubuntu jammy main
```

为了加快安装速度，将官方源改为镜像
```bash
[root@zabbix sources.list.d]$ URL="mirror.tuna.tsinghua.edu.cn/zabbix"
[root@zabbix sources.list.d]$ sed -i.bak "s#repo.zabbix.com#${URL}#" /etc/apt/sources.list.d/zabbix.list
[root@zabbix sources.list.d]$ sed -i.bak "s#repo.zabbix.com#${URL}#" /etc/apt/sources.list.d/zabbix-agent2-plugins.list
```
```bash
[root@zabbix sources.list.d]$ cat zabbix.list.bak
# Zabbix main repository
deb https://repo.zabbix.com/zabbix/6.0/ubuntu jammy main
deb-src https://repo.zabbix.com/zabbix/6.0/ubuntu jammy main

# Zabbix unstable repository
#deb https://repo.zabbix.com/zabbix/5.5/ubuntu jammy main
#deb-src https://repo.zabbix.com/zabbix/5.5/ubuntu jammy main
```

### Install Zabbix server, frontend, agent
- 按照官方说明，安装 zabbix server，即 `zabbix-server-mysql` 包
- 安装前端管理工具，即 `zabbix-frontend-php` 包，该包会安装 nginx 和 php-fpm
注意：虽然选的是 nginx，但会将 apache 安装
- `zabbix-nginx-conf` 为 nginx 配置文件
- `zabbix-sql-scripts` 为数据库的脚本文件，用于创建数据库中的表等来记录 zabbix 监控数据
如果数据库装在另一个服务器上，需要将对应的脚本拷贝到数据库服务器中执行

- 安装是多安装一个 `zabbix-get` 用来测试 agent 是否正常
```bash
[root@zabbix sources.list.d]$ sudo apt install zabbix-server-mysql zabbix-frontend-php\
zabbix-nginx-conf zabbix-sql-scripts zabbix-agent zabbix-get
```


### 安装 mysql 服务器
- 在另一个 ubuntu22.04 上安装 mysql，直接包安装，安装版本如下：
```bash
[root@mysql mysql]$ mysql --version
mysql  Ver 8.0.33-0ubuntu0.22.04.2 for Linux on x86_64 ((Ubuntu))
```
- 安装一个 mycli 客户端
- 安装完后直接用MySQL的 root 账号登录，不需要密码
```bash
[root@mysql mysql]$ mysql --version
mysql  Ver 8.0.33-0ubuntu0.22.04.2 for Linux on x86_64 ((Ubuntu))
[root@mysql mysql]$ mycli -uroot
Connecting to socket /var/run/mysqld/mysqld.sock, owned by user mysql
MySQL 8.0.33
mycli 1.24.3
Home: http://mycli.net
Bug tracker: https://github.com/dbcli/mycli/issues
Thanks to the contributor - Zhongyang Guan
MySQL root@(none):(none)>
```


### 为 zabbix server 创建数据库和用户账号，见官方说明
```bash
mysql> create database zabbix character set utf8mb4 collate utf8mb4_bin;
mysql> create user zabbix@'10.0.0.201' identified by 'password';
mysql> grant all privileges on zabbix.* to zabbix@localhost;
mysql> set global log_bin_trust_function_creators = 1;
mysql> quit;
```

注意 mysql 服务器和 zabbix zerver 不在一个主机上，因此创建的账号主机不能写 `localhost`，
这里根据实际场景改为 `10.0.0.201`

账号的密码 `password` 改为自己想设置的密码

创建账号后，可以在 `10.0.0.201` 服务器上安装 `mycli`，
然后用创建的账号连接 mysql 数据库，
连接时要指定账号 `zabbix`，主机为 MySQL server 的 IP `10.0.0.202`
```bash
[root@zabbix sources.list.d]$ mycli -u"zabbix" -h"10.0.0.202"
Password:
MySQL 8.0.33
mycli 1.24.3
Home: http://mycli.net
Bug tracker: https://github.com/dbcli/mycli/issues
Thanks to the contributor - Georgy Frolov
MySQL zabbix@10.0.0.202:(none)> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| performance_schema |
| zabbix             |
+--------------------+
3 rows in set
Time: 0.019s
MySQL zabbix@10.0.0.202:(none)> use zabbix;
You are now connected to database "zabbix" as user "zabbix"
Time: 0.002s
MySQL zabbix@10.0.0.202:zabbix> show tables;
+------------------+
| Tables_in_zabbix |
+------------------+
+------------------+
0 rows in set
Time: 0.011s
```

### 为数据库 zabbix 表创建一些初始数据
在 zabbix 服务器上安装 `zabbix-sql-scripts` 后会有一些数据库脚本文件
```bash
[root@zabbix zabbix-sql-scripts]$ apt list zabbix-sql-scripts
Listing... Done
zabbix-sql-scripts/jammy,now 1:6.0.18-1+ubuntu22.04 all [installed]
[root@zabbix zabbix-sql-scripts]$ apt show zabbix-sql-scripts
Package: zabbix-sql-scripts
Version: 1:6.0.18-1+ubuntu22.04
Priority: optional
Section: net
Source: zabbix
Maintainer: Zabbix Packager <info@zabbix.com>
Installed-Size: 8,326 kB
Homepage: https://www.zabbix.com
Download-Size: 7,440 kB
APT-Manual-Installed: yes
APT-Sources: https://mirror.tuna.tsinghua.edu.cn/zabbix/zabbix/6.0/ubuntu jammy/main amd64 Packages
Description: Zabbix network monitoring solution - sql-scripts
 Zabbix is the ultimate enterprise-level software designed for
 real-time monitoring of millions of metrics collected from tens of
 thousands of servers, virtual machines and network devices.
 .
 This package provides SQL files needed to setup Zabbix server or proxy databases.
```

用 `dpkg -L` 查看该包的文件，部分内容如下：
```bash
[root@zabbix zabbix-sql-scripts]$ dpkg -L zabbix-sql-scripts
/.
/usr
/usr/share
/usr/share/doc
/usr/share/doc/zabbix-sql-scripts
/usr/share/doc/zabbix-sql-scripts/changelog.Debian.gz
/usr/share/doc/zabbix-sql-scripts/copyright
/usr/share/zabbix-sql-scripts
/usr/share/zabbix-sql-scripts/mysql
```

查看数据库脚本目录，可见有三种数据库的脚本文件：
```bash
[root@zabbix zabbix-sql-scripts]$ pwd
/usr/share/zabbix-sql-scripts
[root@zabbix zabbix-sql-scripts]$ ls
mysql  postgresql  sqlite3
```

根据官方提示，将 mysql 文件夹中的 `server.sql.gz` 导入数据库
注意需要将主机加上，因为 mysql 服务器不在本地
```bash
[root@zabbix mysql]$ ls
double.sql  history_pk_prepare.sql  proxy.sql  server.sql.gz
[root@zabbix mysql]$ zcat server.sql.gz | mysql --default-character-set=utf8mb4 -uzabbix -h'10.0.0.202' -p zabbix
password:
[root@zabbix mysql]$ 
```

导入完成后登录查看 `zabbix` 表中已经有数据了
再将全局变量 `global log_bin_trust_function_creators` 设置回 0
```sql
MySQL root@(none):(none)> set global log_bin_trust_function_creators = 0; 
```

### 为 zabbix server 配置数据库
根据官方提示找到 `/etc/zabbix/zabbix_server.conf` 配置文件，修改与数据库相关连接配置
```bash
[root@zabbix mysql]$ cd /etc/zabbix/
[root@zabbix zabbix]$ ls
nginx.conf  php-fpm.conf  web  zabbix_agentd.conf  zabbix_agentd.d  zabbix_server.conf
[root@zabbix zabbix]$ vim zabbix_server.conf
```

```bash
DBHost=10.0.0.202
DBName=zabbix
DBUser=zabbix
DBUser=zabbix
DBPort=3306
```

### 为 zabbix server 配置 web server
#### 查看 nginx 主配置文件
nginx 主配置文件在 `/etc/nginx` 目录中
可以用 `dpkg -L nginx-common` 查看 nginx 配置文件路径，部分内容如下：
```bash
[root@zabbix zabbix]$ dpkg -L nginx-common
/.
/etc
/etc/default
/etc/default/nginx
/etc/init.d
/etc/init.d/nginx
/etc/logrotate.d
/etc/logrotate.d/nginx
/etc/nginx
/etc/nginx/conf.d
```

主配置文件为 `/etc/nginx/nginx.conf`，该配置文件中
```bash
user www-data;
worker_processes auto;
pid /run/nginx.pid;
include /etc/nginx/modules-enabled/*.conf;

events {
    worker_connections 768;
    # multi_accept on;
}

http {

    ##
    # Basic Settings
    ##

    sendfile on;
    tcp_nopush on;
    types_hash_max_size 2048;
    # server_tokens off;

    # server_names_hash_bucket_size 64;
    # server_name_in_redirect off;

    include /etc/nginx/mime.types;
    default_type application/octet-stream;

    ##
    # SSL Settings
    ##

    ssl_protocols TLSv1 TLSv1.1 TLSv1.2 TLSv1.3; # Dropping SSLv3, ref: POODLE
    ssl_prefer_server_ciphers on;

    ##
    # Logging Settings
    ##

    access_log /var/log/nginx/access.log;
    error_log /var/log/nginx/error.log;

    ##
    # Gzip Settings
    ##

    gzip on;

    # gzip_vary on;
    # gzip_proxied any;
    # gzip_comp_level 6;
    # gzip_buffers 16 8k;
    # gzip_http_version 1.1;
    # gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript;


    ##
    # Virtual Host Configs
    ##

    include /etc/nginx/conf.d/*.conf;
    include /etc/nginx/sites-enabled/*;
}
```

- 配置文件中定义 nginx 使用的用户为 `www-data`，和 php-fpm 使用的用户相同


- 配置文件中调用 `/etc/nginx/conf.d/*.conf`，`/etc/nginx/conf.d/` 目录中包含了zabbix server的配置文件
```bash
[root@zabbix nginx]$ ll conf.d/zabbix.conf
lrwxrwxrwx 1 root root 22 Jun  1 11:19 conf.d/zabbix.conf -> /etc/zabbix/nginx.conf
```
`zabbix.conf` 配置文件中定义一个 server 指令块，配置 zabbix 用到的界面


- 配置文件中调用 `/etc/nginx/sites-enabled/*` ，该目录中有个默认 server 设置
```bash
[root@zabbix nginx]$ pwd
/etc/nginx
[root@zabbix nginx]$ ls sites-enabled/
default
```
查看该默认配置，其根为 `/var/www/html`，且该 server 定义为 default_server，
监听端口为 80，因此用 ip 访问时默认页面为该 server 中的 index 指定页面，
可以将该 server 的设置注释，然后将 zabbix.conf 的 server 指定为 default_server


#### 修改 zabbix server 配置文件
在 `/etc/zabbix` 目录中，查看 `nginx.conf` 配置
将 `listen` 和 `server_name` 两行取消注释，并配置监听端口和域名
默认监听端口为 8080，如果用该端口，则浏览器中访问要指明端口，不指明则浏览器默认用 `80`
```bash
server {
        listen          80 default_server;
        server_name     myZabbix.example.com;

        root    /usr/share/zabbix;

        index   index.php;
```

该 server 的页面数据在 `/usr/share/zabbix` 目录中，
```bash
[root@zabbix zabbix]$ ls
actionconf.php      chart.php            hostinventoriesoverview.php  js               sysmap.php
api_jsonrpc.php     composer.json        hostinventories.php          jsLoader.php     sysmaps.php
app                 composer.lock        host_prototypes.php          jsrpc.php        templates.php
assets              conf                 httpconf.php                 local            toptriggers.php
audio               data                 httpdetails.php              locale           tr_events.php
auditacts.php       disc_prototypes.php  image.php                    maintenance.php  trigger_prototypes.php
browserwarning.php  favicon.ico          imgstore.php                 map.php          triggers.php
chart2.php          fonts                include                      modules          vendor
chart3.php          graphs.php           index_http.php               report2.php      zabbix.php
chart4.php          history.php          index.php                    report4.php
chart6.php          host_discovery.php   index_sso.php                robots.txt
chart7.php          hostgroups.php       items.php                    setup.php
[root@zabbix zabbix]$ pwd
/usr/share/zabbix
```
该目录中的 `.php` 文件都交给 `php-fpm` 处理，而 `php-fpm` 中指定的 user 也为 `www-data`,
因此需要将数据的属性修改
```bash
[root@zabbix share]$ pwd
/usr/share
[root@zabbix share]$ chown -R www-data:www-data zabbix
```

### 禁用 apache2 服务
安装 `zabbix-frontend-php` 时将 nginx 和 apache2 都装上了，为防止冲突，可以将 `apache2` 禁用
```bash
[root@zabbix zabbix]$ systemctl disable --now apache2.service
Synchronizing state of apache2.service with SysV service script with /lib/systemd/systemd-sysv-install.
Executing: /lib/systemd/systemd-sysv-install disable apache2
Removed /etc/systemd/system/multi-user.target.wants/apache2.service.
```

也可以将 apache2 卸载
```bash
[root@zabbix zabbix]$ apt list apache2*
Listing... Done
apache2-bin/jammy-updates,now 2.4.52-1ubuntu4.5 amd64 [installed,automatic]
apache2-data/jammy-updates,now 2.4.52-1ubuntu4.5 all [installed,automatic]
apache2-dev/jammy-updates 2.4.52-1ubuntu4.5 amd64
apache2-doc/jammy-updates 2.4.52-1ubuntu4.5 all
apache2-ssl-dev/jammy-updates 2.4.52-1ubuntu4.5 amd64
apache2-suexec-custom/jammy-updates 2.4.52-1ubuntu4.5 amd64
apache2-suexec-pristine/jammy-updates 2.4.52-1ubuntu4.5 amd64
apache2-utils/jammy-updates,now 2.4.52-1ubuntu4.5 amd64 [installed,automatic]
apache2/jammy-updates,now 2.4.52-1ubuntu4.5 amd64 [installed,automatic]
```
```bash
[root@zabbix zabbix]$ apt purge apache2* -y
[root@zabbix zabbix]$ apt autoremove
[root@zabbix zabbix]$ apt list apache2*
Listing... Done
apache2-bin/jammy-updates 2.4.52-1ubuntu4.5 amd64
apache2-data/jammy-updates 2.4.52-1ubuntu4.5 all
apache2-dev/jammy-updates 2.4.52-1ubuntu4.5 amd64
apache2-doc/jammy-updates 2.4.52-1ubuntu4.5 all
apache2-ssl-dev/jammy-updates 2.4.52-1ubuntu4.5 amd64
apache2-suexec-custom/jammy-updates 2.4.52-1ubuntu4.5 amd64
apache2-suexec-pristine/jammy-updates 2.4.52-1ubuntu4.5 amd64
apache2-utils/jammy-updates 2.4.52-1ubuntu4.5 amd64
apache2/jammy-updates 2.4.52-1ubuntu4.5 amd64
```

### zabbix server 域名解析
前面 zabbix server 的配置文件中指定了 server name，需要对该域名进行解析，然后访问
如本机测试，可以用 `SwitchHosts` 修改 hosts 文件解析域名
```bash
10.0.0.201 myZabbix.example.com
```

如果用 ip 能访问，但域名不能访问时，在浏览器网页中查看请求地址的远程网址是否正确（F12）查看
如果使用代理，可能域名访问不成功


### 重启服务
修改上诉配置后，需要重启服务，在 zabbix server 主机执行下面命令：
```bash
[root@zabbix fpm]$ systemctl restart zabbix-server zabbix-agent nginx php8.1-fpm
[root@zabbix fpm]$ systemctl enable zabbix-server zabbix-agent nginx php8.1-fpm
Synchronizing state of zabbix-server.service with SysV service script with /lib/systemd/systemd-sysv-install.
Executing: /lib/systemd/systemd-sysv-install enable zabbix-server
Synchronizing state of zabbix-agent.service with SysV service script with /lib/systemd/systemd-sysv-install.
Executing: /lib/systemd/systemd-sysv-install enable zabbix-agent
Synchronizing state of nginx.service with SysV service script with /lib/systemd/systemd-sysv-install.
Executing: /lib/systemd/systemd-sysv-install enable nginx
Synchronizing state of php8.1-fpm.service with SysV service script with /lib/systemd/systemd-sysv-install.
Executing: /lib/systemd/systemd-sysv-install enable php8.1-fpm
Created symlink /etc/systemd/system/multi-user.target.wants/zabbix-server.service → /lib/systemd/system/zabbix-server.service.
```