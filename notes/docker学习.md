Docker 学习


# 资源
> Docker 官网介绍：[Docker overview](https://docs.docker.com/get-started/overview/)
> Docker 客户端命令：[Use the Docker command line](https://docs.docker.com/engine/reference/commandline/cli/)
> Dockerfile 官网介绍：[Dockerfile reference](https://docs.docker.com/engine/reference/builder/#arg)
> Docker 容器镜像仓库：[dockerhub](https://hub.docker.com/)




# PaaS、IaaS、SaaS 与 CaaS
> [PaaS、IaaS、SaaS 与 CaaS：它们有何不同？](https://cloud.google.com/learn/paas-vs-iaas-vs-saas?hl=zh-cn)



# 容器（Container）

## 容器介绍
> [什么是容器](https://cloud.google.com/learn/what-are-containers?hl=zh-cn)
> [Use containers to Build, Share and Run your applications](https://www.docker.com/resources/what-container/)


> A container is a standard unit of software that packages up code and all its dependencies so the application runs quickly and reliably from one computing environment to another. 


- 容器是包含了能在任何环境中运行所需的全部元素的软件包
- 容器可以虚拟化操作系统，并在任何地方运行


## 容器的作用
> [什么是容器](https://cloud.google.com/learn/what-are-containers?hl=zh-cn)


- 可移植性好
容器几乎能在任何地方运行，减轻了开发和部署工作量

- 应用隔离
容器会在操作系统级别虚拟化 CPU、内存、存储和网络资源,
为开发者提供在逻辑上与其他应用相隔离的操作系统接口



## 容器和虚拟机
> [什么是容器](https://cloud.google.com/learn/what-are-containers?hl=zh-cn)
> [Containers vs. virtual machines](https://www.atlassian.com/microservices/cloud-computing/containers-vs-vms)
> [Containers vs. Virtual Machines (VMs): What’s the Difference?](https://www.ibm.com/cloud/blog/containers-vs-vms)


> The key differentiator between containers and virtual machines is that virtual machines virtualize an entire machine down to the hardware layers and containers only virtualize software layers above the operating system level


- 容器比虚拟机更轻量化
容器在操作系统级别虚拟化，虚拟机在硬件级别进行虚拟化
容器共享操作系统内核，占用的内存比虚拟机更小
容器启动比虚拟机更快，消耗的资源更少

- 容器的隔离性没有虚拟机好
一个宿主机上的所有容器共享硬件系统



## 容器的种类
> [Containers vs. virtual machines](https://www.atlassian.com/microservices/cloud-computing/containers-vs-vms)


- Docker
- RKT
- Linux Containers (LXC)





- KVM 和 Docker 比较

Docker 隔离性没有 KVM 上装多个虚拟机隔离性好


KVM 单机管理虚拟机
Openstack 管理多主机上全部的虚拟机


docker 管理单个物理机上单个容器
docker compose：单个主机容器编排工具，类似 makefile, ansible 的 playbook
kurbernets 管理多主机上全部容器


windows 上运行容器：WLS ?


# Docker 的组成

镜像：模板，文件，静态文件，占磁盘
容器：进程，占内存，占磁盘

docker run hello-world
hello-world 为容器镜像，本地没有则到官网下载

一次性运行，执行完就结束，但容器还在，存在磁盘上，相同镜像启动两个容器，分别在磁盘存放两个不同镜像，有不同的 container ID 和 Name


overlay2 存储引擎 各层叠加
容器 run 原始镜像复制，stop 时将原来镜像部分删除，保留该容器的新数据，下次 start 后再将镜像复制

Docker Overlay2 is a storage driver used in Docker to manage the container's file system. It allows multiple Docker containers to share the same base image and reduces the disk space used by each container as layers that differ from the base image are stored efficiently.

Overlay2 uses two directories on the host system for Docker storage, the lower directory for read-only files originating from the image and an upper directory for the read-write files specific to the container. Changes made to the container are written to the upper directory, which transparently overlays the read-only image stored in the lower directory.

Overlay2 also uses a file system delta-compression technique known as "deduplication" to limit the disk space usage. This technique identifies files with identical content across layers and stores them only once. This reduces the size of the container images and improves the performance by reducing I/O operations.

In summary, Overlay2 is a storage driver used by Docker to manage container file systems. It enables containers to share the same base image and uses deduplication to reduce the size of the container images and improve overall performance.

可以修改存储引擎


# Docker 优化
用镜像网址代替官网

如果客户端和服务端不在一个主机，docker 服务端和客户端通信改为端口通信，默认本地套接字通信



docker 不建议使用交换空间 swap
禁用 swap 空间 /etc/fstab 注释 swap off
systemctl mask swap.target systemctl stop swap.target


私有仓库 insecure-registry 

Docker Root Dir: /var/lib/docker dockers 全部镜像和数据的默认目录，最好用高速磁盘存放
可以修改默认目录
运行容器过程中修改目录，则需要先停止 docker，


同时上传下载限制


限制日志文件的大小，日志默认在 /var/lib/docker 目录中



********
搜索包含某内容的文件
grep -r|R /var/lib/docker

**************

live-restore: true docker 服务器重启后原来正在
运行的容器不受影响





# Namespace
- 内核功能



# Control groups
- 内核功能，限制资源，防止某个容器一直占用资源



# 容器管理工具
- docker 是容器前端管理工具
- 


# Docker 安装
> [Install Docker Engine](https://docs.docker.com/engine/install/)


- 安装要求

- ubuntu22.04 安装 docker



注意各组件版本一致问题


docker 客户端可以在另一台主机上，管理本机 docker



# 镜像管理
hub.docker.com

镜像系统：alpline 
busybox：太小

用 alpine 作为基础镜像


docker system prune 清理不用的容器、镜像等

dangling image 

A Docker dangling image refers to an image that has been untagged and is not in use by any running containers or other images. In other words, a dangling image is an image that has no name and no tag, and it's not being used by any containers or other images.

Dangling images can be created when a new version of an image is built, and the previous version of the image is no longer needed. If an image is removed or deleted with the `docker rmi` command, any associated containers must first be removed before the associated image can be deleted. If one or more containers that are based on a particular image are still running, then the image will not be removed and instead will be marked as a dangling image.

Docker automatically removes dangling images when the `docker system prune` command is run. This command removes stopped containers, unused networks, and dangling images, freeing up disk space on the host system.

Note that dangling images can also occur when a build context is used to create new images. If a file is removed or renamed in the build context, the previous docker layers that used that file will become unused and may be removed as a result. This can lead to additional dangling images on the host system.


# 镜像结构和原理

## rootfs



## bootfs





# Docker 客户端命令
> [Use the Docker command line](https://docs.docker.com/engine/reference/commandline/cli/)







## docker pull 拉取镜像
> [docker pull](https://docs.docker.com/engine/reference/commandline/pull/)

- 如从 docker hub 拉取 ubuntu 镜像，先找到 ubuntu 镜像仓库：[ubuntu](https://hub.docker.com/_/ubuntu)
仓库中提供了支持的 tags 

- 用 docker pull 拉取镜像时指明镜像的 tag
```bash
[root@docker dockerfile]$ docker pull ubuntu:22.04
22.04: Pulling from library/ubuntu
aee1767db0dd: Pull complete
Digest: sha256:f154feaf13b51d16e2b4b5575d69abc808da40c4b80e3a5055aaa4bcc5099d5b
Status: Downloaded newer image for ubuntu:22.04
docker.io/library/ubuntu:22.04
```







## docker logs 查看容器的日志
容器中前台执行的进程才有日志
前台执行标准输出的内容可盈用该方式查看


## docker images 查看当前镜像


## docker ps 


## docker inspect 查看资源详细信息


## docker cp 容器和宿主机之前复制文件
> [docker cp](https://docs.docker.com/engine/reference/commandline/cp/)

- 指定容器名可以用容器的 ID（可以不写全，但写出的部分能唯一定位容器）或 NAMES


### 将容器的一个目录拷贝到宿主机的目录中
- 如果不想拷贝容器目录只拷贝目录中的文件，则目录最后加 /.
```bash
[root@docker nginx]$ docker cp nginx-02:/data/www/. data/ -a
```
- 拷贝目录本身以及目录中的文件
```bash
[root@docker nginx]$ docker cp nginx-02:/data/www/ data/ -a
```


## docker run
运行容器
如果要容器运行不退出，需要执行前台命令

如 alpine 这种操作系统镜像，默认运行执行的命令为 /sbin/sh，执行完就退出
而 nginx 镜像会执行一个持续运行的前台命令，持续运行，提供服务


### docker run -it 交互执行


###  docker run --name
指定容器名字


### docker run -hostname
指定容器主机名

### docker run --rm 退出后删除容器


### docker run -d 容器后台执行
这个后台是否跟终端有关
&
nohub
tmux|screen


### docker run --restart 指定容器启动的策略


### docker run -P|-p 暴露容器端口
容器中的网络采用 NAT 模式
如果容器中运行 nginx web 服务，外部用户无法访问容器中的服务器，容器中服务器与外部通信时其 IP 通过 SNAT 转换为其宿主机的 IP

如果需要外部访问容器中的 nginx web 服务，可以做 DNAT 端口映射，客户端访问宿主机的某个端口，如 80 端口时转到容器中 nginx 服务器的 80 端口

- docker run -P 
暴露容器中的全部端口到客户端随机端口
端口由镜像制作时确定


- docker run -p
可以指定端口映射


- 修改已经创建的容器的端口映射关系


### docker run -e 创建环境变量



### docker run 传递命令






## docker ps 显示容器信息


### docker ps 显示正在运行的全部容器
- 相当于 `docker ps -a`


### docker -f 筛选条件过滤


## docker top 查看容器内的进程
不进入容器查看容器内进程，显示的 PID 为容器在宿主机中的 PID

如果进入容器中查看进程，PID 为容器中独立的 PID



### docker ps -q 仅显示容器的 ID 
结合 `docker ps -f` 删除已经退出的容器


## docker exec 进入已经运行的容器
- 一般指定 shell 类型

- 进入后可以执行 exit 退出容器，通过 docker ps -a 查看容器已经处于退出状态，
  可以再用 docker start 启动容器


## docker history 查看镜像创建历史

# busybox 
- busybox 模拟命令
- 

# 创建镜像

## docker commit 基于容器创建镜像
- `man docker-commit` 查看帮助

制作镜像和容器的状态无关，停止状态也可以制作镜像



## docker build 基于 DockerFile 创建镜像
> [docker build](https://docs.docker.com/engine/reference/commandline/build/)

将构建的命令写道一个脚本中，如 `build.sh`，脚本和 Dockerfile 在一个目录
```bash
#!/bin/bash

#docker build --no-cache -t nginx-alpine:3.15-01 .
docker build  -t nginx-alpine:3.15-02 -f Dockerfile1 .
```

`-t` 为镜像指定标签
`-f` 指定 Docerfile 的文件名，不写则默认为 `Dockerfile`
最后写上文件路径，`.` 表示当前目录



### Dockerfile 文件格式
> [Dockerfile reference](https://docs.docker.com/engine/reference/builder/)






## Dockerfile

### FROM


### LABEL
> [LABEL](https://docs.docker.com/engine/reference/builder/#label)





### COPY
> [COPY](https://docs.docker.com/engine/reference/builder/#copy)

> COPY [--chown=<user>:<group>] [--chmod=<perms>] <src>... <dest>
> COPY [--chown=<user>:<group>] [--chmod=<perms>] ["<src>",... "<dest>"]

- 将宿主机的文件拷贝到容器中，源为宿主机，目的地址为容器中目录
- 宿主机如果为目录，则默认将目录中的文件内容全部拷贝，包括子目录，不拷贝目录本身
- 容器的目录如果不存在，则全部不存在的目录可以自动新建
- 宿主机的文件默认当前目录为 Dockerfile 所在的目录，如果要拷贝的文件在当前目录的上级，可以写相对路径
```bash
COPY ../install.sh /root/
```
如果源文件写宿主机中绝对路径，报错：
```bash
COPY /etc/test.txt /root/
```
- COPY 拷贝目录时格式，如下面两种写法
```bash
COPY php8/* /root/php8/
COPY php8/ /root/php8-1/
```
Dockerfile 当前目录有一个 php8 的文件夹，其内容入下：
```bash
[root@docker nginx]$ ls
build.sh  Dockerfile  php8  src
[root@docker nginx]$ tree php8
php8
├── conf.d
├── php-fpm.conf
├── php-fpm.d
│   └── www.conf
└── php.ini

2 directories, 3 files
```

生成镜像后查看，第一种 `php8/*` 的写法，拷贝的没有子目录
```bash
[root@docker nginx]$ docker run -it --name test2 nginx-alpine:3.15-02 bash
bash-5.1# cd /root
bash-5.1# ls
b.sh    php8    php8-1
bash-5.1# ls -l php8
total 104
-rw-r--r--    1 root     root          5329 Oct 26  2022 php-fpm.conf
-rw-r--r--    1 root     root         72548 Jun 15 19:59 php.ini
-rw-r--r--    1 root     root         20547 Jun 15 19:56 www.conf
bash-5.1#
bash-5.1# ls -l php8-1/
total 88
drwxr-xr-x    2 root     root          4096 Jun 15 18:46 conf.d
-rw-r--r--    1 root     root          5329 Oct 26  2022 php-fpm.conf
drwxr-xr-x    2 root     root          4096 Jun 17 16:40 php-fpm.d
-rw-r--r--    1 root     root         72548 Jun 15 19:59 php.ini
bash-5.1#
```

- 拷贝文件时，可以使用 chown 和 chmod 修改属性，会将文件夹中全部的文件修改
```bash
RUN addgroup -g 201 -S www \
    && adduser -s /sbin/nologin -S -D -H -u 201 -G www www

COPY ../install.sh /root/b.sh
COPY php8/* /root/php8/
COPY --chown=www:www --chmod=777 php8/ /root/php/php8-1
```

进入容器中查看：
```bash
[root@docker nginx]$ docker run -it --name test nginx-alpine:3.15-02 bash
bash-5.1# cd /root/
bash-5.1# ls
b.sh  php   php8
bash-5.1# ls -lR php
php:
total 4
drwxr-xr-x    4 www      www           4096 Jun 17 16:40 php8-1

php/php8-1:
total 88
drwxrwxrwx    2 www      www           4096 Jun 15 18:46 conf.d
-rwxrwxrwx    1 www      www           5329 Oct 26  2022 php-fpm.conf
drwxrwxrwx    2 www      www           4096 Jun 17 16:40 php-fpm.d
-rwxrwxrwx    1 www      www          72548 Jun 15 19:59 php.ini

php/php8-1/conf.d:
total 0

php/php8-1/php-fpm.d:
total 24
-rwxrwxrwx    1 www      www          20547 Jun 15 19:56 www.conf
bash-5.1# exit
exit

```


### ADD
- 复制，解压缩

### ENV

### ARG
> [ARG](https://docs.docker.com/engine/reference/builder/#arg)

- 传递构建（build）阶段需要用到的变量，和 ENV 不同，不会在镜像创建容器时使用
- 定义的变量在创建镜像时会显示出来，因此不建议将一些需要保密的参数指定为 ARG
- 可以定义多个 ARG，Docerfile 中每个 directive 会创建一层镜像，因此将多个写为一个 ARG 可以减少镜像层
- 注意如果多个变量中后面的要引用前面的变量，则不能写在一个 ARG 中
```bash
ARG NGINX_VERSION="1.24.0" \
    NGINX_URL="https://nginx.org/download/" \
    NGINX_FILE="nginx-${NGINX_VERSION}.tar.gz" \
    NGINX_SRC="/tmp/src" \
    NGINX_PREFIX="/usr/local/nginx" \
    NGINX_DATA="/data/www"

ADD src/${NGINX_FILE} ${NGINX_SRC}
```

上面的 `NGINX_FILE` 用到 `NGINX_VERSION`，虽然写法上有前后次序，但会提示错误：
```bash
 => ERROR [2/2] ADD src/nginx-.tar.gz /tmp/src 
------
 > [2/2] ADD src/nginx-.tar.gz /tmp/src:
------
```
从错误提示可以看出，`NGINX_FILE` 的值不对

做如下修改后成功：
```bash
ARG NGINX_VERSION="1.24.0"
ARG NGINX_URL="https://nginx.org/download/" \
    NGINX_FILE="nginx-${NGINX_VERSION}.tar.gz" \
    NGINX_SRC="/tmp/src" \
    NGINX_PREFIX="/usr/local/nginx" \
    NGINX_DATA="/data/www"
```




## RUN
写多个 run 会创建多层镜像？

安装包
no-cache 不保留缓存

生成镜像时执行

## CMD 容器启动命令
镜像生成容器时默认执行的命令

写命令时两种格式的区别：
直接写命令可能会在前面补一些命令，如 /bin/sh -c 等
而用 ["",""] 写法不会


## ENTRYPOING 入口点
- 为什么需要
配置文件和启动程序的分离存放
配置文件环境的初始化
- 和 CMD 的区别
CMD 负责定义启动程序
执行完后执行 CMD 


## VOLUMN 匿名卷
- 容器删除后不会删除 VOLUMN 指定的文件，但难找


## EXPOSE
- 暴露端口，不暴露端口则 exec 执行时不能用 `-P` 映射端口

`-p` 不用暴露，`-P` 使用时需要用 EXPOSE 

## WORKDIR 指定工作目录
RUN cd /data
RUN ls 

第二个 RUN 的目录不在 /data，第一个 RUN 切换目录不影响后面的 RUN

是否影响 ENTRYPOINT

## ONBUILD


## USER
不指定默认为 root，容器的 root，对宿主机没有权限
需要 --priviles?? 才能操作宿主机


## .dockerignore 文件
和 DockerFile 在一个目录


# 创建镜像优化
1. RUN 尽可能只写一个，写多个 RUN 指令会创建多个镜像
2. 将可能变化的项写后面，充分利用缓存
3. 写 .dockerignore 文件防止复制时拷贝不必要的文件
4. 多级构建，如一些静态编译的 go 程序


# docker 数据管理
LowerDir: 镜像文件，RO，layer0
DiffDir: 容器生成的新数据，RW，layer1
MergeDir: 全部的数据


## 数据卷（data volumn）
启动容器时，可以指定使用数据卷实现容器的持久化

- 指定宿主机目录或文件，指定宿主机的具体路径和容器路径的挂载关系，不会创建数据卷？
这种和第三种区别？这种可以指定目录，第三种目录固定？

直接挂载到宿主机，不是数据卷

- 匿名卷，即 DockerFile 中的 VOLUMN，




- 命名卷，指定数据卷的名称和容器路径的挂载关系，创建数据卷，路径和前面的匿名卷相同，但可以指定卷名

用 docker inspect 查看 Mounts 可以看到
用挂载技术实现，挂载时，如果容器的目录中原本有文件则会被覆盖
如果 entrypoint 中会在容器的要挂载的目录中生成文件，然后运行时执行 -v 挂载，优先级？

指定
docker -v <卷名>:<容器目录>
存放在 /var/lib/docker/volume/<卷名>/_data 目录中

宿主机路径和容器路径



## 数据卷容器
- 数据在多个容器之间共享
- 如两个 nginx 提供 web 服务实现负载均衡，两个容器共享数据，类似在不同的两个虚拟机中搭建 nginx 服务器时，再单独用一个 NFS 来存放数据

- 创建第一个容器，指定数据持久化方案后，后面跟创建容器时如果需要和第一个容器共享目录，则可以用 `--volumes-from` 和第一个容器采用相同的存储策略。






`bash -c` is a command used to run a snippet of Bash shell code that is passed as an argument to the `-c` option. 

Here's an example of using `bash -c` to run a Bash command passed as an argument:

```
bash -c 'echo "Hello, world!"'
```
In this example, the `bash -c` command runs the `echo "Hello, world!"` command as a snippet of Bash shell code passed as an argument. The output would be "Hello, world!" printed on the screen.

The `-c` option can be also useful to execute multiple commands using a single command line argument. For example:

```
bash -c 'echo "Starting the process"; command1; command2; echo "Finished the process"'
```

In this example, the Bash shell code passed as an argument to `bash -c` runs three commands (`echo`, `command1`, and `command2`) and prints out status messages before and after the command execution.


iotop


dockerfile  image   container
两个阶段镜像

~- 相当于 $OLDPWD



# 制作 nginx 镜像
1. 从官方仓库找 nginx 镜像



# 基于 alpine 制作 nginx 镜像

## 制作 alpine 镜像
> alpine 包管理命令：[Alpine Package Keeper](https://wiki.alpinelinux.org/wiki/Alpine_Package_Keeper#)

### 新建用户
新建用户：[Setting up a new user](https://wiki.alpinelinux.org/wiki/Setting_up_a_new_user)

```bash
adduser [OPTIONS] USER [GROUP]

Create new user, or add USER to GROUP

     -h --home DIR           Home directory
     -g --gecos GECOS        GECOS field
     -s --shell SHELL        Login shell named SHELL by example /bin/bash
     -G --ingroup GRP        Group (by name)
     -S --system             Create a system user
     -D --disabled-password  Don't assign a password, so cannot login
     -H --no-create-home     Don't create home directory
     -u --uid UID            User id
     -k SKEL                 Skeleton directory (/etc/skel)
```

### 包管理
> alpine 包管理命令：[Alpine Package Keeper](https://wiki.alpinelinux.org/wiki/Alpine_Package_Keeper#)

- 安装包
```bash
apk --no-cache add 
```

- 更新包
```bash
apk update
```





### 拉取 alpine 镜像并打标签
- 从官方仓库找 alpine 镜像，查看版本，支持的 tags
  如果需要最新版，不用指定 tag，默认为 `latest`
```bash
[root@docker ~]$ docker pull alpine
[root@docker dockerfile]$ docker pull alpine
Using default tag: latest
latest: Pulling from library/alpine
59bf1c3509f3: Pull complete
Digest: sha256:21a3deaa0d32a8057914f36584b5288d2e5ecc984380bc0118285c70fa8c9300
Status: Downloaded newer image for alpine:latest
docker.io/library/alpine:latest
```

- 用 docker images 查看镜像
```bash
[root@docker ~]$ docker images
REPOSITORY         TAG       IMAGE ID       CREATED         SIZE
alpine             latest    c059bfaa849c   18 months ago   5.59MB
```

- docker run 创建容器并进入 alpine 中查看版本和其他信息
alpine 是系统，可以以交互方式进入容器
```bash

[root@docker dockerfile]$ docker run -it --name alpine-01 alpine:latest sh
/ # cat /etc/os-release
NAME="Alpine Linux"
ID=alpine
VERSION_ID=3.15.0
PRETTY_NAME="Alpine Linux v3.15"
HOME_URL="https://alpinelinux.org/"
BUG_REPORT_URL="https://bugs.alpinelinux.org/"
```

- 为镜像打标签
上面查看该镜像的版本为 3.15，官方支持的 tags 中就有 3.15



## 做初始化操作，制作 Dockfile
利用拉取的 alpine 镜像创建容器，进入容器中做一些初始化操作，将这些操作的步骤写到 Dockerfile 中

- 创建 Dockerfile 文件


### 修改软件仓库路径

软件仓库路径为 `/etc/apk/repositories`
```bash
~ # cd /etc/apk
/etc/apk # ls
arch               keys               protected_paths.d  repositories       world
/etc/apk # cat repositories
https://dl-cdn.alpinelinux.org/alpine/v3.15/main
https://dl-cdn.alpinelinux.org/alpine/v3.15/community
/etc/apk #
```

找到一个镜像源，如清华大学镜像网站 [https://mirrors.tuna.tsinghua.edu.cn/alpine/v3.15/](https://mirrors.tuna.tsinghua.edu.cn/alpine/v3.15/)

替换源：
```bash
/etc/apk # sed -i.orig 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/' /etc/apk/repositories
/etc/apk # ls
arch               keys               protected_paths.d  repositories       repositories.orig  world
/etc/apk # cat repositories
https://mirrors.tuna.tsinghua.edu.cn/alpine/v3.15/main
https://mirrors.tuna.tsinghua.edu.cn/alpine/v3.15/community
/etc/apk #
/etc/apk # cat repositories.orig
https://dl-cdn.alpinelinux.org/alpine/v3.15/main
https://dl-cdn.alpinelinux.org/alpine/v3.15/community
/etc/apk # ls protected_paths.d/
```




- 检查时区，修改时区
> 时区介绍：[List of tz database time zones](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List)


默认时区为 UTC
```bash
[root@docker dockerfile]$ docker run -it --name alpine-01 alpine:3.15 sh
/ # date
Thu Jun 15 03:13:18 UTC 2023
```

安装 `tzdata` 来修改时区
> [Setting the timezone](https://wiki.alpinelinux.org/wiki/Setting_the_timezone)

- alpine 用 apk 安装，加上 `--no-cache` 选项可以减少空间，不缓存包的索引信息
- 设置完时区可以用 `apk del tzdata` 删除包
```sh
/ # apk add --no-cache tzdata
/ # cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
/ # echo "Asia/Shanghai" > /etc/timezone
/ # date
Thu Jun 15 14:38:41 CST 2023
/ # apk del tzdata
(1/1) Purging tzdata (2023c-r0)
Executing busybox-1.34.1-r3.trigger
OK: 6 MiB in 14 packages
/ # date
Thu Jun 15 06:30:36 UTC 2023
```


- 安装必要的工具
```bash
apk add --no-cache bash curl wget
```


## 创建 Dockerfile

```bash
FROM alpine:3.15

LABEL author="lx" \
      description="alpine-based image" \
      version="v1.0"

RUN sed -i.orig 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/' /etc/apk/repositories \
    && apk add --no-cache tzdata \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && apk del tzdata \
```


在当前目录下创建构建脚本 build.sh 
```bash
#!/bin/bash

docker build -t alpine-base:3.15 .
```


执行构建脚本

查看新生成的镜像
```bash
[root@docker alpine]$ docker images
REPOSITORY         TAG       IMAGE ID       CREATED          SIZE
alpine-base        3.15      b031c1f21234   10 seconds ago   5.61MB
alpine             3.15      c059bfaa849c   18 months ago    5.59MB
```





# Docker 网络管理
同一宿主机中容器的网络通信
容器的 IP 每次启动都变，不固定


可以修改 daemon.json，bip


ip a 看到的网络接口的选项
<> 和后面的 UP|DOWN 状态 含义


wget -qO - 172.17.0.2

容器重启又会分配一个新的 IP 

--link 容器名
客户端访问服务器时指定 --link 容器名时，自动将服务器的容器名和 IP 写到 /etc/hosts 中

如果 服务器 容器重启，则 /etc/hosts 文件中会更新主机名和 IP 


容器别名，例如 mysql 容器的名为 mysql，
为 mysql 取多个别名，客户端可以用别名


## Host 模式

## Container
创建一个已存在的容器
创建其他容器，指定网络为 --netowrk container:名称或 ID

第二个容器网络依附第一个容器，和第一个容器共享网络，但第二个容器关系上类似 slave 关系，不能主动暴露端口，第一个容器停止，第二个容器看不到 IP ?
??? 


如一个宿主机上装 nginx 搭建 wordpress，再用一个容器
装 mysql，让 mysql 依赖 nginx 服务器网络

端口暴露是分开的？
nginx 暴露 80 端口(宿主机)，外部可以访问，mysql 3306 不对外曝露端口，只有 nginx 访问 3306

启动顺序 /etc/rc.d

特权


## 自定义网络
ping 名字
不用写 IP 
一个宿主机中不同网段的容器能通信吗？
默认不行，通过 iptables 规则实现隔离

镜像拉取加速，用镜像网站




# Docker Compose 容器单机编排工具
单机运行多个容器时管理多个的容器的启动，如顺序，网络配置等

类似 makefile

依赖 docker，docker service 必须正常运行

insecure-registries: 不走 443


# 高可用
粒度高


# Docker 资源限制
pam 模块 limit 

docker 远程管理，客户端和服务端两个主机上

OOM 优先级机制
每个进程有个进程分数 /proc/PID/oom_score_adj
可以修改，值越高越容易被 kill

/proc/PID/oom_score 只读，系统综合进程的内存消耗量

PID 不固定，每次启动可能不同

docker 有自己管理资源的方式


# 压力测试 stree-ng





# lab


## LNMP 搭建 wordpress

### 基于 alpine 做基础镜像
- 选择 alpine:3.15
- 修改软件仓库源为镜像源
- 修改时区


### nginx + php 镜像
- 基于前面的 alpine-base 基础镜像
- nginx 镜像的配置文件、日志和 wordpress 的数据都做持久化，即将宿主机的目录挂载到容器中
- 宿主机中为 nginx 镜像创建一个用户和组，如 www，选择一个容器和宿主机中都未被使用的用户和组
```bash
useradd -s /sbin/nologin -u 124 -g 124 -r -M www
groupadd -g 124 -r www
```
将宿主机中要挂载到容器中的目录的用户和组改为 www
配置文件中指定的 nginx 和 php-fpm 的用户和组都改为 www


### mysql 镜像
#### 利用 ubuntu:22.04 镜像制作 mysql 镜像
Dockerfile 中安装 mysql 制作镜像失败，但用 ubuntu22.04 镜像中生成的容器中安装 mysql 成功 ？
```bash
 => [4/5] RUN apt install -y mysql-server                                                                   338.8s
 => => # Cannot stat file /proc/1/fd/22: Permission denied
 => => # Cannot stat file /proc/1/fd/23: Permission denied
 => => # Cannot stat file /proc/1/fd/24: Permission denied
 => => # Cannot stat file /proc/1/fd/25: Permission denied
 => => # mysqld will log errors to /var/log/mysql/error.log
 => => # mysqld is running as pid 759
```
按照提示说明，是权限问题？ 但进入容器中为什么能成功安装?
Dockerfile 中怎么提升权限？ docker run 指令中可以指定 --privileged 


#### 利用官方的 mysql 镜像
> [mysql](https://hub.docker.com/_/mysql/)

通过传递环境变量来调整 mysql 的配置

- 用 mysql:5.7

mysql 官方镜像生成的容器中，mysql 的数据的 owner 和 group 为 mysql(999)
将 mysql 的数据和配置文件做持久化，在宿主机中创建一个 uid 和 gid 与容器相同的用户 mysql
宿主机中已经有 group 为 999 的组（docker），但无 uid 为 999 的用户
```bash
[root@docker mysql]$ getent group 999
docker:x:999:
[root@docker mysql]$ id docker
id: ‘docker’: no such user
[root@docker mysql]$ useradd -s /sbin/nologin -u 999 -g 999 -r -M mysql
[root@docker mysql]$ id mysql
uid=999(mysql) gid=999(docker) groups=999(docker)
```


如果 mysql 暴露的端口为 3307 而非默认的 3306，则 wordpress 初始化时需要指明主机以及端口
其中主机的 ip 为 mysql 宿主机而非 mysql 容器的 IP，宿主机将 3307 进行转发给 Mysql 容器的 3306
