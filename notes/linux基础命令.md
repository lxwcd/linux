﻿Linux 基础命令  
    
# 操作系统  
> 计算机的心智操作系统之哲学原理 1.3  
    
- 操作系统是一个软件系统  
- 替用户及其应用管理计算机上的软硬件资源  
- 保证对计算机资源的公平竞争和使用  
- 防止对计算机资源的非法侵占和使用  
    
# Linux 介绍  
> [Operating System - Linux](https://www.tutorialspoint.com/operating_system/os_linux.htm)  
> [What is Linux](https://www.redhat.com/en/topics/linux/what-is-linux)  
> [Architecture of Linux](https://www.javatpoint.com/architecture-of-linux)  
    
- 一种开源的操作系统软件  
- 管理系统的硬件和资源  
- 介于硬件和应用程序之间  
- 提供一个平台能让用户方便的运行应用程序  
    
## 特点  
- Portable  
- Open Source  
- Multi-User  
- Multiprogramming  
- Hierachical File System  
- Shell  
- Security  
    
## Linux 基本组成  
> [Operating System - Linux](https://www.tutorialspoint.com/operating_system/os_linux.htm)  
> [Introduction: The Linux Operating System](https://rc.byu.edu/documentation/unix-tutorial/unix1.php)  
    
## Linux 分支介绍  
> [Linux的分支及使用选择](https://zhuanlan.zhihu.com/p/381753464)  
    
# 远程连接  
## SSH  
> [SSH 教程](https://www.cainiaojc.com/ssh/ssh-basic.html)  
> [什么是SSH 以及常见的ssh 功能](https://blog.csdn.net/u013452337/article/details/80847113)  
> [查看linux虚拟机ssh服务是否开启](https://blog.csdn.net/n123456uo/article/details/90261882)  
> [解决：使用xshell连接服务器时无法使用账号密码登录的一种方式](https://blog.csdn.net/LvQiFen/article/details/122182815?spm=1001.2101.3001.6661.1&utm_medium=distribute.pc_relevant_t0.none-task-blog-2%7Edefault%7ECTRLIST%7ERate-1-122182815-blog-96923553.pc_relevant_multi_platform_whitelistv3&depth_1-utm_source=distribute.pc_relevant_t0.none-task-blog-2%7Edefault%7ECTRLIST%7ERate-1-122182815-blog-96923553.pc_relevant_multi_platform_whitelistv3&utm_relevant_index=1)  
> [SSH远程访问及控制](https://www.cnblogs.com/y0226/p/16806645.html)  
    
详细介绍见网络安全笔记  
    
- SSH 是一种网络协议，主要用于保证远程登录计算机的安全  
- SSH 的软件架构是服务器-客户端模式  
- openssh 是 ssh 实现的一种  
- openssh 对**客户端**的实现为 ssh  
- openssh 对**服务器**的实现为 sshd  
- 用小写 ssh 表示客户端程序  
  
![](img/2025-02-04-18-40-31.png)
![](img/2025-02-04-18-41-34.png)
![](img/2025-02-04-18-42-04.png)
    
### 安装  
- ubuntu 默认安装 openssh-client  
- ubuntu 安装 openssh-server：`sudo apt install openssh-server`  
    
### root 不能通过 xshell 远程  
- 修改服务端配置文件 /etc/ssh/sshd_config  
编辑 `/etc/ssh/sshd_config` 做如下修改：  
```bash  
# 添加下面的行  
PermitRootLogin yes  
    
# 注释原来的行  
#PermitRootLogin prohibit-password  
```  
    
- 重启 ssh 服务  
> [How do I restart sshd daemon on Linux or Unix?](https://www.cyberciti.biz/faq/how-do-i-restart-sshd-daemon-on-linux-or-unix/)  
    
- Ubuntu 22.04 和 Ubuntu 20.04  
```bash  
sudo systemctl restart ssh.service  
```  
    
- rocky8.6  
```bash  
sudo systemctl restart sshd.service  
```  
    
### 删除用户密码后 xshell 中不输入  
密码不能连接  
- ssh 做了限制，默认无密码时不能用密码的方法连接，可以修改配置  
```bash  
# /etc/ssh/sshd_config  
# 注释下面行  
#PermitEmptyPasswords no  
    
# 新增下面行  
PermitEmptyPasswords yes  
```  
    
- 换其他方式连接，如密钥或其他方式，还未试过  
![](img/2025-02-04-18-45-28.png)
    
### ssh 通过公钥远程登录  
> [设置 SSH 通过密钥登录](https://www.runoob.com/w3cnote/set-ssh-login-key.html)  
> [linux下ssh公钥验证的设置和远程登录](https://donaldhan.github.io/linux/2020/04/29/linux下ssh公钥验证的设置和远程登录.html)  
    
# linux 终端  
> [Difference between pts and tty](https://unix.stackexchange.com/questions/21280/difference-between-pts-and-tty)  
> [What is the exact difference between a 'terminal', a 'shell', a 'tty' and a 'console'?](https://unix.stackexchange.com/questions/4126/what-is-the-exact-difference-between-a-terminal-a-shell-a-tty-and-a-con)  
> [Difference between /dev/tty and /dev/pts (tty vs pts) in Linux](https://www.golinuxcloud.com/difference-between-pty-vs-tty-vs-pts-linux/)  
> [Linux的各种终端类型及概念](https://blog.csdn.net/xyz/article/details/118066465)  
    
## console  
Console（控制台）是 Linux 系统中用于与用户交互的设备。它通常是一个物理终端（如键盘和显示器）或一个虚拟终端，用于显示系统消息、登录提示、用户输入和输出等。

### Console 的类型
（1）物理控制台（Physical Console）
物理控制台是指直接连接到计算机硬件的终端设备，例如通过键盘和显示器直接与系统交互。在 Linux 系统启动时，物理控制台通常用于显示启动信息、登录提示等。物理控制台通常通过 /dev/console 设备文件进行访问。

（2）虚拟控制台（Virtual Console）
虚拟控制台是 Linux 提供的一种多用户、多任务的终端模拟环境。用户可以通过组合键（如 Ctrl + Alt + F1 到 Ctrl + Alt + F6）在不同的虚拟控制台之间切换。每个虚拟控制台都模拟了一个独立的终端，用户可以在不同的虚拟控制台中运行不同的程序。
虚拟控制台的设备文件：虚拟控制台通过 /dev/tty1、/dev/tty2 等设备文件进行访问。例如，/dev/tty1 对应第一个虚拟控制台。
多用户支持：虚拟控制台允许多个用户同时登录系统，每个用户可以在自己的虚拟控制台中独立操作，互不干扰。

（3）串行控制台（Serial Console）
串行控制台是通过串行端口（如 COM 端口）连接的终端设备。它通常用于远程管理服务器或嵌入式设备。串行控制台通过 /dev/ttyS0、/dev/ttyS1 等设备文件进行访问。
应用场景：在服务器机房中，管理员可以通过串行控制台远程连接服务器进行维护，即使服务器没有键盘和显示器。
配置：需要在 BIOS 和操作系统中配置串行端口参数（如波特率、数据位、停止位等）。

### Console 的功能
（1）系统启动信息显示
在系统启动过程中，console 用于显示内核初始化信息、硬件检测信息、服务启动信息等。这些信息对于系统管理员排查启动问题非常重要。
（2）用户登录与交互
用户可以通过 console 登录系统，输入用户名和密码进行身份验证。登录后，用户可以在控制台中运行命令、管理文件、配置系统等。
（3）系统消息输出
系统会将重要的消息（如错误信息、警告信息、日志信息等）输出到 console。这些消息通常会记录到日志文件中（如 /var/log/messages），同时也会显示在控制台上。

### Console 的配置
（1）内核启动参数
在 Linux 系统启动时，可以通过内核启动参数指定 console 的类型和设备。例如：
console=tty0：表示使用默认的物理控制台。
console=ttyS0,9600：表示使用串行端口 /dev/ttyS0，波特率为 9600。
这些参数通常在启动加载器（如 GRUB）的配置文件中设置。
（2）虚拟控制台的配置
虚拟控制台的行为可以通过 /etc/inittab 文件（在 System V init 系统中）或 systemd 的服务单元文件（在 systemd 系统中）进行配置。例如，可以指定虚拟控制台的数量、默认运行级别等。

### Console 的使用场景
（1）系统维护
在系统出现故障时，管理员可以通过 console 登录系统进行故障排查和修复。例如，当网络服务不可用时，管理员可以通过物理控制台或串行控制台直接访问系统。
（2）多用户环境
在多用户环境中，虚拟控制台允许多个用户同时登录系统，每个用户可以在自己的虚拟控制台中独立工作，互不干扰。
（3）嵌入式设备
在嵌入式设备中，串行控制台是常用的调试和管理工具。由于嵌入式设备通常没有物理键盘和显示器，串行控制台可以通过串行端口与外部设备（如调试器）连接，方便开发和维护。

### Console 与其他终端的区别
（1）与图形终端（X Terminal）的区别
功能：console 是基于字符的终端，主要用于系统管理和命令行操作；而图形终端（如 X Terminal）支持图形界面，可以运行图形应用程序。
启动顺序：console 在系统启动时首先加载，而图形终端通常在用户登录后启动。
资源占用：console 资源占用较少，适合在资源受限的环境中使用；图形终端需要更多的硬件资源。
（2）与远程终端（如 SSH）的区别
连接方式：console 是本地终端，直接连接到系统的硬件设备；远程终端（如 SSH）通过网络连接到系统。
安全性：远程终端需要网络连接，可能存在网络攻击的风险；console 是本地设备，相对更安全。

## tty  
> [Difference between /dev/tty and /dev/pts (tty vs pts) in Linux](https://www.golinuxcloud.com/difference-between-pty-vs-tty-vs-pts-linux/)  
> [The TTY demystified](http://www.linusakesson.net/programming/tty/)  
    
- terminal = tty = text input/output environment  
    
- Ubuntu 22.04 server 可通过 `Ctrl A|t ` `F1-F6` 分别切换到六个 tty 终端，可通过 `tty` 命令显示当前  tty，不按照顺序切换，如先用 `Ctrl A|t F6` 再用 `Ctrl A|t F5` 切换，前面的仍是 `tty6`，后面的是 `tty5`  
![](img/2023-04-04-17-21-22.png)  
用 `w` 可以查看当前登录的用户  
![](img/2023-04-04-17-30-02.png)  
    
- Ubuntu 20.04 桌面版默认打开图形，用 `tty` 命令查看是 `/dev/pts/num` 而非 `/dev/tty/num`  
切换到其他终端，如 `tty3`，可以通过 `startx` 命令切换到图形界面，但该方式打开的图形窗口只能有一个，即其他终端不能再用 `startx` 运行 `X server`，但原来的第一个终端的图形界面还存在。可通过 `killall xinit` 退出图形界面回到终端  
![](img/2023-04-04-17-45-35.png)  
  
- 图形界面登录可通过 `init 3` 切换到 CLI 模式，此时用 `tty` 命令查看为 `tty` 设备而非 `pts`  
    
- 在图形界面可通过 `init 5` 再回到图形界面，查看其他终端还保持原来的界面不变  
    
## pty  
PTY 是伪 TTY 的主设备（Master），它用于控制从设备（pts）。PTY 设备通常由应用程序（如终端模拟器或 SSH 客户端）创建和管理。

**设备文件**：PTY 设备文件通常位于 /dev/ptmx（Pseudo-TTY Multiplexor），它是一个特殊的设备文件，用于分配伪 TTY 对。

**作用**：PTY 设备用于管理伪 TTY 对，它将用户的输入传递给从设备（pts），并将从设备的输出传递给用户。
    
## pts  
- 图形界面和远程登录时终端显示的设备为 `pts` 而非 `tty`  
    
    
## startx  
> [what does startx command do](https://askubuntu.com/questions/518454/what-does-startx-command-do)  
> [startx Command](https://www.ibm.com/docs/en/aix/7.2?topic=s-startx-command)  
    
    
# session 会话管理  
> [Linux session(会话)](https://www.cnblogs.com/sparkdev/p/12146305.html)  
> [10. Processes](https://www.win.tue.nl/~aeb/linux/lk/lk-10.html)  
    
    
# Tmux 终端复用  
> [Tmux使用手册](http://louiszhai.github.io/2017/09/30/tmux/)  
> [Tmux 使用教程](https://www.ruanyifeng.com/blog/2019/10/tmux.html)  
    
# linux 基本规则  
- 区分大小写  
    
# linux 命令格式  
> [What's the difference between a flag, an option, and an argument? [closed]](https://unix.stackexchange.com/questions/285575/whats-the-difference-between-a-flag-an-option-and-an-argument)  
    
# Tab 补全命令  
    
## 列出全部变量  
- 输入 `$` 后按两次 `Tab` 键  
    
## 列出全部用户  
- 输入 `~` 后按两次 `Tab` 键  
    
# linux 常用热键查看  
- `stty -a` 查看热键，`man stty` 查看帮助说明  
    
![](img/2023-03-17-09-13-44.png)  
![](img/2023-03-17-09-18-48.png)  
    
## 热键来源  
- `man bash` 查看帮助文档介绍，bash 会用到 [readline 库](https://en.wikipedia.org/wiki/GNU_Readline)  
- readline 库中热键如 ctrl z 等用 [emacs](https://en.wikipedia.org/wiki/Emacs)  快捷键  
![](img/2025-02-04-18-58-51.png)
![](img/2025-02-04-18-59-50.png)
![](img/2025-02-04-19-00-13.png)
- readline 库初始化文件在 `/etc/inputrc` 中，可以看到默认是 emacs 快捷键  
![](img/2025-02-04-19-00-47.png)
![](img/2025-02-04-19-01-17.png)
    
## 中断执行  
> [ctrl+c 和 ctrl+z 的区别](https://blog.csdn.net/qq_54947566/article/details/124345900?spm=1001.2014.3001.5502)  
> [Linux Ctrl+c与ctrl+z的区别](https://www.cnblogs.com/yzjT-mac/p/6207843.html)  
> [Linux后台进程管理以及ctrl+z（挂起）、ctrl+c（中断）、ctrl+\（退出）和ctrl+d（EOF）的区别](https://blog.csdn.net/qq_36838191/article/details/82710101)  
> [What is the difference in using Ctrl+D and Ctrl+C to terminate cat command?](https://unix.stackexchange.com/questions/379347/what-is-the-difference-in-using-ctrld-and-ctrlc-to-terminate-cat-command)  
    
### Ctrl + z 进程放到后台挂起  
![](img/2025-02-04-19-02-05.png) 

### Ctrl + c 发送 SIGINT 信号  
> [POSIX signals](https://dsa.cs.tsinghua.edu.cn/oj/static/unix_signal.html)  
> [How to Use SIGINT and Other Termination Signals in Linux](https://linuxhandbook.com/termination-signals/)  
    
- 终端输入命令时，如果不想输入了可以按这两个键，该输入不会执行，不会记录到历史记录  
- 如果输入 `sleep 100`，可以用该快捷键终止  
    
### Ctrl + d 发送 EOF  
> [Why does Ctrl-D (EOF) exit the shell?](https://unix.stackexchange.com/questions/110240/why-does-ctrl-d-eof-exit-the-shell)  
    
- 终端直接按该快捷键则退出终端  
    
## Ctrl + s 屏幕不显示和执行输入命令  
- 按 `Ctrl + s` 后，输入的命令不显示在屏幕上，按 `Enter` 也不执行命令  
- 按 `Ctrl + q` 后解锁屏幕，如果之前输入命令后按了 `Enter`，则解锁后将之前输入的依次执行，多个命令都会执行；如果没有按 `Enter`，则只显示在屏幕上  
    
## Ctrl + q 解锁 Ctrl + s  
    
# 命令放后台执行  
## &  
> [Linux 命令中的 & 符号](https://blog.csdn.net/weixin_45505313/article/details/103749523)  

在 Linux 系统中，使用 & 符号可以将命令放到后台执行。这是一个非常实用的功能，尤其是在需要同时运行多个任务或避免阻塞当前终端时。

在 Linux 中，任务（或进程）可以在前台或后台运行：
**前台任务**：直接在终端中运行的任务，会阻塞终端，直到任务完成。
**后台任务**：在终端的后台运行的任务，不会阻塞终端，用户可以在后台任务运行的同时继续使用终端。

在命令后面加上 & 符号，可以让该命令在后台运行。例如：
假设想运行一个长时间的任务，比如下载一个大文件，可以使用以下命令：
bash复制
```bash
wget http://example.com/largefile.zip &
```
这条命令会立即返回，终端不会被阻塞，可以继续在终端中输入其他命令。

### 查看后台任务
在 Linux 中，可以使用 jobs 命令查看当前终端会话中的后台任务：
```bash
[root@lx-virtual-machine ~]$ jobs
[1]-  Running                 sleep 100 &
[2]+  Running                 sleep 200 &
```

### 将前台任务放到后台
如果已经开始运行了一个命令，但希望将其放到后台，可以使用以下步骤：
**暂停当前任务**：按下 Ctrl + Z，这会将当前任务暂停。
**将任务放到后台**：使用 bg 命令将任务放到后台继续运行。

### 将后台任务放到前台
如果需要将后台任务重新放到前台运行，可以使用 fg 命令：
```bash
[root@lx-virtual-machine ~]$ jobs
[1]   Done                    sleep 100
[2]-  Running                 sleep 200 &
[3]+  Running                 sleep 500 &
[root@lx-virtual-machine ~]$ fg %3
sleep 500
```

### 任务结束通知
当后台任务完成时，终端会通知。如果不想接收通知，可以在命令中加上 `>/dev/null 2>&1`，将标准输出和标准错误重定向到 /dev/null：

```bash
command > /dev/null 2>&1 &
```

### 任务与终端的关系
**会话控制**：默认情况下，后台任务仍然属于当前终端会话。如果关闭终端，后台任务可能会被终止。

### 任务状态
可以使用 ps 或 top 命令查看所有后台任务的状态：
```bash
[root@lx-virtual-machine ~]$ ps
    PID TTY          TIME CMD
   3346 pts/1    00:00:00 bash
  32470 pts/1    00:00:00 sleep
  32474 pts/1    00:00:00 ps
```

## nohup
nohup 是一个常用的 Linux 命令，全称为 no hang up（不挂起）。它的主要功能是让指定的命令或程序在用户退出终端或注销后仍然继续运行。

### nohup 与 & 的区别
**&**：
**功能**：将命令放到后台执行，但不会改变命令对终端挂起信号（SIGHUP）的响应。如果终端关闭，后台任务可能会被终止。
**输出**：默认情况下，命令的标准输出和错误输出仍然会发送到终端。

**nohup**：
**功能**：让命令忽略挂起信号（SIGHUP），即使终端关闭或用户注销，命令仍会继续运行。
**输出**：默认情况下，标准输出和错误输出会被重定向到当前目录下的 nohup.out 文件。可以通过重定向操作符（如 > 和 2>&1）指定输出文件。

### 是否绑定窗口或终端
**&**：后台任务与终端绑定，终端关闭时任务可能会被终止。
**nohup**：后台任务与终端解绑，终端关闭或用户注销后任务仍会继续运行。用 jobs 看不到进程，用 ps 可以在另一个窗口查看进程。

### 使用场景
**长时间运行的任务**：例如数据处理、备份脚本等，需要在后台运行且不受终端关闭影响。
**远程会话**：通过 SSH 连接到服务器时，使用 nohup 可以确保任务不会因网络断开而终止。
**日志记录**：将任务的输出重定向到日志文件，便于后续分析。

5. 常见用法

```bash
nohup command &
```
command 是要执行的命令。
& 表示将命令放到后台运行。

重定向输出：
```bash
nohup command > output.log 2>&1 &
```
> 将标准输出重定向到 output.log 文件。
2>&1 将标准错误重定向到标准输出，所有输出都会记录到 output.log。

指定不同的输出文件：
```bash
nohup command > output.log 2> error.log &
```
标准输出写入 output.log，错误输出写入 error.log。

### 查看进程
```bash
ps aux | grep command
```
使用 ps 命令结合 grep 查找相关进程。

### 终止进程
```bash
kill <PID>
```
找到进程 ID 后，使用 kill 命令终止任务。

# shell 设置文本输出颜色  
> [shell中设置文字输出的颜色及字体格式](https://blog.csdn.net/yetugeng/article/details/89978787)  
> [Bash tips: Colors and formatting (ANSI/VT100 Control sequences)](https://misc.flogisoft.com/bash/tip_colors_and_formatting)  
> [How to change the output color of echo in Linux](https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux)  
    
```bash  
[root@ubuntu22-c0 ~]$ echo $PS1  
\[\e[36m\][\u@\h \W]$ \[\e[0m\]  
```  
注意颜色的开始 `\e[36m` 和结束 `\e[0m` 均用方括号括起来，否则一行写到屏幕最右端后新的文字在显示上会覆盖原来的内容而非换到第二行  
    
# 安装完成后基本设置  
## 安装输入法  
> [在 Ubuntu Linux 上安装 Fcitx5 中文输入法](https://zhuanlan.zhihu.com/p/415648411)  
    
## 服务器修改控制台字体  
> [在Ubuntu服务器中更改控制台字体](https://lzyws739307453.blog.csdn.net/article/details/103101188?spm=1001.2101.3001.6650.1&utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7ERate-1-103101188-blog-89723707.pc_relevant_3mothn_strategy_recovery&depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7ERate-1-103101188-blog-89723707.pc_relevant_3mothn_strategy_recovery&utm_relevant_index=2)  
    
    
问题：安装的服务器版本控制台界面很小，字体调大后不能完全显示。  
    
可以不改字体，用 MobaXterm 远程登录，修改和操作更方便  
    
## localectl 设置语言环境  

- 查看当前的语言环境  
```bash  
[root@ubuntu22-c0 ~]$ localectl  
   System Locale: LANG=en_US.UTF-8  
       VC Keymap: n/a  
      X11 Layout: us  
       X11 Model: pc105  
```  
```bash  
[root@ubuntu2204 ~]#echo $LANG  
en_US.UTF-8  
```  

- 查看当前支持语言列表  
```bash  
[root@ubunut22:~]$ localectl list-locales  
C.UTF-8  
en_AG.UTF-8  
en_AU.UTF-8  
en_BW.UTF-8  
en_CA.UTF-8  
en_DK.UTF-8  
en_GB.UTF-8  
en_HK.UTF-8  
en_IE.UTF-8  
en_IL.UTF-8  
en_IN.UTF-8  
en_NG.UTF-8  
en_NZ.UTF-8  
en_PH.UTF-8  
en_SG.UTF-8  
en_US.UTF-8  
en_ZA.UTF-8  
en_ZM.UTF-8  
en_ZW.UTF-8  
zh_CN.UTF-8  
```  
    
- 修改语言环境  
```bash  
[root@ubunut22:~]$ localectl set-locale LANG=en_US.UTF-8  
```  
    
- 修改完后重启  
    
## 设置时区  
### 利用 timedatectl 修改时区  
> [Linux 如何设置时区、时间](https://blog.csdn.net/gezilan/article/details/79422864)  
    
```bash  
sudo timedatectl set-timezone 'Asia/Shanghai'  
```  
    
### 利用 tzdata 修改时区  
安装 tzdata，该软件是交互安装，第一次选择 Asia(6)，第二次选择 Shanghai(70)  
用下面方式安装不用交互  
```bash  
echo -e "6\n70" | sudo apt install -y tzdata  
```  

## 修改提示符 PS1  
> [Controlling-the-Prompt](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Controlling-the-Prompt)  
> [环境变量PS1介绍](https://hongjh.blog.csdn.net/article/details/121312038)  
> [Bash PS1 customization examples](https://linuxhint.com/bash-ps1-customization/)  
> [6.9 Controlling the Prompt](https://www.gnu.org/software/bash/manual/html_node/Controlling-the-Prompt.html)  
    
- `man bash` 帮助文档查看环境变量 `$PS1` 的介绍  
![](img/2025-02-04-19-38-17.png)
    
- 提示符说明：`man bash` 搜索 `PROMPTING`  
![](img/2025-02-04-19-38-45.png)
    
- 注意 `\h` 显示主机名只到第一个 `.`前，之后的不显示，`\H` 显示完整主机名  
![](img/2025-02-04-19-39-07.png)

- 示例  
```bash  
[root@ubuntu22-c0 ~]$ echo $PS1  
\[\e[36m\][\u@\h \W]$ \[\e[0m\]  
```  
    
- 注意该变量设置最好在 `~/.bashrc` 中，如果在 `/etc/profile` 中设置，可能被覆盖  
Ubuntu22.04 中 `~/.bashrc` 中会设置 `PS1`，因此覆盖之前的设置  
不同 bash 版本可能有差异，注意脚本调用顺序和规则  
    
# 主机名  
> [Linux 配置（一）：临时修改主机名 | 永久修改主机名 | 详解](https://blog.csdn.net/succing/article/details/120638064)  
> [LINUX 主机名字规范](https://blog.51cto.com/linuxguest/109487)  
> [Linux修改主机名(静态主机名、临时主机名)](https://blog.csdn.net/zhaogang1993/article/details/82769439)  
    
- 注意主机名不规范可能出现错误  
    
## 主机名规则  
- rocky8.6  
- 大小写字母，数字，连字符（-），不能以连字符开头  
    
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
    
## 查看主机名  
```bash  
[root@ubuntu22-c0 ~]$ hostname  
ubuntu22-c0  
[root@ubuntu22-c0 ~]$ hostnamectl --  
--help             --json             --no-ask-password  --static           --version  
--host             --machine          --pretty           --transient  
[root@ubuntu22-c0 ~]$ hostnamectl --pretty  
    
[root@ubuntu22-c0 ~]$ hostnamectl --static  
ubuntu22-c0  
[root@ubuntu22-c0 ~]$ hostnamectl --transient  
ubuntu22-c0  
```  
    
## 临时修改主机名  
- `hostname` 加新主机名，需要 root 权限，临时生效，不修改配置文件  
```bash

[root@lx-virtual-machine ~]$ hostname "ubuntu2204"
[root@lx-virtual-machine ~]$ cat /etc/hostname
lx-virtual-machine
[root@lx-virtual-machine ~]$ cat /etc/hosts
127.0.0.1       localhost
127.0.1.1       lx-virtual-machine

# The following lines are desirable for IPv6 capable hosts
::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
[root@lx-virtual-machine ~]$ bash
[root@ubuntu2204 ~]$
```
    
## hostnamectl 永久修改主机名  
- `man hostnamectl` 查看帮助文档  
![](img/2025-02-04-19-42-39.png)

- `hostname` 查看当前系统主机名  
前面修改主机名时用的 `hostnamectl --static`，因此只修改 `static` 和 `transient` 两个参数  

- `hostnamectl set-hostname` 永久修改主机名  
```bash
[root@ubuntu2204 ~]$ hostnamectl --static set-hostname "Ubuntu2204"
[root@ubuntu2204 ~]$ cat /etc/host
host.conf    hostid       hostname     hosts        hosts.allow  hosts.deny
[root@ubuntu2204 ~]$ cat /etc/hostname
Ubuntu2204
[root@ubuntu2204 ~]$ cat /etc/hosts
127.0.0.1       localhost
127.0.1.1       lx-virtual-machine
```    
    
## /etc/hostname 主机名所在配置文件  
`hostnamectl` 修改主机名后，可以看到 `/etc/hostname` 配置文件的内容改变，变为新的主机名  
    
## 修改主机名后刷新显示  
- 如果输入 `bash` 重新打开一个 shell，可以看到主机名更新了  
- 如果要当前的 shell 的主机名更新，需要退出后重新进入终端  
    
# 查看 Linux 操作系统版本  
## cat /etc/os-release  
```bash  
[root@ubuntu22-c0 ~]$ cat /etc/os-release  
PRETTY_NAME="Ubuntu 22.04.1 LTS"  
NAME="Ubuntu"  
VERSION_ID="22.04"  
VERSION="22.04.1 LTS (Jammy Jellyfish)"  
VERSION_CODENAME=jammy  
ID=ubuntu  
ID_LIKE=debian  
HOME_URL="https://www.ubuntu.com/"  
SUPPORT_URL="https://help.ubuntu.com/"  
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"  
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"  
UBUNTU_CODENAME=jammy  
[root@ubuntu22-c0 ~]$  
```  
    
## cat /etc/issue  
ubuntu22.04 默认会显示，可以修改其内容  
    
```bash  
[root@ubuntu22-c0 ~]$ cat /etc/issue  
Ubuntu 22.04.1 LTS \n \l  
```  
    
# 查看 linux 内核版本  
## uname -r  
```bash  
[root@ubuntu22-c0 ~]$ uname -r  
5.15.0-73-generic  
[root@ubuntu22-c0 ~]$ uname -a  
Linux ubuntu22-c0 5.15.0-73-generic #80-Ubuntu SMP Mon May 15 15:18:26 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux  
[root@ubuntu22-c0 ~]$  
```  
    
## cat /proc/version  
```bash  
[root@ubuntu22-c0 ~]$ cat /proc/version  
Linux version 5.15.0-73-generic (buildd@bos03-amd64-060) (gcc (Ubuntu 11.3.0-1ubuntu1~22.04.1) 11.3.0, GNU ld (GNU Binutils for Ubuntu) 2.38) #80-Ubuntu SMP Mon May 15 15:18:26 UTC 2023  
```  
    
    
# 查看 IP 地址  
- ip a  
- hostname -I  
    
# 查看登录用户  
## logname  
```bash
[root@ubuntu2204 ~]$ logname
root
[root@ubuntu2204 ~]$ who
lx       tty2         2025-02-04 17:30 (tty2)
root     pts/2        2025-02-04 19:31 (10.0.0.1)
root     pts/3        2025-02-04 19:30 (10.0.0.1)
```
    
登录系统的用户和当前终端用户有区别，不管当前用 su 切换到哪个用户，登录用户都不变  
    
## last  
- 查看最近登陆的用户  
```bash  
[lx@ubuntu22-c0 ~]$ whatis last  
last (1)             - show a listing of last logged in users  
[lx@ubuntu22-c0 ~]$  
[lx@ubuntu22-c0 ~]$ last -n5  
root     pts/0        10.0.0.1         Thu Aug 17 12:02   still logged in  
reboot   system boot  5.15.0-73-generi Thu Aug 17 12:01   still running  
root     pts/0        10.0.0.1         Tue Aug  8 11:53 - down   (08:43)  
root     pts/0        10.0.0.1         Tue Aug  8 11:24 - 11:48  (00:24)  
reboot   system boot  5.15.0-73-generi Tue Aug  8 11:23 - 20:37  (09:13)  
    
wtmp begins Tue Feb 21 08:28:33 2023  
```  
    
## who  
> [who命令、whoami命令和who am i命令的区别](https://blog.csdn.net/u014270566/article/details/124177994)  
> [w who whoami](http://pygo2.top/articles/52265/)  
    
用 `su` 切换不同用户，`whoami` 显示切换后用户名，但 `who` 显示始终是当前登录系统的用户。  
    
```bash  
[root@lx-virtual-machine ~]$ id
uid=0(root) gid=0(root) groups=0(root)
[root@lx-virtual-machine ~]$ who
lx       tty2         2025-02-04 17:30 (tty2)
root     pts/2        2025-02-04 19:31 (10.0.0.1)
root     pts/3        2025-02-04 19:30 (10.0.0.1)
[root@lx-virtual-machine ~]$ logname
root
[root@lx-virtual-machine ~]$ su lx
[lx@Ubuntu2204 root]$ id
uid=1000(lx) gid=1000(lx) groups=1000(lx),4(adm),24(cdrom),27(sudo),30(dip),46(plugdev),122(lpadmin),134(lxd),135(sambashare)
[lx@Ubuntu2204 root]$ who
lx       tty2         2025-02-04 17:30 (tty2)
root     pts/2        2025-02-04 19:31 (10.0.0.1)
root     pts/3        2025-02-04 19:30 (10.0.0.1)
[lx@Ubuntu2204 root]$ logname
root
[lx@Ubuntu2204 root]$ whoami
lx
```

```bash
[lx@ubuntu22-c0 ~]$ whatis who  
who (1)              - show who is logged on  
```  
    
## w  
- `w` 显示当前全部登录用户以及做的操作  
    
```bash  
[root@ubuntu22-c0 ~]$ whatis w  
w (1)                - Show who is logged on and what they are doing.  
[root@ubuntu22-c0 ~]$ w  
 16:38:35 up  1:18,  2 users,  load average: 0.00, 0.01, 0.00  
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT  
root     pts/0    10.0.0.1         12:02    3:25m  0.24s  0.04s -bash  
root     pts/1    10.0.0.1         16:37    3.00s  0.03s  0.00s w  
```  
    
# 创建登录欢迎语  
[Linux中创建自己的MOTD](https://www.cnblogs.com/gageshen/p/11565980.html)  
[如何让你的终端欢迎语好看又有趣](https://zhuanlan.zhihu.com/p/115414827)  
[ASCII艺术字（图）集](https://www.bootschool.net/ascii-art)  
    
# ubuntu 登陆后为 root 账号设置密码  
- Ubuntu 安装时默认设置的账户为普通账户，没有为 root 账户设置密码  
- 默认账户在 sudo 组中，可以执行 `sudo` 命令  
- 执行 `sudo passwd root`  
- 按照提示输入当前登录用户的密码，即安装时设置的账户和密码  
- 按照提示输入 `root` 的密码，输入完回车还要再输入一次确认  
    
# 内部命令和外部命令  
> [Linux的内部命令和外部命令](https://blog.csdn.net/tqptr_opqww/article/details/123879877)  
> [Linux 中的内部命令和外部命令 ](https://www.cnblogs.com/greyzeng/p/16912218.html)  
> [Linux内部命令和外部命令](https://blog.51cto.com/u_15060546/2651988)  
> [hash](https://ipcmen.com/hash)  
> [关於运行档路径的变量： $PATH](http://cn.linux.vbird.org/linux_basic/0220filemanager_1.php#dir_path)  
    
![](img/2025-02-04-19-55-49.png)
![](img/2025-02-04-19-58-25.png)
    
- 内部命令集成在 shell 中，shell 被执行时这些内部命令被加载到内存中，访问速度快  

```bash
[root@ubuntu2204 ~]$ type cd
cd is a shell builtin
```
    
- 外部命令不在 shell 中，需要时才加载，一个外部命令对应一个二进制文件  

- 外部变量的路径要在 `PATH` 环境变量中，才能找到该命令执行  

- 外部命令由 shell 控制，shell 中第一次使用一个外部命令时，从 `PATH` 路径中查找，找到后放到 hash 表中缓存到，之后再次调用该命令时直接从 hash 缓存表中查找  
    
## type 查看命令是内部命令还是外部命令  
- `type` 查看是内部命令还是外部命令  
- 命令路径不在环境变量 $PATH 中后，`type` 找不到该命令  
- 外部命令执行后会在 hash 表中缓存下来，如果该命令路径改了，但也在环境变量 $PATH 中，也无法执行该命令，因为会从 hash 缓存中查找，用 `hash -d` 删除该命令的缓存后，可以使用  
- `type --help` 或 `help type` 查看帮助  
```bash  
[root@ubuntu22-c0 ~]$ type --help  
type: type [-afptP] name [name ...]  
    Display information about command type.  
    
    For each NAME, indicate how it would be interpreted if used as a  
    command name.  
    
    Options:  
      -a        display all locations containing an executable named NAME;  
                includes aliases, builtins, and functions, if and only if  
                the `-p' option is not also used  
      -f        suppress shell function lookup  
      -P        force a PATH search for each NAME, even if it is an alias,  
                builtin, or function, and returns the name of the disk file  
                that would be executed  
      -p        returns either the name of the disk file that would be executed,  
                or nothing if `type -t NAME' would not return `file'  
      -t        output a single word which is one of `alias', `keyword',  
                `function', `builtin', `file' or `', if NAME is an alias,  
                shell reserved word, shell function, shell builtin, disk file,  
                or not found, respectively  
    
    Arguments:  
      NAME      Command name to be interpreted.  
    
    Exit Status:  
    Returns success if all of the NAMEs are found; fails if any are not found.  
```  
```bash
[root@ubuntu2204 ~]$ type which
which is hashed (/usr/bin/which)
[root@ubuntu2204 ~]$ type cd
cd is a shell builtin
```
    
### type -a 列出命令的全部位置  
- 有些命令可能既是内部命令，又是外部命令，如 `echo` 这种常见命令，因为 shell 种类很多，防止内部命令不能用，则使用外部命令  
```bash
[root@ubuntu2204 ~]$ type -a echo
echo is a shell builtin
echo is /usr/bin/echo
echo is /bin/echo
```
    
## enable 管理内部命令  
```bash  
[root@ubuntu22-c0 ~]$ type enable  
enable is a shell builtin  
[root@ubuntu22-c0 ~]$ enable --help  
enable: enable [-a] [-dnps] [-f filename] [name ...]  
    Enable and disable shell builtins.  
    
    Enables and disables builtin shell commands.  Disabling allows you to  
    execute a disk command which has the same name as a shell builtin  
    without using a full pathname.  
    
    Options:  
      -a        print a list of builtins showing whether or not each is enabled  
      -n        disable each NAME or display a list of disabled builtins  
      -p        print the list of builtins in a reusable format  
      -s        print only the names of Posix `special' builtins  
    
    Options controlling dynamic loading:  
      -f        Load builtin NAME from shared object FILENAME  
      -d        Remove a builtin loaded with -f  
    
    Without options, each NAME is enabled.  
    
    To use the `test' found in $PATH instead of the shell builtin  
    version, type `enable -n test'.  
    
    Exit Status:  
    Returns success unless NAME is not a shell builtin or an error occurs.  
```  
    
### enable 查看能使用的内部命令  
![](img/2025-02-04-20-01-34.png)
    
### enable -a 查看全部内部命令以及状态  
    
### enable -n 禁用内部命令  
- 禁用后用 `enable` 查看不到  
- 禁用后仍可以用 `enable -a` 查看  
- 重新用 `enable` 加命令可以解除禁用  
    
## 外部命令  
    
# hash  
> [linux的hash命令](https://blog.csdn.net/wei2314857815/article/details/104077515)  
    
- 已使用过的外部命令的路径会保存在 `hash` 表中，可用 `hash` 命令查看，初始为空  
- hash 表的缓存只是临时存在，只对当前终端，当前用户有效  
- 将 hash 中已缓存的命令路径修改到环境变量 PATH 中的其他位置，无法执行该命令，因为会从 hash 中查找命令  
    
![0](img/2023-03-06-14-53-37.png)  
![](img/2025-02-04-20-04-56.png)
    
## hash -d 从 hash 表中删除缓存的命令  
![](img/2025-02-04-20-06-03.png)
    
## hash -r 清空 hash 表记录  
forget all remembered locations  
    
## hash -t 查看指定命令的路径  
    
# 别名 alias  
> [alias命令_Linux alias命令：给命令定义别名](http://c.biancheng.net/linux/alias.html)  
    
- 优先级：别名 > 内部命令 > 外部命令  
    
## 执行原始命令非别名  
别名和内部命令重名时，默认执行**别名**，如果想执行内部命令，可用如下方法：  
- 别名前加`\`  
- 用**单引号**包围命令  
- 用**双引号**包围命令  
- `command 命令`  
- 直接写命令的完整路径  

![](img/2025-02-04-20-10-42.png) 
![](img/2025-02-04-20-11-03.png)
    
## 自定义别名  
```bash
[root@ubuntu2204 ~]$ alias ls1='/bin/ls'
[root@ubuntu2204 ~]$ ls1
bash_custom.sh  nohup.out  shell_scripts  snap
```
    
## 删除别名 unalias  
```bash
[root@ubuntu2204 ~]$ unalias ls1
```
    
### unalias 删除一个或多个别名  
    
### unalias -a 删除全部别名  
    
## 设置别名永久生效  
- 将别名定义写道配置文件中，根据当前系统 shell 调用配置文件的顺序将别名写到合适的位置  
如仅需要别名对当前用户生效，则将别名写在 `.bashrc` 文件中  
配置文件中写入位置等见 shell 笔记中讲解  
    
- 修改文件后立即生效：`source` 命令。（[Linux下source命令详解 ](https://www.cnblogs.com/shuiche/p/9436126.html)）  
    
# 获取帮助  
## whatis 简要查看命令说明  
> [linux 命令：whatis详解](https://blog.csdn.net/yspg_217/article/details/122061132)  
    
- 列出命令的简单描述  
- 查询利用数据库，如果刚装的程序，可能查不到，需要 `mandb` 更新数据库  
- rocky 8.6 中装完系统后执行 `whatis hostname` 命令，显示 `hostname: nothing appopriate`，普通用户执行 `sudo mandb`后可以正常使用  
    
![0](img/2023-03-06-17-53-57.png)  
    
```bash  
[root@ubuntu22-c0 ~]$ whatis whatis  
whatis (1)           - display one-line manual page descriptions  
```  

## help 查看内部命令  
    
## COMMAND --help 或 COMMAND -h  
有些命令两种格式都支持，有些只支持一种  
    
## man  
- 一般查看外部命令，比 --help 和 -h 的帮助内容更详细。  
    
- man 手册进行分区段处理，分为 9 个区，可以用 `man man` 查看：  
![](img/2025-02-04-20-15-53.png)    

- 一般文件说明在第 5 区段，用 `man 5 COMMAND`  
    
- 有些命令可能在不同区段都有说明，可以用 `whatis` 来查看，然后用 `man section CMD` 查看对应区段说明。  
如 `passwd` 在第 1 区段为命令的解释，第 5 区段为 `passwd` 文件的说明。  
```bash
[root@ubuntu2204 ~]$ whatis passwd
passwd (5)           - the password file
passwd (1)           - change user password
passwd (1ssl)        - OpenSSL application commands
```
    
### man -f  
- 相当于 `whatis`  
![](img/2023-03-07-09-40-46.png)  
    
## manpath 查看帮助文档路径  
```bash  
[root@ubuntu22-c0 ~]$ whatis manpath  
manpath (1)          - determine search path for manual pages  
manpath (5)          - format of the /etc/manpath.config file  
[root@ubuntu22-c0 ~]$ manpath  
/usr/local/man:/usr/local/share/man:/usr/share/man  
```  
    
在配置文件 `/etc/manpath.config` 中定义了帮助文档的查询路径  
如果修改查询路径，需要用 mandb 更新  
    
## info  
帮助文档比 man 更详细。  
    
## /usr/shar/doc 查看一些程序的官方说明文档  
> [/usr/share/doc 的作用](https://blog.csdn.net/FlyClassFox/article/details/110731697)  
    
- 输入 `manpath` 可以查看 man 手册的路径  
- 可以用 vim 打开 `.gz` 的说明文档，如 `README.gz`  
    
![1](img/2023-03-05-20-30-20.png)  
    
## /usr/share/man 查看 `man` 命令看到的文档  
- `.gz` 文件可以直接用 `man` 命令打开  
    
## 官方在线文档  
> [ubuntu](https://ubuntu.com/tutorials?q=bash#community)  
> [GNU Manual Online](https://www.gnu.org/manual/manual.html)  
> [Linux man pages](https://linux.die.net/man/)  
> [Linux Documentation](https://linux.die.net/)  
    
# linux 和 windows 互传文件工具  
## xshell 中传文件  
    
### xftp  
打开窗口，直接拖动文件，可以操作大量文件  
    
### lrzsz 工具包  
- `sz` 命令发送本地文件到 windows 主机中，输入 sz filename 会弹出窗口选择 windows 中保存的路径  
- `rz` 命令发送 windows 中文件到当前目录，直接输入 `rz` 弹出窗口选择文件  
    
## WSL  
在 windows 中安装 linux 子系统，如 ubuntu 20.04，进入该子系统的 `/mnt` 目录即可以操作windows 中的文件，再用 scp 等命令可以在 linux 虚拟机和 windows 中传文件  
    
# 一行执行多个命令  
## 每个命令用分号（`;`）隔开  
```bash  
[root@ubuntu22-c0 ~]$ ls 1.txt; echo $?; ls snap/ -d; echo $?  
ls: cannot access '1.txt': No such file or directory  
2  
snap/  
0  
```  
    
# 一个命令分成多行  
反斜杠（\）+ `Enter` 按键，中间不能有空格  
    
```bash  
[root@ubuntu22-c0 ~]$ echo "hel\  
> lo"  
hello  
[root@ubuntu22-c0 ~]$ host\  
> name  
ubuntu22-c0  
```  
    
# 计算器 bc  
> [Linux bc 命令](https://www.runoob.com/linux/linux-comm-bc.html)  
> [bc command in Linux with examples](https://www.geeksforgeeks.org/bc-command-linux-examples/)  
    
## scale  
- 设置小数点后位数  
- 默认值为 0，即无小数  
    
```bash  
[root@ubuntu22-c0 ~]$ bc  
bc 1.07.1  
Copyright 1991-1994, 1997, 1998, 2000, 2004, 2006, 2008, 2012-2017 Free Software Foundation, Inc.  
This is free software with ABSOLUTELY NO WARRANTY.  
For details type `warranty'.  
3/2  
1  
scale  
0  
scale=1  
3/2  
1.5  
scale  
1  
scale=2  
3/2  
1.50  
```  
    
## ibase  
输入数字的进制（2~36），如果输入包含字母，必须大写。  
```bash  
ibase=10  
obase=2  
16  
10000  
255  
11111111  
```  
    
## obase  
输出数字的进制（2~36）  
    
## last  
上次打印的结果。  
    
## quit 结束  
输入 quit 会终止执行 `bc` 命令  
    
# 查看系统信息  
> [Linux 常用命令集合](https://www.runoob.com/w3cnote/linux-common-command.html)  

## 查看系统是 32 位还是 64 位  
    
### getconf  
> [灵活使用getconf命令来获取系统信息](https://www.cnblogs.com/wjoyxt/p/4815782.html)  
    
`getconf LONG_BIT` 获取系统是 32 位还是 64 位。  
```bash  
[root@ubuntu22-c0 ~]$ whatis getconf  
getconf (1)          - Query system configuration variables  
[root@ubuntu22-c0 ~]$ getconf LONG_BIT  
64  
```  
    
### lscpu  
`lscpu` 也会显示该信息。  
    
## 查看系统架构  
- `arch` 或 `uname -m`。  
- `lscpu` 也会显示该信息  
    
```bash  
[root@ubuntu22-c0 ~]$ whatis arch  
arch (1)             - print machine hardware name (same as uname -m)  
[root@ubuntu22-c0 ~]$ arch  
x86_64  
[root@ubuntu22-c0 ~]$ uname -m  
x86_64  
```  
    
## 查看 CPU  
1. `lscpu`  
2. `/proc/cpuinfo` 文件中，可用 `cat` 命令查看。  
    
## 查看内存  
> [Linux free命令](https://www.runoob.com/linux/linux-comm-free.html)  
    
```bash  
[root@ubuntu22-c0 ~]$ free -h  
               total        used        free      shared  buff/cache   available  
Mem:           1.9Gi       272Mi       1.4Gi       1.0Mi       265Mi       1.5Gi  
Swap:          2.0Gi          0B       2.0Gi  
```  
    
- `total`: This column shows the total amount of physical memory (RAM) and swap space available on the system.  
    
- `used`: It displays the amount of memory that is currently being used by the system.  
    
- `free`: Indicates the amount of memory that is not being used and is available for processes to utilize.  
    
- `shared`: This column represents the amount of memory used by shared memory segments, which are areas of memory that can be accessed by multiple processes.  
    
- `buff/cache`: It shows the amount of memory used by buffers and cache. Buffers are used for temporarily storing data from disk, while cache is used for holding frequently accessed data for faster retrieval.  
    
- `available`: This column represents the estimated amount of memory that is available for starting new processes or expanding existing ones. It takes into account the memory used by the operating system itself and is calculated as the sum of free memory, buffers/caches, and swap space.  
    
The difference between "free" and "available" is that "free" refers specifically to the amount of memory that is not currently in use by any process. On the other hand, "available" takes into consideration both free memory and memory that can be made available by reclaiming space from buffers/caches and swap space if necessary. In other words, "available" reflects the actual amount of memory that can be allocated for new processes or expansions, considering various factors like caching and swapping.  
    
## 查看磁盘空间  
> [Linux 查看磁盘空间](https://www.runoob.com/w3cnote/linux-view-disk-space.html)  
> [Linux命令 lsblk - 列出块设备信息](https://ipcmen.com/lsblk)  
    
### df  
> [Linux df 命令](https://www.runoob.com/linux/linux-comm-df.html)  
    
```bash  
[root@ubuntu22-c0 ~]$ df -h  
Filesystem                         Size  Used Avail Use% Mounted on  
tmpfs                              193M  1.3M  192M   1% /run  
/dev/mapper/ubuntu--vg-ubuntu--lv   97G  5.8G   87G   7% /  
tmpfs                              965M     0  965M   0% /dev/shm  
tmpfs                              5.0M     0  5.0M   0% /run/lock  
/dev/sda2                          2.0G  253M  1.6G  14% /boot  
tmpfs                              193M     0  193M   0% /run/user/0  
```  
    
## 查看发行版本  
> [查看 Linux 发行版名称和版本号的 8 种方法](https://zhuanlan.zhihu.com/p/36253769)  
    
```bash  
[root@ubuntu22-c0 ~]$ cat /etc/os-release  
PRETTY_NAME="Ubuntu 22.04.1 LTS"  
NAME="Ubuntu"  
VERSION_ID="22.04"  
VERSION="22.04.1 LTS (Jammy Jellyfish)"  
VERSION_CODENAME=jammy  
ID=ubuntu  
ID_LIKE=debian  
HOME_URL="https://www.ubuntu.com/"  
SUPPORT_URL="https://help.ubuntu.com/"  
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"  
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"  
UBUNTU_CODENAME=jammy  
```  
```bash  
[root@ubuntu22-c0 ~]$ cat /proc/version  
Linux version 5.15.0-78-generic (buildd@lcy02-amd64-008) (gcc (Ubuntu 11.3.0-1ubuntu1~22.04.1) 11.3.0, GNU ld (GNU Binutils for Ubuntu) 2.38) #85-Ubuntu SMP Fri Jul 7 15:25:09 UTC 2023  
[root@ubuntu22-c0 ~]$  
```  
    
# 关机、重启和注销  
    
## 数据同步写入磁盘 sync  
> [Linux sync命令](https://www.runoob.com/linux/linux-comm-sync.html)  
    
```bash  
[root@ubuntu22-c0 ~]$ whatis sync  
sync (1)             - Synchronize cached writes to persistent storage  
```  
    
## 关机指令 shutdown  
> [Linux shutdown 命令](https://www.runoob.com/linux/linux-comm-shutdown.html)  
> [Linux系统Shutdown命令定时关机详解](https://blog.csdn.net/q_l_s/article/details/44855817)  
    
### shutdown -h now 立即关机  
    
### shutdown -h 时间 设定时间关机  
- shutdown -h 设置时间有一定格式，不指定时间，默认在 1 分钟后关机，会有提示说明，如果要取消，用 `shutdown -c`  
- 本地执行 `shutdown` 不需要 `sudo`，远程需要，否则失败  
- `shutdown -h +3` 表示 3 分钟后关机，该消息会发送给远程登录的全部终端  
- 指定时间是 `hh:mm` 的形式，但可以用 `+m` 指定到超过一天的时间，单位为分钟  
- `+m` 形式指定分钟不能为负数，否则报错  
- `hh:mm` 形式指定的小时和分钟如果比现在早，则被认为是第二天的时间  
    
```bash  
[root@ubuntu22-c0 ~]$ date; shutdown +3; shutdown -c  
Fri Aug 18 01:36:39 PM CST 2023  
Shutdown scheduled for Fri 2023-08-18 13:39:39 CST, use 'shutdown -c' to cancel.  
```  
    
![](img/2023-03-06-17-19-02.png)  
    
![](img/2023-03-06-19-09-45.png)  
    
![](img/2023-03-06-19-19-43.png)  
    
![](img/2023-03-06-19-21-16.png)  
    
![](img/2023-03-06-19-28-41.png)  
    
![](img/2023-03-06-19-31-22.png)  
    
### shutdown -k 广播关机消息，不真的关机  
![](img/2023-03-06-19-44-09.png)  
    
### shutdown --no-wall 不发送 wall message  
- `man wall` 查看 `wall` 介绍  
![](img/2023-03-06-19-51-47.png)  
    
### shutdown -r 重启 reboot  
- 和 `shutdown -h` 语法相同，可以设置时间，只是这个是重启  
    
## 关机指令 halt  
> [Linux halt命令](https://www.runoob.com/linux/linux-comm-halt.html)  
> [Understanding Shutdown, Poweroff, Halt and Reboot Commands in Linux](https://www.tecmint.com/shutdown-poweroff-halt-and-reboot-commands-in-linux/)  
    
## 关机指令 poweroff  
> [Linux poweroff 命令](https://www.runoob.com/linux/linux-comm-poweroff.html)  
    
## 重启指令 reboot  
> [Linux reboot命令](https://www.runoob.com/linux/linux-comm-reboot.html)  
    
## 休眠指令suspend  
> [Linux suspend命令](https://www.runoob.com/linux/linux-comm-suspend.html)  
> [Linux下怎么让挂起的(suspend or stopped)进程恢复执行(resume)](https://blog.csdn.net/baiyan83/article/details/109759386)  
    
# init  
> [init command in linux with examples](https://www.geeksforgeeks.org/init-command-in-linux-with-examples/)  
    
## init 0 关机  
- 如果当前有多个用户正在登录，可能无法关机  
    
![init 0](img/2023-03-06-09-39-49.png)  
    
## init 1  
- single-user mode  
    
## init 2  
- multi-user mode  
    
## init 3 关闭图形界面  
- 从带图形界面的终端用 `sudo init 3` 可以切换到不带图形界面的终端  
    
![init 3](img/2023-03-06-09-56-13.png)  
    
## init 6 reboot  
- 重启  
    
# history 历史命令  
> [原来 history 可以这么强大](https://zhuanlan.zhihu.com/p/371739269)  
    
- 命令行中输入的命令存在缓冲区中，正常退出 shell 后会将缓冲区中的历史记录写入到 `~/.bash_history` 中  
    
## history num 显示最后 num 条历史记录  
- `num` 必须大于零  
    
```bash  
[lx@ubuntu22-c0 ~]$ history 3  
    3  [2023-08-18 16:45:55 lx] sudo cat /etc/passwd | head -n2  
    4  [2023-08-18 16:46:00 lx] history  
    5  [2023-08-18 16:51:57 lx] history 3  
```  

## history -w 将当前缓冲区的历史记录写入到历史记录文件中  
- `history --help | less` 查看说明  
      
```bash  
-w        write the current history to the history file  
```  
    
## history -d num 删除缓冲区指定历史记录  
- 删除的是历史缓冲区的记录，不删除历史文件中的记录  
- `num` 为历史记录的编号，第一条删除后，原来的第二条变为第一条  
```bash  
[root@rocky8-2 ~]$ history | head -n5  
    1  tail -n3 ~lx/.bashrc >> ~/.bashrc  
    2  . ~/.bashrc  
    3  tail -n3 ~lx/.bashrc >> /etc/skel/.bashrc  
    4  passwd -d root  
    5  passwd -d lx  
[root@rocky8-2 ~]$ history -d 1  
[root@rocky8-2 ~]$ history | head -n5  
    1  . ~/.bashrc  
    2  tail -n3 ~lx/.bashrc >> /etc/skel/.bashrc  
    3  passwd -d root  
    4  passwd -d lx  
    5  clear  
```  
- 查看 `~/.bash_history` 文件，仍可看到第一条记录  
```bash  
tail -n3 ~lx/.bashrc >> ~/.bashrc  
. ~/.bashrc  
tail -n3 ~lx/.bashrc >> /etc/skel/.bashrc  
passwd -d root  
passwd -d lx  
clear  
```  
    
## history -c 清除历史缓冲区全部内容  
```bash  
-c        clear the history list by deleting all of the entries  
```  
    
## CTRL-r 搜索历史命令  
- CTRL-g 取消搜索  
    
## 执行最后一次的历史命令  
- 按 `Esc` 后再按 `.`，会显示出最后一次的历史命令  
- 按 `Alt` 同时按 `.`，会显示出最后一次的历史命令  
- 按 `Ctrl` 同时按 `P` 会显示出最后一次的历史命令  
- `!!` 执行最后一次历史命令  
- `!:0` 执行最后一次历史命令，但去除参数  
    
![1](img/2023-03-06-11-03-49.png)  
    
- 按向上的方向键可以从后往前查看历史命令，按一次默认最后一次执行的历史命令  
- `!-1` 执行最后一次历史命令  
    
## 执行过去的某个历史命令  
- 输入 `history` 显示过去的历史命令，前面有个序号，输入 `!`再输入序号，即可执行该条历史记录  
- `!-n` 执行倒数第 n 个历史命令  
- `!!` 重复执行上条命令  
    
```bash  
[root@rocky8-2 ~]$ history 5  
  373  history -w  
  374  history | head -n5  
  375  history  
  376  clear  
  377  history 5  
[root@rocky8-2 ~]$ !374  
history | head -n5  
    1  tail -n3 ~lx/.bashrc >> ~/.bashrc  
    2  . ~/.bashrc  
    3  tail -n3 ~lx/.bashrc >> /etc/skel/.bashrc  
    4  passwd -d root  
    5  passwd -d lx  
```  
    
## 查找最近历史记录  
- `!string` 后面输入命令的开头几个字符，可以执行满足条件的命令  
- `!string:p` 可显示以输入字符开头的最近一次命令，但不执行，执行后，按向上方向键则可显示打印的历史记录  
    
![](img/2023-03-06-11-20-46.png)  
    
- `!?string[?]`执行最近一次包含字符 `string` 的历史记录  
- `Ctrl`+`R` 可以输入关键字查找历史记录，找到后按 `Enter` 键执行该命令，如果未找到，可按 `Ctrl` + `C` 结束输入，或者按 `Ctrl` + `G` 结束查找  
- 当前用户的历史记录默认保存在 `~/.bash_history` 文件中，可在该文件中搜索  
    
当想根据关键字搜索历史记录，只显示不执行时，用 `!string:p` 很有用，  
如果搜索的词不在开头，需要加上通配符，否则搜索不到  
```bash  
[root@ubuntu22-c0 ~]$ !proc:p  
-bash: !proc: event not found  
[root@ubuntu22-c0 ~]$ !?proc?:p  
cat /proc/version  
[root@ubuntu22-c0 ~]$ !whatis:p  
whatis strftime  
```  
    
## 指定历史记录的格式和保存数目  
### HISTTIMEFORMAT 指定历史记录的格式  
> [HISTTIMEFORMAT](https://www.gnu.org/software/bash/manual/html_node/Bash-Variables.html#index-HISTTIMEFORMAT)  
    
- `man bash` 后搜索 `HISTTIMEFORMAT` 可查看该变量的说明  
- `man 3 strftime` 可查看日期和时间的格式 (rocky8 有该命令，Ubuntu22.04 没有)  
> [strftime](https://man7.org/linux/man-pages/man3/strftime.3.html)  
- 初始该变量没有值，用 `set` 查看也没该变量，缓冲区中历史记录格式用默认格式  
```bash  
[root@rocky8-3 ~]# echo $HISTTIMEFORMAT  
    
[root@rocky8-3 ~]# set | grep -i HISTTIMEFORMAT  
[root@rocky8-3 ~]#  
```  
- 可指定该变量的格式写入到 `/etc/profile.d/custom.sh` 中，或者只设置当前用户的历史记录格式写到 `~/.bashrc` 文件中，如 `export HISTTIMEFORMAT="%F %T `whoami` "`  
```bash  
export HISTTIMEFORMAT="[%F %T $(whoami)] "  
```  
    
### HISTSIZE 命令行中显示的历史记录的最大数目  
- `man bash` 搜索 `HISTSIZE` 查看说明  
- 终端输入 `history` 显示的历史记录的最大数目  
- 如果 `HISTFILESIZE` 比这个值小，则不能超过 `HISTFILESIZE` 的值  
- 修改当前用户可在 `~/.bashrc` 中修改参数  
    
![](img/2023-03-06-12-29-25.png)  
    
### HISTFILESIZE 历史文件中记录的历史命令的最大值  
- `man bash` 搜索 `HISTFILESIZE` 查看说明  
- 修改当前用户可在 `~/.bashrc` 中修改参数  
    
### HISTCONTROL 历史记录在保存的方式  
> [HISTCONTROL Command in Linux with Examples](https://www.geeksforgeeks.org/histcontrol-command-in-linux-with-examples/)  
    
- `man bash` 搜索 `HISTCONTROL` 查看说明  
![](img/2023-04-08-17-46-10.png)  
    
- ignorespace  
	- 该选项会导致命令前加空格时不保存到历史记录中  
	- ubuntu 22.04 和 ubuntu 20.04 中设置了该选项  
	![](img/2023-04-08-17-34-00.png)  
	- rocky8.6 没有设置该选项，因此开头带空格的命令也会记录  
	![](img/2023-04-08-17-36-58.png)  
    
- ignoredups  
	- 和上一条历史记录相同的命令不会重复记录到历史记录中  
	- 只针对上一条相同，如果中间间隔其他命令，则仍会保存  
	- rocky8.6 默认的设置  
	- ubuntu 22.04 和 ubuntu 20.04 也设置了该选项  
    
- ignoreboth  
	- 同时设置 ignorespace 和 ignoredups  
	- ubuntu 22.04 为该选项  
	- ubuntu 20.04 为 ignoredups:ignorespace  
    
# hwclock 硬件时间  
> [hwclock](https://linux.die.net/man/8/hwclock)  
    
```bash  
[root@ubuntu22-c0 ~]$ whatis hwclock  
hwclock (5)          - settings that affect the behaviour of the hwclock init script  
hwclock (8)          - time clocks utility  
[root@ubuntu22-c0 ~]$ date; hwclock -r  
Sat Aug 19 03:22:45 PM CST 2023  
2023-08-19 15:22:43.989096+08:00  
```  
    
# date 系统时间  
> [Date Command in Linux: How to Set, Change, Format and Display Date](https://phoenixnap.com/kb/linux-date-command#ftoc-heading-10)  
> [How To Format Date And Time In Linux, MacOS, And Bash?](https://www.shell-tips.com/linux/how-to-format-date-and-time-in-linux-macos-and-bash/)  
> [How to Display the Date and Time in the Linux Terminal](https://www.howtogeek.com/410442/how-to-display-the-date-and-time-in-the-linux-terminal-and-use-it-in-bash-scripts/)  
    
- `date` 显示系统时间  
    
## 日期的格式  
    
- `man date` 查看帮助文档，可看到 FORMAT 介绍  
![](img/2025-02-04-20-26-28.png)
    
## -d 指定具体日期  
![](img/2025-02-04-20-27-09.png)
![](img/2025-02-04-20-27-36.png)
![](img/2025-02-04-20-27-51.png)
![](img/2025-02-04-20-28-19.png)
![](img/2025-02-04-20-28-32.png)
    
## + 指定具体格式  
```bash
[root@ubuntu2204 ~]$ date +"%F-%H:%M:%M"
2025-02-04-20:30:30
[root@ubuntu2204 ~]$ date "+%F-%H:%M:%S"
2025-02-04-20:31:16
[root@ubuntu2204 ~]$
[root@ubuntu2204 ~]$ date; date +"%F"
2025年 02月 04日 星期二 20:31:29 CST
2025-02-04
[root@ubuntu2204 ~]$
[root@ubuntu2204 ~]$ date +"year: %Y, month: %m, day: %d"
year: 2025, month: 02, day: 04
[root@ubuntu2204 ~]$
[root@ubuntu2204 ~]$ date +"%H"
20
[root@ubuntu2204 ~]$
[root@ubuntu2204 ~]$ date +"%I"
08
```
    
## --set 设置时间 系统时间和硬件时间  
![](img/2025-02-04-20-33-59.png)
    
## -u 显示 UTC 时间  
```bash  
[root@ubuntu22-c0 ~]$ date; date -u  
Sat Aug 19 03:31:58 PM CST 2023  
Sat Aug 19 07:31:58 AM UTC 2023  
[root@ubuntu22-c0 ~]$  
[root@ubuntu22-c0 ~]$ date -d '-1 day CST'; date -d '-1 day'-u  
Fri Aug 18 03:34:25 PM CST 2023  
Sat Aug 19 07:34:25 AM CST 2023  
```  
    
## 应用  
    
### Use date with Other Commands  
![](img/2025-02-04-20-34-37.png)

### 显示过去某天的星期  
![](img/2023-03-15-14-12-20.png)  
    
### date 命令显示 24 小时制  
```bash  
[root@ubuntu22-c0 ~]$ date +"%Y-%m-%d %H:%M:%S"  
2023-08-19 16:01:21  
```  
    
### 查看距离当前一定时间的具体日期  
- `date -d` 或 `date --date`  
    
```bash  
[root@ubuntu22-c0 ~]$ date -d "+2 hour"  
Sat Aug 19 05:56:25 PM CST 2023  
```  
    
### 查看距离某个日期一定时间的具体日期  
```bash  
[root@ubuntu22-c0 ~]$ date -d "2023-09-01 +2 days"  
Sun Sep  3 12:00:00 AM CST 2023  
[root@ubuntu22-c0 ~]$ date -d "2023-09-01 "  
Fri Sep  1 12:00:00 AM CST 2023  
```  
```bash  
[root@ubuntu22-c0 ~]$ date -d "2023-09-01 15:57:20  +2 days"  
Sat Sep  2 09:57:20 PM CST 2023  
```  
    
### 计算两日期之间相差的天数  
例如计算从 2023-01-01 到今天相差的天、时、分和秒  
    
```bash  
current_date=$(date +%s)  
target_date=$(date -d "2023-01-01" +%s)  
    
time_difference=$((target_date - current_date))  
days=$((time_difference / 86400))  
hours=$(( (time_difference % 86400) / 3600 ))  
minutes=$(( (time_difference % 3600) / 60 ))  
seconds=$((time_difference % 60))  
    
echo "Time difference: $days days, $hours hours, $minutes minutes, $seconds seconds."  
```  
    
# 修改 bash 快捷键为 Vi 快捷键  
> [Bash 行操作](https://wangdoc.com/bash/readline)  
    
- 在 `~/.bashrc` 中加上 `set -o vi` 后，用 `source ~/.bashrc` 使配置生效  
    
# dos2unix windows格式文件转换为Linux 格式文件  
> [Linux命令 dos2unix - 将DOS格式文本文件转换成Unix格式](https://www.w3cschool.cn/linuxc/linuxc-gvjq3lbf.html)  
    
# echo  
> [echo command in Linux with Examples](https://www.geeksforgeeks.org/echo-command-in-linux-with-examples/)  
> [How to use Linux echo command](https://www.ionos.com/digitalguide/server/configuration/linux-echo-command/)  
    
## echo -n 不输出结尾的换行符  
![](img/2023-03-14-19-43-47.png)  
    
    
## echo -e 允许转义  
![](img/2023-03-14-19-46-03.png)  
![](img/2023-03-14-19-46-54.png)  
    
## `\b` 退格符，删掉前面一个字符  
```bash  
[root@ubuntu22-c0 ~]$ echo  "a\bbc"  
a\bbc  
[root@ubuntu22-c0 ~]$ echo -e "a\bbc"  
bc  
```  
    
## `\n` 换行符  
```bash  
[root@ubuntu22-c0 ~]$ echo -e "a\nb\nc"  
a  
b  
c  
```  
    
## `\t` 水平制表符  
```bash  
[root@ubuntu22-c0 ~]$ echo -e "a\tb\tc"  
a       b       c  
```  
    
## `\v` 垂直制表符  
```bash  
[root@ubuntu22-c0 ~]$ echo -e "a\vb\vc"  
a  
 b  
  c  
```  
    
## `\r` carriage return  
```bash  
[root@ubuntu22-c0 ~]$ echo -e "a\rbc"  
bc  
```  
    
## `\c` 去掉换行符  
```bash  
[root@ubuntu22-c0 ~]$ echo -e "abc\c"  
abc[root@ubuntu22-c0 ~]$  
```  
    
## echo $(ls) 和 ls  
> [Difference between 'ls' and 'echo $(ls)'](https://unix.stackexchange.com/questions/283586/difference-between-ls-and-echo-ls)  
> [Command Substitution](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Command-Substitution)  
    
![](img/2023-03-16-19-32-57.png)  
    
- 直接 `ls` 执行的是别名，输出的内容带颜色（ubuntu22.04）  
```bash  
[root@ubuntu22-c0 ~]$ alias ls  
alias ls='ls --color=auto'  
```  
- `echo $(ls)` 是将 `ls` 输出的内容作为字符串传递给 `echo` 当参数，没有颜色  
    
- 直接 `ls` 后将输出的内容保存到文件中，会将每项加一个换行符单独显示为一行；而 `echo $(ls)` 不会  
    
# 环境变量  
> [Environment variable](https://en.wikipedia.org/wiki/Environment_variable)  
    
- 不区分大小写  
- `env` 查看  
    
# PATH 环境变量  
> [Linux path environment variable](https://linuxconfig.org/linux-path-environment-variable)  
> [环境变量](https://www.lanqiao.cn/courses/1/learning/?id=60)  
> [How to Set Environment Variables in Linux](https://phoenixnap.com/kb/linux-set-environment-variable#ftoc-heading-1)  
    
## 设置临时环境变量  
```bash
[root@ubuntu2204 ~]$ var=a
[root@ubuntu2204 ~]$ echo $var
a
[root@ubuntu2204 ~]$ bash
[root@Ubuntu2204 ~]$ echo $var

[root@Ubuntu2204 ~]$ exit
exit
[root@ubuntu2204 ~]$ echo $var
a
[root@ubuntu2204 ~]$ unset var
[root@ubuntu2204 ~]$ echo $var
```
    
## 设置永久环境变量  
    
在 /etc/profile 文件中添加，对所有用户生效。  
    
## 在 PATH 中添加路径  
> [Linux中如何添加自己的路径到PATH](https://blog.csdn.net/qq_16209077/article/details/50711397)  
> [关於运行档路径的变量： $PATH](http://cn.linux.vbird.org/linux_basic/0220filemanager_1.php#dir_path)  
    
# /dev/null  
> [What is /Dev/Null in Linux?](https://www.geeksforgeeks.org/what-is-dev-null-in-linux/)  
> [shell 脚本中 /dev/null 的用途](https://www.cnblogs.com/wanng/p/shell-dev-null.html)  
    
- 清空文件内容  
```bash  
[root@ubuntu22-c0 ~]$ cat /dev/null > 1.txt  
```  
- 将不需要的信息放到 /dev/null 中  
```bash  
[root@ubuntu22-c0 ~]$ ls a  
ls: cannot access 'a': No such file or directory  
[root@ubuntu22-c0 ~]$ ls a 2> /dev/null  
```  
    
# 用户  
> [Linux User Administration: A Complete Guide to Managing Multi-User Systems](https://www.linuxfordevices.com/tutorials/linux-user-administration)  
    
## 用户类型  
![](img/2025-02-04-20-41-32.png)    
    
- **根据 UID 区分不同的用户类型**  
在 `/etc/login.defs` 文件中查看 UID 的范围，不同的系统可能不一样，下面是 Ubuntu 22.04.1 查看的范围：  
![](img/2025-02-04-20-42-09.png)
    
**超级用户**：  
root，UID 为 0  

**系统用户**： 
100 ~ 999  
100 是保留给用户设置使用的最小值  
![](img/2025-02-04-20-43-06.png)

- 普通用户  
1000 ~ 60000  
    
### 新建普通用户 UID 超过 60000 影响  
- 根据配置文件 `/etc/login.defs`，普通用户的最大 UID 为 60000，但新建 UID 超过 60000 也能新建成功，但有一些影响，见 [Using Large User IDs and Group IDs](https://docs.oracle.com/cd/E19120-01/open.solaris/819-2379/userconcept-35/index.html)  
    
![](img/2025-02-04-20-43-32.png)
    
## 查看当前全部用户  
### 在 `/etc/passwd` 中查看全部账户信息  
- 查看全部  
```bash
cat /etc/passwd
```

- 查看最后部分  
```bash
tail -n5 /etc/passwd
```

- 查看前面部分  
```bash
head -n5 /etc/passwd
```
    
### 通过 `getent passwd` 查看  
- 查看全部用户  
```bash
getnet passwd
```
    
- 查看某个特殊用户信息  
根据用户名或者 UID 查询  
```bash
[root@ubuntu2204 ~]$ getent passwd lx
lx:x:1000:1000:lx,,,:/home/lx:/bin/bash
```
    
## 用户组分类  
- 管理员组  
- 系统组  
- 普通组  
    
### GID 范围  
通过 `/etc/login.def` 文件查看，Ubuntu 22.04.1 查看范围如下：  
![](img/2025-02-04-20-46-32.png)

## 私有组、主要组和附加组  
> [Linux私有组，主要组和附加组 ](https://blog.51cto.com/xinsz08/5022617)  
    
- 创建新用户时默认会创建一个和该用户同名的组，组ID 为 GID  
- `id username` 可以查看其全部组  
    
## 用户和组相关配置文件  
### /etc/passwd  
1. 查看该配置文件的说明：  
```bash
[root@ubuntu2204 ~]$ whatis passwd
passwd (5)           - the password file
passwd (1)           - change user password
passwd (1ssl)        - OpenSSL application commands
```

该配置文件包含用户账号的信息，每一行一个用户，由 7 部分组成，每个部分由冒号分隔，内容如下：  
![](img/2025-02-04-20-48-03.png)
    
2. 配置文件的内容  
```bash
[root@ubuntu2204 ~]$ head -n1 /etc/passwd
root:x:0:0:root:/root:/bin/bash
```
  
- 第二字段为密码  
- 如果用户密码为**小写的 `x`**，表示密码实际在 `shadow` 文件中，可以在 `etc/shadow` 文件中查看，如果**该文件中没有则密码无效**  
- 如果**用户密码为空**，则不需要密码。但有些应用可能在密码为空时不允许访问。  
- 如果密码以感叹号 `!` 开头，表示**密码被锁定**  
新创建的用户，还没设置密码时，查看密码为一个 `!`，除了 `root` 可以直接切换到该用户外，其他用户不能切换，需要先设置密码  
用 `passwd -l` 锁住密码后 `/etc/shadow` 中加密的密码前也有一个 `!`  
![](img/2025-02-04-20-49-46.png)
![](img/2025-02-04-20-50-06.png)
![](img/2025-02-04-20-50-21.png)
    
- 第七字段显示 shell 的类型  
    
### /etc/shadow 用户密码相关配置  
> [详细解析/etc/shadow文件尤其是加密密码字段](https://www.cnblogs.com/jason-huawen/p/16300671.html)  
    
- 查看配置文件的帮助文档  
```bash
[root@ubuntu2204 ~]$ whatis shadow
shadow (5)           - shadowed password file
```
    
- 查看该配置文件的内容  
```bash
[root@ubuntu2204 ~]$ head -n1 /etc/shadow
root:$y$j9T$YrJnvq6yIZEJHcY.C8ET11$anGsi4VIWdBoaFDY/VJ0A373IPSHRLrukXq61uKbKT5:19755:0:99999:7:::
```
    
- **第 1 字段 登录用户名 login name**  
如 root  
    
- **第 2 字段 用户密码**  
密码以加密的形式显示，没有则为空。  
    
- **第 3 字段 最近一次修改密码的日期**  
显示的数字为从 1970 年 1 月 1 号到最近一次修改密码的天数。  
数值 0 表示用户应在下次登录时修改密码。  
数值为空表示禁用密码老化功能。  

- **第 4 字段 最短密码使用时间**  
用户在上次修改密码后，想再次修改密码必须等待的天数。  
数值 0 和空表示没有等待时间，即随时可以修改密码。  
    
- **第 5 字段 最长密码使用时间**  
距离上次修改密码后，经过该天数用户必须修改密码。  
如果用户超过该时间仍不修改密码，密码仍然有效，在下次登录时用户会被要求修改密码。  
数值为空表示没有最长密码使用期限。  
如果数值比最短密码使用时间小，表示用户不能修改密码。  

- **第 6 字段 密码警告期**  
在密码将要过期（即第 5 字段定义的最长密码使用时间）的前几天提示用户修改密码。  
数值为 0 和空表示没有警告期。  
    
- **第 7 字段  密码不活动期**  
在密码已经过期（即第 5 字段定义的最长密码使用时间）之后的一段时间，密码仍能使用，但超过该有效期后用户将不能登录。  
字段为空表示无不活动期。  

- **第 8 字段 账户到期日**  
从 1970 年 1 月 1 号算起，用户账号到期的时间。  
账号到期后将不能登录该账号，密码到期后不能使用该密码登录。  
字段为空表示账号永远不会过期。  
数值 0 不建议使用，可能解释为账户不会到期或者到期时间为 1970年1月1号。  

- **第 9 字段 保留字段**  
	    
### /etc/group 用户组相关信息  
- 配置文件帮助文档  
该配置文件存放用户组相关信息。  
```bash
[root@ubuntu2204 ~]$ whatis group
group (5)            - user group file
```
    
- 配置文件内容  
```bash
[root@ubuntu2204 ~]$ head -n5 /etc/group
root:x:0:
daemon:x:1:
bin:x:2:
sys:x:3:
adm:x:4:syslog,lx
```
- 第 1 字段 组名  
- 第 2 字段 组密码  
字段为空表示不需要密码。  
- 第 3 字段 GID  
- 第 4 字段 组中的全部用户  
逗号分隔用户，用户为以该组为**附加组**的用户，**不包含主要组**的用户  
    
### /etc/gshadow 组密码相关配置  
- 查看帮助文档  
```bash
[root@ubuntu2204 ~]$ whatis gshadow
gshadow (5)          - shadowed group file
```
    
- 查看配置文件内容  
```bash
[root@ubuntu2204 ~]$ head -n5 /etc/gshadow
root:*::
daemon:*::
bin:*::
sys:*::
adm:*::syslog,lx
```
- 第 1 字段 组名  
- 第 2 字段 加密的组密码  
- 第 3 字段 组管理者  
组管理者以逗号分隔。  
管理者（administrators）能修改组密码和组成员。  
管理者同时有组成员的权限。  
- 第 4 字段 组成员  
组成员以逗号分隔  
组成员访问组不需要密码  
组成员为**以该组为附加组**的用户列表  
    
### /etc/skel/ 用户家目录中配置文件  
> [/etc/skel/目录](https://blog.csdn.net/codetz/article/details/52541780)  
    
- 用户如果实际创建家目录，会将该目录中的文件复制到**家目录**中  
```bash
[root@ubuntu2204 ~]$ ll /etc/skel/
total 32
drwxr-xr-x   2 root root  4096  3月 19  2024 ./
drwxr-xr-x 133 root root 12288  2月  4 19:45 ../
-rw-r--r--   1 root root   763  2月  2  2024 bash_custom.sh
-rw-r--r--   1 root root   220  1月  7  2022 .bash_logout
-rw-r--r--   1 root root  3830  2月  2  2024 .bashrc
-rw-r--r--   1 root root   807  1月  7  2022 .profile
[root@ubuntu2204 ~]$
```

- 该目录在 `/etc/default/useradd` 文件中指定  
    
### /etc/login.defs 用户默认设置文件  
> [Linux /etc/login.defs：创建用户的默认设置文件](http://c.biancheng.net/view/3059.html)  
    
#### 查看 UID 和 GID 范围  
![](img/2025-02-04-20-58-57.png)

#### 默认加密方法  
- `/etc/shadow` 中第二个字段加密密码的方法  
![](img/2025-02-04-20-59-23.png)    
![](img/2025-02-04-20-59-40.png)
    
### /etc/default/useradd 指定创建新用户时的默认设置  
> [/etc/default/useradd文件详解](https://blog.csdn.net/qq_41982304/article/details/104953572)  
    
利用 `useradd` 命令添加新用户时默认的设置，如默认 shell 类型等  
    
#### 指定创建用户时的默认 shell 类型  
- ubuntu 20.04 默认 `/bin/sh`，rocky 8.6 中默认 `/bin/bash`  
![](img/2025-02-04-21-00-18.png)
![](img/2025-02-04-21-00-42.png)

#### 指定创建家目录时复制配置文件的路径 SEKL  
![](img/2025-02-04-21-01-10.png)
    
#### 指定创建用户时是否创建 mail spool  
- ubuntu 22.04 默认不创建 mail spool，rocky 8.6 默认创建  
- 将 ubuntu 22.04 `/etc/default/useradd` 文件中的 `CREATE_MAIL_SPOOL` 那行取消注释则  
在 `/var/mail/` 目录中为用户创建邮件文件  
    
从 `/etc/login.defs` 说明，ubuntu22.04 不再将 `MAIL_DIR` 作为环境变量，  
该变量修改后仅在 `useradd/userdel/usermod` 命令中使用  
    
如果不创建邮件文件，用 `userdel -rf` 删除用户时会提示没有邮件文件  
    
```bash  
 13 # REQUIRED for useradd/userdel/usermod  
 14 #   Directory where mailboxes reside, _or_ name of file, relative to the  
 15 #   home directory.  If you _do_ define MAIL_DIR and MAIL_FILE,  
 16 #   MAIL_DIR takes precedence.  
 17 #  
 18 #   Essentially:  
 19 #      - MAIL_DIR defines the location of users mail spool files  
 20 #        (for mbox use) by appending the username to MAIL_DIR as defined  
 21 #        below.  
 22 #      - MAIL_FILE defines the location of the users mail spool files as the  
 23 #        fully-qualified filename obtained by prepending the user home  
 24 #        directory before $MAIL_FILE  
 25 #  
 26 # NOTE: This is no more used for setting up users MAIL environment variable  
 27 #       which is, starting from shadow 4.0.12-1 in Debian, entirely the  
 28 #       job of the pam_mail PAM modules  
 29 #       See default PAM configuration files provided for  
 30 #       login, su, etc.  
 31 #  
 32 # This is a temporary situation: setting these variables will soon  
 33 # move to /etc/default/useradd and the variables will then be  
 34 # no more supported  
 35 MAIL_DIR        /var/mail  
 36 #MAIL_FILE      .mail  
```  
    
`/etc/default/useradd` 文件中取消注释  
```bash  
  2 # Defines whether the mail spool should be created while  
  1 # creating the account  
36  CREATE_MAIL_SPOOL=yes  
```  
    
## 添加用户  
> [useradd](https://linux.die.net/man/8/useradd)  
> [Linux 中useradd命令的使用](https://www.cnblogs.com/Hackerman/p/12535719.html)  
    
### 指定家目录  
1. `-b` 选项指定 basedir，家目录默认由 **basedir** 和**账户名**组合在一起。 
    
    
2. 加 `-m` 选项可以实际生成该家目录，并将 `/etc/skel/` 目录中的配置文件拷贝到家目录下。  
    
3. `-d` 选项可以直接指定**家目录的完整路径**，如果同时指定 basedir 和 homedir 且两者不一致，不管命令的先后顺序，以 `-d` 指定的路径为主。 
![](img/2025-02-04-21-03-35.png)
    
4. `-d` 选项指定的**路径不存在时**可以**创建该路径**，包括**多级子目录都可以创建**，但创建子目录时有提示；`-b` 创建 basedir 规则也相同。
![](img/2025-02-04-21-03-54.png)
![](img/2025-02-04-21-04-10.png)
![](img/2025-02-04-21-04-25.png)
    
5. 如果不指定 basedir 和 homedir，则使用默认值，默认在 `/etc/login.def ` 文件中  
- 默认认 basedir 为/home，家目录为 basedir/用户名/  
![](img/2025-02-04-21-05-12.png)

- `ubuntu 22.04`  中没有该设置，`rocky 8.6` 有  
![](img/2025-02-04-21-05-32.png)    
![](img/2025-02-04-21-05-55.png)

### -u 指定 UID  
#### `-u` 选项指定 UID，默认如果 UID 已存在，则不能创建：  
![](img/2025-02-04-21-06-14.png)
    
#### `-u -o` 两个选项结合可以创建重复的 UID  
![](img/2025-02-04-21-06-27.png) 

#### 创建的账户指定 UID 为 0 时  
![](img/2025-02-04-21-06-53.png)

该账户显示为 root，具有 root 权限：  
![](img/2025-02-04-21-07-25.png)

#### 指定 UID 超过 60000  
- 根据配置文件 `/etc/login.defs`，普通用户的最大 UID 为 60000，但新建 UID 超过 60000 也能新建成功，但有一些影响，见 [Using Large User IDs and Group IDs](https://docs.oracle.com/cd/E19120-01/open.solaris/819-2379/userconcept-35/index.html)  
![](img/2025-02-04-21-07-46.png)

### -g 指定用户 primary group  
`-g` 选项指定主要组，可以指定组名或者 GID，但**组必须存在**  
如果不指定，默认创建一个**和用户同名的组**  
![](img/2025-02-04-21-08-06.png) 

### -G 指定用户附加组  
用 `-G` 选项增加附加组，附加组可以多个，用逗号 `,` 间隔，如果不指定主要组，则默认创建一个用户名同名的主要组。  
![](img/2025-02-04-21-08-35.png)    

### -s 指定 shell  
Ubuntu 22.04.1 默认用 useradd 创建用户的 shell 为 `/bin/sh`，可在 `/etc/default/useradd` 文件中查看，可以修改默认为 `/bin/bash`  
![](img/2025-02-04-21-08-53.png)
    
### -r 创建系统用户  
`-r` 选项创建系统用户，系统用户和普通用户的 UID 范围不同。  
![](img/2025-02-04-21-09-18.png)    

### -m 创建家目录  
用 `-d` 指定加目录后默认不会真的创建该目录，需要用 `-m` 选项创建，而 `-M` 选项则不创建家目录。  
![](img/2025-02-04-21-09-39.png)
    
### -e 设置账号过期时间  
`-e` 选项设置账号过期时间：  
![](img/2025-02-04-21-10-11.png)
    
### <font color = 'red'>-l 不将新创建的用户添加到 lastlog 和 faillog 数据库中</font>  
![](img/2025-02-04-21-10-33.png)
    
*********************  
**问题：**  
- ubuntu22.04 指定 `-l` 选项后新加的用户仍在 `lastlog` 数据库中？？  
![](img/2025-02-04-21-10-52.png) 

### useradd 和 adduser  
> [useradd和 adduser的区别](https://blog.csdn.net/cynthrial/article/details/84673357)  
    
Ubuntu 22.04.1 测试两者区别，adduser 会交互式让输入密码，默认的 shell 为 `/bin/bash`，自动创建主目录且赋值默认文件：  
![](img/2025-02-04-21-11-30.png)    
![](img/2025-02-04-21-11-44.png)
    
### 批量添加用户 newusers  
> [newusers和chpasswd的用法](https://blog.licess.com/newusers-chpasswd/)  
    
- 格式按照 `/etc/passwd` 中写  
![](img/2025-02-04-21-12-06.png)
    
## 新添加的用户不能执行 ll 命令问题  
- 测试环境为 Ubuntu 22.04.1  
![](img/2025-02-04-21-12-23.png)
    
- 解决方案  
用 `-m` 选项增加家目录（家目录内会有一些配置文件），并用 `-s` 选项修改 shell  为 `/bin/bash`  
![](img/2025-02-04-21-12-41.png) 
    
## 新添加的账户设置登录密码  
新建账号没有设置密码时，先切换到 root 账户，然后用 `passwd` 命令设置密码，再切换到新账户即可正常使用新账号登录：  
![](img/2025-02-04-21-13-02.png) 

## 无法切换到 root 账户  
新装好 Ubuntu 系统后用 `su` 或 `su -` 无法切换到 root 时，可以修改 root 密码，再切换  
![](img/2025-02-04-21-13-24.png)
    
## 新建用户时默认创建家目录  
- ubuntu 20.04 和 rocky 8.6 的默认设置有差异  
- rocky 8.6 中新建用户默认创建家目录  
- ubuntu 20.04 中新建用户不指定 -m 选项，不创建家目录  
- 在 `/etc/login.defs`  文件中设置  
![](img/2025-02-04-21-13-52.png)    
![](img/2025-02-04-21-14-05.png)
![](img/2025-02-04-21-14-21.png)
![](img/2025-02-04-21-14-33.png)

****************  
- `/etc/login.defs` 文件中设置 `CREATE_HOME` 变量  
- ubuntu 20.04 需要新加设置  
![](img/2025-02-04-21-14-53.png) 
    
## 新建用户时为家目录中添加指定文件  
- 将要默认添加的文件添加到 `/etc/skel` 目录中  
- `useradd -m` 在创建用户时创建家目录  
![](img/2025-02-04-21-15-46.png)
    
## mkhomedir_helper 为已创建的用户创建家目录  
- `man mkhomedir_helper` 查看该命令的帮助文档  
![](img/2025-02-04-21-16-03.png)
    
### 用户已存在家目录：原来家目录文件时间不更新  
![](img/2025-02-04-21-16-25.png)
![](img/2025-02-04-21-16-47.png)
    
### 用户不存在家目录：创建家目录并拷贝默认文件  
![](img/2025-02-04-21-17-05.png)
    
## 修改用户账户 usermod  
> [Usermod Command in Linux](https://linuxize.com/post/usermod-command-in-linux/)  
    
### -g 修改用户初始组群 GID  
`-g` 选项修改用户 GID  
![](img/2025-02-04-21-17-30.png)    
    
### -G 修改用户附加组  
`-G` 选项修改附加组。  
![](img/2025-02-04-21-17-50.png)
    
### -aG 添加附加组  
`-G` 修改附加组，会完全替换之前的附加组，如果想在原来基础上添加附加组，加上 `-a` 选项。  
注意要写 `-aG`，如果写 `-Ga` 失败：  
![](img/2025-02-04-21-18-46.png)
    
### -d -m修改家目录  
`-d` 选项修改家目录，但**不会创建该家目录**，也不会将原来家目录内容移到新目录中。  
![](img/2025-02-04-21-19-13.png) 
    
加上 `-m` 选项可**新建家目录并将原来目录改为新目录**。  
![](img/2025-02-04-21-19-30.png) 

### -s 修改用户默认 shell  
![](img/2025-02-04-21-19-52.png)
    
### -u 修改用户 UID  
`-u` 选项修改 UID，和添加用户时使用规则相同，注意范围，以及修改的 UID 不能和已存在的相同，如果添加相同的 UID，需要加上 `-o` 选项。  
![](img/2025-02-04-21-20-09.png)
    
### -l 修改用户登录名  
- 家目录的名称不变  
- GID 对应的组名不变  
- 文件中 owner 名改变  
![](img/2025-02-04-21-20-24.png)
    
### -e 修改账号过期日期  
`-e` 选项，和 `useradd` 使用方法相同。  
    
## 删除账户 userdel  
> [How to Delete/Remove Users in Linux (userdel Command)](https://linuxize.com/post/how-to-delete-users-in-linux-using-the-userdel-command/)  
    
### userdel -f  
- `userdel` 删除用户，如果用户正在登录，无法删除，需要 `-f` 选项强制删除。  
![](img/2025-02-04-21-20-46.png)
    
### userdel -r 删除家目录和 mail spool 文件  
不加 `-r` 删除用户后其家目录以及里面的文件仍存在。  
![](img/2025-02-04-21-21-11.png) 
![](img/2025-02-04-21-21-26.png)
![](img/2025-02-04-21-21-47.png)
    
## 账号信息查询  
### id 查询 UID GID  
`-G` 即 `groups` 里内容，包括主要组和附加组。  
![](img/2025-02-04-21-22-11.png)
    
### finger  
    
### chfn  
    
### su 切换账号  
> [Linux su命令：用户间切换（包含su和su -的区别）](http://c.biancheng.net/view/3089.html)  
    
- 切换普通账号  
![](img/2025-02-04-21-22-30.png)
    
- shell 为 /sbin/nologin 的账户登录  
[What does "sudo su -s /bin/bash - <username>" do?](https://unix.stackexchange.com/questions/277639/what-does-sudo-su-s-bin-bash-username-do)  
对于shell 为 /sbin/nologin 的账户，无法直接切换  
![](img/2025-02-04-21-22-54.png) 

### sudo  
> [第十四章、Linux 账号管理与 ACL 权限配置](http://cn.linux.vbird.org/linux_basic/0410accountmanager_4.php#sudo)  
> [How to Use the sudo Command in Linux](https://phoenixnap.com/kb/linux-sudo-command)  
> [su、sudo、sudo su、sudo -i sudo -l的用法和区别](https://blog.csdn.net/mutou990/article/details/107724302)  
    
使用 sudo 可以执行超级用户权限，且输入的是**自己用户的密码**而非 root 密码，但账号能否使用 sudo 要看 ` /etc/sudoers ` 文件的设置。  
![](img/2025-02-04-21-23-40.png)
    
- usermod 命令将账户加入 sudo 组使用 sudo 命令  
从 `/etc/sudoer` 配置文件可以看见 sudo 组的成员可以执行命令：  
![](img/2025-02-04-21-24-05.png)

- 添加附加组也可以  
![](img/2025-02-04-21-24-20.png)    

- 修改 /etc/sudoers 文件  
![](img/2025-02-04-21-24-40.png)    

普通用户可以用 `sudo vi /etc/sudoers` 修改该文件，或者用 **visudo** 来修改。  

添加 NOPASSWD 可以不用输入密码，如为用户 `uu` 设置权限  
```bash  
uu  ALL=(ALL:ALL) NOPASSWD: ALL  
```  
    
以后用户 uu 用 `sudo` 命令后不用输入密码  
```bash  
[root@zabbix zabbix_agentd.d]$ useradd -s /usr/bin/bash uu  
[root@zabbix zabbix_agentd.d]$ su uu  
uu@zabbix:/etc/zabbix/zabbix_agentd.d$ cat /etc/shadow  
cat: /etc/shadow: Permission denied  
uu@zabbix:/etc/zabbix/zabbix_agentd.d$ sudo cat /etc/shadow | head -n2  
root:$y$j9T$sM6qch5ObbQXD.2Qp755m/$kzwDdTHvHQKswOq7mpQpungyh4QU6.Du12ZLuWIaUS1:19485:0:99999:7:::  
daemon:*:19213:0:99999:7:::  
uu@zabbix:/etc/zabbix/zabbix_agentd.d$  
```  
    
******************************  
    
visudo 的其他用法见 [第十四章、Linux 账号管理与 ACL 权限配置](http://cn.linux.vbird.org/linux_basic/0410accountmanager_4.php#sudo)。  
    
## 用户密码  
> [How to Handle Account Passwords in Linux With passwd Command](https://linuxhandbook.com/passwd-command/)  
> [第十四章、Linux 账号管理与 ACL 权限配置](http://cn.linux.vbird.org/linux_basic/0410accountmanager_2.php#passwd)  
    
### 密码格式  
![](img/2025-02-04-21-26-05.png) 

### 普通用户修改自己密码 passwd  
![](img/2025-02-04-21-26-21.png)
    
### 修改 root 账号密码 sudo passwd root  
![](img/2025-02-04-21-26-34.png) 

### 修改其他用户密码  
- sudo passwd 用户名  
如果普通用户可以执行 sudo 则可以修改其他用户密码，不需要知道其原始密码  
![](img/2025-02-04-21-26-49.png) 

- root 账户修改 passwd 用户名  
![](img/2025-02-04-21-27-03.png)
    
### 检查密码状态 passwd -S  
![](img/2025-02-04-21-27-24.png) 
    
**7 个字段的含义如下：**  
- 用户名  
- 密码状态  
	- L  
	密码被锁（locked password）  
	- P  
	有可用的密码（usable password）  
	- NP  
	没有密码（no password）  
- 最近一次密码修改的日期  
- 最短密码使用时间  
数值 0 表示随时可修改密码  
- 最长密码使用时间  
- 密码警告期  
- 密码不活动期，即密码过期后的宽限期  
数值 -1 表示无不活跃期  
    
最后四个字段的解释见 `/etc/shadow` 文件中描述。  
    
### 检查全部账户的密码状态 passwd -Sa  
![](img/2025-02-04-21-27-46.png) 

### 强制用户在下次登录时修改密码  
#### passwd -e 用户名  
![](img/2025-02-04-21-28-05.png)
    
#### chage -d 0 用户名  
![](img/2025-02-04-21-28-19.png)
    
### 锁定账户密码 passwd -l  
- passwd -l 用户名锁住密码  
![](img/2025-02-04-21-28-39.png)
    
- passwd -u 用户名 解锁密码  
![](img/2025-02-04-21-28-54.png)
    
### 删除密码 passwd -d  
![](img/2025-02-04-21-29-13.png) 

### 设置最短密码使用时间  
距离上次修改密码后，最短需要等待多少天才能修改密码，默认值为 0，即随时可以修改密码，可以通过 `-n` 选项修改。  
    
![](img/2025-02-04-21-29-31.png)

### 修改密码过期参数 chage  
![](img/2025-02-04-21-29-47.png) 

1. 初始：  
![](img/2025-02-04-21-30-17.png)
    
2. 修改最近一次修改密码日期  
![](img/2025-02-04-21-33-43.png)

如果设置数值为 0 则密码立即过期，下次登录必须修改修改密码：  
![](img/2025-02-04-21-34-02.png)
    
3. 修改最短密码使用天数  
![](img/2025-02-04-21-34-31.png)
![](img/2025-02-04-21-34-49.png)

4. 设置账号过期日期  
![](img/2025-02-04-21-35-03.png)
    
5. 设置密码最长使用天数  
![](img/2025-02-04-21-35-16.png)
    
6. 设置密码过期后的宽限期  
![](img/2025-02-04-21-35-35.png)
![](img/2025-02-04-21-35-50.png)
    
### 批量修改密码 chpasswd  
> [chpasswd command in Linux with examples](https://www.geeksforgeeks.org/chpasswd-command-in-linux-with-examples/)  
    
![](img/2025-02-04-21-36-04.png) 

### 无交互形式修改密码  
![](img/2025-02-04-21-36-29.png)
    
# 组  
## 用户组分类  
- 管理员组  
- 系统组  
- 普通组  
    
### GID 范围  
通过 `/etc/login.def` 文件查看，Ubuntu 22.04.1 查看范围如下：  
![](img/2025-02-04-21-36-47.png)
    
## 私有组、主要组和附加组  
> [Linux私有组，主要组和附加组 ](https://blog.51cto.com/xinsz08/5022617)  
    
## groupadd 添加群组  
> [The groupadd command in Linux – A complete guide](https://www.linuxfordevices.com/tutorials/linux/groupadd-command)  
> [groupadd](https://haicoder.net/linux/linux-groupadd.html)  
    
- 添加普通组 groupadd -g GID 组名  
![](img/2025-02-04-21-37-20.png)
    
- 添加系统组 groupadd -g GID -r 组名  
![](img/2025-02-04-21-37-31.png)

## groupmod 修改组  
- 修改组的名字  groupmod -n  
- 修改组的 GID  groupmod -g  
![](img/2025-02-04-21-37-46.png)
    
## groupdel 删除组  
`groupdel 组名`，如果该组是某个用户的主要组（GID 为该组），则无法删除，需要用 `-f` 选项强制删除。  
    
如果要删除的组是某个用户的附加组，则可以正常删除。  
    
![](img/2025-02-04-21-38-08.png)
    
## newgrp 切换用户登录的组  
> [Linux newgrp command](https://www.computerhope.com/unix/unewgrp.htm)  
> [Linux newgrp命令用法详解：切换用户的有效组](https://blog.csdn.net/digitalkee/article/details/102616038)  
    
- 默认新建一个文件时其组为 GID 对应的那个主要组，如果要**新建文件时组为附加组**，用 **newgrp** 命令  
- 与 `su` 和 `su -` 类似，如果切换组时用 `newgrp`则**当前目录不变**，如果用  `newgrp -`则当**前目录改变**  
    
![](img/2025-02-04-21-38-35.png)
![](img/2025-02-04-21-38-51.png)
![](img/2025-02-04-21-39-04.png)
    
## 查看当前全部组  
### /etc/group 文件中查看  
![](img/2025-02-04-21-39-21.png)
    
### getent group 查看  
![](img/2025-02-04-21-39-34.png)
    
## 查看某个附加组成员  
### getent group 组名  
`/etc/group` 中最后一个字段为该组成员，但为用户的附加组，不包括主要组，可以通过 `getent group` 查看：  
![](img/2025-02-04-21-39-49.png)
    
### groupmems 组名  
![](img/2025-02-04-21-40-06.png)
    
## 查看用户所在的全部组  
- id  
- groups  
    
![](img/2025-02-04-21-40-23.png) 
    
# 文件权限  
> [第六章、Linux 的文件权限与目录配置](http://cn.linux.vbird.org/linux_basic/0210filepermission_2.php)  
> [Linux 的文件权限与目录配置](http://cn.linux.vbird.org/linux_basic/0210filepermission_2.php#filepermission_ch)  
    
## 查看文件权限  
![](img/2025-02-04-21-40-48.png)
![](img/2025-02-04-21-41-01.png)

## 文件和目录权限意义  
- **文件存放数据**，**目录**存放内容为**文件名清单**  
    
### 文件权限  
- **r（read）**  
读取文件内容  
    
- **w（write）**  
编辑，新增，修改**文件内容**（不包含删除文件）  
![](img/2025-02-04-21-41-17.png) 

- **x（execute）**  
	- 该文件可以被系统执行  
	- **Windows** 中文件**是否可执行**是依据**文件的后缀**  
	- **Linux** 文件**是否可执行**是依据其**是否有 x 权限**  
	- 如果**有 x 权限**但**文件不是可执行文件**也**不能执行**，如给一个文本文件可执行权限也不能执行  
    
**********************  
    
### 目录权限  
- **r（read）**  
读取目录结构清单，即查看文件名。  
![](img/2025-02-04-21-41-38.png)
![](img/2025-02-04-21-41-58.png)
![](img/2025-02-04-21-42-19.png)
    
- **w（write）**  
	- 创建新的文件或子目录  
	- 删除文件或子目录  
	- 修改文件或子目录名字  
	- 移动文件或子目录的位置  
![](img/2025-02-04-21-42-44.png)
![](img/2025-02-04-21-43-27.png)

- **x（execute）**  
使用者能进入目录的权限，如果目录只有 w 权限而没有 x 权限，也不能删除或新增文件等操作。  
![](img/2025-02-04-21-43-49.png)
    
## 修改所在组 chgrp  
新的组必须存在  
普通用户需要用 sudo 执行该命令：  
![](img/2025-02-04-21-44-06.png)
    
### 修改文件的所属组  
![](img/2025-02-04-21-44-20.png)
    
### 修改目录的所属组  
![](img/2025-02-04-21-44-40.png)
    
## 修改所有者 chown  
普通用户需要用 sudo 执行该命令：  
![](img/2025-02-04-21-44-58.png)
    
### chown --reference= 参考其他文件修改所有者  
```bash  
--reference=RFILE  
    use RFILE's owner and group rather than specifying OWNER:GROUP values  
```  
    
### 修改文件所有者  
![](img/2025-02-04-21-45-13.png)
    
### 修改目录的所有者  
注意仅修改目录的所有者还是修改目录以及其所有子目录和文件的所有者。  
    
1. 初始：  
![](img/2025-02-04-21-45-26.png) 

2. 仅修改目录 passwd 的用户和所有组  
![](img/2025-02-04-21-45-41.png)
    
3. 修改目录以及其全部子目录和文件的用户和组  
![](img/2025-02-04-21-45-56.png)
    
## 修改权限 chmod  
> [改变权限, chmod](http://cn.linux.vbird.org/linux_basic/0210filepermission_2.php#chmod)  
> [Linux chmod命令](https://www.runoob.com/linux/linux-comm-chmod.html)  
    
| 权限 | 二进制 | 十进制 |
| ---- | ------ | ------ |
| r--  | 100    | 4      |
| -w-  | 010    | 2      |
| --x  | 001    | 1      |
    
如果是目录，需要递归设置目录中所有子目录以及文件的权限，则加上 `-R` 选项。  
    
1. chmod 数字 文件名  
![](img/2025-02-04-21-46-20.png)
![](img/2025-02-04-21-46-39.png)
    
2. 符号类型修改  
    
| 身份   | 符号 |
| ------ | ---- |
| user   | u    |
| group  | g    |
| others | o    |
| all    | a    |
    
| 权限设置符号 | 含义   |
| ------------ | ------ |
| +            | 加入   |
| -            | 除去   |
| =            | 设置为 |
    
![](img/2025-02-04-21-47-15.png)
![](img/2025-02-04-21-47-28.png)

*****************  
**注意**：  
- root 账户，即使文件没有 rw 权限，依旧可以读写  
![](img/2025-02-04-21-48-14.png)

- root 账户，如果文件全部身份都没有 x 权限，不能执行文件，但仍可以修改文件权限  
![](img/2025-02-04-21-48-27.png)

- root 账户，只要 user，group 或者 other 三者之一有 x 权限，则 root 可以执行文件  
![](img/2025-02-04-21-48-43.png)

- 文件所有者，即使没有任何权限，仍可以修改权限  
![](img/2025-02-04-21-48-58.png)

- 属于文件所属组的成员也不可以修改文件权限  
![](img/2025-02-04-21-49-12.png)
    
- `chmod -R` 递归修改目录中文件的权限，只针对已存在的文件，新建的文件仍是默认权限  
![](img/2025-02-04-21-49-30.png)
    
## 默认权限 umask  
> [文件与目录的默认权限与隐藏权限](http://cn.linux.vbird.org/linux_basic/0220filemanager_4.php)  
> [Linux umask详解：令新建文件和目录拥有默认权限](http://c.biancheng.net/view/764.html)  
    
1.  文件的最大默认权限为 666（rw-rw-rw-），目录的最大默认权限为777（rwxrwxrwx）。（这个参数在哪查看？）  
2. 最大默认权限减去 umask 的值即为新建文件或目录时的权限。  
    
![](img/2025-02-04-21-49-55.png)

# 文件的隐藏属性  
> [文件隐藏属性](http://cn.linux.vbird.org/linux_basic/0220filemanager_4.php#attr)  
> [Linux chattr命令详解：修改文件系统的权限属性](http://c.biancheng.net/view/874.html)  
> [Linux lsattr命令：查看文件系统属性](http://c.biancheng.net/view/875.html)  
    
![](img/2025-02-04-21-50-14.png) 
    
The "e" flag in lsattr command output represents the "extent" attribute of the file.  
    
The extent attribute is used by certain filesystems, such as ext4, to optimize file storage allocation.  
It indicates that the file is using extents, which are contiguous blocks of disk space allocated for that file. Extents help improve file access and storage efficiency.  
    
# 文件特殊权限  
> [文件特殊权限： SUID, SGID, SBIT](http://cn.linux.vbird.org/linux_basic/0220filemanager_4.php#suid_sgid_sbit)  
> [Linux SetUID（SUID）文件特殊权限用法详解](http://c.biancheng.net/view/868.html)  
    
## SUID  
- 出现在文件**拥有者（owner）** 的 **x** 权限上，全称为 set UID  
- 只针对**二进制程序**有效，不能是其他文件或目录  
- 仅在**执行该程序的过程**中有效  
- 执行者在程序执行过程中将具有该程序**拥有者**的权限  
- 如果文件原来的 owner 位有 `x` 权限，则原来的 `x` 变为 `s`  
- 如果文件原来的 owner 位没有 `x` 权限，则原来的 `x` 变为 `S`  
    
## SGID  
- set GID，s 标志在**所属群组**的 **x** 位置时具有该权限  
- SGID 可以针对**文件或目录**  
- SGID 针对**文件权限**：  
	- SGID 仅对**二进制程序**有用  
	- 程序**执行者**对于该程序需要有 **x** 权限  
	- 执行者在**执行过程**中其**群组将变成文件的群组**，即执行过程中其所属组改变  
- SGID 针对**目录权限**：  
	- 使用者在该目录下的群组将变成该目录的群组，但如果使用者没有 w 权限，目录的群组有 w 权限，使用者也不能新建文件  
	- 若使用者在该目录下有 w 权限，则使用者所创建的新文件的群组和**此目录的群组相同**  
    
![](img/2025-02-04-21-50-59.png) 
    
## SBIT  
- sticky bit，仅针对**目录**的权限  
- 使用者在该目录下创建的文件或目录只有**自己与 root 能删除**  
    
![](img/2025-02-04-21-51-24.png)
    
## 添加特殊权限  
1. 数字方法  
- SUID 为 4  
- SGID 为 2  
- SBIT 为 1  
    
将要添加的特殊权限数字写在第一个，如 `chmod 4755`，4 表示特殊权限 SUID，7 为 owner 的权限，第一个 5 为 group 权限，第二个 5 为 other 权限。  
如果第一个数字为 6，即同时拥有权限 SUID 和 SGID。  
    
![](img/2025-02-04-21-51-42.png)
    
2. 符号方法  
- chmod u+s 添加 SUID 权限  
- chmod g+s 添加 GUID 权限  
- chmod o+t 添加 SBIT 权限  

![](img/2025-02-04-21-52-01.png)    

## 权限与指令之间的关系  
> [ 极重要！权限与命令间的关系](http://cn.linux.vbird.org/linux_basic/0220filemanager_6.php)  
    
    
# ACL 访问控制权限  
> [Linux ACL访问控制权限完全攻略](http://c.biancheng.net/view/863.html)  
> [主机的细部权限规划：ACL 的使用](http://cn.linux.vbird.org/linux_basic/0410accountmanager_3.php)  
> [An introduction to Linux Access Control Lists (ACLs)](https://www.redhat.com/sysadmin/linux-access-control-lists)  
    
## ACL 作用  
ACL（Access Control List），可以针对特定使用者，文件或目录来设置权限。  
    
## 启动 ACL  
    
## getfacl 获取文件 ACL  
![](img/2025-02-04-21-52-26.png)
    
## setfacl 设置文件 ACL  
### 为特定用户设置权限  
`setfacl -m u:账号:权限`  
    
![](img/2025-02-04-21-52-43.png)
    
### 为特定组设置权限  
![](img/2025-02-04-21-52-59.png)
    
### 最大有效权限 mask  
- 对文件设置 mask 只针对设置的 ACL 用户、组和默认的组，不影响文件的 owner 和 root 账户。  
- 设置 mask 后如果用 setfacl 设置用户或组权限，mask 又恢复为默认值。  
- mask 用来限制最大的有效权限，设置的 ACL  用户的权限不能超过 mask  的权限，超过的权限无效。  
    
![](img/2025-02-04-21-53-21.png)
![](img/2025-02-04-21-53-42.png)

### 设置默认 ACL 权限  
目录内已有的文件权限不改变，只改变新建的文件权限。  
    
![](img/2025-02-04-21-54-06.png)
![](img/2025-02-04-21-54-19.png)
![](img/2025-02-04-21-54-32.png)
![](img/2025-02-04-21-54-45.png)

### 设置已有目录及其内容权限  
- 默认 `setfacl` 设置目录不影响目录内文件的权限  
![](img/2025-02-04-21-55-02.png)
    
- 修改已存在的目录以及其子文件权限，不改变新建子文件权限  
![](img/2025-02-04-21-55-24.png)
![](img/2025-02-04-21-55-42.png)
    
## setfacl 删除 ACL 权限  
- 删除单个文件或目录 ACL 权限  
![](img/2025-02-04-21-56-27.png)
    
- 删除目录内全部文件的单个 ACL 权限  
	- 初始  
    ![](img/2025-02-04-21-57-13.png)
    ![](img/2025-02-04-21-57-39.png)
	- 递归删除目录的 ACL 权限  
    ![](img/2025-02-04-21-57-58.png)
    
- 删除全部的 ACL 权限  
	- `setfacl -b filename` 删除该文件或目录的全部 ACL 权限，目录不递归删除其子文件 ACL 权限。  
	- `setfacl -b -R filename` 递归删除目录的全部 ACL 权限。  
    
# 文件结构  
> [Linux File Structure](https://www.linux.com/training-tutorials/linux-file-structure/)  
    
# 文件种类  
> [Linux文件种类与扩展名](http://cn.linux.vbird.org/linux_basic/0210filepermission_2.php#filepermission_type)  
    
# 查看文件类型 file  
> [Linux file命令](https://www.runoob.com/linux/linux-comm-file.html)  
    
![](img/2025-02-04-21-58-41.png)
    
# stat 查看文件状态 四种时间信息  
    
> [Stat Command in Linux](https://linuxize.com/post/stat-command-in-linux/)  
    
![](img/2025-02-04-21-58-59.png)    

## stat -L 查看符号链接对应的源文件的文件信息  
- 默认查看符号链接时查看的信息是链接文件而非源文件的文件信息  
- 加上 `-L` 选项后查看的是源文件的信息  
    
![](img/2025-02-04-21-59-19.png)
    
## stat -f 查看文件系统的信息  
![](img/2025-02-04-21-59-36.png)
    
## stat --format="format" 指定输出格式  
- `man stat` 查看帮助文档可查看格式介绍  
![](img/2025-02-04-21-59-56.png)
    
# 文件的三种时间 mtime ctime atime  
> [ Useful Examples of Touch Command in Linux](https://phoenixnap.com/kb/touch-command-in-linux)  
    
# 查看文件时间  
## stat 一次查看全部时间  
![](img/2025-02-04-22-00-17.png)
    
## ll 查看文件时间  
### ll 查看 mtime  
- `ll` 命令看到的时间默认是修改时间（modification time）。  
- **文件内容** 改变时更新该时间。  
- 加上 `--full-time` 选项查看完整时间。  
![](img/2025-02-04-22-00-45.png)
    
### ll -c 查看 ctime  
- ll -c 命令看到的时间为 change time。  
- 文件的 **属性和权限** 改变时，修改文件名，移动文件等会更该时间。  
![](img/2025-02-04-22-01-00.png)
    
### ll -u 查看 atime  
> [3.8. Configuring atime Updates](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/global_file_system_2/s1-manage-atimeconf)  
> [Linux File Timestamps Explained: atime, mtime, and ctime](https://www.howtogeek.com/517098/linux-file-timestamps-explained-atime-mtime-and-ctime/)  
    
- ll -u 查看 access time  
- **查看文件内容**时更新该时间，如 `cat` 查看，但不一定每次读取都会更新，可能延迟  
- 更新的有规则  
![](img/2025-02-04-22-01-30.png)
    
### ll --time= 查看特定时间  
![](img/2025-02-04-22-01-58.png)
    
### ll --full-time 查看完整时间  
- 可以直接用 `stat` 查看所有时间的完整显示  
![](img/2025-02-04-22-02-12.png)
    
# touch 修改文件时间  
> [How To Use the touch Command in Linux](https://phoenixnap.com/kb/touch-command-in-linux#set-timestamp-using-a-reference-file)  
> [Touch Command in Ubuntu 22.04](https://linuxhint.com/touch-command-linux/)  
    
![](img/2025-02-04-22-02-30.png)

## touch 已存在的文件后更新全部时间  
![](img/2025-02-04-22-02-57.png)
    
##  touch -c：更新文件的全部时间为当前时间  
- `-c` 选项可以避免创建文件，默认文件不存在则创建  
- 如果文件存在，则更新文件的全部时间为当前时间  
    
![](img/2025-02-04-22-03-20.png)
![](img/2025-02-04-22-03-35.png)
![](img/2025-02-04-22-03-48.png)
    
## touch -d：更新文件的 mtime 和 atime  
- `touch --date=STRING`  
- `touch -d` 可以同时修改 mtime 和 atime 的时间，后面参数为日期，以当前日期为参考；修改后 ctime 会变成当前日期和时间  
    
![](img/2025-02-04-22-04-06.png)
![](img/2025-02-04-22-04-30.png)
![](img/2025-02-04-22-04-49.png)
![](img/2025-02-04-22-05-04.png)
    
## touch -t：更新文件的 mtime 和 atime  
- 和 `touch -d` 一样，不修改 ctime，但 ctime 的时间还是会变成当前时间  
    
![](img/2025-02-04-22-06-24.png)
![](img/2025-02-04-22-05-50.png)
![](img/2025-02-04-22-07-03.png)
![](img/2025-02-04-22-07-28.png)
    
## touch -mt：仅修改 mtime  
- 修改后 ctime 的时间变为当前时间。  
    
- **touch -m 修改 mtime 为当前时间**  
![](img/2025-02-04-22-07-48.png)

- **修改 mtime 为指定时间**  
![](img/2025-02-04-22-08-05.png) 

## touch -at：仅修改 atime  
- mtime 的日期和时间都不变，但 ctime 的时间变为当前时间。  
    
- **修改 atime 为当前时间**  
![](img/2025-02-04-22-08-25.png)
    
- **修改 atime 为指定时间**  
![](img/2025-02-04-22-08-46.png)
    
## touch -amt 修改 mtime 和 atime 为指定时间  
- 修改后 ctime 会变成当前时间。  
![](img/2025-02-04-22-09-14.png)
    
## touch -r 将文件的时间改为另一个文件的时间  
- 第一个文件为参考文件，第二个文件为要修改的文件  
- atime 和 mtime 修改为参考文件的对应时间，ctime 修改为当前时间  
    
![](img/2025-02-04-22-09-32.png)

## touch -h：修改符号链接文件时间  
- 硬链接和源文件是同一个文件，inode 相同，因此修改其中一个时间，另一个同步改变  
- 修改符号链接时间，默认会修改到源文件而非符号链接文件  
    
![](img/2025-02-04-22-10-54.png)
![](img/2025-02-04-22-11-25.png)
![](img/2025-02-04-22-11-43.png)
    
# touch 创建新文件  
> [Useful Examples of Touch Command in Linux](https://linuxhandbook.com/touch-command/)  
> [How To Use the touch Command in Linux](https://phoenixnap.com/kb/touch-command-in-linux)  
> [修改文件时间或建置新档： touch](http://cn.linux.vbird.org/linux_basic/0220filemanager_3.php#touch)  
    
## 创建的文件已存在  
- 创建的文件已存在，会修改文件的时间，三个时间均更新为当前时间  
    
![](img/2025-02-04-22-12-02.png)

## 创建多个文件  
    
![](img/2025-02-04-22-12-16.png) 

## touch 创建文件数据过多不成功  
![](img/2023-03-13-15-35-32.png)  
    
## 创建特殊字符文件名  
### 以 - 开头的文件  
![](img/2023-03-11-21-00-36.png)  
    
### 以 * 开头的文件  
![](img/2023-03-11-21-02-56.png)  
    
# 查找文件位置  
> [linux命令which,whereis,locate,find的区别](https://zhuanlan.zhihu.com/p/35727707)  
> [How to Use All Linux’s Search Commands](https://www.howtogeek.com/425408/how-to-use-all-linuxs-search-commands/)  
> [ 命令与文件的搜寻](http://cn.linux.vbird.org/linux_basic/0220filemanager_5.php)  
> [5 Command Line Tools to Find Files Quickly in Linux](https://www.tecmint.com/find-files-quickly-in-linux-terminal/)  
> [搜索文件](https://www.lanqiao.cn/courses/1/learning/?id=60)  
    
## which  
> [Which Command in Linux ](https://linuxhandbook.com/which-command/)  
    
- 查找可执行文件  
- 在环境变量 `$PATH` 的路径中搜索  
- `-a` 显示全部匹配结果  
    
![](img/2025-02-04-22-12-48.png)
    
## whereis  
> [Linux whereis命令](https://www.runoob.com/linux/linux-comm-whereis.html)  
    
![1](https://img-blog.csdnimg.cn/3377f8eb8c5c446e98aeb448795f0a79.png)  
![2](https://img-blog.csdnimg.cn/a0df71ce0acc4b88b526c87a7ef14c10.png)  
![3](https://img-blog.csdnimg.cn/25daaba010fd4ccfaffdab97d595cf78.png)  
    
## locate  
> [Linux locate命令](https://www.runoob.com/linux/linux-comm-locate.html)  
> [How to Use the locate Command in Linux](https://phoenixnap.com/kb/locate-command-in-linux)  
    
    
- 从数据库查找数据，速度快  
- 新建的文件等需要更新，用 `updatedb` 更新  
- 查找的是路径全名，即 `-w` 选项；只搜索文件名  
- 不是实时更新，如果一个文件被删了，但数据库没更新，可能该能查到  
    
    
![1](https://img-blog.csdnimg.cn/373a69d4c41549e7b2c2050fc0500575.png)  
![2](https://img-blog.csdnimg.cn/c170119724394449b3c6ee3f1fd91e04.png)  
![3](https://img-blog.csdnimg.cn/4b0246e6c6014a8a8deaf3ec5a7ad111.png)![4](https://img-blog.csdnimg.cn/82f84fc8274c473fb47423a358a809b8.png)  
    
    
## find  
> [find](http://cn.linux.vbird.org/linux_basic/0220filemanager_5.php#find)  
> [Linux find 命令](https://www.runoob.com/linux/linux-comm-find.html)  
> 例子说明：[35 Practical Examples of Linux Find Command](https://www.tecmint.com/35-practical-examples-of-linux-find-command/)  
> 命令参数讲解：[Linux find command](https://www.computerhope.com/unix/ufind.htm)  
> [How to Use All Linux’s Search Commands](https://www.howtogeek.com/425408/how-to-use-all-linuxs-search-commands/)  
> [Linux find命令：在目录中查找文件](http://c.biancheng.net/view/779.html)  
> [15 Super Useful Examples of the Find Command in Linux](https://linuxhandbook.com/find-command-examples/)  
    
    
![1](https://img-blog.csdnimg.cn/e95e08f31182446ab6b1bb05f6cbb927.png)  
    
    
### find 查找文件需要的权限  
- 如果目录有 r 权限，没有 x 权限，目录中的文件有 r 权限，find 仍能找到文件  
    
![](img/2023-03-13-16-41-42.png)  
    
![](img/2023-03-13-16-46-15.png)  
    
### 查找文件的路径  
- **.**  
当前路径，不写路径默认也是当前路径  
- **/**  
根目录  
- **~**  
当前用户所在家目录  
    
![1](https://img-blog.csdnimg.cn/68b1aa1fdbdf4384832ae0e9aa90aaf0.png)  
    
    
### find -name 按文件名在特定目录查找  
- 直接指定文件名为精确查找  
    
![1](https://img-blog.csdnimg.cn/a3a9923d02b94c189107b9dd08ebf26a.png)  
    
![](img/2023-03-15-10-30-04.png)  
<br/>  
    
- 可以使用通配符  
![](img/2023-03-19-09-41-48.png)  
      
    
### <font color=red>find -regex 利用正则表达式查找文件</font>  
> [8.5.2 'emacs' regular expression syntax](https://www.gnu.org/software/findutils/manual/html_node/find_html/emacs-regular-expression-syntax.html)  
    
- 用 Emacs 正则表达式  
    
![](img/2023-03-19-10-43-36.png)  
![](img/2023-03-19-10-48-25.png)  
![](img/2023-03-19-11-22-58.png)  
    
### find -type 指明文件类型查找  
    
![1](https://img-blog.csdnimg.cn/adbd3a5b27b248dfaae8d4e692fd7786.png)  
    
![2](https://img-blog.csdnimg.cn/275a735af0014429b56dc702195b73f2.png)  
![3](https://img-blog.csdnimg.cn/e004236c423e4e81865da24c9395109c.png)  
    
    
### find -perm 查找特定权限的文件  
#### find -perm mode 精准匹配  
![2](https://img-blog.csdnimg.cn/f061c1796df24228bc4b9515931f176e.png)  
    
    
#### find -perm -mode 匹配所有权限位包含该权限的文件  
![1](https://img-blog.csdnimg.cn/dc5d2fa16f5f4dbf8657f54b3d9c9d4d.png)  
![2](https://img-blog.csdnimg.cn/353b4c9e479548b99a4dd30bd2be9e5a.png)  
![4](https://img-blog.csdnimg.cn/16404c71d02c4f7d9de8455beacfd87e.png)  
![6](https://img-blog.csdnimg.cn/4dc97e79cbeb49b990475b1185a0ef13.png)  
    
#### find -perm /mode 任意一个权限位的权限匹配即可  
- `find -perm /222` 则只要 	`owner group other` 中一个有 `w` 权限即可  
- `find -perm /002` 则 `other` 必须要有 `w` 权限，其他权限位的 `0` 不是可以没有权限  
    
![](img/2023-03-15-10-41-37.png)  
![](img/2023-03-19-11-07-57.png)  
    
### find -depth  
- 和 `find -d` 相同  
- 先处理目录的内容，再处理目录  
    
### find -ls  
- 加上 `-ls` 的选项，相当于 `ls -dils`  
    
![](img/2023-03-19-11-46-58.png)  
    
### find -fls  
- 和 `ls` 类似，但将输出的内容重定向到文件中而非屏幕显示  
    
![](img/2023-03-19-14-36-41.png)  
    
    
### find -print  
- 将文件名打印到标准输出，每个文件名后加一个换行符  
- 默认行为  
    
![](img/2023-03-19-14-42-47.png)  
    
### find -print0  
- 和 `print` 类似，但每个文件后不加换行符，用 `null` 字符代替  
    
![](img/2023-03-19-14-47-11.png)  
![](img/2023-03-19-14-46-07.png)  
    
### find -prune 不递归查找目录  
- 不能和 `-delete` 一起使用，`-delete` 默认递归处理目录  
- 要实现该功能可以用 `-maxdepth` 指定深度  
    
![](img/2023-03-19-14-58-32.png)  
    
```bash  
[root@ubuntu22-c0 1]$ tree  
.  
├── 1  
├── 2  
│   ├── 1  
│   ├── 2  
│   └── 3  
└── 3  
    ├── 1  
    ├── 4  
    ├── 5  
    └── 6  
    
2 directories, 8 files  
[root@ubuntu22-c0 1]$ find -type d -name "3" -prune -o -type f -name "1" -print  
./1  
./2/1  
```  
    
### find -maxdepth -mindepth 指定目录深度  
- 当前目录深度为 1，指定深度为 1，则只搜索当前目录  
- 指定深度时该参数放在最前面  
    
![](img/2023-03-19-15-09-31.png)  
![1](https://img-blog.csdnimg.cn/f62f9b2d240648c3b7b19e893847b352.png)  
![1](https://img-blog.csdnimg.cn/f915c2174cf24f6fb1a0bde8d43bd192.png)  
    
    
### find -exec 对查找的文件执行命令  
![1](https://img-blog.csdnimg.cn/0c55c4f5dd86433cb2f5eb62073f60b7.png)  
![2](https://img-blog.csdnimg.cn/4724bcda74c64a84bd6efe578ac158d7.png)  
![3](https://img-blog.csdnimg.cn/00c301ba761e4cf484bc174748941dfe.png)  
![4](https://img-blog.csdnimg.cn/e566fb8f212842709ae24f9cb4132e12.png)  
![5](img/2023-03-19-14-17-46.png)  
    
**问题**：这里为什么有错误提示？看结果是删除成功了？  
    
### find -ok command ;  
- 和 `-exec` 类似，但执行命令时会提示  
    
![](img/2023-03-19-14-32-35.png)  
    
### find -delete 删除文件  
- 用该选项删除文件  
- 默认开启 `-depth` 选项  
    
![](img/2023-03-19-14-33-30.png)  
![](img/2023-03-19-14-26-36.png)  
    
### find -empty 查找全部空文件  
![1](https://img-blog.csdnimg.cn/ca5b0856c97f449e85be576545d81f14.png)  
    
    
### 查找隐藏的文件或目录  
![1](https://img-blog.csdnimg.cn/675a1bb674e54d039e29b09726542bfe.png)  
    
    
- 这里的点表示符号 `.`，用的是通配符而非正则表达式的符号  
- 通配符 `*` 匹配任意字符，可以没有，因此可以匹配 `.`  
- `.?*` 排除 `.`，`?` 匹配单个字符，`.` 后至少要有一个字符才行，因此排除 `.`  
    
### 查找多个文件类型  
    
![](img/2023-03-19-15-33-51.png)  
    
### 找到一个符合的文件就退出  
    
![](img/2023-03-19-15-36-10.png)  
### 根据文件所有者或所属组查询  
> -user  
> -group  
> -uid  
> -gid  
> -nouser  
> -nogroup  
    
    
![1](https://img-blog.csdnimg.cn/1e83fce016ab42ef8174c18e2e5d91b2.png)  
![2](https://img-blog.csdnimg.cn/f56f46723e6f459eb7d0ddb454b498c9.png)  
    
### 根据时间查找文件  
> 鸟哥的私房菜解释时间含义：[find](http://cn.linux.vbird.org/linux_basic/0220filemanager_5.php#find)  
    
#### 以天为时间  
- mtime atime ctime  
- 当时间为 0，表示从当前时间到过去 24h 内的时间段  
    
![1](https://img-blog.csdnimg.cn/76a2ce93e3ec4bd880b686c9c862c96a.png)  
    
    
#### 以分钟为时间  
- mmin amin cmin  
    
    
### find -size 按文件大小查找文件  
![1](https://img-blog.csdnimg.cn/4e8dc12bba254f7597382464990928ac.png)  
![](img/2023-03-19-16-06-17.png)  
    
- 单位 `c，k，M，G` 大小写敏感，数值不能是小数  
![1](https://img-blog.csdnimg.cn/04564f387e3441838035a44a5795a518.png)  
    
- find -size n  
- 查询并非刚好 n units 的文件，而是 (n-1, n] unit 范围。  
![2](https://img-blog.csdnimg.cn/35bbe6780771452d911554c0011dd891.png)  
    
- find -size +n  
- **大于 n** unit，不包括 n unit。  
![3](https://img-blog.csdnimg.cn/c67f8f8e577b427da0e3bf862e04e37d.png)  
    
- find -size -n  
- 小于等于 **n-1** unit。  
![4](https://img-blog.csdnimg.cn/4211b5eaf3bf420bab6f61076ab866b1.png)  
    
    
- find -size +n -size -m 查找一段范围内文件  
![2](https://img-blog.csdnimg.cn/862a9118535243fbbf8d4740cfe3ab2f.png)  
![3](https://img-blog.csdnimg.cn/0d178dd35e4d4ebd84b178b33ae9b623.png)  
    
### 操作符  
> [Linux find command](https://www.computerhope.com/unix/ufind.htm#syntax)  
> [What is meant by POSIX compliant?](https://teacherscollegesj.org/what-is-meant-by-posix-compliant/)  
    
![1](https://img-blog.csdnimg.cn/d513e67ad06e4d4bb3afadef927131f9.png)  
![2](https://img-blog.csdnimg.cn/2c081937ac6541fca663cbb765392306.png)  
    
- 注意 `( expr )` 使用时括号要转义，即 `\( expr \)`，括号内左右两边有空格  
- `-a` 逻辑与  
- `-o` 逻辑或  
    
# 绝对路径和相对路径  
> [绝对路径与相对路径](http://cn.linux.vbird.org/linux_basic/0210filepermission_3.php#dir_path)  
    
![1](https://img-blog.csdnimg.cn/44953df763b84402bc133e5fbd131d35.png)  
![2](https://img-blog.csdnimg.cn/bf1d988ac5cb4f289c0f343b775284c3.png)  
    
# Linux 目录结构  
> [Linux目录配置](http://cn.linux.vbird.org/linux_basic/0210filepermission_3.php)  
    
鸟哥的 Linux 私房菜基础学习篇第 5 章介绍  
    
## 根目录的意义与内容  
- 系统最重要的目录，与启动、还原、系统修复等操作有关  
- 根目录不要放在非常大的分区内，越大则数据越多，越容易发生错误  
    
## 根目录下的子目录  
### /bin  
存放可执行文件，单人维护模式下还能被使用的命令，如 cp 等  
在Linux中，单用户维护模式（Single User Mode）是一种特殊的引导模式，也被称为救援模式（Rescue Mode）或故障修复模式（Troubleshooting Mode）。它是用于系统维护和故障排除的一种运行级别。  
    
在单用户维护模式下，只有系统管理员（root用户）可以登录系统，并且系统仅运行最基本的服务和进程。这种模式下，网络服务一般是禁用的，多用户模式下的其他用户也无法登录。这样做的目的是为了防止其他用户对系统进行更改并保护系统的完整性。  
    
单用户维护模式常用于以下情况：  
1. 系统出现严重问题，无法正常启动或登录时，使用该模式可以进入系统进行修复。  
2. 忘记root账户密码时，可以进入单用户维护模式并重置密码。  
3. 进行重要文件的备份和还原操作。  
    
进入单用户维护模式需要在系统引导过程中选择或修改引导参数。具体步骤可以因Linux发行版而有所不同，但通常在GRUB引导菜单中选择相应的选项即可进入单用户维护模式。  
    
一旦进入单用户维护模式，可以执行各种系统维护和故障排除任务，如修复磁盘错误、更新软件包、重置密码、修复启动问题等。  
    
需要注意的是，在进行任何更改之前，建议备份重要数据，并确保了解所执行的操作的影响和潜在风险。  
    
### /boot  
- 启动会使用的文件，包括 linux 内核文件以及启动选项与启动所需配置文件等  
    
### /dev  
- 设备与接口文件，读取该文件等于读写设备，如 /dev/null, /dev/zero, /dev/tty 等  
    
### /etc  
- 配置文件  
- 该目录下文件属性一般是可以让普通用户查看，但只有 root 能修改  
    
#### /etc/opt  
- 第三方辅助软件 /opt 的相关配置文件  
#### /etc/X11  
- 与 X Windows 有关的各种配置文件  
    
### /lib  
- 系统启动时会用到的函数库，以及 /bin 或 /sbin 中命令会调用到的函数库  
    
### /media  
- 放置可删除的设备  
    
### /mnt  
- 暂时挂载某些额外设备时用到  
    
### /opt  
- 第三方辅助软件放置的目录  
    
### /run  
- 系统启动后所产生的各项信息  
    
### /sbin  
- 系统启动过程中需要的，包括启动、修复、还原等所需的命令，只有 root 能使用  
- 服务器软件程序一般放在 /usr/sbin 中  
- 自行安装的软件所产生的系统执行文件一般放在 /usr/local/sbin 中  
    
### /srv  
- service 缩写，服务需要使用的数据目录  
    
### /tmp  
- 临时文件  
    
### /lost+found  
- 使用 /ext2、/ext3、/ext4 文件系统格式会产生的目录  
- 当文件发生错误时，将一些遗失的片段放置到该目录下  
    
### /proc 查看内存数据  
- 虚拟文件系统  
- 内存的数据写入到 `/proc` 目录下，如 /proc/cpuinfo  
- 主机上各程序的 PID 以目录的形式在 `/proc` 目录中，目录的名为 PID  
- 开机的第一个程序 `systemd` 的 PID 为 1，因此在 `/proc/1` 目录中  
![](img/2023-04-13-14-11-38.png)  
    
### /sys  
- 虚拟文件系统  
- 主要记录内核与系统硬件信息相关的内容，不占据硬盘容量  
    
### /usr  
- 可分享、不可变动  
- UNIX Software Resource 缩写  
- 系统刚装完后会占用很多硬盘容量  
    
### /var  
- 经常变动的文件  
    
#### /var/cache  
    
#### /var/lock  
    
#### /var/log  
    
#### /var/run  
    
#### /var/spool  
- 放置队列数据，即排队等待其他程序使用的数据，这些数据通常使用后会被删除  
    
## 目录链接关系  
```bash  
[root@ubuntu22-c0 ~]$ ll /bin  
lrwxrwxrwx 1 root root 7 Aug  9  2022 /bin -> usr/bin/  
[root@ubuntu22-c0 ~]$ ll /sbin  
lrwxrwxrwx 1 root root 8 Aug  9  2022 /sbin -> usr/sbin/  
[root@ubuntu22-c0 ~]$ ll /lib  
lrwxrwxrwx 1 root root 7 Aug  9  2022 /lib -> usr/lib/  
[root@ubuntu22-c0 ~]$ ll /var/run  
lrwxrwxrwx 1 root root 4 Aug  9  2022 /var/run -> /run/  
[root@ubuntu22-c0 ~]$ ll /lib64  
lrwxrwxrwx 1 root root 9 Aug  9  2022 /lib64 -> usr/lib64/  
[root@ubuntu22-c0 ~]$ ll /var/lock  
lrwxrwxrwx 1 root root 9 Aug  9  2022 /var/lock -> /run/lock/  
```  
    
# 目录操作  
## 切换目录 cd  
> [目录的相关操作](http://cn.linux.vbird.org/linux_basic/0220filemanager_1.php#dir_opdir)  
    
    
![1](https://img-blog.csdnimg.cn/fc84238b2b5b48208c3c2251fa185256.png)  
    
![2](https://img-blog.csdnimg.cn/960ac5ce93fa4ca4839a20e5b8fd35bb.png)  
    
## 显示当前目录 pwd  
![1](https://img-blog.csdnimg.cn/fb4790dacc2c4c13a9ae5b865a1fe141.png)  
    
## 创建目录 mkdir  
![1](https://img-blog.csdnimg.cn/668b0eb4694341a4912041d3a2c79ab4.png)  
    
    
- mkdir -p 创建多级目录  
创建多级目录是如果用 `{}` 扩展，注意 `{}` 内的文件夹名用逗号分隔时不能有空格  
```bash  
[root@docker dockerfile]$ mkdir -pv  web/{nginx, apache, tomcat, jdk}  
mkdir: created directory 'web'  
mkdir: created directory 'web/{nginx,'  
mkdir: created directory 'apache,'  
mkdir: created directory 'tomcat,'  
mkdir: created directory 'jdk}'  
[root@docker dockerfile]$ tree  
.  
├── apache,  
├── jdk}  
├── tomcat,  
└── web  
    └── {nginx,  
```  
    
```bash  
[root@docker dockerfile]$ mkdir -pv  web/{nginx,apache,tomcat,jdk}  
mkdir: created directory 'web'  
mkdir: created directory 'web/nginx'  
mkdir: created directory 'web/apache'  
mkdir: created directory 'web/tomcat'  
mkdir: created directory 'web/jdk'  
[root@docker dockerfile]$ tree  
.  
└── web  
    ├── apache  
    ├── jdk  
    ├── nginx  
    └── tomcat  
    
5 directories, 0 files  
```  
    
## 删除空目录 rmdir  
![1](https://img-blog.csdnimg.cn/27df270623284bbb9143f23cbb522598.png)  
![2](https://img-blog.csdnimg.cn/af88523932464511aa2e66f9f931d6dd.png)  
![3](https://img-blog.csdnimg.cn/742299a6dc944373b14426176dcd7bad.png)  
![4](https://img-blog.csdnimg.cn/45470dee9eec49a6bd44e46dfe7c2cec.png)  
    
    
## basename 和 dirname 获取文件名和目录名  
```bash  
[root@ubuntu22-c0 etc]$ basename /etc/passwd  
passwd  
[root@ubuntu22-c0 etc]$ dirname /etc/passwd  
/etc  
```  
    
# 查看文件系统信息  
[Linux dumpe2fs命令：查看文件系统信息](http://c.biancheng.net/view/889.html)  
    
# wc 统计文件字数、字节数和行数  
[Linux命令 wc - 统计文件的字节数、字数、行数](https://www.w3cschool.cn/linuxc/linuxc-rhp23mam.html)  
[wc command in Linux with examples](https://www.geeksforgeeks.org/wc-command-linux-examples/)  
    
```bash  
[root@ubuntu22-c0 ~]$ wc --help  
Usage: wc [OPTION]... [FILE]...  
  or:  wc [OPTION]... --files0-from=F  
Print newline, word, and byte counts for each FILE, and a total line if  
more than one FILE is specified.  A word is a non-zero-length sequence of  
characters delimited by white space.  
    
With no FILE, or when FILE is -, read standard input.  
    
The options below may be used to select which counts are printed, always in  
the following order: newline, word, character, byte, maximum line length.  
  -c, --bytes            print the byte counts  
  -m, --chars            print the character counts  
  -l, --lines            print the newline counts  
      --files0-from=F    read input from the files specified by  
                           NUL-terminated names in file F;  
                           If F is - then read names from standard input  
  -L, --max-line-length  print the maximum display width  
  -w, --words            print the word counts  
      --help     display this help and exit  
      --version  output version information and exit  
```  
    
```bash  
[root@ubuntu22-c0 ~]$ echo "a" | wc -m  
2  
[root@ubuntu22-c0 ~]$ echo "a" | wc -c  
2  
[root@ubuntu22-c0 ~]$ echo -n "a" | wc -m  
1  
[root@ubuntu22-c0 ~]$ echo -n "a" | wc -c  
1  
```  
```bash  
[root@ubuntu22-c0 ~]$ echo "你" | wc -m  
2  
[root@ubuntu22-c0 ~]$ echo "你" | wc -c  
4  
[root@ubuntu22-c0 ~]$ echo -n "你" | wc -m  
1  
[root@ubuntu22-c0 ~]$ echo -n "你" | wc -c  
3  
```  
    
```bash  
[root@ubuntu22-c0 ~]$ cat -A 1.txt  
a b c $  
1 2 3 4  $  
[root@ubuntu22-c0 ~]$ cat 1.txt | wc -L  
9  
[root@ubuntu22-c0 ~]$ cat 1.txt | wc -w  
7  
[root@ubuntu22-c0 ~]$ cat 1.txt | wc -c  
17  
[root@ubuntu22-c0 ~]$ cat 1.txt | wc -m  
17  
```  
    
# 统计目录中文件的数目  
> [how to count files in directory on linux](https://devconnected.com/how-to-count-files-in-directory-on-linux/)  
## ls | wc -l 统计一个目录中文件数目  
- `ls` 列出的每个文件都是单独一行，但终端处理并没有每个文件一行写  
![](img/2023-03-13-15-57-41.png)  
![](img/2023-03-13-15-51-01.png)  
    
## 递归统计目录中的文件数目  
- 注意查找时可能有的位置没有权限而出现错误提示  
![](img/2023-03-13-16-15-55.png)  
![](img/2023-03-13-16-50-54.png)  
![](img/2023-03-13-16-55-19.png)  
    
    
## tree 统计  
- 注意如果没有权限则显示的结果不准确  
- 如果目录树太多，只看最后的结果，可以用 `tree | tail -n1` 显示最后一行结果  
![](img/2023-03-13-17-02-10.png)  
    
    
# 查看目录的实际大小  
> [`ls -lS` isn't showing true size of directory](https://unix.stackexchange.com/questions/365369/ls-ls-isnt-showing-true-size-of-directory)  
    
- 目录的内容为文件名，文件的内容记录文件的实际数据  
- 文件系统中创建目录时会分配一个 inode 与至少一个区块给该目录  
因此 `ll` 查看目录时大小为 4k 或其整数倍（块大小为 4k 时，可以用 dumpe2fs 查看某个分区的文件系统信息）  
如果目录中的文件不多，则只占用一个区块，如果文件过多可能占用多个区块  
```bash  
[root@ubuntu22-c0 ~]$ ll snap/  
total 12  
drwx------ 3 root root 4096 Feb 21  2023 ./  
drwx------ 7 root root 4096 Aug 26 22:43 ../  
drwxr-xr-x 4 root root 4096 Feb 21  2023 lxd/  
```  
    
## du  
> [How to Get the Size of a Directory in Linux](https://linuxize.com/post/how-get-size-of-file-directory-linux/)  
    
![](img/2023-03-19-16-56-55.png)  
    
# 链接文件  
> [Linux ln 命令](https://www.runoob.com/linux/linux-comm-ln.html)  
> [硬链接和符号链接的区别](https://www.cnblogs.com/LubinLew/p/LinuxFileLink.html)  
> [实体链接与符号链接： ln](http://cn.linux.vbird.org/linux_basic/0230filesystem_2.php#link)  
    
    
## 硬链接 （hard link）  
### 定义  
> 硬链接的定义：[Hard link](https://en.wikipedia.org/wiki/Hard_link)  
    
- 链接文件 inode 和源文件相同  
- 不占用额外空间，指向的都是同一块数据  
- 对用户来说，相当于一个文件有多个名字  
- 修改一个文件内容，**其他文件同步改变**  
- 增加一个链接文件，链接数加 1  
- **不能为目录**创建硬链接  
- 只能在**同一个文件系统**创建硬链接  
- 如果源文件**移动到其他地方**，**链接不受影响**  
- 删除源文件后**仍可以操作其他硬链接文件**  
- 删除一个链接文件后，文件的连接数减1，如果删除全部硬链接文件，则文件被删除  
- 硬链接和源文件的 inode 相同，因此其权限属性等相同，一个修改，其他同步改变  
    
![1](https://img-blog.csdnimg.cn/42c1c1058f464175b8c664c704f179f1.png)  
![2](https://img-blog.csdnimg.cn/6494826babcf46e089a48c341657b3fb.png)  
![3](https://img-blog.csdnimg.cn/908a6e63777f4b118b60cd4978fd1119.png)  
![4](https://img-blog.csdnimg.cn/0a54681578c74333ad46552f488b1104.png)  
![5](https://img-blog.csdnimg.cn/7a396e4be5dd4651ab92764be50a3fba.png)  
![6](https://img-blog.csdnimg.cn/8ba1acb1d5f3489b8b0bdc605d138e67.png)  
**************  
![7](https://img-blog.csdnimg.cn/de3652a42a3a44858be2065e5f079567.png)  
![8](https://img-blog.csdnimg.cn/b0fa659e925d428a89e42135ebba0c28.png)  
![9](https://img-blog.csdnimg.cn/d197f6235e8547ab90c4435b774ba920.png)  
![10](https://img-blog.csdnimg.cn/a489e68cc5de43e88c2613f555f816cf.png)  
    
### 目录的链接数  
- 目录至少有两个链接数，当前目录下其本身占一个，子目录中有个 `./` 表示当前目录，占一个硬链接  
- 根目录 `/` 下也有一个 `../` 目录，其 inode 和当前目录相同（[Why does '/' have an '..' entry?](https://unix.stackexchange.com/questions/5711/why-does-have-an-entry/)）  
- 一般操作系统不允许为目录创建硬链接  
    
![1](https://img-blog.csdnimg.cn/85b39e21f0f24f0faa7cc4c063631e82.png)  
![2](https://img-blog.csdnimg.cn/2c9d3d92105a4ecd9a1a56bb20767ea0.png)  
    
### 硬链接的作用  
> [Why do hard links exist?](https://unix.stackexchange.com/questions/20670/why-do-hard-links-exist)  
> [When would creating a hard link be useful?](https://superuser.com/a/288297/1112374)  
    
### 硬链接的限制  
> [Why are hard links only valid within the same filesystem?](https://unix.stackexchange.com/questions/290525/why-are-hard-links-only-valid-within-the-same-filesystem)  
    
    
- 大多数操作系统，不能为目录创建硬链接  
- 硬链接**不能跨文件系统**使用  
    
## 符号链接 （symbolic link）  
    
### 定义  
> [Symbolic link](https://en.wikipedia.org/wiki/Symbolic_link)  
    
- 可以在不同的文件系统上使用  
- 链接文件的 **inode 和源文件不同**  
- 源文件的**链接数不增加**  
- 类似 Windows 中的快捷键  
- 源文件删除，则符号链接文件不能用  
- 符号链接的 inode 指向内容为**源文件的文件名**  
- 符号链接和源文件的权限不同  
- 修改源文件的权限，不影响符号链接的权限  
- 符号链接文件是一种新的文件类型，`ll` 可看见文件类型为 `l`，与源文件是两个文件  
- 如果创建符号链接失败，查看符号链接时源文件的路径处闪，创建时使用绝对路径创建  
    
![1](https://img-blog.csdnimg.cn/e2aebcc33ee94bd591b585bafd8b43ff.png)  
![2](https://img-blog.csdnimg.cn/1684a8510d504d59aa7bf63f0e93f0ff.png)  
![3](https://img-blog.csdnimg.cn/3cbfaa27bd714d3d8756c7d5862b36a2.png)  
![4](https://img-blog.csdnimg.cn/3d21d81648414e7aa8a1f775f49dde72.png)  
![5](https://img-blog.csdnimg.cn/85c80fea2512414ea1cee64f64635789.png)  
    
### 符号链接的作用  
> [When do we use symbolic link in Linux?](https://qr.ae/prialT)  
    
- 相对硬链接，可以为目录创建符号链接  
- 可以跨文件系统创建符号链接  
- 用于不同软件版本切换很方便  
    
    
### 创建符号链接时源文件的路径  
![1](https://img-blog.csdnimg.cn/1b5b6910dadf468d8256357ca5850914.png)![在这里插入图片描述](https://img-blog.csdnimg.cn/8888ef23f9df4714b33345a086202123.png)  
    
### 删除符号链接  
> [How to Remove (Delete) Symbolic Links in Linux](https://linuxize.com/post/how-to-remove-symbolic-links-in-linux/)  
> [Trailing slashes on symbolic links to directories](https://unix.stackexchange.com/questions/29769/trailing-slashes-on-symbolic-links-to-directories)  
    
    
- 如果为一个文件创建符号链接，直接删除符号链接，不影响源文件  
![1](https://img-blog.csdnimg.cn/6f540fe827eb438fb2f80111b857eedb.png)  
- 如果为目录创建符号链接，删除时只删除符号链接文件，后面不带 `/`，则只删除符号链接，不影响源目录文件  
![2](https://img-blog.csdnimg.cn/35a54ae409d0481d8ee2c066d7158a97.png)  
- 如果为目录创建符号链接，删除时符号链接文见带 `/`，则会删除源目录，而链接文件仍存在，只是查看无内容  
![3](https://img-blog.csdnimg.cn/39b62dfd7f0e453c9aaaa67f4c73c2bc.png)  
    
    
# 查看文件目录内容 ls  
> [Linux ls Options](https://ipcisco.com/lesson/linux-ls-command/)  
> [文件与目录的检视： ls](http://cn.linux.vbird.org/linux_basic/0220filemanager_2.php#ls)  
    
    
## ls -t 按照修改时间排序  
默认按照文件名排序  
    
```bash  
[root@ubuntu22-c0 shell_scripts]$ ll  
total 48  
drwxr-xr-x 3 root root  4096 Aug 23 19:19 ./  
drwx------ 7 root root  4096 Aug 23 19:16 ../  
drwxr-xr-x 4 root root  4096 Aug 23 10:28 1/  
-rw-r--r-- 1 root root     0 Aug 23 19:19 a  
-rw-r--r-- 1 root root     0 Aug 23 19:19 A  
-rw-r--r-- 1 root root     0 Aug 23 19:19 b  
-rw-r--r-- 1 root root     0 Aug 23 19:19 B  
-rw-r--r-- 1 root root   375 Aug 19 16:08 cal  
```  
    
`ls -t` 按照修改时间排序，最新的时间最先显示  
## ls -l 查看文件属性  
显示的时间为修改时间（modification time）mtime。  
    
![1](https://img-blog.csdnimg.cn/9c53585631d84915b3f0c42c8dcfa2c4.png)  
    
    
### ls -l 显示的文件和目录的 size  
#### 普通文件  
- 普通文件的 size 为文件的内容大小  
    
#### 符号链接文件  
- 显示源文件的文件名的长度  
    
![](img/2023-03-13-18-08-27.png)  
    
#### 硬链接文件  
- 和源文件相同  
#### 管道文件  
    
#### 目录  
> [Why is the size of a directory either 0 or 4096?](https://unix.stackexchange.com/questions/503048/why-is-the-size-of-a-directory-either-0-or-4096)  
> [`ls -lS` isn't showing true size of directory](https://unix.stackexchange.com/questions/365369/ls-ls-isnt-showing-true-size-of-directory)  
    
- 目录的 size 并非目录的实际大小，而是目录使用数据区块的大小  
- 目录的内容为文件名，文件的内容记录文件的实际数据  
- 文件系统中创建目录时会分配一个 inode 与至少一个区块给该目录  
因此 `ll` 查看目录时大小为 4k 或其整数倍（块大小为 4k 时，可以用 dumpe2fs 查看某个分区的文件系统信息）  
如果目录中的文件不多，则只占用一个区块，如果文件过多可能占用多个区块  
```bash  
[root@ubuntu22-c0 ~]$ ll snap/  
total 12  
drwx------ 3 root root 4096 Feb 21  2023 ./  
drwx------ 7 root root 4096 Aug 26 22:43 ../  
drwxr-xr-x 4 root root 4096 Feb 21  2023 lxd/  
```  
    
## ls -a 查看全部文件，包含隐藏文件  
    
![1](https://img-blog.csdnimg.cn/48d8064f80ab43bca74fe35e0ca9ef90.png)  
    
## ls -A 查看全部文件，不包括 . 和 ..  
    
- `.` 为当前目录，`..` 为上级目录。  
![1](https://img-blog.csdnimg.cn/c45cf82acba2404b86ea8fa5167f2af7.png)  
    
    
## ls 仅列出隐藏文件  
    
```bash  
[lx@rocky8-2 ~]$ ls -A | grep -E "^[.].+$"  
.bash_history  
.bash_logout  
.bash_profile  
.bashrc  
.cache  
.config  
.esd_auth  
.ICEauthority  
.local  
```  
    
## ls -d 仅列出目录，而不列出目录的内容  
    
![1](https://img-blog.csdnimg.cn/72892ec1b5a045aba10483a53cb3dae3.png)  
    
    
## ls -F 在列出的文件后加符号表明其类型  
目录加 `/`，可执行文件加 `*`，socket 文件加 `=`  
    
![1](https://img-blog.csdnimg.cn/f4878771c914459c8ee584c27e6d4828.png)  
![2](https://img-blog.csdnimg.cn/9a44a1d8d5b14b7f93c9898fd9663c75.png)  
    
## 文件大小以较易读的方式显示  
![1](https://img-blog.csdnimg.cn/e4dfcf4e493e4367b76fc858dd5f3db2.png)  
    
## ls -i 列出 inode 号码  
    
![1](https://img-blog.csdnimg.cn/37acdd0ac833481499730db1c514eae3.png)  
    
## ll -n 用 UID 和 GID 代替使用者和群组的名称  
![1](https://img-blog.csdnimg.cn/2a305e1d0c4349e88d41944213d36dd4.png)  
    
    
## ls -R 查看目录中所有子目录的信息  
    
![1](https://img-blog.csdnimg.cn/d68034ef44e84a4ab5af0800d852484a.png)  
    
## ls -s  
> [Why does ls -l output a different size from ls -s?](https://askubuntu.com/questions/269480/why-does-ls-l-output-a-different-size-from-ls-s)  
    
- `ls -s` 列出的不是文件的真是大小  
![](img/2023-03-19-11-59-59.png)  
    
    
## ls --format=single-column 单列形式列出文件  
```bash  
[root@ubuntu22-c0 ~]$ ls --format=single-column -F /boot/  
config-5.15.0-79-generic  
config-5.15.0-82-generic  
grub/  
initrd.img@  
initrd.img-5.15.0-79-generic  
initrd.img-5.15.0-82-generic  
initrd.img.old@  
lost+found/  
System.map-5.15.0-79-generic  
System.map-5.15.0-82-generic  
vmlinuz@  
vmlinuz-5.15.0-79-generic  
vmlinuz-5.15.0-82-generic  
vmlinuz.old@  
```  
    
## ll 常用组合  
![1](https://img-blog.csdnimg.cn/161e9d543c264b43bfb419ddd6cf9aa3.png)  
    
    
# Linux 处理多个连续的路径分隔符  
> [How does Linux handle multiple consecutive path separators (/home////username///file)?](https://unix.stackexchange.com/questions/1910/how-does-linux-handle-multiple-consecutive-path-separators-home-username)  
    
    
    
# 目录最后是否带 / 的差异  
> [When should I use a trailing slash on a directory? [duplicate]](https://unix.stackexchange.com/questions/50499/when-should-i-use-a-trailing-slash-on-a-directory)  
    
    
- 移动文件  
![1](https://img-blog.csdnimg.cn/15237352ede346b99dd475f576ce19c8.png)  
- 移动目录  
![1](https://img-blog.csdnimg.cn/c0d9d8199fb34e28a9b412982a4d638d.png)  
![2](https://img-blog.csdnimg.cn/33a2827316eb49cab330b992cd62bf8e.png)  
![3](https://img-blog.csdnimg.cn/3f2e426c77a04e7385132e8bcfe7087a.png)  
![4](https://img-blog.csdnimg.cn/1c9933ce374f4e7f9e72cdcf2376ffd3.png)![5](https://img-blog.csdnimg.cn/5ada1b8b5d03482fa90ed57138d64dee.png)  
![6](https://img-blog.csdnimg.cn/ac1aef3c6a5540ef9e07f3ab1f6dcf4a.png)  
    
    
# 文件描述符 fd  
> [File descriptor](https://en.wikipedia.org/wiki/File_descriptor)  
> [File descriptor](https://www.computerhope.com/jargon/f/file-descriptor.htm)  
    
    
## lsof 查看文件的文件描述符  
```bash  
[root@docker filebeat]$ lsof -f -- log.json  
COMMAND  PID USER   FD   TYPE DEVICE SIZE/OFF    NODE NAME  
filebeat 894 root    9u   REG  253,0    49408 6204255 log.json  
```  
    
根据 PID 和 FD 查看：  
```bash  
[root@docker filebeat]$ ll /proc/894/fd/9  
lrwx------ 1 root root 64 Jul 11 10:18 /proc/894/fd/9 -> /var/lib/filebeat/registry/filebeat/log.json  
```  
    
如果用 vim 打开一个普通文本，查看该文本的文件描述符看不到内容，但可以看到 vim 临时生成的 .swp 文件的描述符  
```bash  
[root@docker filebeat]$ ls -a  
.  ..  1.txt  .1.txt.swp  log.json  meta.json  
[root@docker filebeat]$ jobs  
[1]+  Stopped                 vim 1.txt  
[root@docker filebeat]$ lsof -f -- 1.txt  
[root@docker filebeat]$ lsof -f -- .1.txt.swp  
COMMAND  PID USER   FD   TYPE DEVICE SIZE/OFF    NODE NAME  
vim     2411 root    5u   REG  253,0    12288 6204313 .1.txt.swp  
[root@docker filebeat]$ ll /proc/2411/fd/5  
lrwx------ 1 root root 64 Jul 11 11:17 /proc/2411/fd/5 -> /var/lib/filebeat/registry/filebeat/.1.txt.swp  
```  
如将 1.txt 删除但该文件的文件描述符仍处于打开状态，`.1.txt.swp` 文件还存在，则可以继续编辑文件并保存  
    
    
# 文件操作  
> [第七章、Linux 文件与目录管理](http://cn.linux.vbird.org/linux_basic/0220filemanager_2.php#cprmmv)  
    
## 复制文件和目录 cp  
[Linux cp命令：复制文件和目录](http://c.biancheng.net/view/746.html)  
    
### 复制单个普通文件 不加任何选项  
#### 复制文件后文件的属性改变  
- ubuntu 22.04 测试复制文件后权限不变（源文件修改默认权限，普通用户和 root 复制该文件，权限仍和源文件相同，但创建新文件则是默认权限）  
- ubuntu 22.04 测试复制文件后 owner 和所属组变成复制的用户的 uid 和 gid  
- ubuntu 22.04 测试，复制后用 `stat` 命令查看，mtime，ctime，atime 和 birth time 均变成当前时间  
    
![0](img/2023-03-11-15-16-34.png)  
    
#### 有同名文件直接覆盖，即使该文件正在使用，不询问是否覆盖  
![2](https://img-blog.csdnimg.cn/14275caec29c4ce9a156e12c65b3d1df.png)  
    
### cp -p 复制单个文件 保留文件属性  
- ubuntu 22.04 测试  
- 普通用户加上 -p 选项后，uid 和 gid 仍然改变，变成当前用户的 ownership  
- root 加上 -p 选项后，uid 和 gid 保持不变  
- 普通用户和 root 的 mtime 和 atime 不变，ctime 改变  
    
    
![0](img/2023-03-11-14-55-23.png)  
    
![](img/2023-03-11-15-30-06.png)  
    
    
### cp -d 复制符号链接文件时保留链接文件属性  
- 不加选项时复制链接文件时复制的实际是源文件而非链接文件  
- 复制时加 `-p` 选项，复制的仍是源文件而非链接文件  
- `cp -d` 复制链接文件，但其 ownership 等属性仍会改变  
- 复制**硬链接文件**该选项无效，普通用户和 root 均是  
    
![](img/2023-03-11-15-46-10.png)  
![](img/2023-03-11-15-52-43.png)  
![1](https://img-blog.csdnimg.cn/935acd31f4044849a2af1a8a905a3f69.png)  
![2](https://img-blog.csdnimg.cn/ab44211a01d44197adf419fed2c45c33.png)  
    
    
### cp -r, cp -R 复制目录  
- -r 或 -R 复制目录以及目录内的文件和子目录  
- 递归复制不加其他参数，其文件的属性会改变  
- 递归复制后要保留属性则根据需要添加额外参数  
    
![](img/2023-03-11-16-53-38.png)  
![](img/2023-03-11-16-57-13.png)  
    
![1](https://img-blog.csdnimg.cn/2ed936f843ee4d5ea044f915ea13d896.png)  
![2](https://img-blog.csdnimg.cn/92b6632fc0b2417da3d85fcf96eca294.png)  
![3](https://img-blog.csdnimg.cn/3a517584bd5344878e83fd26155ed69f.png)  
    
### cp -a 复制文件或目录 保留属性 递归复制目录内容  
- `-a` 为 `-dR --preserve=all`  
- 隐藏属性，即用 `chattr` 修改的属性，root 和普通用户复制时均不能保留  
- 特殊权限，如 `SUID`，root 复制可保留，普通用户不能  
    
    
![](img/2023-03-11-17-16-20.png)  
    
### cp -i 复制单个文件 目标文件存在时提示  
- `--interactive`  
    
![1](https://img-blog.csdnimg.cn/5c68ab58a5a64e8f94b74a935fb756d7.png)  
    
### 复制文件生成链接文件  
- -s 生成符号链接  
- -l 生成硬链接  
    
![1](https://img-blog.csdnimg.cn/ade35c22ddd14f278b75834abd49f34a.png)  
    
### cp -u 目标文件存在 只有源文件更新时覆盖目标文件  
![3](https://img-blog.csdnimg.cn/8272cf8db0b64e6fa59ee160289d4927.png)  
    
    
### cp --backup 有同名文件先备份  
    
- 可以用 `cp -b`，但这样备份的文件名固定，如果再备份一次会覆盖，这种写法不能指定参数  
- `cp --backup=numbered` 会为备份的文件创建数字，多备份几次会有不同的文件名  
    
![](img/2023-03-12-10-56-59.png)  
    
### 复制多个文件到同一个目录中  
- 目录必须存在  
    
![1](https://img-blog.csdnimg.cn/200eced9121d43aab6df47ff8213485d.png)  
![2](https://img-blog.csdnimg.cn/e44132b116064242904ce277334eb2d6.png)  
    
    
## 将一个文件复制多份  
> [linux系统如何将一个文件同时复制多份](https://www.cnblogs.com/liujiaxin2018/p/9405079.html)  
    
### 利用 tee 命令  
![1](https://img-blog.csdnimg.cn/415156de2ea8443991093570b859542d.png)  
    
    
### 利用 xargs 命令  
> [How to copy a single file to multiple directories in Linux or Unix](https://www.cyberciti.biz/faq/linux-unix-copy-a-file-to-multiple-directories-using-cp-command/)  
    
    
```bash  
$ tree 1  
1  
└── 2  
    └── 3.txt  
    
$ xargs -n 1 cp -av 1 <<< "2/ 3/ 4/"  
'1' -> '2/'  
'1/2' -> '2/2'  
'1/2/3.txt' -> '2/2/3.txt'  
'1' -> '3/'  
'1/2' -> '3/2'  
'1/2/3.txt' -> '3/2/3.txt'  
'1' -> '4/'  
'1/2' -> '4/2'  
'1/2/3.txt' -> '4/2/3.txt'  
$ ls  
1  2  3  4  
```  
    
## 删除文件或目录 rm  
- 如果文件正在编辑，默认 `rm` 文件可以直接删除，删除后用 `ls` 查看无此文件，但如果在另一个终端仍编辑已删除的文件然后保存，会重新生成该文件，文件名不变，无任何提示，再用 `ls` 查看可以看到已删除的文件  
    
### -f 强制删除文件  
![1](https://img-blog.csdnimg.cn/c7ef1e10ceda41a098aede42ca966c9e.png)  
    
### -i 删除前询问  
`y` 或 `Y` 表示删除，`n` 或 `N` 表示不删除。  
    
![2](https://img-blog.csdnimg.cn/83c927793f5f40b49bfdc723c26018fe.png)  
    
### -r 递归删除目录  
`rm` 默认不能删除目录，用 `-r` 或 `-R` 选项可以删除目录及其子目录  
    
![1](https://img-blog.csdnimg.cn/37059f5322f14b09b6368f111a21f077.png)  
    
### -ri 删除目录中部分文件  
可以用 `rm -ri` 删除目录时加上 `-i` 选项，可只删除部分内容。  
![1](https://img-blog.csdnimg.cn/18288c2b035b4427aa388e0b8e2dbc55.png)  
    
### -d 删除空目录  
- `--dir`  
    
### 删除目录中的全部内容但不删除目录文件  
![1](https://img-blog.csdnimg.cn/aac53862791e424f97713621b3fceb94.png)  
![2](https://img-blog.csdnimg.cn/162f97e0493a43b68f543fbe36f27d16.png)  
![3](https://img-blog.csdnimg.cn/6e1e63a9a48d4966ac0c1972d790a716.png)  
    
### 写别名利用 mv 在删除时将文件移到一个回收站  
> [Linux使用别名alias将rm命令替换为mv避免误删除](https://blog.csdn.net/timonium/article/details/115210188)  
    
- 防止 `rm` 误删文件，可以定义别名，利用 `mv` 来实现类似垃圾桶的的效果，文件删除到一个垃圾桶中，方便找回  
- `mv -t` 可以指定目标位置  
- 如果确定想永久删除而非移到其他地方，可以用 `\rm` 不使用别名而是原始命令  
- 如果想永久保存别名，则根据是需要对全部用户生效还是当前用户选则将别名存到不同的文件中  
    
```bash  
alias rm='DIR=/tmp/rm_$(date +"%Y%m%d%H%M%S"); mkdir ${DIR}; mv -t ${DIR} '  
alias rm_r='\rm -ri '  
```  
    
### 删除特殊文件名的文件  
![](img/2023-03-11-21-08-10.png)  
    
    
## 移动文件或目录 mv  
1. 如果目标文件已存在，默认不提示，直接覆盖。  
![1](https://img-blog.csdnimg.cn/be99ad5553de4cdea453ee7cf0507c6d.png)  
![2](https://img-blog.csdnimg.cn/42edb95205ba43fcabc28aa110aa0f39.png)  
    
    
2. 如果目标文件不存在，默认创建该目标文件  
![2](https://img-blog.csdnimg.cn/fa17478e84b84834ae10bf04647cac01.png)  
    
3. 如果目标文件在**不存在的目录**中，默认**无法移动**  
![3](https://img-blog.csdnimg.cn/ee824afd83f742f3980f023fd35d85eb.png)  
4. 可以移动目录，默认**移动目录中全部内容**  
![4](https://img-blog.csdnimg.cn/d1ee59ae01c043f9a3e647c313b4c7c3.png)  
5. 移动后文件的 inode 和属性权限等与原来相同  
![5](https://img-blog.csdnimg.cn/05df9b7ac3f04fc8a1eb62964ef59671.png)  
    
    
## 同一分区和不同分区移动文件  
### 相同分区移动文件  
When the source and destination are within the same partition, `mv` simply updates the file's directory entry to point to the new location.  
    
In Linux, the `mv` command is used to move or rename files and directories. When the source file and the destination directory are located within the same partition (a logical division of a storage device), `mv` utilizes a mechanism that efficiently updates the file's metadata to reflect the new location. This process involves making changes to the file's directory entry.  
    
1. The `mv` command checks if the source and destination are within the same partition. If they are, it proceeds with the following steps.  
    
2. Instead of physically copying the entire file's content and creating a new file at the destination, `mv` simply updates the file's directory entry. This directory entry serves as a reference or pointer to the file's actual data blocks on the filesystem.  
    
3. The file's directory entry is modified to reflect the new location or filename. This update ensures that the file is logically associated with the new directory or name.  
    
4. The file's inode (a data structure that contains metadata about the file) remains unchanged. It retains the same identification number and retains its ownership, permissions, timestamps, and other attributes.  
    
By updating the directory entry instead of performing a data block copy, the `mv` command completes the task swiftly and efficiently when the source and destination are within the same partition. This approach is advantageous, especially when working with large files, as it saves time and conserves system resources.  
    
    
### 不同分区移动文件  
- If the source and destination are on different partitions, the `mv` command treats it as a copy-and-delete operation.  
- First, the content of the file is physically copied from the source partition to the destination partition, preserving all the file attributes.  
- Once the file is successfully copied, the original file on the source partition is deleted.  
- Moving files between partitions can take longer depending on the size of the file being moved.  
    
## move -b 移动前备份  
- 和 `cp --backup` 用法相同  
    
### mv -i 目标文件存在时提示  
![2](https://img-blog.csdnimg.cn/b542747fc8e74c739caa9f70d3fb9881.png)  
    
### mv -t 移到一个目录中  
- `--target-directory=DIRECTORY` 第一个参数为一个已存在的目录，后面可以跟多个文件  
- 可以将多个文件移到已存在的目录中  
    
![](img/2023-03-11-19-31-04.png)j  
    
    
### 移动多个文件到目录  
- 最后必须是目录，且存在  
![3](https://img-blog.csdnimg.cn/66c20339288545d6888ed4a32dfbcece.png)  
![4](https://img-blog.csdnimg.cn/d77c71cd14f14e0c880292b876bd46a4.png)  
![5](https://img-blog.csdnimg.cn/fc84a906aed845429f7cfddfdfe626b0.png)  
    
    
- 可以用 `mv -t`  
    
    
### mv -u 移动时目标文件只有源文件较新时才覆盖  
![4](https://img-blog.csdnimg.cn/477320340ef542f68ccfc63784422029.png)  
    
### mv -n 目标文件存在时不移动  
- `mv --no-clobber` 不覆盖已存在的文件  
    
### mv -f 强制移动文件不提示  
- `-f, --force` 强制移动不提示  
    
## rename 批量修改文件名  
> [Linux rename command](https://www.computerhope.com/unix/rename.htm)  
    
### substitution  
![](img/2023-03-13-14-34-45.png)  
    
### translation  
![](img/2023-03-13-14-24-27.png)  
    
    
## 获取路径的文件名和目录名 basename dirname  
### basename  
![1](https://img-blog.csdnimg.cn/2efd4f616f6345bb9044cee445f5517c.png)  
![1](https://img-blog.csdnimg.cn/c1b22121bacf4c658da7c4164876b559.png)  
![2](https://img-blog.csdnimg.cn/50fe606474cd4e9aaed0bf5953517eb0.png)  
    
### dirname  
![1](https://img-blog.csdnimg.cn/b0c240b65d6a45eca279c0feff4e5ee9.png)  
    
    
# 查看文件内容——纯文本文件  
> [ 文件内容查阅](http://cn.linux.vbird.org/linux_basic/0220filemanager_3.php)  
> [5 Commands to View the Content of a File in Linux Command Line](5 Commands to View the Content of a File in Linux Command Line)  
    
![1](https://img-blog.csdnimg.cn/a1477d7c083544bb973a9f3db9fff2f3.png)  
    
## cat  
> [Cat Command in Linux: Essential and Advanced Examples](https://linuxhandbook.com/cat-command/)  
> [How to Use Linux Cat Command (With Examples)](https://phoenixnap.com/kb/linux-cat-command)  
    
    
![1](https://img-blog.csdnimg.cn/748f96c4ebe848278dc3e4f401610675.png)  
    
### 显示多个输入  
![1](https://img-blog.csdnimg.cn/283dfad016574960a20b87b52aeff211.png)  
    
    
### cat f - g  
![1](https://img-blog.csdnimg.cn/4ed436c0d7c2495fbd11d1d1b17d273d.png)  
![2](https://img-blog.csdnimg.cn/908df607be954097bb2f11ce47ea30fb.png)  
    
#### 合并被分割的文件  
可以合并被分割的二进制文件或文本文件。  
![1](https://img-blog.csdnimg.cn/a632f49cd12a4cf7997cde24829a93f3.png)  
    
####  cat -n 显示内容时标注行号  
空白行也会标记  
![1](https://img-blog.csdnimg.cn/4122847d4bad48f59679af0ed9e0500b.png)  
    
```bash  
[root@ubuntu22-c0 ~]$ cat -n 1 12/12.txt  
     1  1  
     2  12  
```  
    
#### cat -b 标注行号不包括空白行  
![1](https://img-blog.csdnimg.cn/977fba59db4748e195507a9304d2dcae.png)  
    
    
#### cat -s 压缩连续的空白行  
![1](https://img-blog.csdnimg.cn/5baa2c8033c24b41874c0f69933a7812.png)  
    
    
#### cat -E  
- 每行结束位置显示 `$`  
    
#### cat -A 显示非打印字符  
- 注意 windows 格式和 Linux 格式的文件显示隐藏字符不同  
![1](https://img-blog.csdnimg.cn/f74d98d00cd54b7b8d92395249433e47.png)  
![](img/2023-03-17-09-58-44.png)  
    
- `cat -A` 相当于 `cat -vET`  
    
### tac 从后往前显示  
![1](https://img-blog.csdnimg.cn/54fc7e2777cb41b9b9a89c6dfd6b7707.png)  
    
### nl  
![1](https://img-blog.csdnimg.cn/9f374ceadba143928c5de1b36c0c371f.png)  
    
### rev 反转一行内容  
reverse lines charaterwise  
![1](https://img-blog.csdnimg.cn/1c8d7c15659644f49c578ff5886973ff.png)  
    
### more  
> [可翻页检视](http://cn.linux.vbird.org/linux_basic/0220filemanager_3.php#file_content_2)  
    
### less  
> [可翻页检视](http://cn.linux.vbird.org/linux_basic/0220filemanager_3.php#file_content_2)  
    
    
### head  
#### head -n NUM  
- NUM 为正数，显示前 n 行  
- NUM 为负数，显示除了最后 NUM 行以外的所有行  
    
![1](https://img-blog.csdnimg.cn/840ff8c756fd4c01b46db741571d7a03.png)  
![2](https://img-blog.csdnimg.cn/a8f4efd376ba4eaf9051d5340cffbd13.png)  
    
#### head -c NUM  
- NUM 为正数，打印前 NUM bytes 的字符  
- NUM 为负数，打印除了最后 NUM bytes 的字符  
    
![1](https://img-blog.csdnimg.cn/dae23b11e3564fc78dfe5ba1febc3b32.png)  
![2](https://img-blog.csdnimg.cn/ce2ffd1ca1d845099df82fdf9704ed08.png)  
![3](https://img-blog.csdnimg.cn/93c5c1f124964b4facc52888c738c8fe.png)  
    
```bash  
[root@ubuntu22-c0 1]$ cat 1  
1  
2  
3  
4  
5  
[root@ubuntu22-c0 1]$ head -n2 1  
1  
2  
[root@ubuntu22-c0 1]$ head -n -2 1  
1  
2  
3  
```  
    
## tail  
![1](https://img-blog.csdnimg.cn/e41fbc0ce43449e1ab672625052d2f9c.png)  
    
### tail -n NUM  
    
![1](https://img-blog.csdnimg.cn/26c79f356d4b4a04813b81fc853cf6d6.png)  
![2](https://img-blog.csdnimg.cn/57f59673a6d647b8ab57be97a94b17f2.png)  
    
```bash  
[root@ubuntu22-c0 1]$ cat 1  
1  
2  
3  
4  
5  
[root@ubuntu22-c0 1]$ tail -n2 1  
4  
5  
[root@ubuntu22-c0 1]$ tail -n -2 1  
4  
5  
[root@ubuntu22-c0 1]$ tail -n +2 1  
2  
3  
4  
5  
```  
    
### tail -c NUM  
    
![1](https://img-blog.csdnimg.cn/987e4855448a41e68505683c883e0405.png)  
![2](https://img-blog.csdnimg.cn/ae795be7d099484fba77e3ebf81cb684.png)  
    
    
### tail -f  
    
![1](https://img-blog.csdnimg.cn/3cad37030307458ba10f821dc8624c3f.png)  
    
    
## cut  
> [Linux cut命令](https://www.runoob.com/linux/linux-comm-cut.html)  
    
    
![1](https://img-blog.csdnimg.cn/c5a6478b73dd49c1882bb01fcae72f3f.png)  
    
### cut -b 以字节为单位分割  
![1](https://img-blog.csdnimg.cn/ef8eed5d4e3f402d8b2c668145afd2ac.png)  
![2](https://img-blog.csdnimg.cn/7333e9068047407f87df11501af5d035.png)  
![3](https://img-blog.csdnimg.cn/5b044ecbb08745338223220661131dfc.png)  
![4](https://img-blog.csdnimg.cn/fa17436211334ff58e43fbe6a71bf668.png)  
    
### cut -c 以字符为单位分割  
![1](https://img-blog.csdnimg.cn/cec14564d1e443a5842599898501e107.png)  
![2](https://img-blog.csdnimg.cn/b265be093bc447959baaf7e0c99fce7c.png)  
    
    
#### cut -f 按照区域为单位分割  
默认用 tab 为分隔符，可以用 `-d` 选项指定分隔符。  
    
![1](https://img-blog.csdnimg.cn/b100781ea0c34653aafe0eaf2538bfdb.png)  
![2](https://img-blog.csdnimg.cn/5cb79c0f35f84ee287d9eb66ed8562f9.png)  
![3](https://img-blog.csdnimg.cn/076153ceb4d84d0e82f568f4ba3ce085.png)  
![4](https://img-blog.csdnimg.cn/8ace7f60dfac45548e7b3168b616a94c.png)  
![5](https://img-blog.csdnimg.cn/31b5a1e35169472bb3d0aa1b413bdd08.png)  
    
#### cut --complement 反选  
    
![1](https://img-blog.csdnimg.cn/732ffa65a2324bc6b45366b656b520a3.png)  
    
#### cut --output-delimiter 指定输出分隔符  
    
![1](https://img-blog.csdnimg.cn/a39956607af0492fb55c0c621a8436e6.png)  
![2](https://img-blog.csdnimg.cn/6154e9138c93471f8b2821bdeb011649.png)  
    
    
### paste 合并文件  
> [10 examples of paste command usage in Linux](https://www.theunixschool.com/2012/07/10-examples-of-paste-command-usage-in.html)  
    
    
    
默认合并的两个文件以 tab 分隔  
![1](https://img-blog.csdnimg.cn/7b3d6cc64d8e49b090a590a67333875f.png)  
    
#### paste -d 指定分隔符  
    
![1](https://img-blog.csdnimg.cn/be6b96a9be8d4bd59da6938e952d8339.png)  
    
![2](https://img-blog.csdnimg.cn/2d1cce0284de4698924ee876d0900c87.png)  
    
    
#### paste -s 将文件以行方式合并  
    
![1](https://img-blog.csdnimg.cn/ca3174fb5ef34c5cb8f08caf8150af33.png)  
    
    
    
## 查看文件内容——非纯文本文件  
### od  
> [非纯文字档： od](http://cn.linux.vbird.org/linux_basic/0220filemanager_3.php#od)  
> [Linux od命令](https://www.runoob.com/linux/linux-comm-od.html)  
    
### hexdump 查看二进制文件  
> [Linux命令学习总结：hexdump](https://www.cnblogs.com/kerrycode/p/5077687.html)  
    
### jq 查看 json 格式文件  
    
# inode  
> [理解inode](http://www.ruanyifeng.com/blog/2011/12/inode.html)  
> [认识 EXT2 文件系统](http://cn.linux.vbird.org/linux_basic/0230filesystem_1.php)  
    
    
- 每个文件系统的 inode 编号独立  
- 文件系统没有 inode 号，但还有存储空间，也不能新建文件  
- inode 部分看深入理解计算机系统页表  
- 不同分区 inode: df -i (查看多少分区，当前文件在哪个分区)  
- 不同分区的 inode，不同分区有相同一个 inode 号  
    
# 输入输出重定向  
> [第十一章、认识与学习 BASH](http://cn.linux.vbird.org/linux_basic/0320bash_5.php)  
> [Input Output Redirection in Linux/Unix Examples](https://www.guru99.com/linux-redirection.html)  
> [Input Output Redirection on Linux Explained](https://devconnected.com/input-output-redirection-on-linux-explained/)  
> [shell中的"2>&1"是什么意思？](https://blog.csdn.net/Rbaggio92/article/details/52003250)  
> [Input/Output Redirection in the Shell](https://thoughtbot.com/blog/input-output-redirection-in-the-shell)  
> [Input/Output Redirection in Unix](http://www.unixmantra.com/2013/09/input-output-redirection-in-unix.html)  
> [linux redirection: difference between using "2>&1" before and after "> somfilename"](https://stackoverflow.com/a/54960560/12342782)  
> 用 dup2 函)数实现重定向，解释重定向的过程：[38.2 - The dup2 System Call - A C tutorial for redirecting stdin and stdout using system calls](https://youtu.be/PIb2aShU_H4)  
> [dup(2) — Linux manual page](https://man7.org/linux/man-pages/man2/dup.2.html)  
> bash 帮助手册在线文档：[3.6 Redirections](https://www.gnu.org/software/bash/manual/html_node/Redirections.html)  
> [2.7 Redirection](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_07)  
    
    
## 查看帮助文档  
![1](https://img-blog.csdnimg.cn/c353b37ca16e4f448771b19fe0b66d08.png)  
    
- `man bash` 查看帮助文档，搜索 `REDIRECTION` 关键词可找到重定向的说明  
    
## 文件描述符  
- 标准输入：0  
- 标准输出：1  
- 标准错误：2  
    
    
## 1> 或 >：标准输出重定向到文件  
1. 如果重定向的文件不存在，则创建该文件，如果文件在不存在的目录中，提示错误  
![1](https://img-blog.csdnimg.cn/419daf72013a44608fe16fb3db296aa1.png)  
    
2. 如果重定向文件已存在，1> (>) 覆盖源文件，1>>（>> ）在源文件中追加内容  
![2](https://img-blog.csdnimg.cn/43b42a7d040e4c13966b22f649a7e8ed.png)  
    
## >&fd：根据 fd 重定向到标准输出或标准错误  
> [Input/Output Redirection in the Shell](https://thoughtbot.com/blog/input-output-redirection-in-the-shell)  
    
    
将标准错误重定向到标准输出：  
![1](https://img-blog.csdnimg.cn/1c7a32bee4684212a13f496284441378.png)  
    
![2](https://img-blog.csdnimg.cn/68f346f0e58245ea8a1344bb91de36d4.png)  
    
    
## 2>： 错误重定向  
- 标准错误包括一些提示语  
![1](https://img-blog.csdnimg.cn/466f55ea862c48a7a658b47ded0dc47f.png)  
![1](https://img-blog.csdnimg.cn/c5db16a69b334d2da6e0c893d3d70a1d.png)  
![2](https://img-blog.csdnimg.cn/994b2348b59c42aea6f0b48cdc1a72d6.png)  
    
## 标准输出和标准错误分开放不同文件  
![1](https://img-blog.csdnimg.cn/097d226a794d4491988975ab1e215803.png)  
    
## &>：标准输出和错误放到同一文件  
    
![1](https://img-blog.csdnimg.cn/f8ba169567a442b2975c4e1a9c758530.png)  
![2](https://img-blog.csdnimg.cn/f0956065c82f461abbbf5f3ad2a17635.png)  
    
    
![1](https://img-blog.csdnimg.cn/5f9e8740b9134a96af8692bb1ee1da16.png)  
    
## 注意重定向的顺序  
> [linux redirection: difference between using "2>&1" before and after "> somfilename"](https://stackoverflow.com/a/54960560/12342782)  
> 用 dup2 函数实现重定向，解释重定向的过程：[38.2 - The dup2 System Call - A C tutorial for redirecting stdin and stdout using system calls](https://youtu.be/PIb2aShU_H4)  
> 和上面的视频讲的描述一样，有伪代码：[linux redirection: difference between using "2>&1" before and after "> somfilename"](https://stackoverflow.com/a/54960021/12342782)  
> [dup(2) — Linux manual page](https://man7.org/linux/man-pages/man2/dup.2.html)  
> bash 帮助手册在线文档：[3.6 Redirections](https://www.gnu.org/software/bash/manual/html_node/Redirections.html)  
> [2.7 Redirection](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_07)  
    
    
![1](https://img-blog.csdnimg.cn/842126740b034ae1a1a7cbaff933172a.png)  
    
    
## 丢弃标准输出或错误  
![1](https://img-blog.csdnimg.cn/5cb9e3c6e48d48518c7a40fb20a84de1.png)  
    
## 重定向不覆盖已存在文件  
- 默认设置会覆盖已存在的文件。  
    
1. set -o noclobber  
![1](https://img-blog.csdnimg.cn/dfa9674161404454984ba8a39539cec3.png)  
    
2. set -C  
	- `help set` 查看 `set` 选项  
	- `set -C` 设置该选项  
	- `set +C` 取消该设置  
![1](https://img-blog.csdnimg.cn/d007154d0ff4467bbfcd17252ee0ac36.png)  
![2](https://img-blog.csdnimg.cn/43236e0981c942139926d1006a58b147.png)  
    
    
## set -e 如果输出有错误则退出  
- `help set` 查看帮助文档  
- `set -e` 设置选项  
- `set +e` 取消设置  
![1](https://img-blog.csdnimg.cn/5cd2d5a09bb5420d9cf3c817a054351f.png)  
    
## cat > 终端输入的内容重定向到文件  
![1](https://img-blog.csdnimg.cn/b7f9d40c763540a38f79f11e667a9843.png)  
![2](https://img-blog.csdnimg.cn/d0591553791d49c7ac3ad9492fe0f650.png)  
    
## 多个命令输出内容重定向  
    
![1](https://img-blog.csdnimg.cn/a868442191654e9a9325a0c3a8622902.png)  
    
    
## 输入重定向  
![1](https://img-blog.csdnimg.cn/61b2d44cea54478990e419567528f334.png)  
    
- 用文件内容作为输入代替键盘输入  
- 注意命令是否支持标准输入，不支持则不能用输入重定向  
- 直接输入命令后回车，支持标准输入的则会等待输入，如 `cat`，`bc`  
    
    
# | 管道  
- 管道 `|` 的前面要支持标准输出，后面要支持标准输入  
- 不支持标准错误，如果要处理标准错误，需要将标准错误重定向到标准输出  
- 管道的左右两边都在子进程中执行  
    
![](img/2023-03-19-17-53-13.png)  
![](img/2023-03-19-17-54-03.png)  
    
    
# tr 字符转换或删除  
> [Linux tr Command with Examples](https://phoenixnap.com/kb/linux-tr)  
> [Tr Command in Linux with Examples](https://linuxize.com/post/linux-tr-command/)  
    
    
![1](https://img-blog.csdnimg.cn/9cfe2d005be44547b4564d7f7743d594.png)  
    
    
## tr 替换  
    
![1](https://img-blog.csdnimg.cn/df9d1f8e326249ffa970ee003da605bc.png)  
![2](https://img-blog.csdnimg.cn/94b85d601d304e4988bab5a98e737e7b.png)  
![3](https://img-blog.csdnimg.cn/1983e29420374f94b025d5d25e5e5af6.png)  
![4](https://img-blog.csdnimg.cn/ce1854d10be14d9d9d6d5d3ef4584fb8.png)  
    
    
## tr -s 将重复的字符进行压缩再替换  
    
![3](https://img-blog.csdnimg.cn/700bc9ee1ea141febb7d56439d63b5dc.png)  
![4](https://img-blog.csdnimg.cn/23bbeb75e07a420583dc9f5984186454.png)  
    
## tr -d 删除字符  
    
![1](https://img-blog.csdnimg.cn/cf6acc29594140e38c2db5e496de10f0.png)  
    
## tr -c 反选替换  
- 下面例子中，要替换的字符比用来替换的字符多，全替换为 `y`  
- 注意排除字符时可能会包含最后的换行符，可用 `echo -n` 去掉换行符  
    
![1](https://img-blog.csdnimg.cn/e46a3631bcdf457589362a3cdaa13dba.png)  
![2](https://img-blog.csdnimg.cn/4237ef5c53864806aeb420b8cbd7f9be.png)  
![](img/2023-03-19-17-21-32.png)  
![](img/2023-03-19-17-22-52.png)  
![](img/2023-03-19-17-24-46.png)  
    
## tr -t 将原字符的长度减少到和替换字符相同  
- `t` 代表 `truncate`  
- 默认替换时如果用来替换的字符比需要替换的字符少，后面的字符全部替换为用来替换的最后一个字符  
- 使用 `-t` 选项后，多余的字符不再替换，只替换 `SET2` 的字符数目  
![1](https://img-blog.csdnimg.cn/340110e5689b4f93a58032f04da9e690.png)  
    
## tr 处理的结果保存到文件  
    
![1](https://img-blog.csdnimg.cn/148d30a59a184f988c4c322bdf8e41ae.png)  
![2](https://img-blog.csdnimg.cn/ecbf3dacc9834bd3ab33d016db547d7d.png)  
    
    
## tr -d "[:digit:]"  
    
![](img/2023-03-15-09-22-08.png)  
    
&nbsp;  
    
# Here 文档 输入多行字符串  
> [Here-Document](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_07_04)  
> [How to Use “Here Documents” in Bash on Linux](https://www.howtogeek.com/719058/how-to-use-here-documents-in-bash-on-linux/)  
> [Here 文档 ](https://wangdoc.com/bash/quotation#here-%E6%96%87%E6%A1%A3)  
    
    
![1](https://img-blog.csdnimg.cn/3d5701eb62af4cc098ae6631747d4547.png)  
    
# Here 字符串  
> [Here 字符串](https://wangdoc.com/bash/quotation#here-%E5%AD%97%E7%AC%A6%E4%B8%B2)  
    
    
- 将字符串通过标准输入传递给命令  
![1](https://img-blog.csdnimg.cn/5853815999ac47ddb1c11755dde407d3.png)  
![](img/2023-03-19-17-31-57.png)  
    
&nbsp;  
    
# 进程替换 <(list)  >(list)  
> [Process Substitution: An Uncommon but Advanced Way for Input/Output Redirection in Linux](https://linuxhandbook.com/bash-process-substitution/)  
> [Chapter 23. Process Substitution](https://tldp.org/LDP/abs/html/process-sub.html)  
    
    
![](img/2023-03-18-15-41-00.png)  
    
# tee 命令  
> [How to Use the Linux tee Command](https://phoenixnap.com/kb/linux-tee)  
> [Linux tee命令](https://www.runoob.com/linux/linux-comm-tee.html)  
    
    
- `tee` 命令用来将标准输入同时显示到标准输出和文件中  
- tee [FILE]  
- 如果有相同的文件存在，默认覆盖原来的内容  
![1](https://img-blog.csdnimg.cn/5179ca92697c4f10ba177d1e23b62ba6.png)  
![2](https://img-blog.csdnimg.cn/47ba7b0538694efca7c730f65301aae1.png)  
- tee -a [FILE]  
有相同的文件，则追加内容而不是覆盖  
![3](https://img-blog.csdnimg.cn/098fcfc49399435ea43e8386d081d1fe.png)  
- tee [FILE1] [FILE2] 标准输入保存到多个文件  
![4](https://img-blog.csdnimg.cn/9ddd9ad488634c8aa861e7dabf89cc05.png)  
- 不显示标准输出的内容  
![5](https://img-blog.csdnimg.cn/9ee5539ca98c46aca81e93d6970fd152.png)  
![6](https://img-blog.csdnimg.cn/44aa08666420415385eee96b98b37587.png)  
    
## 将标准输入内容保存到文件  
利用 here document 在终端输入多行内容并保存到文件  
```bash  
➜  ls  
➜  tee 1.txt <<EOF  
heredoc> a  
heredoc> b  
heredoc> c  
heredoc> EOF  
a  
b  
c  
➜  cat 1.txt  
a  
b  
c  
➜  cat /etc/issue  
Ubuntu 20.04.5 LTS \n \l  
```  
    
## 用 root 权限保存 vim 修改的文档  
> [How does the vim "write with sudo" trick work?](https://stackoverflow.com/questions/2600783/how-does-the-vim-write-with-sudo-trick-work)  
    
普通用户编辑一个需要 root 权限的文档时，不能直接用 `:w` 保存，此时可以在命令行输入 `:w !sudo tee % > /dev/null` 保存  
    
后面的 `> /dev/null` 将标准输出的内容不显示，因为 `tee` 命令会将当前 vim buffer 的内容显示到标准输出  
    
`%` 表示当前的文档名  
    
# getent 命令  
> [Linux getent 命令手册](https://www.360blogs.top/linux-getent-cmd/)  
    
# 文件压缩  
> [压缩文件的用途与技术](http://cn.linux.vbird.org/linux_basic/0240tarcompress_1.php)  
> [Linux 系统常见的压缩命令](http://cn.linux.vbird.org/linux_basic/0240tarcompress_2.php)  
    
    
常见压缩文件扩展名：  
    
![1](https://img-blog.csdnimg.cn/a8d4ce01a46148c98ab7f5b822b46268.png)  
    
- 文件压缩指令只能针对单个文件压缩，不能压缩目录。  
    
## compress 压缩  
### 一些比较小或者空的文件不能压缩  
![1](https://img-blog.csdnimg.cn/512a62d5ef1c4348b536bb7290dd5d97.png)  
### compress -r 递归压缩目录中的全部文件  
- 压缩的为单个文件，不打包  
![2](https://img-blog.csdnimg.cn/f56ce3a1666a43e98887b1a2186fef7a.png)  
### compress -v 显示压缩过程的信息  
### compress -d 解压缩  
![3](https://img-blog.csdnimg.cn/2c0f7dfd8ca04c5594efa143a0dea8ef.png)  
    
&nbsp;  
    
### zcat 查看压缩后文件  
![2](https://img-blog.csdnimg.cn/34d8b4e6b88a4d6cbc358a2b3ffd1961.png)  
    
### uncompress 解压缩  
和 `compress -d` 效果一样  
![3](https://img-blog.csdnimg.cn/4198d6608c8e4f15853b274f4608d698.png)  
    
## gzip 压缩文件  
> [Linux gzip命令：压缩文件或目录](http://c.biancheng.net/view/783.html)  
    
gzip  只能压缩文件，不能压缩目录  
![1](https://img-blog.csdnimg.cn/32dc7ecdccad49d1a1a05260e8a8c067.png)  
![2](https://img-blog.csdnimg.cn/1e66a044043d4f3087ba4a8f3800de13.png)  
    
### gzip 可以压缩空的或很小的文件  
![1](https://img-blog.csdnimg.cn/ec18fbf933fd44f1b0be35d35d940dfd.png)  
![2](https://img-blog.csdnimg.cn/e6863e9b7edd47a9ae5a4347f2cef360.png)  
    
### gzip -v 显示压缩比  
- 显示的百分比为减少的百分比，不是压缩后的文件与源文件的百分比  
![2](https://img-blog.csdnimg.cn/bfa63a4857164aaa8abde200c2172296.png)  
    
### gzip -d 解压缩  
![3](https://img-blog.csdnimg.cn/3c97edd810c344e18766193c50af212e.png)  
    
### gzip -c 保留源文件，将压缩数据输出到标准输出  
![4](https://img-blog.csdnimg.cn/3257faa086fa459b8f37dfc8ac32edc3.png)  
    
### gzip -数值 指定压缩等级  
- 1 等级最低，压缩比最差  
- 9 等级最高，压缩比最好，需要时间更长  
- 默认等级为 6  
    
![5](https://img-blog.csdnimg.cn/1e8aef4877064a9994bd711509855220.png)  
  
### gzip -r 递归压缩目录中全部文件  
gzip 不能压缩目录，递归压缩的只是文件，文件未打包，是单个文件  
![6](https://img-blog.csdnimg.cn/63d110a870c04c04976041b0c025d59a.png)  
    
    
### gunzip 解压 .gz 文件  
相当于 `gzip -d`  
    
### zcat zmore zless 查看 .gz 压缩文件内容  
![1](https://img-blog.csdnimg.cn/40fc75e036a14760a8d46c2bd4415540.png)  
    
## bzip2 压缩文件  
![1](https://img-blog.csdnimg.cn/97990f9c50fa41f98deea28079039ccc.png)  
    
### bzip2 能压缩空文件  
![1](https://img-blog.csdnimg.cn/ded648f8d1014598bd6bbd1f987bcf25.png)  
    
### bzip2 不能压缩目录  
bzip2 没有 `-r` 选项，不能递归压缩目录中的文件  
![1](https://img-blog.csdnimg.cn/0fcac291480e49c3adeccddd9eee65d6.png)  
![2](https://img-blog.csdnimg.cn/b21640cff794424ca0c17cc9f1f8f893.png)  
    
### bzip2 -v 显示压缩比  
![2](https://img-blog.csdnimg.cn/2d79504d2baa4006a99adb562867bb2c.png)  
    
### bzip2 -d 解压缩 .bz2 的文件  
![3](https://img-blog.csdnimg.cn/ae65eb366f1144e4b33afe311df9daf9.png)  
    
### bzip2 -k 压缩文件并保留源文件  
`--keep` keep input files during compression or decompression  
![4](https://img-blog.csdnimg.cn/b81b051a54d14702b213feb1c5286de0.png)  
    
### bzip2 -c  
- 将压缩的文件输出到标准输出  
- 直接输出到终端会提示错误  
- 可以结合重定向将输出的压缩文件内容重定向到一个文件  
    
![1](https://img-blog.csdnimg.cn/578a796155eb48ed9273a31bf2f7a431.png)  
![1](https://img-blog.csdnimg.cn/21fb597fc5664a0c8f00bdefdd789167.png)  
    
    
### bzip2 -数字 设置压缩比  
和 gzip 相同  
![5](https://img-blog.csdnimg.cn/a4b2ba732e53478b998fb85e334c0dd2.png)  
    
### bzcat bzmore bzless 查看 .bz2 压缩文件内容  
相当于 bzip2 -dc，不会将文件解压，而是将解压的内容输出到标准输出。  
    
![6](https://img-blog.csdnimg.cn/561eade21e704327a2d139b9a8d10dd0.png)  
    
## xz 压缩  
    
### xz 不能压缩目录  
- `xz` 没有 `-r` 选项，不能压缩目录，也不能递归压缩目录下的文件  
![1](https://img-blog.csdnimg.cn/eef7eeefbbb140fd92c771a058e18665.png)  
- 可以通过其他方式同时压缩多个文件  
![2](https://img-blog.csdnimg.cn/9fc4a6e29ab9490cb2cac9efc97f7513.png)  
<br/>  
    
### xz -v 显示压缩比信息  
![1](https://img-blog.csdnimg.cn/195960805e9a44039112f1bc8bddf0df.png)  
    
<br/>  
    
### xz -l 列出压缩文件的信息  
![1](https://img-blog.csdnimg.cn/9ee7ff49f3034633805d43bd1a684abe.png)  
    
<br/>  
    
### xz -k 压缩并保留源文件  
![1](https://img-blog.csdnimg.cn/ff5dcc6d5fd0448c86157f0edb00ce8b.png)  
    
<br/>  
    
### xz -d 解压缩文件  
![1](https://img-blog.csdnimg.cn/aaf6f23937554521aa518dae0a400a0f.png)  
    
### unxz 解压缩  
- 相当于 `xz -d`  
    
    
### xz -数字 设置压缩比  
- 同 bzip2 -数字  
    
### xzcat xzmore xzless 查看 .zx 压缩文件内容  
![1](https://img-blog.csdnimg.cn/6ab8fcc8e5234336a4f0a36fedf48bbd.png)  
    
## zip 打包压缩  
> [Linux zip 命令](https://www.runoob.com/linux/linux-comm-zip.html)  
> [How to Zip Files and Directories in Linux](https://linuxize.com/post/how-to-zip-files-and-directories-in-linux/)  
    
    
### 压缩多个文件  
![1](https://img-blog.csdnimg.cn/06fe19326d4a412da939b5edcab40a6a.png)  
    
&nbsp;  
    
### -r 压缩目录  
![1](https://img-blog.csdnimg.cn/d2b332c812c14274a0ee8ac9cf24f4cd.png)  
    
&nbsp;  
    
### -q 压缩时不显示执行过程  
![1](https://img-blog.csdnimg.cn/d4c4bc9ca1bd4a8d9a7785c5cee2c503.png)  
    
&nbsp;  
    
### -Z 指定压缩方法 bzip2  
![1](https://img-blog.csdnimg.cn/669237db0b4b4565b94c5398f9802d36.png)  
![1](https://img-blog.csdnimg.cn/dd4abaf6fdba43c5bf9941962382b7a3.png)  
    
&nbsp;  
    
### 指定压缩等级  
- xz 相同  
![1](https://img-blog.csdnimg.cn/27771b82ab4e4c068d221b3bdea71cc8.png)  
    
<br/>  
    
### -e 创建密码  
![1](https://img-blog.csdnimg.cn/031a60274d1f4aa9a1ac6afec6edc4a8.png)  
    
<br/>  
    
### -s 压缩成多个分卷  
- 单位为 k，m，g，t，**不区分大小写**，但分卷的最小大小为 64K，小于这个大小不能分卷。  
![1](https://img-blog.csdnimg.cn/02060ad40de44838a824f613c858d270.png)  
![2](https://img-blog.csdnimg.cn/66cc9cd820224f838fc4d8f2d2f60f0e.png)  
    
<br/>  
    
### -0 打包但不压缩  
- 数字为 0 ~ 9，0 不压缩，1 压缩比最低，速度最快；9 压缩比最高，速度最慢  
    
![1](https://img-blog.csdnimg.cn/eeb53ca5da374489bca96f8acb3faf2e.png)  
    
&nbsp;  
    
### -c 为每个文件添加备注  
![1](https://img-blog.csdnimg.cn/cfe296306ec44b48a95fb7752823596d.png)  
&nbsp;  
    
## unzip 解压缩  
### -d 指定解压缩目录  
目录不存在会创建，但不能递归创建目录。  
    
![1](https://img-blog.csdnimg.cn/65f15bb0540049a39caf96ca253b9d22.png)  
    
&nbsp;  
    
### -q 不显示提示信息  
![2](https://img-blog.csdnimg.cn/242b55a0dfcc4477b457d058801d1af5.png)  
    
&nbsp;  
    
### -x 解压时排除部分文件  
![1](https://img-blog.csdnimg.cn/85729b9c3ed04f31a10ff6829debb021.png)  
&nbsp;  
    
### -o 不询问是否覆盖相同文件，直接覆盖  
![1](https://img-blog.csdnimg.cn/b5ea211ce25c46a58dd26eea96c6084b.png)  
&nbsp;  
    
### -n 不覆盖已存在的相同文件  
![1](https://img-blog.csdnimg.cn/a33f7bd0e6274badbcdf0466ded5f6c5.png)  
&nbsp;  
    
### -l 列出压缩文件的内容  
![1](https://img-blog.csdnimg.cn/ca10eaf1811f41f58d0bf7cfbbb7cbb4.png)  
![2](https://img-blog.csdnimg.cn/a8424dc91531407593e709308ad97e26.png)  
![3](https://img-blog.csdnimg.cn/8c4f1185d30e494fbdefc3aeb041889c.png)  
&nbsp;  
    
# 文件打包  
## tar  
> [ 打包命令: tar](http://cn.linux.vbird.org/linux_basic/0240tarcompress_3.php)  
> [Tar Command in Linux (Create and Extract Archives)](https://linuxize.com/post/how-to-create-and-extract-archives-using-the-tar-command-in-linux/)  
> [Linux tar 命令](https://www.runoob.com/linux/linux-comm-tar.html)  
    
    
### -cf 创建打包文件  
- `-c` 选项创建打包文件  
- `-f` 选项指明打包后文件名，**后面必须为文件名不能是其他选项**  
![1](https://img-blog.csdnimg.cn/4d31ff829f254528857198da12fd97bc.png)  
- 如果打包目录，默认将目录中全部内容**递归打包**  
![2](https://img-blog.csdnimg.cn/08b55f65a6aa431399587e43648e9e6b.png)  
![3](https://img-blog.csdnimg.cn/3846b7e0686c417aa1d1ee42aa5e1099.png)  
![4](https://img-blog.csdnimg.cn/c1b0800e81664c8ab366cd29f4725d42.png)  
    
### -v 显示正在处理的文件  
![1](https://img-blog.csdnimg.cn/1f70d848bb13474583a1bc94dfd25313.png)  
    
### -t 查看打包的文件名  
- List the contents of an archive  
![1](https://img-blog.csdnimg.cn/e481b9e488a042c68b1dfd9fca143ff5.png)  
    
- 加上 `-v` 选项可查看文件的属性等信息  
![2](https://img-blog.csdnimg.cn/56cba031887d4ae8a90844ef0ab79ae1.png)  
    
### -z 创建 gzip 压缩的打包文件  
- `-z` 选项表明采用 gzip 压缩  
- 打包文件后缀最好为 `.tar.gz`  
  
![1](https://img-blog.csdnimg.cn/f9c3e556409a4a399a2c34a82dbda567.png)  
    
### -j 创建 bzip2 压缩的打包文件  
- `-j` 选项采用 bzip2 压缩打包文件  
- 打包文件的后缀最好为 `.tar.bz2`  
  
![1](https://img-blog.csdnimg.cn/d1fb648194e34ef5882fd7662563eb96.png)  
    
### -J 创建 xz 压缩的打包文件  
- `-J` 选项采用 xz 压缩打包文件  
- 打包文件的后缀最好为 `.tar.xz`  
  
![1](https://img-blog.csdnimg.cn/0ae2672a51454d4cbade0dc3b58a3bef.png)  
    
### -x 解打包文件 将打包文件中的文件提取出来  
- Extract files from an archive  
- 用 gzip、bzip2 或 xz 压缩的打包文件解打包过程相同，无需特殊的选项  
- 默认提取出来的文件在当前目录  
    
![1](https://img-blog.csdnimg.cn/127e48ca6d234819bb2dbba28d6a7c4b.png)  
    
### -C 解打包时将里面的文件提取到其他目录  
- Change directory  
![1](https://img-blog.csdnimg.cn/a72a77f083d246d3a93c8a9b44f7b929.png)  
    
### -p 保留权限  
![1](https://img-blog.csdnimg.cn/180703fcc0d24193bf6ca5a6918a575f.png)  
    
普通用户默认打包后再解打包文件的权限和属性会改变，root 用户不会改变。  
    
1. 初始文件权限和属性  
![1](https://img-blog.csdnimg.cn/ed95b94ca00348d4bd46350cdb5a3273.png)  
    
2. 打包后用 -t 查看，权限和属性未改变  
![2](https://img-blog.csdnimg.cn/8ad701f0fc2a4f8c952473ee75d0f93b.png)  
    
3. 解打包后所属者和所属组改变  
![3](https://img-blog.csdnimg.cn/284161e56ff246848b40af678408bbde.png)  
![4](https://img-blog.csdnimg.cn/0c51750c8e074f8f958486f6a87ddfd6.png)  
![5](https://img-blog.csdnimg.cn/8689258fc3da48f5a93ead7599675b85.png)  
    
### -P 保留绝对路径符  
![1](https://img-blog.csdnimg.cn/1abb2d2dea7d4dcab90d29b0b012fe45.png)  
![2](https://img-blog.csdnimg.cn/279e1f8a4c5c46018de7186b2a8699e9.png)  
    
### --strip-components 去除目录结构  
1. 原始目录结构：  
```bash  
[root@docker tmp]$ tree dir1/  
dir1/  
├── subdir1  
│   └── t1.txt  
└── subdir2  
    └── t2.txt  
    
2 directories, 2 files  
```  
    
2. 将该目录打包  
```bash  
[root@docker tmp]$ tar zcvf dir1.tar.gz dir1/  
```  
    
3. 直接解压到其他目录中，解压后目录结构和原始相同  
```bash  
[root@docker tmp]$ tar xzvf dir1.tar.gz  -C dir1-1/  
dir1/  
dir1/subdir2/  
dir1/subdir2/t2.txt  
dir1/subdir1/  
dir1/subdir1/t1.txt  
[root@docker tmp]$ ls  
dir1  dir1-1  dir1.tar.gz  
[root@docker tmp]$ tree dir1-1/  
dir1-1/  
└── dir1  
    ├── subdir1  
    │   └── t1.txt  
    └── subdir2  
        └── t2.txt  
    
3 directories, 2 files  
```  
    
4. 解压后去掉第一级目录  
```bash  
[root@docker tmp]$ tar xzvf dir1.tar.gz -C dir1-2/ --strip-components=1  
dir1/subdir2/  
dir1/subdir2/t2.txt  
dir1/subdir1/  
dir1/subdir1/t1.txt  
[root@docker tmp]$ tree dir1-  
dir1-1/ dir1-2/  
[root@docker tmp]$ tree dir1-2  
dir1-2  
├── subdir1  
│   └── t1.txt  
└── subdir2  
    └── t2.txt  
    
2 directories, 2 files  
```  
    
5. 解压后去掉第二级目录  
```bash  
[root@docker tmp]$ tar xzvf dir1.tar.gz -C dir1-3/ --strip-components=2  
dir1/subdir2/t2.txt  
dir1/subdir1/t1.txt  
[root@docker tmp]$ tree dir1-3  
dir1-3  
├── t1.txt  
└── t2.txt  
    
0 directories, 2 files  
```  
    
### 打包多个文件  
![1](https://img-blog.csdnimg.cn/96a774a4ec844b45980c5e540c611ee5.png)  
    
### --exclude 打包时排除部分文件或目录  
注意 --exclude 的位置：  
![1](https://img-blog.csdnimg.cn/7213e3eee84c4e1ca2de5738e15e4e29.png)  
![2](https://img-blog.csdnimg.cn/a5100d5f4af245ba85f3cfb85904e70a.png)  
    
# 文件拆分  
## slpit  
> [split命令_Linux split命令：切割（拆分）文件](http://c.biancheng.net/linux/split.html)  
> [9 Useful Examples of the Split Command in Linux](https://linuxhandbook.com/split-command/)  
    
    
    
### split -l 按照文件的行划分  
- `-l` 指定分割的一份文件有多少行  
- `--lines=NUMBER`  
![1](https://img-blog.csdnimg.cn/2e2d3a8a95344c70b59ba95600843f0a.png)  
    
### split -n 将文件分成几份  
- `--number=CHUNKS`  
![1](https://img-blog.csdnimg.cn/7bf89feffadb48b98b359880410fbb37.png)  
    
### split -a 修改子文件后缀长度  
- 默认长度 2，aa，ab，ac 等。  
![1](https://img-blog.csdnimg.cn/0a893c76b7b645f189ae2b35a0a12e61.png)  
    
### split -d 子文件后缀用数字  
![1](https://img-blog.csdnimg.cn/b6c0dfe42e37443aa42827904fe659ac.png)  
    
### split -b 按照文件大小划分子文件  
![1](https://img-blog.csdnimg.cn/7f078c0711834fc9ba5776dcc8083898.png)  
    
### split -C 设置子文件的最大尺寸  
![1](https://img-blog.csdnimg.cn/468847bdd8e2488daa4570eff9a51181.png)  
    
### 将划分的子文件组合起来  
![1](https://img-blog.csdnimg.cn/28b1207987674f04b7bb2892ca6b4919.png)  
    
# sort 文件内容排序整理  
> [Linux sort Command with Examples](https://phoenixnap.com/kb/linux-sort)  
> [10 Useful Examples of the Sort Command in Linux](https://linuxhandbook.com/sort-command/)  
    
    
## sort filename  
默认将文件内容每行按照第一个字符排序，数字在前（0-9，如果是 10 只识别 1，负数识别符号 -），先小写字母，然后大写字母。  
    
![1](https://img-blog.csdnimg.cn/afe92a323f784fe0bcde5e9da6d2a595.png)  
![2](https://img-blog.csdnimg.cn/cd5d4beb86b145d9be11fa17a17b7084.png)  
    
<br/>  
    
## sort -o 保存排序后内容到文件  
    
![1](https://img-blog.csdnimg.cn/8b31dedba8714107a63e4ec47e7b6bc3.png)  
    
也可以用重定向实现相同的效果：  
![2](https://img-blog.csdnimg.cn/91057455e5d94d96bc46f73f77741386.png)  
    
<br/>  
    
## sort -c 检查文件是否已排序  
![1](https://img-blog.csdnimg.cn/d8e661ecb7e647a4aec2ac7c32a6684f.png)  
    
<br/>  
    
    
## sort file1 file2 将多个文件内容排序  
![1](https://img-blog.csdnimg.cn/2735c90eaad148be8dd0e2b1a926b328.png)  
    
可以用下面方法实现相同的效果：  
![2](https://img-blog.csdnimg.cn/c48b37acc1934e1db2e7d5e1cc059fbd.png)  
![3](https://img-blog.csdnimg.cn/14f8877dbb904f9e8aa526c38b16bdf4.png)  
    
<br/>  
    
    
## sort --files0-from=F  
    
![1](https://img-blog.csdnimg.cn/94b992e8a02b4e14aa4bc194890632ba.png)  
 ![2](https://img-blog.csdnimg.cn/c669d53fa3c24ec8bb29d1fc9eed5707.png)  
    
<br/>  
    
## 将排序后的内容加上行号  
![1](https://img-blog.csdnimg.cn/203c6ca6b221499b9f8edbdc5a8d4e7f.png)  
    
<br/>  
    
## sort -r 将排序后的结果逆序显示  
- 默认排序是从小到大，逆序后从大到小  
    
![1](https://img-blog.csdnimg.cn/c01ee96cd37f46a58e9d69a5d5dd6ae7.png)  
    
<br/>  
    
## sort -n 按照数字排序  
- `sort --numeric-sort`  
- 默认从小到大排序  
    
![](img/2023-03-14-20-55-05.png)  
<br/>  
    
    
## sort -R 随机排序，打乱顺序  
- `sort --Random-sort`  
    
![1](https://img-blog.csdnimg.cn/105062fb7af74734bcb16f3a344395d9.png)  
    
<br/>  
    
## sort -k 按照指定的列排序  
- `sort --key=KEYDEF`  
- 默认的分隔符为空格  
    
![](img/2023-03-14-21-08-21.png)  
<br/>  
    
## sort -t 指定分隔符  
- `sort --field-separator=SEP`  
- 用 sort -k 时默认的分隔符为空格，可以用 -t 修改分隔符。  
    
![1](https://img-blog.csdnimg.cn/38ce0688e3d44936a7a61123021facdb.png)  
    
<br/>  
    
    
## sort -u 去除相同的行  
- `sort --unique`  
    
![1](https://img-blog.csdnimg.cn/6817c04f5d8848768a61207b8997fc7b.png)  
![2](https://img-blog.csdnimg.cn/cbb602f78aa7449f890e8883a18b3118.png)  
    
<br/>  
    
# uniq 过滤文件中相邻的相同行  
    
## uniq 只去除相邻重复的行  
![2](https://img-blog.csdnimg.cn/4c636ba906cd4997812a54b4c3908b22.png)  
![3](https://img-blog.csdnimg.cn/f931529817aa4e0e801a6ede051cfca6.png)  
    
    
## -c 显示行的相邻重复数目  
![1](https://img-blog.csdnimg.cn/1d4d50ca33dd4654ae5fea27d4088603.png)  
    
## uniq -d 只显示有相邻重复行的行  
![1](https://img-blog.csdnimg.cn/cbc699a9b86d4ab1883e05e54359ee6f.png)  
    
## uniq -D 打印全部相邻重复的行  
![1](https://img-blog.csdnimg.cn/625d830a1b71450cb35caace9c80acb0.png)  
    
    
## uniq -u 只打印不相邻的行  
![1](https://img-blog.csdnimg.cn/48a663ec700849d3aae2bb67885bf568.png)  
![2](https://img-blog.csdnimg.cn/3de44d027b27488db934c5a539a53810.png)  
    
    
# 比较文件之间的不同之处  
## diff 查看两个文件的不同之处  
> [Linux 文本对比 diff 命令详解（整理）](https://www.cnblogs.com/wf-linux/p/9488257.html)  
    
- `diff` 只能查看文本文件的不同，不能比较二进制文件  
    
    
## patch 根据 diff 文件修复源文件  
![1](https://img-blog.csdnimg.cn/f3906493449c4468888ee0bdde9eba3e.png)  
    
<br/>  
    
## vimdiff 通过图形界面查看文件的不同  
![1](https://img-blog.csdnimg.cn/82fed04face14158af9424e684f56e6a.png)  
    
<br/>  
    
- 相当于 `vim -d`  
    
## cmp 查看文件之间差异  
> [10+ cmp command examples in Linux](https://www.golinuxcloud.com/cmp-command-in-linux/)  
    
    
- `cmp` 可查看二进制文件的差异  
    
# seq  
    
![1](https://img-blog.csdnimg.cn/a4ca5c30e1934af5bb82290a9ff23add.png)  
    
    
## seq -w 保持数字相同宽度  
    
![1](https://img-blog.csdnimg.cn/bc9d5ac205f84db3ac2574951db57732.png)  
    
<br/>  
    
## seq -f 用 printf 格式打印浮点数  
> [printf](https://cplusplus.com/reference/cstdio/printf/)  
> [Linux Seq Command - Print a Sequence of Numbers](https://www.putorius.net/seq-command-linux.html)  
> [Seq Command in Linux](https://linuxhandbook.com/seq-command/)  
    
用 `info seq` 查看详细介绍：  
    
![1](https://img-blog.csdnimg.cn/006ad49708a5409399ab83c75e6ae190.png)  
    
![2](https://img-blog.csdnimg.cn/6a29736398a4460a9d7a82db5e6006a0.png)  
    
![3](https://img-blog.csdnimg.cn/fb6a24521b214751991e8d174a34bd34.png)  
    
    
    
<br/>  
    
## seq -s 指定分隔符  
默认分隔符为换行符。  
    
![1](https://img-blog.csdnimg.cn/256fa2fb930c4fe3af6a1f09e7364415.png)  
    
![2](https://img-blog.csdnimg.cn/17c77e49e23e41fc9e9fea045ce239f5.png)  
    
    
## 进行加减乘除运算  
![1](https://img-blog.csdnimg.cn/cbf702772547485695f6381502bf7a92.png)  
![2](https://img-blog.csdnimg.cn/671ecfc998b648c29e8e18415e217f10.png)  
    
    
## 应用  
### 创建多个文件  
    
![1](https://img-blog.csdnimg.cn/3411432d752a43c099b1df865f63f680.png)  
    
### 将打印数字保存到文件  
![1](https://img-blog.csdnimg.cn/5d3c3de0141044729f3e08e3a32a5772.png)  
    
### 循环中使用  
    
![1](https://img-blog.csdnimg.cn/430987688640428f96b82e006bb6fa1d.png)  
<br/>  
    
# 不同格式文本查看  
## file 文件类型查看  
- `man file` 查看帮助文档  
    
      
## 二进制文件查看  
> [Linux命令学习总结：hexdump](https://www.cnblogs.com/kerrycode/p/5077687.html)  
    
    
## windows格式文件转换为 Unix 格式文件  
### vim 中转换  
- `:set ff=dos` 转换为 Windows 格式  
- `:set ff=unix` 转换为 unix 格式  
    
### dos2unix 转换  
> [Linux命令 dos2unix - 将DOS格式文本文件转换成Unix格式](https://www.w3cschool.cn/linuxc/linuxc-gvjq3lbf.html)  
    
- dos2unix 需要安装后才能使用  
![1](https://img-blog.csdnimg.cn/e96a88ceb20f45a2829224f145bfb060.png)  
    
# 查看文本中非打印字符  
## cat -A 显示出制表符、结束符等非打印字符  
![1](https://img-blog.csdnimg.cn/9087369b700547318d3f23431b3412ef.png)  
    
- `cat -v`  
Windows 格式的文件显示最后的 `^M` 标记，linux 格式文件不显示  
![](img/2023-03-17-09-58-44.png)  
    
- `cat -T` 将制表符显示为 `^I` 符号  
- `cat -E` 将行末的结束符显示出来  
    
    
## vim 中 list 模式显示制表符和行结束符号$  
![1](https://img-blog.csdnimg.cn/4a66d80b7db847a295f69a4c46dd005e.png)  
![2](https://img-blog.csdnimg.cn/ab4cc700bebd4648a896364af42241dd.png)  
    
- 能方便识别空格和制表符  
- 能识别出行结尾位置  
    
# grep  
> [20 grep command examples in Linux](https://www.golinuxcloud.com/grep-command-in-linux/)  
> [grep(1) — Linux manual page](https://man7.org/linux/man-pages/man1/grep.1.html)  
    
    
- `man grep` 或 `grep --help` 查看帮助  
![1](https://img-blog.csdnimg.cn/c30d1d8375a6444d8eb2b33e9fa89324.png)  
    
- 按行匹配  
- 默认区分大小写  
    
## grep 逐行匹配文本  
- grep 按行查看是否匹配给定的模式，模式打印匹配的一行内容  
![1](https://img-blog.csdnimg.cn/1099303dd9ad451c8d45303a9cc9f526.png)  
    
## grep 在多个文件中查找  
![1](https://img-blog.csdnimg.cn/0ad65d92cf904215b9692b19911c6e14.png)  
    
## grep -i 不区分大小写  
- `grep -i` 即 `grep --ignore-case`  
![2](https://img-blog.csdnimg.cn/da8f030b97c741d9941fa4c9a218eb29.png)  
    
## grep -w 必须整个 word 匹配  
- word 定义是字母、数字和下划线  
![1](https://img-blog.csdnimg.cn/59ad2360c86e41f5be15f57c4886faf2.png)  
![2](https://img-blog.csdnimg.cn/3dedf011a6c94444b35bd3be85d36ee6.png)  
- 中文也能匹配  
![3](https://img-blog.csdnimg.cn/5e2f80c4822d419da880b1d37ca5f483.png)  
    
    
## grep -c 显示匹配到的行数  
- 显示的以行为单位，如果匹配的只有一行，但该行中有几个匹配的内容，输出也为 1  
![1](https://img-blog.csdnimg.cn/03a6e3b6f3a74e1f807873ad1c6f32c6.png)  
![2](https://img-blog.csdnimg.cn/5c885da2602e4ff2802314b0c6a97796.png)  
    
## grep -v 排除含某些内容的行  
![0](https://img-blog.csdnimg.cn/09469d36aa7d4e439d25ad20c5c5076c.png)  
![1](https://img-blog.csdnimg.cn/66a7e4ab80254072905735e19d8aebf1.png)  
    
## grep -n 显示行号  
![0](https://img-blog.csdnimg.cn/da269fa8bf0e467d9c8cdb4fb8fee2be.png)  
![1](https://img-blog.csdnimg.cn/d6dad0809fa64069905d2950f746c704.png)  
    
## grep -o 仅显示匹配的内容  
- 一行中匹配的多个部分会被分开成多行显示  
![1](https://img-blog.csdnimg.cn/6dce85396bab4e208da3a0df49879919.png)  
![2](https://img-blog.csdnimg.cn/94b1e749165c4901b81df1f61eb0c1dc.png)  
![3](https://img-blog.csdnimg.cn/455b92d5af154ad58e492a8d5d25a84d.png)  
    
## 搜索一个目录中的全部文件  
- 搜索指定目录的全部文件，不包括子目录  
- 不指定目录则为当前目录  
![1](https://img-blog.csdnimg.cn/6261ed57fea64dbfa195c9cfee94e7f7.png)  
    
## grep -r 递归查找目录中全部的子目录  
- 当符号链接文件在子目录时，不能显示出来，要用 `-R`，见后面 `-R` 说明  
![1](https://img-blog.csdnimg.cn/9d66a3a123f54b19b4c1a839fedb33d9.png)  
![2](https://img-blog.csdnimg.cn/b1a74dd6585341cb8af4ed2f81515c86.png)  
    
## grep -R 递归查找目录中全部的子目录  
![1](https://img-blog.csdnimg.cn/5420dc43db534c38b7c8bf6c6a402d7c.png)  
    
帮助文档说 `-r` 参数不显示软连接，但 ubunut 22.04 测试，符号链接文件在当前搜索目录时，能显示，符号链接文件在子目录时，只有 `-R` 能显示  
![1](https://img-blog.csdnimg.cn/cd51da1c9e00453080d8522766aac1fe.png)  
    
    
## grep -l 仅显示匹配的文件  
![1](https://img-blog.csdnimg.cn/869710e7db964256aeeaeb6a14d7492b.png)  
![2](https://img-blog.csdnimg.cn/866934d1f6c541218488805479741889.png)  
    
## grep -L 显示不匹配的文件名  
- 和 `grep -l` 相反  
![1](https://img-blog.csdnimg.cn/45433a63dd25464d8431d5dc2681e5f2.png)  
![2](https://img-blog.csdnimg.cn/919730bb98ca417eb7f3045667e732be.png)  
    
## grep -m NUM 匹配了 NUM 行后停止搜索  
- grep 并不会一次搜索整个文件，按行搜索  
- 如果指定最多匹配 NUM 行，则搜索匹配了 NUM 行后，停止搜索文件  
![1](https://img-blog.csdnimg.cn/ad08df1a718f4423abcbfd84af4725ff.png)  
![1](https://img-blog.csdnimg.cn/a32af47506f94d10a0b0415fdfc87971.png)  
![2](https://img-blog.csdnimg.cn/5262e078fe24484abc9e046694941221.png)  
    
## grep -f 从文件内容获取匹配模式  
![1](https://img-blog.csdnimg.cn/dfd30de820864a99a6adef199ba9bd50.png)  
![2](https://img-blog.csdnimg.cn/a0478ace7f1841a88078139203b3461e.png)  
    
## grep -H 每个显示内容加上文件名  
![1](https://img-blog.csdnimg.cn/508b8ffafab04762bd101bae6f341604.png)  
![2](https://img-blog.csdnimg.cn/8008ace129f346238ead1b336a2bd94b.png)  
    
## grep -h 匹配的内容前不输出文件名  
![1](https://img-blog.csdnimg.cn/53106c59f221462fa5ffac45c344e3d8.png)  
![2](https://img-blog.csdnimg.cn/6cd33da530c04e8b9851f3587870db99.png)  
    
## grep -A | -B | -C 显示匹配内容前后的内容  
- grep -A NUM 显示匹配文本之后的 NUM 行  
- grep -B NUM 显示匹配文本之前的 NUM 行  
- grep -C NUM 显示匹配文本之前和之后的 NUM 行  
    
![1](https://img-blog.csdnimg.cn/b503d84d06404db3a2e4f9407be4c293.png)  
![2](https://img-blog.csdnimg.cn/b18b1e9b97ee493893cdaf65416133a3.png)  
    
## 匹配以特定字符开头的行  
![1](https://img-blog.csdnimg.cn/7ee6e083302c47c9880a661415f0bb05.png)  
    
## 匹配以特定字符结束的行  
![1](https://img-blog.csdnimg.cn/c81dd9a88d7f4052969d7660d3bf78d7.png)  
    
## grep -e 匹配出以 `-` 开头的模式  
![1](https://img-blog.csdnimg.cn/de6e347cd0a147f5a87983ad8fa03a73.png)  
![1](https://img-blog.csdnimg.cn/3ed28112e188419492e057f583c480c9.png)  
    
## grep -e 匹配多个模式  
![1](https://img-blog.csdnimg.cn/de6e347cd0a147f5a87983ad8fa03a73.png)  
![2](https://img-blog.csdnimg.cn/cba9bdc693554d27b1b47f475c350261.png)  
    
## grep -E 结合扩展正则表达式  
![](img/2023-03-14-19-54-00.png)  
![](img/2023-03-14-20-04-06.png)  
    
## grep 中正则表达式应用  
### <font color=red>grep 取出首尾单词相同的行</font>  
![](img/2023-03-14-20-36-34.png)  
    
### grep "[0-Z]" 匹配  
![](img/2023-03-15-09-13-39.png)  
    
### [:digit:] 和 [[:digit:]]  
![](img/2023-03-15-09-22-08.png)  
![](img/2023-03-17-10-18-30.png)  
    
# sed  
> [sed, a stream editor](https://www.gnu.org/software/sed/manual/sed.html#Invoking-sed)  
> [50 sed Command Examples](https://linuxhint.com/50_sed_command_examples/)  
    
    
- `sed` is a stream editor. A stream editor is used to perform basic text transformations on an input stream(a file or input from a pipeline).  
- `sed` can filter text in a pipeline.  
- 一行一行处理，不将整个文件全部加载再处理  
    
    
## 工作原理  
> [How sed Works](https://www.gnu.org/software/sed/manual/sed.html#index-Pattern-space_002c-definition)  
    
    
- `sed` maintains two data buffers: the active pattern space, and the auxiliary hold space. Both are initially empty.  
- `sed` 从 input stream 读取一行内容，去掉 trailing newline 后将其放到 pattern space 中。  
- 然后执行命令，每个命令可以关联一个地址，即在选择的地址返回内执行命令。  
- 当该行的命令执行完成后，除非使用了 `-n` 选项，该模式空间的内容会打印到 output stream，加上被移除的 trailing newline。  
- 接着开始重复的处理下面一行内容。  
    
    
## sed 使用的正则表达式语法  
> [Regular Expressions: selecting text](https://www.gnu.org/software/sed/manual/sed.html#sed-regular-expressions)  
    
    
- greedy 模式匹配  
    
    
### 基本正则表达式  
> [5.3 Overview of basic regular expression syntax](https://www.gnu.org/software/sed/manual/sed.html#BRE-syntax)  
    
#### `.`  
- Matched any character, including newline.  
    
#### `\+`  
    
#### `\?`  
    
#### `\{i\}`  
    
#### `\{i,j\}`  
    
#### `\{i,\}`  
    
#### `\(regexp\)`  
    
#### regexp1\|regexp2  
- or  
      
#### regexp1regexp2  
- and  
    
#### \digit  
- 对 `()` 中的内容 back reference，如 `\1` 引用第一个 group 的内容  
    
#### `\n`  
- newline  
    
#### `\char`  
- 对特殊字符转义，匹配字符本身，如 `$ * . [ \ ^`  
- `\\` 匹配 `\`  
- `\t` 不能匹配制表符，只匹配 `t`  
![](img/2023-04-01-09-34-04.png)  
- `\$` 匹配一个 `$` 符号  
- `\\$` 匹配以 `\` 结尾的字符串  
    
#### `[a-zA-Z0-9]` 匹配字母和数字  
- 数字和字母  
    
### 扩展正则表达式  
> [5.4 Overview of extended regular expression syntax](https://www.gnu.org/software/sed/manual/sed.html#ERE-syntax)  
    
#### 特殊字符匹配本身需要转义  
- `?`  
- `+`  
- `{}`  
- `()`  
- `|`  
    
### `[]` Bracket Expressions  
> [5.5 Character Classes and Bracket Expressions](https://www.gnu.org/software/sed/manual/sed.html#Character-Classes-and-Bracket-Expressions)  
    
    
- 基本和扩展正则表达式都可以用  
- 方括号中以 `^` 开头则排除后面的字符  
- `^` 在方括号中只有不是在最前面时才能表达本来含义  
- `-` 在方括号中只有在最后或最前面时才不是表示范围  
- `]` 如果不是在最前面，则表示结束 bracket expression  
    
#### [abc]  
- 匹配方括号中的其中一个单个字符  
    
#### `[a-d]` Range Expression  
    
### Named Classes  
> [5.5 Character Classes and Bracket Expressions](https://www.gnu.org/software/sed/manual/sed.html#Character-Classes-and-Bracket-Expressions)  
    
    
- 必须要在方括号中使用，如 `[[:digit:]]`  
    
#### [:digit:]  
    
#### [:alnum:]  
    
#### [:alpha:]  
    
#### [:blank:]  
- space and tab  
    
#### [:cntrl:]  
- ASCII 码八进制范围为 `000` 到 `037`，以及 `177`  
    
#### [:graph:]  
- `[:alnum:]` and `[:punct:]`  
#### [:print:]  
- `[:alnum:]`, `[:punct:]`, and space  
#### [:space:]  
- Space characters: in the `C locale`, this is tab, newline, vertical tab, form feed, carriage return, and space.  
#### [:lower:]  
#### [:upper:]  
#### [:xdigit:]  
    
### Regular Expression Extensions  
> [Regular Expression Extensions](https://www.gnu.org/software/sed/manual/sed.html#regexp-extensions)  
    
- 基本正则表达式和扩展正则表达式都可以使用  
    
#### \w  
    
#### \W  
    
#### \b 匹配单词边界  
- 边界是 word 和 non-word 的边界  
    
#### \< 单词的开头  
    
#### \> 单词的结束  
    
#### \B  
- 和 `\b` 相反  
    
#### \s  
- space and tabs  
    
#### \S  
    
#### `\``  
    
#### `\'`  
    
    
### 转义字符  
> [5.8 Escape Sequences - specifying special characters](https://www.gnu.org/software/sed/manual/sed.html#Escapes)  
    
    
## sed 命令格式  
- `sed [OPTION]... {script-only-if-no-other-script} [input-file]...`  
![](img/2023-03-31-19-54-15.png)  
- 选项：可选  
- script：必须有，如果没有命令，则用空 `''`  
- 文件：可选，没有则用标准输入  
    
### 选项 OPTION 格式第一部分  
> [Command-line Options](https://www.gnu.org/software/sed/manual/sed.html#Command_002dLine-Options)  
    
    
#### -n 不自动输出模式空间的内容  
- quite, --silent  
- 不自动的输出模式空间的内容  
    
![](img/2023-03-31-20-25-52.png)  
    
    
#### -e 处理多个命令  
- `--expression=script`  
- Add the commands in script to the set of commands to be run while processing the input.  
    
![](img/2023-03-31-20-38-12.png)  
![](img/2023-03-31-20-43-10.png)  
    
#### -i[SUFFIX] 修改文件  
> [sed -i](https://www.gnu.org/software/sed/manual/sed.html#Command_002dLine-Options)  
    
- `--in-place[=SUFFIX]`  
- `sed` 将创建一个临时文件并发送输出到该文件而非标准输出。  
- 当文件全部处理完，临时文件被重命名为输出文件的名字，即覆盖原始文件。  
- 可以加一个后缀（SUFFIX），这样起到备份的作用，将原始文件的名字修改为带有后缀或前缀的名字。  
- 添加前缀或后缀时，可以用 `*` 代表源文件的名字，这样可以在 `*` 前后添加字符。  
- 后缀中不加 `*`，则默认在源文件的名后添加后缀。  
    
    
![](img/2023-03-31-21-18-43.png)  
    
    
#### -b 二进制模式打开文件  
- `--binary`  
    
    
#### -r|-E 扩展正则表达式  
> [extended regular expression](https://www.gnu.org/software/sed/manual/sed.html#ERE-syntax)  
> [Regular Expressions: selecting text](https://www.gnu.org/software/sed/manual/sed.html#sed-regular-expressions)  
    
    
- `--regexp-extended`  
- `egrep` 使用的正则表达式  
- 扩展正则表达式对一些符号需要转义：`? + () {} |`  
    
####  -s 将多个文件视为分开的独立文件  
    
### scrip 格式第二部分  
> [sed Script](https://www.gnu.org/software/sed/manual/sed.html#sed-scripts)  
    
- `sed` 程序可以包含多个 `sed` 命令，即 `sed script`  
- 格式为 `[addr]X[options]`  
- `X` 是单个字母的 `sed` 命令  
- `[addr]` 表示地址，可选的，指定地址则后面的命令 `X` 只处理匹配的**行**  
- 地址可以是行号，正则表达式，或者行范围  
- 不特意指明地址，则表示全部范围  
- 最后的 `options` 是可选的额外命令  
      
#### `[addr]` 地址表示方法  
> [4 Addresses:selecting lines](https://www.gnu.org/software/sed/manual/sed.html#sed-addresses)  
    
    
- `N` 第 N 行  
- `$` 表示最后一行  
- `1,3` 表示第 1 行到第 3 行  
- `1,+2` 表示第 1 行到第 1 行再加 2 行的位置  
- `1,/pattern/` 起始为第 1 行，结束根据模式匹配到的行  
- `/pattern/` 能被匹配到的每一行  
- `/pattern1/,/pattern2/` 两个匹配模式中间（包含匹配的行）所有行  
    
##### 指定特定一行  
- 直接输入行号  
- `$` 表示最后一行  
    
##### 指定连续的行的范围  
- 两个行号用 `,` 分隔，如 `3,5` 表示第 3 行到第 5 行  
![](img/2023-04-01-11-12-18.png)  
- `4,` 表示第 4 行到最后一行  
- `4,1` 则只能匹配第 4 行  
- `2,+3` 表示起始为第 2 行，结束行为第 2 行后面的第 3 行  
![](img/2023-04-01-11-20-54.png)  
    
    
##### 指定不连续的加步长的行范围  
- `first~step`  
- `0~2` 表示从第 2 行开始，取 2，4，6 行等偶数行  
- `1~2` 表示从第 1 行开始，取 1，3，5 行等奇数行  
![](img/2023-04-01-11-09-12.png)  
- `2,~3` 表示从第 2 行开始，结束行为 3 倍数的行  
![](img/2023-04-01-11-26-35.png)  
    
    
##### 行号 + 正则表达式 指定地址范围  
- 如 `0,/regexp/` 起始行为第 0 行，结束行为正则表达式匹配的行  
- 注意 `0,/regexp/` 和 `1,/regexp/` 的区别  
- 起始行也可以是正则表达式，`/regexp/,/regexp/`  
      
![](img/2023-04-01-11-19-37.png)  
    
    
#### sed 命令  
> [sed commands summary](https://www.gnu.org/software/sed/manual/sed.html#sed-scripts)  
    
##### p 打印模式空间的内容  
- 默认区分大小写  
- `IP` 忽略大小写  
![](img/2023-04-01-12-16-00.png)  
    
    
##### P 打印模式空间的内容直到第一个换行符  
- Print the pattern space, up to the first <newline>.  
    
##### a\ 在行后添加内容  
- 用 `a\` 后面写要添加的内容  
![](img/2023-04-01-11-49-32.png)  
- 可以用 `\n` 添加多行  
![](img/2023-04-01-11-50-48.png)  
    
##### d 删除内容  
- 直到范围后删除匹配的行  
![](img/2023-04-01-11-51-43.png)  
    
##### c\ 替换行  
- change lines with text  
- 在 `\c` 后写入替换的文本，可以用 `\n` 换行  
![](img/2023-04-01-11-53-30.png)  
    
##### e command 执行命令替换输出内容  
- Executes command and sends its output to the output stream. The command can run across multiple lines, all but the last ending with a back-slash.  
```bash  
[root@ubuntu22-c0 shell_scripts]$ seq 5 | sed -n '1,3e echo "hello"'  
hello  
hello  
hello  
[root@ubuntu22-c0 shell_scripts]$ seq 5 | sed  '1,3e echo "hello"'  
hello  
1  
hello  
2  
hello  
3  
4  
5  
```  
    
##### i\ text 在行前插入内容  
![](img/2023-04-01-11-59-50.png)  
    
##### r filename 读取文件内容到匹配的行后  
![](img/2023-04-01-12-20-14.png)  
    
##### w filename 保存模式空间的内容到指定文件  
![](img/2023-04-01-12-23-58.png)  
    
##### = 为输出的内容打印行号  
- 行号后带换行符，即行号单独占一行，在实际行的上面  
- 空行也有行号  
![](img/2023-04-01-12-26-33.png)  
    
##### q[exit-code] 退出  
- 下面的例子不执行后面的 `5d`，但输出不是 `2 4 5 6` 而是 `2`  
![](img/2023-04-01-13-03-25.png)  
    
##### s/regexp/replacement/[flags] 查找替换  
> [The s Command](https://www.gnu.org/software/sed/manual/sed.html#The-_0022s_0022-Command)  
    
- 不改变源文件的内容，仅将修改输出显示  
- 类似 vim 中的查找替换  
- 不加标志则，默认只替换一行中的第一个符合的字符  
- 标志位类似 vim 中替换的标志位，但不是全都支持  
- 分隔符 `/` 可以换成其他符号，如 `#` 或 `@` 等，当搜索的内容有 `/` 符号时，可以换成其他分隔符  
- 和其他命令一样，前面可以指明地址范围  
    
###### flags  
- g  
将**一行**中全部符合条件的均替换，而不是只替换第一个符合之处  
![](img/2023-04-01-13-12-21.png)  
    
- p  
打印替换后模式空间的结果  
    
- i|I 忽略大小写  
大写和小写的 i 均是忽略大小写，和 vim 不同，不加则区分大小写  
    
- m|M 多行匹配  
![](img/2023-03-16-20-01-49.png)  
![](img/2023-03-16-20-03-39.png)  
![](img/2023-03-16-20-34-38.png)  
![](img/2023-03-16-20-37-53.png)  
![](img/2023-03-16-21-13-27.png)  
    
## sed 处理一行中其中一个匹配内容  
![](img/2023-03-16-20-45-45.png)  
    
## sed 处理多个命令  
> [Multiple commands syntax](https://www.gnu.org/software/sed/manual/sed.html#Multiple-commands-syntax)  
    
### 命令用 newlines 分隔  
![](img/2023-03-31-20-47-55.png)  
    
### 用 `;` 分隔一些命令  
![](img/2023-03-31-20-49-33.png)  
![](img/2023-04-01-12-59-15.png)  
    
### 用 `-e` 选项  
    
    
## sed 使用变量  
例如将一个文件中的一行如 `port 6379` 改为 `port num`，num 为变量，该行的开头为 `port`  
```bash  
[root@docker init_data]$ num=6371  
[root@docker init_data]$ sed -Ei "s/^port 6379/port ${num}/" 1.conf  
```  
    
注意在 `sed` 中使用变量，用双引号而非单引号包围，单引号会无法识别变量  
    
    
## sed 使用例子  
    
### 删除行末尾空格  
上传到 github 上的文档，行末尾需要添加两个空格才会换行，在文档上传前，批量处理每行，在其末尾加两个空格，但文档可能重复修改，不能每次上传都加空格，因此在加空格前，先删除末尾的空格  
    
规则为：不处理空白行，包含多个空格的行，仅处理有内容，末尾有两个或以上空格的行，删除末尾空格  
    
原始文件：  
```bash  
[root@lvs-1 ~]$ cat 1.txt -An  
     1  abc  $  
     2   a   bcd 3    $  
     3      $  
     4      $  
     5  $  
     6  d$  
     7  $  
     8  1 $  
```  
    
选择非空白行：  
```bash  
[root@lvs-1 ~]$ sed -n '/^ *$/!p' 1.txt | cat -An  
     1  abc  $  
     2   a   bcd 3    $  
     3  d$  
     4  1 $  
```  
    
处理非空白行，筛选末尾空格两个或以上的行，删除末尾空格：  
```bash  
[root@lvs-1 ~]$ sed -n '/^ *$/!s/\s\{2,\}$//p' 1.txt | cat -An  
     1  abc$  
     2   a   bcd 3$  
```  
    
用扩展正则表达式：  
```bash  
[root@lvs-1 ~]$ sed -rn '/^ *$/!s/\s{2,}$//p' 1.txt  | cat -An  
     1  abc$  
     2   a   bcd 3$  
```  
    
### 取消行前注释  
筛选某一行后，将该行和其后两行取消注释，即最前面的 `#`  
    
筛选某行，并显示其后两行  
```bash  
root@ubuntu2204c12:~# sed -n '/#if \[ -f \/etc\/bash_completion \] && ! shopt -oq posix; then/,+2p' /root/.bashrc  
#if [ -f /etc/bash_completion ] && ! shopt -oq posix; then  
#    . /etc/bash_completion  
#fi  
```  
    
取消这三行的注释：  
```bash  
root@ubuntu2204c12:~# sed -n '/#if \[ -f \/etc\/bash_completion \] && ! shopt -oq posix; then/,+2 s/^#//p' /root/.bashrc  
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then  
    . /etc/bash_completion  
fi  
```  
    
# awk  
> 跟着这个教程学习基本用法：[Awk Tutorial](https://www.tutorialspoint.com/awk/index.htm)  
> 要详细了解某个具体知识点查询 gnu 官网：[gnu gawk](https://www.gnu.org/software/gawk/manual/gawk.html)  
    
- AWK is an interpreted programming language.  
- It is very powerful and specially designed for text processing.  
    
```bash  
[root@ubuntu22-c0 ~]$ ll $(which awk)  
lrwxrwxrwx 1 root root 21 Aug  9  2022 /usr/bin/awk -> /etc/alternatives/awk*  
```  
    
## awk workflow  
> [AWK - Workflow](https://www.tutorialspoint.com/awk/awk_workflow.htm)  
    
- read a line from the input stream (file, pipe or stdin)  
- execute AWK command on a line  
- repeat it until the input stream reaches the its end  
    
## awk command format  
> gnu: [1.1 How to Run awk Programs](https://www.gnu.org/software/gawk/manual/gawk.html#Running-gawk)  
    
    
```bash  
awk 'program' input-file1 input-file2 …  
```  
    
```bash  
awk -f program-file input-file1 input-file2 …  
```  
    
也可以不指定文件，从标准输入读取，`Ctrl-d` 终止输入  
```bash  
awk 'program'  
```  
    
### awk program structure  
> [AWK - Workflow](https://www.tutorialspoint.com/awk/awk_workflow.htm)  
    
#### BEGIN block  
```bash  
BEGIN {awk-commands}  
```  
- The BEGIN block gets executed at program start-up.  
- It executes only once. This is good place to initialize variables.  
- BEGIN is an AWK keyword and hence it must be in upper-case.  
- This block is optional.  
    
    
#### Body block  
```bash  
/pattern/ {awk-commands}  
```  
- The body block applies AWK commands on every input line.  
- pattern 可以对行进行筛选只处理特定的行  
    
    
#### END Block  
```bash  
END {awk-commands}  
```  
- The END block executes at the end of the program.  
- END is an AWK keyword and hence it must be in upper-case.  
- This block is optional.  
    
# UID, EUID, RUID  
> [euid,ruid,suid](https://book.hacktricks.xyz/linux-hardening/privilege-escalation/euid-ruid-suid)  
    
Consider a program named "example" that performs sensitive operations and is owned by User A with UID 1000. This program needs root privileges to execute certain actions, but running it with root privileges all the time can introduce security risks.  
    
1. UID (User ID): The UID identifies the user who runs the program. For instance, if User B logs in and runs the "example" program, the UID associated with that process will be 1001 (assuming User B has UID 1001).  
    
2. EUID (Effective User ID): The EUID determines the privileges granted to the process during its execution. If the "example" program has the SUID permission and it's owned by User A, whenever User B runs the program, the EUID will temporarily change to 1000 (owner's UID) during the execution. This allows the program to access resources or perform actions that require User A's privileges. Once the execution is complete, the EUID will return to User B's UID.  
    
3. RUID (Real User ID): The RUID represents the actual user who initiated the program. In our example, no matter who runs the "example" program, the RUID will always be the UID of the user who executed it. So, if User B runs the program, the RUID remains as 1001 (User B's UID).  
    
    
# chroot  
> [chroot](https://wiki.archlinux.org/title/chroot)  
> [How to Use the chroot Command on Linux](https://www.howtogeek.com/441534/how-to-use-the-chroot-command-on-linux/)  
> [chroot command in Linux with examples](https://www.geeksforgeeks.org/chroot-command-in-linux-with-examples/)  
> [chroot](https://github.com/saschagrunert/demystifying-containers/blob/master/part1-kernel-space/post.md#chroot)  
    
  
# lsns 查看名称空间  
```bash  
[root@docker ~]$ whatis lsns  
lsns (8)             - list namespaces  
```  
  
# wall  
> [Wall Command in Linux with Examples](https://linuxhint.com/wall-command-in-linux-with-examples/)  
    
给当前全部登录的用户发消息  
    
# watch  
> [What Is the Linux watch Command, How to Use It + Examples](https://www.hostinger.com/tutorials/linux-watch-command/)  
    
# time  
> [How to Use Linux Time Command: All You Need to Know](https://www.hostinger.com/tutorials/linux-time-command/)  
    
```bash  
[root@ubuntu22-c0 ~]$ time ls  
shell_scripts  snap  
    
real    0m0.002s  
user    0m0.002s  
sys     0m0.000s  
```  
    
# lsof  
> [How to use the lsof command to troubleshoot Linux](https://www.redhat.com/sysadmin/analyze-processes-lsof)  
    
    
# jq 查看 json 文件  
    
    
# dd  
> [Linux DD Command – 18 Examples with All Options](https://linuxopsys.com/topics/linux-dd-command-with-examples)  
    
# 硬件资源的收集与分析工具  
系统硬件由操作系统内核管理  
内核所检测到的硬件设备会被记录在 /proc 和 /sys 目录中  
    
## dmesg  
查看内核运行过程中所显示的各项信息记录  
    
## vmstat  
分析系统目前状态  
    
## lspci  
列出 PC 系统的 PCI 接口设备  
    
## lsusb  
列出 USB 端口的状态  
    
## iostat  
实时列出 CPU 与接口设备的输入输出状态  
    
# mktemp 创建临时文件  
```bash  
[root@ubuntu22-c0 ~]$ mktemp --help  
Usage: mktemp [OPTION]... [TEMPLATE]  
Create a temporary file or directory, safely, and print its name.  
TEMPLATE must contain at least 3 consecutive 'X's in last component.  
If TEMPLATE is not specified, use tmp.XXXXXXXXXX, and --tmpdir is implied.  
Files are created u+rw, and directories u+rwx, minus umask restrictions.  
    
  -d, --directory     create a directory, not a file  
  -u, --dry-run       do not create anything; merely print a name (unsafe)  
  -q, --quiet         suppress diagnostics about file/dir-creation failure  
      --suffix=SUFF   append SUFF to TEMPLATE; SUFF must not contain a slash.  
                        This option is implied if TEMPLATE does not end in X  
  -p DIR, --tmpdir[=DIR]  interpret TEMPLATE relative to DIR; if DIR is not  
                        specified, use $TMPDIR if set, else /tmp.  With  
                        this option, TEMPLATE must not be an absolute name;  
                        unlike with -t, TEMPLATE may contain slashes, but  
                        mktemp creates only the final component  
  -t                  interpret TEMPLATE as a single file name component,  
                        relative to a directory: $TMPDIR, if set; else the  
                        directory specified via -p; else /tmp [deprecated]  
      --help     display this help and exit  
      --version  output version information and exit  
```  
    
```bash  
[root@ubuntu22-c0 ~]$ mktemp -u  
/tmp/tmp.7COl8xwQaB  
```  
    
```bash  
[root@ubuntu22-c0 ~]$ mktemp -u aXXX  
aEt8  
[root@ubuntu22-c0 ~]$ mktemp -u aXX  
mktemp: too few X's in template ‘aXX’  
```  
    
```bash  
[root@ubuntu22-c0 ~]$ mktemp -u -d  
/tmp/tmp.y6wgdnTZsM  
```  
    
# sleep  
    
```bash  
[root@ubuntu2204 ~]$ for i in {1..10..2}; do  
> echo $i  
> sleep 0.5  
> done  
1  
3  
5  
7  
```  
    
# install 复制文件设置属性  
```bash  
[root@ubuntu22-c0 ~]$ whatis install  
install (1)          - copy files and set attributes  
```  
    
# 信号捕捉工具 trap  
    
    
# 文字接口网页浏览  
## 文字浏览器 links  
- 需要手动安装  
- 可以用来看 html 的文档，如/usr/share/doc 中的帮助文档  
- 用方向键不太方便  
    
### -dump 将网页内容输出到标准输出  
- 可以重定向到文件中  
    
## 文字接口下载器 wget  
```bash  
[root@ubunut22:~]$ whatis wget  
wget (1)             - The non-interactive network downloader.  
```  
    
```bash  
wget https://www.example.com/example.txt  
```  
    
## curl  
```bash  
curl -o filename.txt https://www.example.com/example.txt  
```  
    
    
**************************  
# 查看操作系统版本  
## cat /etc/os-release  
```bash  
[root@ubuntu22-c0 ~]$ cat /etc/os-release  
PRETTY_NAME="Ubuntu 22.04.1 LTS"  
NAME="Ubuntu"  
VERSION_ID="22.04"  
VERSION="22.04.1 LTS (Jammy Jellyfish)"  
VERSION_CODENAME=jammy  
ID=ubuntu  
ID_LIKE=debian  
HOME_URL="https://www.ubuntu.com/"  
SUPPORT_URL="https://help.ubuntu.com/"  
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"  
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"  
UBUNTU_CODENAME=jammy  
```  
```bash  
[root@mysql ~]$ cat /etc/os-release  
NAME="Rocky Linux"  
VERSION="8.7 (Green Obsidian)"  
ID="rocky"  
ID_LIKE="rhel centos fedora"  
VERSION_ID="8.7"  
PLATFORM_ID="platform:el8"  
PRETTY_NAME="Rocky Linux 8.7 (Green Obsidian)"  
ANSI_COLOR="0;32"  
LOGO="fedora-logo-icon"  
CPE_NAME="cpe:/o:rocky:rocky:8:GA"  
HOME_URL="https://rockylinux.org/"  
BUG_REPORT_URL="https://bugs.rockylinux.org/"  
ROCKY_SUPPORT_PRODUCT="Rocky-Linux-8"  
ROCKY_SUPPORT_PRODUCT_VERSION="8.7"  
REDHAT_SUPPORT_PRODUCT="Rocky Linux"  
REDHAT_SUPPORT_PRODUCT_VERSION="8.7"  
```  
    
# 查看内核版本  
## uname -vr  
```bash  
[root@mysql shell_scripts]$ uname -vr  
4.18.0-425.19.2.el8_7.x86_64 #1 SMP Tue Apr 4 22:38:11 UTC 2023  
```  
```bash  
[root@mysql ~]$ uname -rv  
4.18.0-425.19.2.el8_7.x86_64 #1 SMP Tue Apr 4 22:38:11 UTC 2023  
```  
    
# 查看根文件系统的利用率  
## df + awk  
```bash  
[root@zabbix ~]$ df  
Filesystem                        1K-blocks    Used Available Use% Mounted on  
tmpfs                                198824    1324    197500   1% /run  
/dev/mapper/ubuntu--vg-ubuntu--lv 101590008 6435248  89948132   7% /  
tmpfs                                994116       0    994116   0% /dev/shm  
tmpfs                                  5120       0      5120   0% /run/lock  
/dev/sda2                           1992552  258188   1613124  14% /boot  
tmpfs                                198820       0    198820   0% /run/user/0  
[root@zabbix ~]$ df | awk -F' +|%' '$7 == "/" {print $5}'  
7  
```  
    
# 查看文件或文件夹的大小  
    
```bash  
[root@zabbix boot]$ du -sh  
253M    .  
[root@zabbix boot]$ du -h  
16K     ./lost+found  
2.3M    ./grub/fonts  
2.5M    ./grub/i386-pc  
4.0K    ./grub/locale  
7.1M    ./grub  
253M    .  
[root@zabbix boot]$ du -h vmlinuz-5.15.0-72-generic  
12M     vmlinuz-5.15.0-72-generic  
```  
    
# 查看内核中是否有某个模块  
```bash  
[root@zabbix boot]$ uname -r  
5.15.0-73-generic  
[root@zabbix boot]$ pwd  
/boot  
[root@zabbix boot]$ ls  
config-5.15.0-72-generic  initrd.img-5.15.0-72-generic  System.map-5.15.0-72-generic  vmlinuz-5.15.0-73-generic  
config-5.15.0-73-generic  initrd.img-5.15.0-73-generic  System.map-5.15.0-73-generic  vmlinuz.old  
grub                      initrd.img.old                vmlinuz  
initrd.img                lost+found                    vmlinuz-5.15.0-72-generic  
```  
    
```bash  
[root@zabbix boot]$ grep -i "kvm" /boot/config-5.15.0-73-generic  
```  
  
# iotop 监视磁盘 I/O 工具  
需要额外安装  
