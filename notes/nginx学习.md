Nginx 学习


# 学习资源
> [nginx documentation](https://nginx.org/en/docs/)


# HTTP 超文本传输协议

## URI URL URN


## cookie

## session

## token



## HTTP 工作机制


## HTTP 协议版本


## HTTP 请求访问的完整过程

## HTTP 报文头结构

# Web 相关工具
## links

## wget

### wget -p

```
The `wget -p` command is used to download a web page and all of its dependencies, such as images and stylesheets, to a local directory while preserving their directory structure.

The `-p` option, short for `--page-requisites`, tells `wget` to download all of the page's requisites, including inline images, sounds, and stylesheets. It also downloads all linked components, such as images and scripts, that are necessary to properly display the web page.

When using `wget -p`, the downloaded files are saved with their original directory structure preserved. This means that each file is downloaded to a subdirectory that mirrors the directory structure of the web page and all of its dependencies.

For example, running `wget -p http://example.com` would download the web page at `http://example.com` as well as all of its dependencies and store them in subdirectories of the current directory.

Note that the `-p` option is just one of many options available in `wget`, which is a versatile command-line tool for downloading files and web pages from the Internet.
```

### wget  -P 指定文件保存的目录
- 指定下载文件存放的目录
- 目录必须事先存在

```bash
[root@docker nginx]$ wget -P /usr/local/src/ https://nginx.org/download/nginx-1.24.0.tar.gz
```



## curl



## httpie

## 压力测试工具


# Web 服务


## 用户访问体验统计
- 互联网用回顾速度体验的 1-3-10 原则，1 秒较优，3~10 秒较慢，10 秒以上无法接受

## 影响用户体验的因素


# 服务端 I/O 流程



# I/O 模型

## 同步和异步
- 同步

- 异步

## 阻塞和非阻塞
- 阻塞

- 非阻塞


## 磁盘 I/O


## 网络 I/O


# I/O 具体实现方式

## select

## poll

## epoll

## kqueue

## IOCP

## /dev/poll

## rtsig

## eventport


# I/O 实现方式的选择


# 零拷贝

## MMAP

## SENDFILE

## DMA 辅助的 SENDFILE



# 经典的 Web 服务端 —— Apache
> [apache](https://apache.org/)

## Apache prefork 模型

## Apache worker 模型
- 多进程和多线程混合模型
- 一个控制进程，启动多个子进程，每个子进程包含固定的线程
- 线程处理请求，线程不够时在启动一个新的子进程


## Apache event 模型
- 最新模式，支持事件驱动模型（epoll）
- 在 worker 模型的基础上，每个子进程中增加一个监听线程，可以释放空闲的线程


# 高性能的 Web 服务端 —— Nginx
> [nginx](https://nginx.org/en/)

- Nginx 分为社区版和商业版
- Nginx 的社区版分为开发版（奇数）、最新稳定版（偶数）和过期版
- 功能丰富，既可以做 http 服务器，又可以做反向代理和邮件服务器
- 能快速响应静态网页的请求
- 内置模块多，且支持很多第三方的扩展模块


## Nginx VS apache 


## Nginx 其他二次发行版

### Tengine

### OpenResty


## Nginx 功能
- 静态的 Web 资源服务器，处理 html，js，css，图片等
- http/https 反向代理
- 结合 FastCGI/uWSGI/SCGI 等协议反向代理动态资源请求
- tcp/udp 协议的请求转发（反向代理）
- imap4/pop3 邮件协议的反向代理


## Nginx 基础特性
- 模块化设计，较好的扩展性
- 高可靠性
- 支持热部署
不停机更新配置文件，升级版本，更换日志文件
- 低内存消耗
10000 个 keep-alive 连接模式下的非活动连接，仅需 2.5M 内存
- event-driven


## Nginx 中 Web 服务相关功能
- 设置多个虚拟主机（server）
- 支持 keep-alive 和管道连接（一个连接做多次请求）


## Nginx 架构


## Nginx 进程结构
- 多进程模型
- 一个 Master 主进程和多个 Worker 进程组成

### Master 进程任务


### Worker 进程任务


## Nginx 启动建立 http 连接的过程

## Nginx 对 http 处理过程





# 安装 nginx

## 编译安装
> [Building nginx from Sources](http://nginx.org/en/docs/configure.html)
> [Installation and Compile-Time Options](https://www.nginx.com/resources/wiki/start/topics/tutorials/installoptions/)


不指定路径时默认编译完后路径如下：
```bash
Configuration summary
  + using system PCRE library
  + using system OpenSSL library
  + using system zlib library

  nginx path prefix: "/usr/local/nginx"
  nginx binary file: "/usr/local/nginx/sbin/nginx"
  nginx modules path: "/usr/local/nginx/modules"
  nginx configuration prefix: "/usr/local/nginx/conf"
  nginx configuration file: "/usr/local/nginx/conf/nginx.conf"
  nginx pid file: "/usr/local/nginx/logs/nginx.pid"
  nginx error log file: "/usr/local/nginx/logs/error.log"
  nginx http access log file: "/usr/local/nginx/logs/access.log"
  nginx http client request body temporary files: "client_body_temp"
  nginx http proxy temporary files: "proxy_temp"
  nginx http fastcgi temporary files: "fastcgi_temp"
  nginx http uwsgi temporary files: "uwsgi_temp"
  nginx http scgi temporary files: "scgi_temp"
```

安装完成后怎么查看配置文件等路径？
查看 service 文件



编译完成后用软连接形式将 `nginx` 链接至 PATH 环境变量中，如 `/usr/sbin`

```bash
[root@VM-ubuntu22 nginx]$ ln -sv /usr/local/nginx/sbin/nginx /usr/sbin/
```

修改配置文件

写 service 文件
```bash
[root@VM-ubuntu22 nginx]$ vim /lib/systemd/system/nginx.service

[Unit]
Description=A high performance web server and a reverse proxy server
Documentation=https://nginx.org/en/docs/
After=network.target remote-fs.target nss-lookup.target
Wants=network-online.target

[Service]
Type=forking
PIDFile=/usr/local/nginx/run/nginx.pid
ExecStartPre=/bin/rm -f /usr/local/nginx/run/nginx.pid
ExecStartPre=/usr/local/nginx/sbin/nginx -t
ExecStart=/usr/local/nginx/sbin/nginx -c /usr/local/nginx/conf/nginx.conf
ExecReload=/bin/kill -s HUP $MAINPID
ExecStop=/bin/kill -s TERM $MAINPID
KillSignal=SIGQUIT
TimeoutStopSec=5
KillMode=process
PrivateTmp=true
LimitNOFILE=100000

[Install]
WantedBy=multi-user.target
usr/local/nginx/sbin/nginx'
```

让 service 文件生效
```bash
[root@VM-ubuntu22 nginx]$ systemctl daemon-reload
```
查看 nginx.service 状态
```bash
[root@VM-ubuntu22 nginx]$ systemctl status nginx.service
○ nginx.service - A high performance web server and a reverse proxy server
     Loaded: loaded (/lib/systemd/system/nginx.service; disabled; vendor preset: enabled)
     Active: inactive (dead)
       Docs: https://nginx.org/en/docs/
```
开启服务并设置为开机自启
```bash
[root@VM-ubuntu22 nginx]$ systemctl enable --now nginx.service
```



- ubuntu22.04 编译安装选项如下：
```bash
[root@ubuntu22 ~]$ nginx -V
nginx version: nginx/1.22.1
built by gcc 11.3.0 (Ubuntu 11.3.0-1ubuntu1~22.04.1)
built with OpenSSL 3.0.2 15 Mar 2022
TLS SNI support enabled
configure arguments: --prefix=/apps/nginx --user=nginx --group=nginx --with-http_ssl_module --with-http_v2_module --with-http_realip_module --with-http_stub_status_module --with-http_gzip_static_module --with-pcre --with-stream --with-stream_ssl_module --with-stream_realip_module
```

nginx 的源码包在 `/usr/local/src/nginx-1.24.0` 路径下
```bash
[root@ubuntu22 nginx-1.24.0]$ pwd
/usr/local/src/nginx-1.24.0
[root@ubuntu22 nginx-1.24.0]$ ls
auto  CHANGES  CHANGES.ru  conf  configure  contrib  html  LICENSE  Makefile  man  objs  README  src
[root@ubuntu22 nginx-1.24.0]$ ls conf
fastcgi.conf  fastcgi_params  koi-utf  koi-win  mime.types  nginx.conf  scgi_params  uwsgi_params  win-utf
```
编译后文件在 `/apps/nginx` 目录中
```bash
[root@ubuntu22 nginx-1.24.0]$ cd /apps/nginx/
[root@ubuntu22 nginx]$ ls
client_body_temp  conf  fastcgi_temp  html  logs  proxy_temp  run  sbin  scgi_temp  uwsgi_temp
[root@ubuntu22 nginx]$ ls conf/
fastcgi.conf          fastcgi_params.default  mime.types          nginx.conf.default   uwsgi_params
fastcgi.conf.default  koi-utf                 mime.types.default  scgi_params          uwsgi_params.default
fastcgi_params        koi-win                 nginx.conf          scgi_params.default  win-utf
```

<font color=red>上面 `conf/nginx.conf` 为 nginx 配置文件，下面两个地方所相对的路径为什么不同？</font>

```bash
include       mime.types;

location / {
              root   html;
              index  index.html index.htm;
           }

```

```bash
[root@ubuntu22 nginx-1.24.0]$ nginx -V
nginx version: nginx/1.24.0
built by gcc 11.3.0 (Ubuntu 11.3.0-1ubuntu1~22.04.1)
built with OpenSSL 3.0.2 15 Mar 2022
TLS SNI support enabled
configure arguments: --prefix=/apps/nginx --user=nginx --group=nginx --with-http_ssl_module --with-http_v2_module --with-http_realip_module --with-http_stub_status_module --with-http_gzip_static_module --with-pcre --with-stream --with-stream_ssl_module --with-stream_realip_module --add-module=/usr/local/src/nginx-module-vts-master --add-module=/usr/local/src/echo-nginx-module-master
```

编译完成后选项
```bash
Configuration summary
  + using system PCRE library
  + using system OpenSSL library
  + using system zlib library

  nginx path prefix: "/apps/nginx"
  nginx binary file: "/apps/nginx/sbin/nginx"
  nginx modules path: "/apps/nginx/modules"
  nginx configuration prefix: "/apps/nginx/conf"
  nginx configuration file: "/apps/nginx/conf/nginx.conf"
  nginx pid file: "/apps/nginx/logs/nginx.pid"
  nginx error log file: "/apps/nginx/logs/error.log"
  nginx http access log file: "/apps/nginx/logs/access.log"
  nginx http client request body temporary files: "client_body_temp"
  nginx http proxy temporary files: "proxy_temp"
  nginx http fastcgi temporary files: "fastcgi_temp"
  nginx http uwsgi temporary files: "uwsgi_temp"
  nginx http scgi temporary files: "scgi_temp"
```

### 添加额外模块编译安装
> [What does the *-dev *-dbg and *-utils mean?](https://stackoverflow.com/questions/19032398/what-does-the-dev-dbg-and-utils-mean)


编译时指定 `--with-pcre`，如果未安装相关库，则会提示：
```bash
./configure: error: the HTTP rewrite module requires the PCRE library.
You can either disable the module by using --without-http_rewrite_module
option, or install the PCRE library into the system, or build the PCRE library
statically from the source with nginx by using --with-pcre=<path> option.
```
搜索相关库：
```bash
[root@VM-ubuntu22 nginx-1.24.0]$ apt list *pcre3*
Listing... Done
libpcre3-dbg/jammy-updates,jammy-security 2:8.39-13ubuntu0.22.04.1 amd64
libpcre3-dev/jammy-updates,jammy-security 2:8.39-13ubuntu0.22.04.1 amd64
libpcre32-3/jammy-updates,jammy-security 2:8.39-13ubuntu0.22.04.1 amd64
libpcre3/jammy-updates,jammy-security,now 2:8.39-13ubuntu0.22.04.1 amd64 [installed]
```
安装 `libpcre3-dev`





# 性能优化 
1. sendfile on 使用零拷贝
2. 高并发配置
先通过 systemctl status nginx 查看其 PID（需要通过用 systemctl 开启 nginx）
```bash
[root@ubuntu22 conf]$ systemctl status nginx.service
● nginx.service - A high performance web server and a reverse proxy server
     Loaded: loaded (/lib/systemd/system/nginx.service; enabled; vendor preset: enabled)
     Active: active (running) since Sun 2023-05-21 10:43:43 CST; 4h 15min ago
       Docs: https://nginx.org/en/docs/
    Process: 878 ExecStartPre=/bin/rm -f /apps/nginx/run/nginx.pid (code=exited, status=0/SUCCESS)
    Process: 901 ExecStartPre=/apps/nginx/sbin/nginx -t (code=exited, status=0/SUCCESS)
    Process: 928 ExecStart=/apps/nginx/sbin/nginx -c /apps/nginx/conf/nginx.conf (code=exited, status=0/SUCCESS)
   Main PID: 936 (nginx)
      Tasks: 3 (limit: 2193)
     Memory: 3.8M
        CPU: 65ms
     CGroup: /system.slice/nginx.service
             ├─936 "nginx: master process /apps/nginx/sbin/nginx -c /apps/nginx/conf/nginx.conf"
             ├─939 "nginx: worker process" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" >
             └─940 "nginx: worker process" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" >

May 21 10:43:43 ubuntu22 systemd[1]: Starting A high performance web server and a reverse proxy server...
May 21 10:43:43 ubuntu22 nginx[901]: nginx: the configuration file /apps/nginx/conf/nginx.conf syntax is ok
May 21 10:43:43 ubuntu22 nginx[901]: nginx: configuration file /apps/nginx/conf/nginx.conf test is successful
May 21 10:43:43 ubuntu22 systemd[1]: Started A high performance web server and a reverse proxy server.
```

查看 nginx 并发数限制
```bash
[root@ubuntu22 conf]$ cat /proc/936/limits
Limit                     Soft Limit           Hard Limit           Units
Max cpu time              unlimited            unlimited            seconds
Max file size             unlimited            unlimited            bytes
Max data size             unlimited            unlimited            bytes
Max stack size            8388608              unlimited            bytes
Max core file size        0                    unlimited            bytes
Max resident set          unlimited            unlimited            bytes
Max processes             7311                 7311                 processes
Max open files            100000               100000               files
Max locked memory         65536                65536                bytes
Max address space         unlimited            unlimited            bytes
Max file locks            unlimited            unlimited            locks
Max pending signals       7311                 7311                 signals
Max msgqueue size         819200               819200               bytes
Max nice priority         0                    0
Max realtime priority     0                    0
Max realtime timeout      unlimited            unlimited            us
```
修改 service 文件中 `LimitNOFILE`
```bash
 18 [Unit]
 17 Description=A high performance web server and a reverse proxy server
 16 Documentation=https://nginx.org/en/docs/
 15 After=network.target remote-fs.target nss-lookup.target
 14 Wants=network-online.target
 13
 12 [Service]
 11 Type=forking
 10 PIDFile=/apps/nginx/run/nginx.pid
  9 ExecStartPre=/bin/rm -f /apps/nginx/run/nginx.pid
  8 ExecStartPre=/apps/nginx/sbin/nginx -t
  7 ExecStart=/apps/nginx/sbin/nginx -c /apps/nginx/conf/nginx.conf
  6 ExecReload=/bin/kill -s HUP $MAINPID
  5 ExecStop=/bin/kill -s TERM $MAINPID
  4 KillSignal=SIGQUIT
  3 TimeoutStopSec=5
  2 KillMode=process
  1 PrivateTmp=true
19  LimitNOFILE=100000
  1
  2 [Install]
  3 WantedBy=multi-user.target
```

或者配置文件中修改指令 `worker_rlimit_nofile`


查看系统支持最大文件数 `open files`
```bash
[root@ubuntu22 conf]$ ulimit -a
real-time non-blocking time  (microseconds, -R) unlimited
core file size              (blocks, -c) 0
data seg size               (kbytes, -d) unlimited
scheduling priority                 (-e) 0
file size                   (blocks, -f) unlimited
pending signals                     (-i) 7311
max locked memory           (kbytes, -l) 248528
max memory size             (kbytes, -m) unlimited
open files                          (-n) 1024
pipe size                (512 bytes, -p) 8
POSIX message queues         (bytes, -q) 819200
real-time priority                  (-r) 0
stack size                  (kbytes, -s) 8192
cpu time                   (seconds, -t) unlimited
max user processes                  (-u) 7311
virtual memory              (kbytes, -v) unlimited
file locks                          (-x) unlimited
```

3. 开启文件压缩
```bash
gzip on
```
该功能属于 http_gzip_module，需要查看该模块是否加载

1. 编译安装查看
```bash
[root@ubuntu22 nginx-1.24.0]$ pwd
/usr/local/src/nginx-1.24.0
[root@ubuntu22 nginx-1.24.0]$ ls
auto  CHANGES  CHANGES.ru  conf  configure  contrib  html  LICENSE  Makefile  man  objs  README  src
[root@ubuntu22 nginx-1.24.0]$ ./configure --help | grep -i http_gzip_module
  --without-http_gzip_module         disable ngx_http_gzip_module
```
可看见该模块是默认加载，即不指定 `--without-http_gzip_module` 则默认加载

2. 包安装查看 

可以从[官方文档](https://nginx.org/en/docs/)查看对应模块，如果官方未说明不是默认安装，则需要特意指定安装，
而有没有指定，则通过 `nginx -V` 查看，注意 `nginx -V` 输出不是标准输出，而是标准错误输出，
如果要将输出内容通过管道再筛选，需要将其重定向到标准输出，如：
```bash
[root@web1 modules]$ nginx -V 2>&1 | grep -i gzip
```


4. 设置会话保持时间
> [keepalive_time](https://nginx.org/en/docs/http/ngx_http_core_module.html#keepalive_time)
`keepalive_time`

5. 合并请求后统一发给客户端
`tcp_nopush` 必须开启 sendfile 使用，开启则合并请求后统一发给客户端

`tcp_nodelay` 开启 keepalived 模式下是否启用 `TCP_NODELAY`，不开启则延迟发送


# 配置文件
## 配置文件的结构
> [Configuration File’s Structure](https://nginx.org/en/docs/beginners_guide.html#conf_structure)

配置文件中使用一个指令（directive）时，需要从官网查该指令在哪个 `Context` 中
- 单个指令
名字和参数组成，多个参数由空格隔开，最好加上 `;` 结束
```
Syntax:	access_log path [format [buffer=size] [gzip[=level]] [flush=time] [if=condition]];
access_log off;
Default:	
access_log logs/access.log combined;
Context:	http, server, location, if in location, limit_except
```
有的指令在 `main` 中则表示不用包含在某个具体的指令块中
```
Syntax:	user user [group];
Default:	
user nobody nobody;
Context:	main
```

- 指令块
指令中包含其他指令，这些指令在花括号中，即在一个 context 中，如：
```
Syntax:	http { ... }
Default:	—
Context:	main
```

## 配置文件中指令书写的顺序
注意顺序

## 全局配置和子配置
全局配置和子配置最好分开
全局配置放在 `nginx.conf`，子配置放在 `conf.d/*.conf` 文件中，通过在全局配置用 `include conf.d/*.conf` 包含
子配置文件根据名字字母顺序被先后加载，要指定先后顺序，可以在前面加上数字，如 `00-` `01-`


# 文件类型映射为 MIME 类型 
> [MIME types (IANA media types)](https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/MIME_types)

浏览器使用 MIME 类型，Web 服务器要将不同文件扩展名映射为 MIME 类型才能被浏览器识别

## MIME
> Warning: Browsers use the MIME type, not the file extension, 
> to determine how to process a URL, so it's important that web servers 
> send the correct MIME type in the response's Content-Type header. 
> If this is not correctly configured, browsers are likely to misinterpret 
> the contents of files, sites will not work correctly, and downloaded files may be mishandled.


1. 如果是编译安装，例如安装目录在 `/apps/nginx` 中，则在 `conf` 文件夹中有个 `mime.types` 文件
在 `type {}` 指令块中将文件名扩展映射为 MIME 类型扩展，扩展不区分大小写
```
  1 types {
  2     text/html                                        html htm shtml;
  3     text/css                                         css;
  4     text/xml                                         xml;
  5     image/gif                                        gif;
        ...
    }
```


2. 包安装则在 `/etc/nginx/mime.types` 文件中


# 设置默认服务器
如果有多个服务器提供服务，可以在一个 server {} 块中指定默认服务器，这样，不管该服务器配置文件的顺序在哪都会是默认服务器

```bash
server {
    listen 80 default server; 
}
```


# 设置编码格式
默认编码为俄罗斯编码，改为 `utf-8`
该指令可以在 http context 中设置，这样对全部的 server 都生效，或者在某个特定的 server 中设置
```bash
charset utf-8;
```


# 不同服务器日志文件分开存放
默认有访问日志 `access_log` 和错误日志 `error_log` 两个日志文件，所有 server 的日志均在两个文件中
如果有多个 server，可以在每个 server 指令块中分别存放日志文件，日志文件名可以加上 server 的名字

# 指定日志文件的格式
`log_format` 可以指定日志格式，如默认配置中
```bash
  #log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
  #                  '$status $body_bytes_sent "$http_referer" '
  #                  '"$http_user_agent" "$http_x_forwarded_for"';
  #access_log  logs/access.log  main;
```

通过 `log_format` 指定一个格式，该配置的名字为 `main`，
然后指定访问日志 `access_log` 使用格式为 `main` 的日志格式

# 自定义错误页面
> [error_page](https://nginx.org/en/docs/http/ngx_http_core_module.html#error_page)

- 看官网例子，很详细
- 可以修改错误响应码，如发生 404 错误时，将响应码改为 200 并跳转到首页，如：
```bash
error_page   404  =200 /index.html;
```
此时如果浏览器中输入错误页面，跳转到了 index.html，但其 url 中显示的仍为错误的路径
用 curl 命令查看响应码变为 200
```bash
[root@ubuntu22 html]$ curl 127.0.0.1/xxx
index.html 10.0.0.202
```
```bash
[root@ubuntu22 html]$ curl 127.0.0.1/xxx -i
HTTP/1.1 200 OK
Server: nginx/1.22.1
Date: Sun, 21 May 2023 09:48:46 GMT
Content-Type: text/html; charset=utf-8
Content-Length: 22
Last-Modified: Sun, 21 May 2023 09:27:37 GMT
Connection: keep-alive
ETag: "6469e409-16"
Accept-Ranges: bytes

index.html 10.0.0.202
```

# 设置 root 路径
```bash
  1         location / {
  2             root   html;
  3             index  index.html index.htm;
  4         }
  5
  6         #error_page  404              /404.html;
  7
  8         # redirect server error pages to the static page /50x.html
  9         #
 10
 11         error_page   404  =200 /index.html;
 12         error_page   500 502 503 504  /50x.html;
 13         location = /50x.html {
 14             root   html;
 15         }
```

上面指定根（/）为 html 文件夹
当出现 404 错误时，将错误码改为 200，并显示 `/index.html`，即根 `html` 文件夹下的 `index.html` 文件


# location 
> [location](https://nginx.org/en/docs/http/ngx_http_core_module.html#location)

根据 URI 匹配不同的配置


# 四层访问控制
> [Module ngx_http_access_module](https://nginx.org/en/docs/http/ngx_http_access_module.html)

- 可以用来限制某个 IP 或某个网段地址的访问
- 相当于白名单和黑名单
- 也可以用防火墙规则来实现
- 有 `allow` 和 `deny` 两个指令
- 小范围在前，大范围在后，如果只允许少量地址访问，其他拒绝，则 `allow` 几个地址后用 `deny all;`

- 匹配到第一个满足的条件后，不会再往下找其他规则，直接生效，和防火墙规则设置类似
  因此，如果第一个条件 `deny` 某个地址，第二个条件 `allow` 某个地址，则会 `deny` 不会 `allow`


# try_files 文件不存在时查找其他文件
> [try_files](https://nginx.org/en/docs/http/ngx_http_core_module.html#try_files)

```
location /images/ {
    try_files $uri /images/default.gif;
}

location = /images/default.gif {
    expires 30s;
}
```

当用户访问根下 `images/` 目录时，首先查找该目录 `$uri`，
如果找不到，则使用 `/images/default.gif`

按照顺序一个一个往后找，如果最后一个也找不到，则报错

# index 指定索引文件
> [Module ngx_http_index_module](https://nginx.org/en/docs/http/ngx_http_index_module.html#index)

`index` 这个指令用于指定某个目录的索引文件，当访问的路径以 `/` 结尾时，表示目录
如果未指定目录，则默认为根目录 `/`，可以为目录指定索引文件

索引文件可以写多个，和 `try_files` 规则相同，按照顺序依次查找，用找到的第一个文件

```bash
location / {
    index index.$geo.html index.html;
}
```

# 持续连接（persistent connection）
> [keepalive_timeout](https://nginx.org/en/docs/http/ngx_http_core_module.html#keepalive_timeout)

HTTP/1.1 协议支持持续链接，即万维网服务器在发送响应给客户端（浏览器）后仍在一段时间内
保持这条连接，使同一客户端和该服务器可以继续在这条连接上传输后续的 HTTP 请求报文和响应报文

这种持续连接只要传送的文档都在一个服务器上就行，不局限于一个页面的文档


一个页面包含很多超链接，


# access_log 访问日志设置
> [access_log](https://nginx.org/en/docs/http/ngx_http_log_module.html#access_log)

- 当访问某些资源时，可以不记录访问日志

```bash
  1 location ~* .*\.(gif|jpg|png|ico|css|jpg|jpeg)$ {
  2 access_log off;
  3 #access_log /dev/null;
  4 }
```

# 设置网站图标 favicon

# 压缩
> [NGINX GZIP_STATIC: WHAT IT DOES AND HOW TO USE IT?](https://www.carnaghan.com/nginx-gzip_static/)

- 什么时候适合压缩？
- 哪些文件适合压缩？
- 压缩的优势和劣势？

- 什么是预压缩？




# 第三方模块

## echo 模块显示信息
> [openresty/echo-nginx-module](https://github.com/openresty/echo-nginx-module)

- 放在 `location` context 中
- 需要指定其 MIME 类型，否则浏览器中不会识别为文本而将其下载成一个文件
不指定时，怎么查看浏览器将其解析为哪种类型？
```bash
 location /echo {
               default_type text/html;
              echo "The current uri is $request_uri";
               echo "The current ip is $remote_addr";
           }
```

- curl 查看换行，浏览器中未换行

```
[root@mysql ~]$ curl 10.0.0.202/echo
The current uri is /echo
The current ip is 10.0.0.82
The current ip is
The current ip is /apps/nginx/html
[root@mysql ~]$
[root@mysql ~]$ curl 10.0.0.202/echo | cat -A
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   107    0   107    0     0   104k      0 --:--:-- --:--:-- --:--:--  104k
The current uri is /echo$
The current ip is 10.0.0.82$
The current ip is $
The current ip is /apps/nginx/html$
[root@mysql ~]$
[root@mysql ~]$ curl 10.0.0.202/echo | cat
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   107    0   107    0     0  53500      0 --:--:-- --:--:-- --:--:-- 53500
The current uri is /echo
The current ip is 10.0.0.82
The current ip is
The current ip is /apps/nginx/html
```




#  Nginx 做反向代理
## 正向代理和反向代理


## Nginx 做反向代理


## proxy_pass 
> [proxy_pass](https://nginx.org/en/docs/http/ngx_http_proxy_module.html#proxy_pass)

- 查看官网例子，注意 URL 是否指定区别
指定
- 端口号
不指明则默认 80，后端服务器可以用其他端口，如 8080，此时需要指明端口


## 启用缓存功能提升效率
