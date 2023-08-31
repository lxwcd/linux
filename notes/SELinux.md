SELinux 学习笔记

> 鸟哥的 Linux 私房菜基础学习篇第四版 第 16 章 进程管理与 SELinux 初探


# SELinux 介绍
- Security Enhanced Linux
- 避免资源误用，如不小心将某个重要程序权限设置为 777 而引发的安全隐患
- 进行进程、文件等细部权限设置依据的一个核心模块

## 自助式访问控制 DAC
- Discretionary Access Control
- 传统的文件权限与账号的关系
- 依据进程的拥有者和文件资源的 rwx 权限决定有无读写能力

缺点：
- root 有最高权限，若不小心被其他人获取，则该程序可以在系统上进行任何资源的存取
- 使用者可以取得进程来变更文件资源的访问权限

## 强制访问控制 MAC
- Mandatory Access Control
- 可以对特定进程与特定的文件资源来进行权限控制
即使是 root，在使用不同的进程时，获取的权限不一定是 root，而要根据该进程的设置而定
文件资源也对进程设置了可用的权限，因此进程也不一定能任意使用文件资源
- SELinux 提供一些默认策略（policy），并在该政策中提供多个规则（rule），来选择是否启用该控制规则
- 控制的主体是进程
- 进程能活动的空间更小，更安全

# SELinux 运行模式
- 通过 MAC 管理程序
- 控制的主体（Subject）为进程
- 目标（Object）为该进程能否读写的文件资源
- 通过制定策略（Policy）来管理
- 策略中有详细的规则（rule）指定不同的服务开放的资源
	- targeted
	针对网络服务限制多，本机限制少，默认政策
	- minimum
	仅针对选择的进程保护
	- mls
	限制较严格
- 主体与目标的安全上下文（security context）必须一致才能读写目标，类似 rwx
- SELinux 放行后，最终能否读写目标还是要看文件系统的 rwx 权限
- 安全上下文在 inode 中，可以通过 `ls -Z` 查看，前提是开启 SELinux

# SELinux 三种模式
- enforcing
强制模式，SELinux 运行中，且已开始限制 domain/type
- permissive
宽容模式，SELinux 运行中，但不实际限制，仅警告
- disabled
SELinux 未运行

# getenforce 查看 SELinux 模式
- rocky8.6
```bash
[lx@Rocky8 ~]$ getenforce 
Enforcing
```

- ubuntu 22.04
要先安装 `selinux-utils`
```bash
[14:40 lx@ubunut22 ~/Documents]$getenforce
Command 'getenforce' not found, but can be installed with:
sudo apt install selinux-utils
[15:28 lx@ubunut22 ~/Documents]$sudo apt install selinux-utils
```
```bash
[15:32 lx@ubunut22 ~/Documents]$getenforce 
Disabled
```

# sestatus 查看 SELinux 政策
- rocky8.6 
```bash
[lx@Rocky8 ~]$ sestatus 
SELinux status:                 enabled
SELinuxfs mount:                /sys/fs/selinux
SELinux root directory:         /etc/selinux
Loaded policy name:             targeted
Current mode:                   enforcing
Mode from config file:          enforcing
Policy MLS status:              enabled
Policy deny_unknown status:     allowed
Memory protection checking:     actual (secure)
Max kernel policy version:      33
```

- ubuntu 22.04 
先安装 policycoreutils
```bash
[15:33 lx@ubunut22 ~/Documents]$sestatus
Command 'sestatus' not found, but can be installed with:
sudo apt install policycoreutils
[15:34 lx@ubunut22 ~/Documents]$sudo apt install policycoreutils
```

```bash
[15:38 lx@ubunut22 ~/Documents]$sestatus 
SELinux status:                 disabled
```

# 修改 SELinux 的模式
## 配置文件修改 SELinux 的模式
- 修改 `/etc/selinux/config` 文件
- 修改后重启

```bash
  1 # This file controls the state of SELinux on the system.
  2 # SELINUX= can take one of these three values:
  3 #     enforcing - SELinux security policy is enforced.
  4 #     permissive - SELinux prints warnings instead of enforcing.
  5 #     disabled - No SELinux policy is loaded.
  6 SELINUX=enforcing
  7 # SELINUXTYPE= can take one of these three values:
  8 #     targeted - Targeted processes are protected,
  9 #     minimum - Modification of targeted policy. Only selected processes are protected. 
 10 #     mls - Multi Level Security protection.
 11 SELINUXTYPE=targeted
```

## setenforce  
- 不能关闭，仅其他两种模式切换
- 修改后要重启，因为 SELinux 在内核中

```bash
[lx@Rocky8 ~]$ setenforce --help
usage:  setenforce [ Enforcing | Permissive | 1 | 0 ]

[lx@Rocky8 ~]$ sudo setenforce 0
[lx@Rocky8 ~]$ getenforce 
Permissive
```