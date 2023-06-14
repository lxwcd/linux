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

### Dockerfile 文件格式
> [Dockerfile reference](https://docs.docker.com/engine/reference/builder/)






## Dockerfile

### FROM


### LABEL
> [LABEL](https://docs.docker.com/engine/reference/builder/#label)





### COPY

### ADD
- 复制，解压缩

### ENV


## run
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

# lab
tomcat 

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



# Docker 网络管理
同一宿主机中容器的网络通信
容器的 IP 每次启动都变，不固定


可以修改 daemon.json，bip


ip a 看到的网络接口的选项
<> 和后面的 UP|DOWN 状态 含义


wget -qo - 172.17.0.2

容器重启又会分配一个新的 IP 

--link 容器名
客户端访问服务器时指定 --link 容器名时，自动将服务器的容器名和 IP 写到 /etc/hosts 中

如果 服务器 容器重启，则 /etc/hosts 文件中会更新主机名和 IP 


容器别名，例如 mysql 容器的名为 mysql，
为 mysql 取多个别名，客户端可以用别名



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
