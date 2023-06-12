Docker 学习


# 资源



# 容器



# 物理机、虚拟机和 Docker

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

## docker logs 查看容器的日志
容器中前台执行的进程才有日志
前台执行标准输出的内容可盈用该方式查看


## docker images 查看当前镜像


## docker ps 


## docker inspect 查看资源详细信息

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
这个后台是否跟终端有管
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




# busybox 
- busybox 模拟命令
- 

# 创建镜像

## Dockerfile

### FROM


### LABEL

### COPY

### ADD
- 复制，解压缩

### ENV


## run
写多个 run 会创建多层镜像？

安装包
no-cache 不保留缓存

生成镜像时执行

## CMD
镜像生成容器时默认执行的命令



`bash -c` is a command used to run a snippet of Bash shell code that is passed as an argument to the `-c` option. 

Here's an example of using `bash -c` to run a Bash command passed as an argument:

```
bash -c 'echo "Hello, world!"'
``
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