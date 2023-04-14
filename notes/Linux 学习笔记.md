# 学习资源
笔记主要来源于 `鸟哥的 Linux 私房菜基础篇（第四版）` 和 `鸟哥的 Linux 私房菜服务器架设篇（第三版）`


## 官方文档
> [ubuntu](https://ubuntu.com/tutorials?q=bash#community)
> [GNU Manual Online](https://www.gnu.org/manual/manual.html)
> [Linux man pages](https://linux.die.net/man/)
> [Linux Documentation](https://linux.die.net/)

## 教程
> [鸟哥的 Linux 私房菜](http://cn.linux.vbird.org/linux_basic/linux_basic.php)
> [Ubuntu 中文社区](https://forum.ubuntu.org.cn/index.php)
> [UNIX Tutorial for Beginners](http://www.ee.surrey.ac.uk/Teaching/Unix/)
> [Linux学习教程](http://c.biancheng.net/linux_tutorial/)
> [Linux 教程](https://www.runoob.com/linux/linux-tutorial.html)
> [w3cschool](https://www.w3cschool.cn/linuxc/linuxc-612m3l6o.html)
> [Linux 入门教程](http://www.imooc.com/wiki/linuxlesson)
> [Linux 常用命令全拼](https://www.runoob.com/w3cnote/linux-command-full-fight.html)
> [howtogeek](https://www.howtogeek.com/category/linux/)
> [Linux Tutorial](https://rc.byu.edu/documentation/unix-tutorial/)



## 博客
> [The Linux kernel](https://www.win.tue.nl/~aeb/linux/lk/lk.html#toc10)


## 提问网站

> [FORCHANGE AI EDU](https://chat.forchange.cn/)



# 注意
- 在不同的系统，使用不同的  `bash` 版本，有些设置可能不同
	- 如 ubuntu 20.04 中默认创建用户不创建家目录，但 rocky 8.6 中默认创建家目录
	- 如通配符匹配在 ubuntu 20.04 和 rocky 8.6 中不同，用的 bash 版本不同，见 [3.5.8.1 Pattern Matching](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Pattern-Matching) 对 `[...]` 说明
![1](https://img-blog.csdnimg.cn/c4ba1d16633d4677a572f566ad26d506.png)
![2](https://img-blog.csdnimg.cn/1f9c2ef0dc32465b91bfc8f8dca37773.png)



&nbsp;

# 操作系统下载
可以在官网或者镜像网站下载。

## Ubuntu
下载长期支持版。

> [阿里云镜像源](https://mirrors.aliyun.com/ubuntu-releases/)
> [Ubuntu 官网最新版](https://ubuntu.com/?spm=a2c6h.13651104.0.0.5a1a4763TTb0EY)
> [Ubuntu 官网 Old Ubuntu Releases](http://old-releases.ubuntu.com/releases/?spm=a2c6h.13651104.0.0.414329cacFG7ic)
> [阿里云 Old Ubuntu Releases](https://mirrors.aliyun.com/oldubuntu-releases/releases/?spm=a2c6h.25603864.0.0.63826f0f8RacGj)



# 安装虚拟化软件
## 虚拟化介绍
> [Virtualization Explained](https://www.bilibili.com/video/BV1ee4y1z7ix/?spm_id_from=333.999.0.0&vd_source=a99dfd145a3e6aa8000930c149d4bf58)


## 安装 VMware Workstation
> [有那些免费的虚拟机软件？](https://zhuanlan.zhihu.com/p/422262182)



***************************
# 操作系统
> 计算机的心智操作系统值哲学原理 1.3

- 操作系统是一个软件系统
- 替用户及其应用管理计算机上的软硬件资源
- 保证对计算机资源的公平竞争和使用
- 防止对计算机资源的非法侵占和使用
- 保证操作系统自身正常运转


# Linux 介绍

> [Operating System - Linux](https://www.tutorialspoint.com/operating_system/os_linux.htm)
> [What is Linux](https://www.redhat.com/en/topics/linux/what-is-linux)
> [Architecture of Linux](https://www.javatpoint.com/architecture-of-linux)



- 一种开源的操作系统软件
- 管理系统的硬件和资源
- 介于硬件和应用程序之间
- 提供一个平台能让用户方便的运行应用程序


## Linux 基本组成
> [Operating System - Linux](https://www.tutorialspoint.com/operating_system/os_linux.htm)


- Kernel
- System Library
- System Utility
###  Kernel
- The core part of linux
- It onsists of variable modules
- It interacts directly with the ulderlying hardware 
- It provides an abstraction to hide low level hardware details to **system or application programs**

### System Library
- Special functions or programs 
- Application programs or system utilities access the Kernel's ofeatures through system libraries
- These libraries implement most of the functionalities of the operating system and do not requires kernel module's code access rights


## 特点
- Portable
- Open Source
- Multi-User
- Multiprogramming
- Hierachical File System
- Shell
- Security


### System Utility
- Do specialized, individual level tasks


*********************************

> [Introduction: The Linux Operating System](https://rc.byu.edu/documentation/unix-tutorial/unix1.php) 


Three parts of the Linux operating system:
1. The kernel
- It is the lowest layer of the Linux operating system
- It interfaces directly with the computer hardware
- It provides an interface to programs whereby they may access files, the network, and devices

2. The shell
- The shell acts as an interface between the user and the kernel
- It is a command line interpreter (CLI) 
- It interprets the commands the user types in and executes them

3. The programs
- Each of programs does one thing and does it well




# Linux 分支介绍
> [Linux的分支及使用选择](https://zhuanlan.zhihu.com/p/381753464)


# 安装 ubuntu
## ubuntu 安装后基本配置



# 远程连接
## SSH

> [SSH 教程](https://www.cainiaojc.com/ssh/ssh-basic.html)
> [什么是SSH 以及常见的ssh 功能](https://blog.csdn.net/u013452337/article/details/80847113)
> [查看linux虚拟机ssh服务是否开启](https://blog.csdn.net/n123456uo/article/details/90261882)
> [解决：使用xshell连接服务器时无法使用账号密码登录的一种方式](https://blog.csdn.net/LvQiFen/article/details/122182815?spm=1001.2101.3001.6661.1&utm_medium=distribute.pc_relevant_t0.none-task-blog-2%7Edefault%7ECTRLIST%7ERate-1-122182815-blog-96923553.pc_relevant_multi_platform_whitelistv3&depth_1-utm_source=distribute.pc_relevant_t0.none-task-blog-2%7Edefault%7ECTRLIST%7ERate-1-122182815-blog-96923553.pc_relevant_multi_platform_whitelistv3&utm_relevant_index=1)
> [SSH远程访问及控制](https://www.cnblogs.com/y0226/p/16806645.html)


- SSH 是一种网络协议，主要用于保证远程登录计算机的安全
- SSH 的软件架构是服务器-客户端模式
- openssh 是 ssh 实现的一种
- openssh 对**客户端**的实现为 ssh
- openssh 对**服务器**的实现为 sshd
- 用小写 ssh 表示客户端程序
![1](https://img-blog.csdnimg.cn/dd5063d8abd74f1d93f4cb361907bd73.png)
![2](https://img-blog.csdnimg.cn/7cccddb0b78b475d8113b35f0e956129.png)
![1](https://img-blog.csdnimg.cn/5eb10cfa4dfd41888262a129561743e6.png)

### 安装 
- ubuntu 默认安装 openssh-client
- ubuntu 安装 openssh-server：`sudo apt-get install openssh-server` 

### root 不能通过 xshell 远程
- 修改配置文件 /etc/ssh/sshd_config
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
/etc/init.d/ssh restart
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
![2](https://img-blog.csdnimg.cn/cd84de7e58804de98bc460f55723afbe.png)


### ssh 通过公钥远程登录
> [设置 SSH 通过密钥登录](https://www.runoob.com/w3cnote/set-ssh-login-key.html)
> [linux下ssh公钥验证的设置和远程登录](https://donaldhan.github.io/linux/2020/04/29/linux下ssh公钥验证的设置和远程登录.html)



# linux 终端
> [Difference between pts and tty](https://unix.stackexchange.com/questions/21280/difference-between-pts-and-tty)
> [What is the exact difference between a 'terminal', a 'shell', a 'tty' and a 'console'?](https://unix.stackexchange.com/questions/4126/what-is-the-exact-difference-between-a-terminal-a-shell-a-tty-and-a-con)
> [Difference between /dev/tty and /dev/pts (tty vs pts) in Linux](https://www.golinuxcloud.com/difference-between-pty-vs-tty-vs-pts-linux/)
> [Linux的各种终端类型及概念](https://blog.csdn.net/xyz/article/details/118066465)



## console


## tty
> [Difference between /dev/tty and /dev/pts (tty vs pts) in Linux](https://www.golinuxcloud.com/difference-between-pty-vs-tty-vs-pts-linux/)
> [The TTY demystified](http://www.linusakesson.net/programming/tty/)

- terminal = tty = text input/output environment

- Ubuntu 22.04 server 可通过 `Ctrl A|t ` `F1-F6` 分别切换到六个 tty 终端，可通过 `tty` 命令显示当前  tty，不按照顺序切换，如先用 `Ctrl A|t F6` 再用 `Ctrl A|t F5` 切换，前面的仍是 `tty6`，后面的是 `tty5`
![](img/2023-04-04-17-21-22.png)

用 `w` 可以查看当前登录的用户
![](img/2023-04-04-17-30-02.png)

- Ubuntu 20.04 桌面版默认打开图形，用 `tty` 命令查看是 `/dev/pts/num` 而非 `/dev/tty/num`
![](img/2023-04-04-17-45-35.png)

切换到其他终端，如 `tty3`，可以通过 `startx` 命令切换到图形界面，但该方式打开的图形窗口只能有一个，即其他终端不能再用 `startx` 运行 `X server`，但原来的第一个终端的图形界面还存在。可通过 `killall xinit` 退出图形界面回到终端

- 图形界面登录可通过 `init 3` 切换到 CLI 模式，此时用 `tty` 命令查看为 `tty` 设备而非 `pts`

- 在图形界面可通过 `init 5` 再回到图形界面，查看其他终端还保持原来的界面不变


## pty

## pts
- 图形界面和远程登录时终端显示的设备为 `pts` 而非 `tty`


## startx
> [what does startx command do](https://askubuntu.com/questions/518454/what-does-startx-command-do)
> [startx Command](https://www.ibm.com/docs/en/aix/7.2?topic=s-startx-command)



//TODO: session 待补充
# session 会话管理
> [Linux session(会话)](https://www.cnblogs.com/sparkdev/p/12146305.html)
> [10. Processes](https://www.win.tue.nl/~aeb/linux/lk/lk-10.html)



# Tmux 终端复用
> [Tmux使用手册](http://louiszhai.github.io/2017/09/30/tmux/)
> [Tmux 使用教程](https://www.ruanyifeng.com/blog/2019/10/tmux.html)


# 基本规则
- 区分大小写

# 命令格式
> [What's the difference between a flag, an option, and an argument? [closed]](https://unix.stackexchange.com/questions/285575/whats-the-difference-between-a-flag-an-option-and-an-argument)


# Tab 补全命令

## 列出全部变量
- 输入 `$` 后按两次 `Tab` 键

## 列出全部用户
- 输入 `~` 后按两次 `Tab` 键



# 常用热键查看
- `stty -a` 查看热键，`man stty` 查看帮助说明

![](img/2023-03-17-09-13-44.png)
![](img/2023-03-17-09-18-48.png)

## 热键来源
- `man bash` 查看帮助文档介绍，bash 会用到 [readline 库](https://en.wikipedia.org/wiki/GNU_Readline)
- readline 库中热键如 ctrl z 等用 [emacs](https://en.wikipedia.org/wiki/Emacs)  快捷键
![1](https://img-blog.csdnimg.cn/bc93f100bd7a48b4b3bc4d5b73357c27.png)
![2](https://img-blog.csdnimg.cn/72111b4c14e84a9baa76b26686224aed.png)
![3](https://img-blog.csdnimg.cn/ae412ba4373e4542bb123ad50f81bbec.png)
- readline 库初始化文件在 `/etc/inputrc` 中，可以看到默认是 emacs 快捷键
![4](https://img-blog.csdnimg.cn/32ae80777eb842a7a29b76acee1e1f4d.png)
![5](https://img-blog.csdnimg.cn/64cd1010d39543aebc3f300cceb0a749.png)


## 中断执行
> [ctrl+c 和 ctrl+z 的区别](https://blog.csdn.net/qq_54947566/article/details/124345900?spm=1001.2014.3001.5502)
> [Linux Ctrl+c与ctrl+z的区别](https://www.cnblogs.com/yzjT-mac/p/6207843.html)
> [Linux后台进程管理以及ctrl+z（挂起）、ctrl+c（中断）、ctrl+\（退出）和ctrl+d（EOF）的区别](https://blog.csdn.net/qq_36838191/article/details/82710101)
> [What is the difference in using Ctrl+D and Ctrl+C to terminate cat command?](https://unix.stackexchange.com/questions/379347/what-is-the-difference-in-using-ctrld-and-ctrlc-to-terminate-cat-command)


### Ctrl + z 进程放到后台挂起
![1](https://img-blog.csdnimg.cn/b92877d442d0478ca70bdddc6aaa33ff.png)


//TODO: 待补充 Ctrl C
### Ctrl + c 发送 SIGINT 信号
> [POSIX signals](https://dsa.cs.tsinghua.edu.cn/oj/static/unix_signal.html)
> [How to Use SIGINT and Other Termination Signals in Linux](https://linuxhandbook.com/termination-signals/)


- 终端输入命令时，如果不想输入了可以按这两个键，该输入不会执行，不会记录到历史记录
- 如果输入 `sleep 100`，可以用该快捷键终止


//TODO: 待补充 Ctrl D
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




# shell 设置文本输出颜色
> [shell中设置文字输出的颜色及字体格式](https://blog.csdn.net/yetugeng/article/details/89978787)
> [Bash tips: Colors and formatting (ANSI/VT100 Control sequences)](https://misc.flogisoft.com/bash/tip_colors_and_formatting)
> [How to change the output color of echo in Linux](https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux)


![1](https://img-blog.csdnimg.cn/c48e392891404b25b92337a26541af78.png)


# 安装完成后基本设置
## 安装输入法
> [在 Ubuntu Linux 上安装 Fcitx5 中文输入法](https://zhuanlan.zhihu.com/p/415648411)


## 服务器修改控制台字体
> [在Ubuntu服务器中更改控制台字体](https://lzyws739307453.blog.csdn.net/article/details/103101188?spm=1001.2101.3001.6650.1&utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7ERate-1-103101188-blog-89723707.pc_relevant_3mothn_strategy_recovery&depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7ERate-1-103101188-blog-89723707.pc_relevant_3mothn_strategy_recovery&utm_relevant_index=2)


问题：安装的服务器版本控制台界面很小，字体调大后不能完全显示。



## 设置时区
> [Linux 如何设置时区、时间](https://blog.csdn.net/gezilan/article/details/79422864)

```shell
sudo timedatectl set-timezone 'Asia/Shanghai'
```





## 修改提示符 PS1
> [Controlling-the-Prompt](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Controlling-the-Prompt)
> [环境变量PS1介绍](https://hongjh.blog.csdn.net/article/details/121312038)
> [Bash PS1 customization examples](https://linuxhint.com/bash-ps1-customization/)
> [6.9 Controlling the Prompt](https://www.gnu.org/software/bash/manual/html_node/Controlling-the-Prompt.html)


要想设置永久生效，将设置放在文件中，如 `/etc/profile` 或 `.bashrc` 等都可以。

- `man bash` 帮助文档查看环境变量 `$PS1` 的介绍
![1](https://img-blog.csdnimg.cn/73a3f9095dc1413e8de842dc0318a530.png)
- 提示符说明：`man bash` 搜索 `PROMPTING`
![2](https://img-blog.csdnimg.cn/16d7d4f2437049f485ab801d1a428124.png)

- 注意 `\h` 显示主机名只到第一个 `.`前，之后的不显示，`\H` 显示完整主机名
![3](https://img-blog.csdnimg.cn/5fb00cec78d54535ba7f7a31f42ce3ee.png)
- 示例
![3](https://img-blog.csdnimg.cn/7dd9cc7760b949aabb89c0877902cd49.png)

### <font color=red>问题</font>
- ubuntu 22.04 虚拟机中修改 PS1 （`/etc/profile`），需要 source 后生效，重新打开终端还原，且 `echo $PS1` 后查看的还是原来的变量


//TODO: 补充
# PS2

# PS3


# 主机名
> [Linux 配置（一）：临时修改主机名 | 永久修改主机名 | 详解](https://blog.csdn.net/succing/article/details/120638064)
> [LINUX 主机名字规范](https://blog.51cto.com/linuxguest/109487)
> [Linux修改主机名(静态主机名、临时主机名)](https://blog.csdn.net/zhaogang1993/article/details/82769439)


- 注意主机名不规范可能出现错误

## 查看主机名
![1](https://img-blog.csdnimg.cn/5d474bdd9e3b4c94b700d1f7c36bc022.png)


## 临时修改主机名
- `hostname` 加新主机名，需要 root 权限，临时生效，不修改配置文件
![1](https://img-blog.csdnimg.cn/fd8cbfa46742403fa005d1ffc6d2bef9.png)

## hostnamectl 永久修改主机名
- `man hostnamectl` 查看帮助文档
![1](https://img-blog.csdnimg.cn/374965746b094d72bd6c24d49a88210f.png)
- `hostname` 查看当前系统主机名
	- 前面修改主机名时用的 `hostnamectl --static`，因此只修改 `static` 和 `transient` 两个参数
![2](https://img-blog.csdnimg.cn/0f220302a5334e428c11d11b3724a562.png)
- `hostname set-hostname` 永久修改主机名
![1](https://img-blog.csdnimg.cn/17c3cc520e6e42c09b45f20c5b2514e8.png)

## /etc/hostname 主机名所在配置文件
- `hostnamectl` 修改主机名后，可以看到 `/etc/hostname` 配置文件的内容改变，变为新的主机名

## 修改主机名后刷新显示
- 如果输入 `bash` 重新打开一个 shell，可以看到主机名更新了
- 如果要当前的 shell 的主机名更新，需要退出后重新进入终端 


# 查看 Linux 版本
> [如何查看当前Ubuntu系统的版本](https://blog.csdn.net/mybelief321/article/details/9076331?spm=1001.2101.3001.6661.1&utm_medium=distribute.pc_relevant_t0.none-task-blog-2%7Edefault%7ECTRLIST%7ERate-1-9076331-blog-52074390.pc_relevant_multi_platform_whitelistv3&depth_1-utm_source=distribute.pc_relevant_t0.none-task-blog-2%7Edefault%7ECTRLIST%7ERate-1-9076331-blog-52074390.pc_relevant_multi_platform_whitelistv3&utm_relevant_index=1)


# 查看 IP 地址
![1](https://img-blog.csdnimg.cn/9453b193052247aab98ee0d9d16c303e.png)

## ip a

![](img/2023-03-20-09-45-21.png)
## hostname -I
![](img/2023-03-20-09-47-28.png)
![](img/2023-03-20-09-47-52.png)

# 查看登录用户
## logname
![1](https://img-blog.csdnimg.cn/a870ec486e964186b0ab3d4caa1b6ba6.png)


## last
- 查看最近登陆的用户

![](img/2023-03-17-10-56-18.png)

## who
> [who命令、whoami命令和who am i命令的区别](https://blog.csdn.net/u014270566/article/details/124177994)
> [w who whoami](http://pygo2.top/articles/52265/)


用 `su` 切换不同用户，`whoami` 显示切换后用户名，但 `who` 显示始终是当前登录系统的用户。
![1](https://img-blog.csdnimg.cn/52e6a08cba874f7bb933c33f74055c53.png)

## w 
- `w` 显示当前全部登录用户以及做的操作

# 创建登录欢迎语
[Linux中创建自己的MOTD](https://www.cnblogs.com/gageshen/p/11565980.html)
[如何让你的终端欢迎语好看又有趣](https://zhuanlan.zhihu.com/p/115414827)
[ASCII艺术字（图）集](https://www.bootschool.net/ascii-art)

# Linux 登录
## ubuntu 登陆后为 root 账号设置密码
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






- 内部命令集成在 shell 中，shell 被执行时这些内部命令被加载到内存中，访问速度快
![1](https://img-blog.csdnimg.cn/a1075156c3074f96a1168a401f23ead6.png)
![2](https://img-blog.csdnimg.cn/92f97c9b9d9548cd96178ccb1b746760.png)

- 外部命令不在 shell 中，需要时才加载，一个外部命令对应一个二进制文件
- 外部变量的路径要在 `PATH` 环境变量中，才能找到该命令执行
- 外部命令由 shell 控制，shell 中第一次使用一个外部命令时，从 `PATH` 路径中查找，找到后放到 hash 表中缓存到，之后再次调用该命令时直接从 hash 缓存表中查找


****************
![2](https://img-blog.csdnimg.cn/0c7622fe76024419ad9e94e3f75b7f51.png)


## type 查看命令是内部命令还是外部命令
- `type` 查看是内部命令还是外部命令
- 命令路径不在环境变量 $PATH 中后，`type` 找不到该命令
- 外部命令执行后会在 hash 表中缓存下来，如果该命令路径改了，但也在环境变量 $PATH 中，也无法执行该命令，因为会从 hash 缓存中查找，用 `hash -d` 删除该命令的缓存后，可以使用


![1](https://img-blog.csdnimg.cn/afe54a6eea654b37aa85cc5612d9e29f.png)
### help type 查看 type 命令帮助文档
![2](https://img-blog.csdnimg.cn/f25dc413d8a24f479b0e8601f722a038.png)
### type -a 列出命令的全部位置
- 有些命令可能既是内部命令，又是外部命令，如 `echo` 这种常见命令，因为 shell 种类很多，防止内部命令不能用，则使用外部命令
![1](https://img-blog.csdnimg.cn/97a0466bf2e14dc6a4f59ce77352963c.png)


## enable 管理内部命令
![2](https://img-blog.csdnimg.cn/a236b269162e43ee9db9d1aaafeb5c2b.png)

### enable 查看能使用的内部命令
![1](https://img-blog.csdnimg.cn/7bb50424a0754ab09460a266204aee4a.png)

### enable -a 查看全部内部命令以及状态
![1](https://img-blog.csdnimg.cn/461c088217834b7b8a1ea832702e905b.png)
### enable -n 禁用内部命令
- 禁用后用 `enable` 查看不到
- 禁用后仍可以用 `enable -a` 查看
- 重新用 `enable` 加命令可以解除禁用

![1](https://img-blog.csdnimg.cn/edd4339fa63b4f2aa50e296c3d967bde.png)

## 外部命令
![1](https://img-blog.csdnimg.cn/59db47e14eef43bfa8c8413cf4d541d2.png)
![2](https://img-blog.csdnimg.cn/5bac4d6f11f646fa8aa5a4f6da3719d5.png)
![3](https://img-blog.csdnimg.cn/e2529c21609442df95255ea4e5d1c293.png)

# hash
> [linux的hash命令](https://blog.csdn.net/wei2314857815/article/details/104077515)


- 已使用过的外部命令的路径会保存在 `hash` 表中，可用 `hash` 命令查看，初始为空
- hash 表的缓存只是临时存在，只对当前终端，当前用户有效
- 将 hash 中已缓存的命令路径修改到环境变量 PATH 中的其他位置，无法执行该命令，因为会从 hash 中查找命令

![0](img/2023-03-06-14-53-37.png)

![1](https://img-blog.csdnimg.cn/a6ece557fb734aebaf3b5f337f50441f.png)
![2](https://img-blog.csdnimg.cn/1143c8736d2b4127a7ba8d2c8ae2557a.png)

## hash -d 从 hash 表中删除缓存的命令
![1](https://img-blog.csdnimg.cn/46a6e5138aff4633be131e8572c07a65.png)
## hash -r 情况 hash 表记录
- forget all remembered locations
![1](https://img-blog.csdnimg.cn/264ca43ee74f4e67bd7a8895d93f3bfe.png)

## hash -t 查看指定命令的路径
![1](https://img-blog.csdnimg.cn/6e4b5def196b4465a27ff3867bd71c68.png)

# 别名 alias
> [alias命令_Linux alias命令：给命令定义别名](http://c.biancheng.net/linux/alias.html)


- 优先级：别名 > 内部命令 > 外部命令

## 执行原始命令非别名
- 别名和内部命令重名时，默认执行**别名**，如果想执行内部命令，可用如下方法：
	- 别名前加`\`
	- 用**单引号**包围命令
	- 用**双引号**包围命令
	- `command 命令` 
	- 直接写命令的完整路径
![1](https://img-blog.csdnimg.cn/989095a3f6c94a5e8f4dda00600a052b.png)
![2](https://img-blog.csdnimg.cn/b66c930ce58f40fcb622f979552db10f.png)
## 自定义别名
![1](https://img-blog.csdnimg.cn/30a712a2171443a7acdb8da712322731.png)

## 删除别名 unalias
### unalias 删除一个或多个别名
![1](https://img-blog.csdnimg.cn/7d7a89cd18aa4ba4a239d05a9d5fe9f1.png)
### unalias -a 删除全部别名
![1](https://img-blog.csdnimg.cn/be270b3652ce4813b66d45748a555688.png)

## 设置别名永久生效
- 将别名永久设置：将别名写在 `.bashrc` 文件中（注意要对当前用户生效还是所有用户生效有不同的路径）。

- 修改文件后立即生效：`source` 命令。（[Linux下source命令详解 ](https://www.cnblogs.com/shuiche/p/9436126.html)）


# 获取帮助
## whatis
> [linux 命令：whatis详解](https://blog.csdn.net/yspg_217/article/details/122061132)

- 列出命令的简单描述
- 查询利用数据库，如果刚装的程序，可能查不到，需要 `mandb` 更新数据库
- rocky 8.6 中装完系统后执行 `whatis hostname` 命令，显示 `hostname: nothing appopriate`，普通用户执行 `sudo mandb`后可以正常使用

![0](img/2023-03-06-17-53-57.png)
![1](https://img-blog.csdnimg.cn/ebb4b50a5878470bbab5079b57d9b257.png)

## help 查看内部命令

![1](https://img-blog.csdnimg.cn/a6e3fe3b565b48198ce72a3fdce270e5.png)
## COMMAND --help 或 COMMAND -h
有些命令两种格式都支持，有些只支持一种

## man
- 一般查看外部命令，比 --help 和 -h 的帮助内容更详细。

- man 手册进行分区段处理，分为 9 个区，可以用 `man man` 查看：

![1](https://img-blog.csdnimg.cn/68a0626d424a4d6b9e2c4bdea281a856.png)

- 一般文件说明在第 5 区段，用 `man 5 COMMAND`

- 有些命令可能在不同区段都有说明，可以用 `whatis` 来查看，然后用 `man section CMD` 查看对应区段说明。
如 `passwd` 在第 1 区段为命令的解释，第 5 区段为 `passwd` 文件的说明。

![1](https://img-blog.csdnimg.cn/863fb534a10143b4b42ce22215ea38de.png)

![2](https://img-blog.csdnimg.cn/70f661dbb19f44f3b94998b777f2555b.png)

![3](https://img-blog.csdnimg.cn/f9d036cbad83414e9b9e02dc89b05d6c.png)

![4](https://img-blog.csdnimg.cn/0e972779b5b64649ba4d1eb9ee8557e2.png)


### man -f
- 相当于 `whatis` 
![](img/2023-03-07-09-40-46.png)

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


## linux 和 windows 互传文件工具
### xshell 中传文件

#### xftp

#### lrzsz
- `sz` 命令


# 一行执行多个命令
1. 每个命令用分号（`;`）隔开
![1](https://img-blog.csdnimg.cn/7a79ec0cdda0451e834f34282f4602c3.png)
# 一个命令分成多行
反斜杠（\）+ `Enter` 按键，中间不能有空格


![1](https://img-blog.csdnimg.cn/ed0d1e60b2a2433daca506490e3a1ef5.png)
![2](https://img-blog.csdnimg.cn/7822f00bab774e7288b7a4ed56ce8061.png)

# 计算器 bc
> [Linux bc 命令](https://www.runoob.com/linux/linux-comm-bc.html)
> [bc command in Linux with examples](https://www.geeksforgeeks.org/bc-command-linux-examples/)


1. scale 
设置小数点后位数。
![1](https://img-blog.csdnimg.cn/aa5ba446d66041ed8ee45fe19f64e6f3.png)
2. ibase
输入数字的进制（2~36），如果输入包含字母，必须大写。
3. obase
输出数字的进制（2~36）
4. last
上次打印的结果。
5. quit 结束
输入 quit 会终止执行 `bc` 命令


# 查看系统信息 
> [Linux 常用命令集合](https://www.runoob.com/w3cnote/linux-common-command.html)
## 查看系统是 32 位还是 64 位
> [灵活使用getconf命令来获取系统信息](https://www.cnblogs.com/wjoyxt/p/4815782.html)

`getconf LONG_BIT` 获取系统是 32 位还是 64 位。

`lscpu` 也会显示该信息。

## 查看系统架构
- `arch` 或 `uname -m`。
- `lscpu` 也会显示该信息

![1](https://img-blog.csdnimg.cn/81d37f6581334f8f831a832eae7e671c.png)


## 查看 CPU
1. `lscpu`
2. `/proc/cpuinfo` 文件中，可用 `cat` 命令查看。

## 查看内存
> [Linux free命令](https://www.runoob.com/linux/linux-comm-free.html)

## 查看磁盘空间
> [Linux 查看磁盘空间](https://www.runoob.com/w3cnote/linux-view-disk-space.html)
> [Linux命令 lsblk - 列出块设备信息](https://ipcmen.com/lsblk)


### df
> [Linux df 命令](https://www.runoob.com/linux/linux-comm-df.html)


![1](https://img-blog.csdnimg.cn/0721fa539ccd459f8d1e417ebfa129c5.png)


## 查看发行版本
> [查看 Linux 发行版名称和版本号的 8 种方法](https://zhuanlan.zhihu.com/p/36253769)


# 关机、重启和注销

## 数据同步写入磁盘 sync
> [Linux sync命令](https://www.runoob.com/linux/linux-comm-sync.html)

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

## 关机指令 poweroff
> [Linux poweroff 命令](https://www.runoob.com/linux/linux-comm-poweroff.html)

关闭电源

## 重启指令 reboot
> [Linux reboot命令](https://www.runoob.com/linux/linux-comm-reboot.html)

## 休眠指令suspend
> [Linux suspend命令](https://www.runoob.com/linux/linux-comm-suspend.html)
[Linux下怎么让挂起的(suspend or stopped)进程恢复执行(resume)](https://blog.csdn.net/baiyan83/article/details/109759386)


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

- 历史记录中序号后面有个 `*`


## 执行最后一次的历史命令
- 按 <Esc> 后再按 `.`，会显示出最后一次的历史命令
- 按 <Alt> 同时按 `.`，会显示出最后一次的历史命令
- 按 <Ctrl> 同时按 `P` 会显示出最后一次的历史命令
- `!!` 执行最后一次历史命令
- `!:0` 执行最后一次历史命令，但去除参数 

![1](img/2023-03-06-11-03-49.png)

- 按向上的方向键可以从后往前查看历史命令，按一次默认最后一次执行的历史命令
- `!-1` 执行最后一次历史命令

## 执行过去的某个历史命令
- 输入 `history` 显示过去的历史命令，前面有个序号，输入 `!`再输入序号，即可执行该条历史记录

- `!-n` 执行倒数第 n 个历史命令

![](img/2023-03-06-11-08-16.png)

## 查找最近历史记录
- `!string` 后面输入命令的开头几个字符，可以执行满足条件的命令
- `!string:p` 可显示以输入字符开头的最近一次命令，但不执行，执行后，按向上方向键则可显示打印的历史记录

![](img/2023-03-06-11-20-46.png)

- `!?string[?]`执行最近一次包含字符 `string` 的历史记录
- `Ctrl`+`R` 可以输入关键字查找历史记录，找到后按 `Enter` 键执行该命令，如果未找到，可按 `Ctrl` + `C` 结束输入，或者按 `Ctrl` + `G` 结束查找
- 当前用户的历史记录默认保存在 `~/.bash_history` 文件中，可在该文件中搜索


## history -n 显示最近的几条历史记录
- 相当于 `history | tail -n` 

![](img/2023-03-06-11-45-25.png)


## 删除历史记录
### history -c 清楚全部的历史记录

### history -d 删除指定序号的历史记录

![](img/2023-03-06-11-56-25.png)

## 不让命令显示在历史记录中
- 输入命令前输一个空格，该记录不在历史记录中（ubuntu 22.04 测试）


## 指定历史记录的格式和保存数目
### HISTTIMEFORMAT 指定历史记录的格式
- `man bash` 后搜索 `HISTTIMEFORMAT` 可查看该变量的说明
- `man 3 strftime` 可查看日期和时间的格式
- 可指定该变量的格式写入到 `/etc/profile` 中，或者只设置当前用户的历史记录格式写到 `~/.bashrc` 文件中，如 `export HISTTIMEFORMAT="%F %T `whoami` "`

![](img/2023-03-06-12-20-00.png)
![](img/2023-03-06-12-26-18.png)
![](img/2023-03-06-12-22-26.png)

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

![](img/2023-03-06-20-07-10.png)

![](img/2023-03-06-20-11-18.png)


# date 系统时间
> [Date Command in Linux: How to Set, Change, Format and Display Date](https://phoenixnap.com/kb/linux-date-command#ftoc-heading-10)
> [How To Format Date And Time In Linux, MacOS, And Bash?](https://www.shell-tips.com/linux/how-to-format-date-and-time-in-linux-macos-and-bash/)
> [How to Display the Date and Time in the Linux Terminal](https://www.howtogeek.com/410442/how-to-display-the-date-and-time-in-the-linux-terminal-and-use-it-in-bash-scripts/)


- `date` 显示系统时间

## 日期的格式 

![0](https://img-blog.csdnimg.cn/d6fadabe5ed848b0b2544a07c7bd0b78.png)
<br/>

- `man date` 查看帮助文档，可看到 FORMAT 介绍

## -d 指定具体日期
![1](https://img-blog.csdnimg.cn/80af8ce7463049628b28bd23bc6a2e25.png)

![1](https://img-blog.csdnimg.cn/1264f460f34247b2950d7840ee3c596a.png)
![2](https://img-blog.csdnimg.cn/b7b87a8f32534b1b9c544bab7d7b5a16.png)
![3](https://img-blog.csdnimg.cn/d59789f03b374d07a3f326220a2ee133.png)
![4](https://img-blog.csdnimg.cn/e445603ba8bd45f78997baa31a0cfc3c.png)

## + 指定具体格式

![0](https://img-blog.csdnimg.cn/9c61e1dc47324ae38bd266657cd76ec2.png)

![0](https://img-blog.csdnimg.cn/7d2e0c9ce210482e9a0a44b0511b6d3a.png)


![1](https://img-blog.csdnimg.cn/90519073b41f4fce893106807153f03b.png)
![2](https://img-blog.csdnimg.cn/857587ea0fac48958acc21a8c3e1ec6b.png)
![3](https://img-blog.csdnimg.cn/f395c91b4e59481eaa3e07d897b5a0e8.png)
![4](https://img-blog.csdnimg.cn/7fafc7f00dd245e694139c31230c91e7.png)
![5](https://img-blog.csdnimg.cn/672a5ceed1654dcfbbad4bbba4bad6f2.png)

![5](https://img-blog.csdnimg.cn/94e00276e5fc4bdd80dc14a6a5a0476b.png)
![6](https://img-blog.csdnimg.cn/ebfb1076989146de926101ab05954a97.png)

![7](https://img-blog.csdnimg.cn/9a8120c12430400fb0f060b0f6ba2cc0.png)

![8](https://img-blog.csdnimg.cn/f5c36acc51a24efc80b490e5005670f1.png)


## --set 设置时间 系统时间和硬件时间

![1](https://img-blog.csdnimg.cn/fa41083e511c445d9ba80cf2cf6e68b2.png)

## 应用

### Use date with Other Commands
![1](https://img-blog.csdnimg.cn/15c1d1aaed4e4820abed78946b1cb403.png)
<br/>

### 显示过去某天的星期
![](img/2023-03-15-14-12-20.png)

### 查看距离当前一定时间的具体日期
- `date -d` 或 `date --date`

### 查看距离某个日期一定时间的具体日期




### 计算某一天距离今天有多少天




### 计算


# 修改 bash 快捷键为 Vi 快捷键
> [Bash 行操作](https://wangdoc.com/bash/readline)


- 在 `~/.bashrc` 中加上 `set -o vi` 后，用 `source ~/.bashrc` 使配置生效



# 二进制文件查看
> [Linux命令学习总结：hexdump](https://www.cnblogs.com/kerrycode/p/5077687.html)

# windows格式文件转换为Linux 格式文件
> [Linux命令 dos2unix - 将DOS格式文本文件转换成Unix格式](https://www.w3cschool.cn/linuxc/linuxc-gvjq3lbf.html)


//LABEL: echo
# echo
> [echo command in Linux with Examples](https://www.geeksforgeeks.org/echo-command-in-linux-with-examples/)
> [How to use Linux echo command](https://www.ionos.com/digitalguide/server/configuration/linux-echo-command/)

## echo -n 不输出结尾的换行符
![](img/2023-03-14-19-43-47.png)


## echo -e 允许转义
![](img/2023-03-14-19-46-03.png)
![](img/2023-03-14-19-46-54.png)
![](img/2023-03-14-19-48-11.png)


- `echo -e "a b c \c"` 输出的内容不会换行，相当于 `echo -n "a b c "`
## <font color=red>echo $(ls) 和 ls</font>
> [Difference between 'ls' and 'echo $(ls)'](https://unix.stackexchange.com/questions/283586/difference-between-ls-and-echo-ls)
> [Command Substitution](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Command-Substitution)



![](img/2023-03-16-19-32-57.png)

# PATH 环境变量
> [Linux path environment variable](https://linuxconfig.org/linux-path-environment-variable)
> [环境变量](https://www.lanqiao.cn/courses/1/learning/?id=60)
> [How to Set Environment Variables in Linux](https://phoenixnap.com/kb/linux-set-environment-variable#ftoc-heading-1)


## 设置临时环境变量
![1](https://img-blog.csdnimg.cn/203283acce344b7499130fe99b14b442.png)
![2](https://img-blog.csdnimg.cn/5cd63e05c1454c27ba8e28527dca8324.png)

## 设置永久环境变量

在 /etc/profile 文件中添加，对所有用户生效。

![1](https://img-blog.csdnimg.cn/13907b40d87f4b3695e04c68d7f11356.png)
![1](https://img-blog.csdnimg.cn/6953532b11f94209a366a90f2378672e.png)
<br/>

## 在 PATH 中添加路径
> [Linux中如何添加自己的路径到PATH](https://blog.csdn.net/qq_16209077/article/details/50711397)
> [关於运行档路径的变量： $PATH](http://cn.linux.vbird.org/linux_basic/0220filemanager_1.php#dir_path)






# /dev/null
> [What is /Dev/Null in Linux?](https://www.geeksforgeeks.org/what-is-dev-null-in-linux/)
> [shell 脚本中 /dev/null 的用途](https://www.cnblogs.com/wanng/p/shell-dev-null.html)


# 用户
> [Linux User Administration: A Complete Guide to Managing Multi-User Systems](https://www.linuxfordevices.com/tutorials/linux-user-administration)

## 用户类型

![1](https://img-blog.csdnimg.cn/3462364620494c36a8a334c4233e5715.png)
<br/>

- **根据 UID 区分不同的用户类型**
在 `/etc/login.defs` 文件中查看 UID 的范围，不同的系统可能不一样，下面是 Ubuntu 22.04.1 查看的范围：
![1](https://img-blog.csdnimg.cn/e574f71072e54d3eac3d805628889923.png)

	- 超级用户
	root，UID 为 0
	- 系统用户
	100 ~ 999
	100 是保留给用户设置使用的最小值
![1](https://img-blog.csdnimg.cn/ef646ce538944398b987d3640d5b1b49.png)

	- 普通用户
	1000 ~ 60000

### 新建普通用户 UID 超过 60000 影响
- 根据配置文件 `/etc/login.defs`，普通用户的最大 UID 为 60000，但新建 UID 超过 60000 也能新建成功，但有一些影响，见 [Using Large User IDs and Group IDs](https://docs.oracle.com/cd/E19120-01/open.solaris/819-2379/userconcept-35/index.html)
![1](https://img-blog.csdnimg.cn/415b371e172d4f16a1b0d6f2edbc3b7b.png)


## 查看当前全部用户
### 在 `/etc/passwd` 中查看全部账户信息
- 查看全部
![1](https://img-blog.csdnimg.cn/859a2982188748b3b87e18436454aad9.png)	
- 查看最后部分
![2](https://img-blog.csdnimg.cn/37e4eb45763d4f1f996f7f2925de5712.png)
- 查看前面部分
![3](https://img-blog.csdnimg.cn/c0bb2aa264b3468f8990fa71cfbfe85f.png)

### 通过 `getent passwd` 查看
- 查看全部用户
![4](https://img-blog.csdnimg.cn/1e8e87df525d4b4c9b25cd3de0b66c32.png)

- 查看某个特殊用户信息
根据用户名或者 UID 查询
![5](https://img-blog.csdnimg.cn/251e28e099d34fd2aba360e41a684521.png)

## 用户组分类
- 管理员组
- 系统组
- 普通组

### GID 范围
通过 `/etc/login.def` 文件查看，Ubuntu 22.04.1 查看范围如下：
![1](https://img-blog.csdnimg.cn/8315e27a5cc141408b6b79ea06ea4cdf.png)

## 私有组、主要组和附加组
> [Linux私有组，主要组和附加组 ](https://blog.51cto.com/xinsz08/5022617)

- 创建新用户时默认会创建一个和该用户同名的组，组ID 为 GID
- `id username` 可以查看其全部组
![1](https://img-blog.csdnimg.cn/c22580ba940545fc9edae820afa4b826.png)

## 用户和组相关配置文件
### /etc/passwd
- 查看该配置文件的说明：
![1](https://img-blog.csdnimg.cn/3a4c9c0ded454e7fbc9450c39850684e.png)
该配置文件包含用户账号的信息，每一行一个用户，由 7 部分组成，每个部分由冒号分隔，内容如下：
![2](https://img-blog.csdnimg.cn/7a6d08fe51e94cc9a022e745ce1c775b.png)


- 配置文件的内容
![2](https://img-blog.csdnimg.cn/368d2ee181b64e1fb77975ec79f5b5cd.png)
	- 第二段密码
		- 如果用户密码为**小写的 `x`**，表示密码实际在 `shadow` 文件中，可以在 `etc/shadow` 文件中查看，如果**该文件中没有则密码无效**
		- 如果**用户密码为空**，则不需要密码。但有些应用可能在密码为空时不允许访问。
		- 如果密码以感叹号 `!` 开头，表示**密码被锁定**
		新创建的用户，还没设置密码时，查看密码为一个 `!`，除了 `root` 可以直接切换到该用户外，其他用户不能切换，需要先设置密码
		用 `passwd -l` 锁住密码后 `/etc/shadow` 中加密的密码前也有一个 `!`	![1](https://img-blog.csdnimg.cn/8058e0605677489e9fcae702f4758947.png)
![2](https://img-blog.csdnimg.cn/d6ea94a978644ba59430163545ccf0e8.png)
![3](https://img-blog.csdnimg.cn/9cda11e669c542f9843654772c1d6990.png)

	- 第七段
该段显示 shell 的类型

### /etc/shadow 用户密码相关配置
> [详细解析/etc/shadow文件尤其是加密密码字段](https://www.cnblogs.com/jason-huawen/p/16300671.html)


- 查看配置文件的帮助文档
![1](https://img-blog.csdnimg.cn/a8f34eee0bd9470f8d636bc292dbe602.png)


- 查看该配置文件的内容
![2](https://img-blog.csdnimg.cn/a3264046efaf42c4a31d5d90d227aa73.png)<br/>


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
![1](https://img-blog.csdnimg.cn/aeda50a8882b46cab39e0c7c50e0a303.png)

- 配置文件内容
![2](https://img-blog.csdnimg.cn/e1740769beea49f3b64771852ae3a112.png)
	- 第 1 字段 组名
	- 第 2 字段 组密码
	字段为空表示不需要密码。
	- 第 3 字段 GID
	- 第 4 字段 组中的全部用户
	逗号分隔用户，用户为以该组为**附加组**的用户，**不包含主要组**的用户


### /etc/gshadow 组密码相关配置
- 查看帮助文档
![1](https://img-blog.csdnimg.cn/2476eeef95c546a9a2f3cf86336560bd.png)

- 查看配置文件内容
![2](https://img-blog.csdnimg.cn/70f088dec33b44f89c6136626306ae4c.png)
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
![1](https://img-blog.csdnimg.cn/1e41ef7bb60a41e6a97ef47a7febf9a1.png)
![2](https://img-blog.csdnimg.cn/a647c2e64eba474ca63590d587ab88b3.png)
- 该目录在 `/etc/default/useradd` 文件中指定
![3](https://img-blog.csdnimg.cn/21aa866434844f6ebe026d7da2b217b1.png)






### /etc/login.defs 用户默认设置文件 
> [Linux /etc/login.defs：创建用户的默认设置文件](http://c.biancheng.net/view/3059.html)


#### 查看 UID 和 GID 范围
![1](https://img-blog.csdnimg.cn/62583e07edb14abf8cd1ef7fbcc4ae0d.png)
#### 默认加密方法
- `/etc/shadow` 中第二个字段加密密码的方法
![2](https://img-blog.csdnimg.cn/1d84b7110fe64cbd862b1511ece94416.png)
![2](https://img-blog.csdnimg.cn/f9e2d6ae5e5f4cedb7486e069a125f83.png)


### /etc/default/useradd 指定创建新用户时的默认设置
> [/etc/default/useradd文件详解](https://blog.csdn.net/qq_41982304/article/details/104953572)

利用 `useradd` 命令添加新用户时默认的设置。

#### 指定创建用户时的默认 shell 类型
- ubuntu 20.04 默认 `/bin/sh`，rocky 8.6 中默认 `/bin/bash` 
![1](https://img-blog.csdnimg.cn/79fca442c0444e01bd2b36faeb0e955c.png)
![2](https://img-blog.csdnimg.cn/6ad39c01101b46578c07c6d1f0d474b9.png)

#### 指定创建家目录时复制配置文件的路径 SEKL
![1](https://img-blog.csdnimg.cn/299791d813d54a778b28a7d1f3506f7d.png)

#### 指定创建用户时是否创建 mail spool
- ubuntu 22.04 默认不创建 mail spool，rocky 8.6 默认创建
- 将 ubuntu 22.04 `CREATE_MAIL_SPOOL` 那行去掉注释则创建 mail spool
![1](https://img-blog.csdnimg.cn/5adf2c804b274490aa60a3b1e60da9f6.png)
![2](https://img-blog.csdnimg.cn/9b6908cacd1e4c0fad84d9f950266e7f.png)

&nbsp;

## 添加用户
> [useradd](https://linux.die.net/man/8/useradd)
> [Linux 中useradd命令的使用](https://www.cnblogs.com/Hackerman/p/12535719.html)


### 指定家目录
1. `-b` 选项指定 basedir，家目录默认由 **basedir** 和**账户名**组合在一起，如：
![1](https://img-blog.csdnimg.cn/ea80e41009c5447fb1174c83a752697b.png)

<br/>

2. 加 `-m` 选项可以实际生成该家目录，并将 `/etc/skel/` 目录中的配置文件拷贝到家目录下：
![2](https://img-blog.csdnimg.cn/316f0ec16b9e4cbb99d71f9191e585b3.png)
<br/>

3. `-d` 选项可以直接指定**家目录的完整路径**，如果同时指定 basedir 和 homedir 且两者不一致，不管命令的先后顺序，以 `-d` 指定的路径为主：
![3](https://img-blog.csdnimg.cn/b87ea03fa12e4770901177825f46e798.png)
<br/>

4. `-d` 选项指定的**路径不存在时**可以**创建该路径**，包括**多级子目录都可以创建**，但创建子目录时有提示；`-b` 创建 basedir 规则也相同：
![4](https://img-blog.csdnimg.cn/9594ad79cdda471e979debeaeeb3cc7d.png)
![5](https://img-blog.csdnimg.cn/81bdcb83954b48cca583c4708ccd6d78.png)
![6](https://img-blog.csdnimg.cn/8b9b01a52ade444eb243c9ee89ee5476.png)
![7](https://img-blog.csdnimg.cn/71aaaa52cec64601b37563f2af2ae80d.png)

<br/>

5. 如果不指定 basedir 和 homedir，则使用默认值，默认在 `/etc/login.def ` 文件中
	- 默认认 basedir 为/home，家目录为 basedir/用户名/
![7](https://img-blog.csdnimg.cn/f22795e9d02d4167931cacf104b950e7.png)
	- `ubuntu 22.04`  中没有该设置，`rocky 8.6` 有
![6](https://img-blog.csdnimg.cn/9b070855f0d04a078e67f650acfebb40.png)
![7](https://img-blog.csdnimg.cn/b591244d0cd14ab08a67ff669ce79574.png)

<br/>

### -u 指定 UID
#### `-u` 选项指定 UID，默认如果 UID 已存在，则不能创建：
![1](https://img-blog.csdnimg.cn/c36b8d4c54874223b4d8a40fae390054.png)
<br/>

#### `-u -o` 两个选项结合可以创建重复的 UID
![2](https://img-blog.csdnimg.cn/591f122613cf4b1e92c5d7aeb0ca4f02.png)

#### 创建的账户指定 UID 为 0 时
![1](https://img-blog.csdnimg.cn/9973b08510e64555aa6077076eb1baf4.png)
该账户显示为 root，具有 root 权限：
![2](https://img-blog.csdnimg.cn/f9bd43ea8be14e5b82a6192b4d80dd3e.png)
#### 指定 UID 超过 60000
- 根据配置文件 `/etc/login.defs`，普通用户的最大 UID 为 60000，但新建 UID 超过 60000 也能新建成功，但有一些影响，见 [Using Large User IDs and Group IDs](https://docs.oracle.com/cd/E19120-01/open.solaris/819-2379/userconcept-35/index.html)
![1](https://img-blog.csdnimg.cn/415b371e172d4f16a1b0d6f2edbc3b7b.png)
### -g 指定用户 primary group
`-g` 选项指定主要组，可以指定组名或者 GID，但**组必须存在**
如果不指定，默认创建一个**和用户同名的组**

![1](https://img-blog.csdnimg.cn/e3fbcb3ddfcf4bf0bd6a297fa5ea8e25.png)

### -G 指定用户附加组
用 `-G` 选项增加附加组，附加组可以多个，用逗号 `,` 间隔，如果不指定主要组，则默认创建一个用户名同名的主要组。

![1](https://img-blog.csdnimg.cn/2e39e6b8a7994476b23cdd2bb7a8507d.png)
### -s 指定 shell
Ubuntu 22.04.1 默认用 useradd 创建用户的 shell 为 `/bin/sh`，可在 `/etc/default/useradd` 文件中查看，可以修改默认为 `/bin/bash`
![1](https://img-blog.csdnimg.cn/aa850680f54148b18f6d1b28f6294457.png)![2](https://img-blog.csdnimg.cn/b34fed8b44d04fcd95e264fac9048072.png)

### -r 创建系统用户
`-r` 选项创建系统用户，系统用户和普通用户的 UID 范围不同。

![1](https://img-blog.csdnimg.cn/b557ca941d0d421f91e354b6c9428ea8.png)![2](https://img-blog.csdnimg.cn/3e8be66ac53e4756b260cfe6c79c1217.png)
### -m 创建家目录
用 `-d` 指定加目录后默认不会真的创建该目录，需要用 `-m` 选项创建，而 `-M` 选项则不创建家目录。

![1](https://img-blog.csdnimg.cn/d1596edfa74b4bdabb6fbcf8d1e3184b.png)

### -e 设置账号过期时间
`-e` 选项设置账号过期时间：
![1](https://img-blog.csdnimg.cn/9639737365fa41ff8cc51ca12571c04b.png)
![2](https://img-blog.csdnimg.cn/4ebbcbe254a1439aa496edbff738d69e.png)

### <font color = 'red'>-l 不将新创建的用户添加到 lastlog 和 faillog 数据库中</font>
![1](https://img-blog.csdnimg.cn/1b288af44c8e46b7a57ed0f706c6e9a8.png)

*********************
**问题：**
- ubuntu22.04 指定 `-l` 选项后新加的用户仍在 `lastlog` 数据库中？？
![2](https://img-blog.csdnimg.cn/e98725beb529440db7de3977261d602b.png)

### useradd 和 adduser
> [useradd和 adduser的区别](https://blog.csdn.net/cynthrial/article/details/84673357)


Ubuntu 22.04.1 测试两者区别，adduser 会交互式让输入密码，默认的 shell 为 `/bin/bash`，自动创建主目录且赋值默认文件：

![1](https://img-blog.csdnimg.cn/ca88313c2dc3402e8d44fe491c05b022.png)

![2](https://img-blog.csdnimg.cn/7e20bea56b2749569368ae0322570e04.png)


### 批量添加用户 newusers
> [newusers和chpasswd的用法](https://blog.licess.com/newusers-chpasswd/)

- 格式按照 `/etc/passwd` 中写
![1](https://img-blog.csdnimg.cn/390c8e5a4cf34e44b1f5f2d455caa4ec.png)

## 新添加的用户不能执行 ll 命令问题
- 测试环境为 Ubuntu 22.04.1
![1](https://img-blog.csdnimg.cn/9d16342866d74448a1a67e678b7e8820.png)

- 解决方案
用 `-m` 选项增加家目录（家目录内会有一些配置文件），并用 `-s` 选项修改 shell  为 `/bin/bash`
![2](https://img-blog.csdnimg.cn/f284176e41c44b8791cef67a8a4558d0.png)
![3](https://img-blog.csdnimg.cn/f55cfc1bc0d84473b2ff6fe7c64b94b7.png)


## 新添加的账户设置登录密码
新建账号没有设置密码时，先切换到 root 账户，然后用 `passwd` 命令设置密码，再切换到新账户即可正常使用新账号登录：
![1](https://img-blog.csdnimg.cn/b099c0fb857e4e62951c2175c552a21e.png)

## 无法切换到 root 账户
新装好 Ubuntu 系统后用 `su` 或 `su -` 无法切换到 root 时，可以修改 root 密码，再切换

![1](https://img-blog.csdnimg.cn/be9aed1077b441ddb2537331d4e33457.png)

&nbsp;

## 新建用户时默认创建家目录
- ubuntu 20.04 和 rocky 8.6 的默认设置有差异
- rocky 8.6 中新建用户默认创建家目录
- ubuntu 20.04 中新建用户不指定 -m 选项，不创建家目录
- 在 `/etc/login.defs`  文件中设置

![1](https://img-blog.csdnimg.cn/9b178e2d3467464daa2554a607811208.png)
![2](https://img-blog.csdnimg.cn/f4b35a74fec945d69e7e34aa385d2822.png)
![3](https://img-blog.csdnimg.cn/086ee324c1b048cf822a2af782974541.png)

![3](https://img-blog.csdnimg.cn/abe8e8bf46ff453ab749083d88530fd2.png)

****************
- `/etc/login.defs` 文件中设置 `CREATE_HOME` 变量
- ubuntu 20.04 需要新加设置
![1](https://img-blog.csdnimg.cn/8bf7538b0d8b40d1bba8a1b1ce247f57.png)




## 新建用户时为家目录中添加指定文件
- 将要默认添加的文件添加到 `/etc/skel` 目录中
- `useradd -m` 在创建用户时创建家目录
![1](https://img-blog.csdnimg.cn/bb72ca267e8e41dd966cec80e4ee767a.png)

## mkhomedir_helper 为已创建的用户创建家目录
- `man mkhomedir_helper` 查看该命令的帮助文档
![1](https://img-blog.csdnimg.cn/7128e17eb1654805829a7a1e3564281a.png)

### 用户已存在家目录：原来家目录文件时间不更新
![1](https://img-blog.csdnimg.cn/a1e062257b4b4b659445a6d267c07ec5.png)
![2](https://img-blog.csdnimg.cn/4eccf180582f4632ba16a942f06491ad.png)

### 用户不存在家目录：创建家目录并拷贝默认文件
![1](https://img-blog.csdnimg.cn/5471505d22a94f05a5fb9ea96b821638.png)

## 修改用户账户 usermod
> [Usermod Command in Linux](https://linuxize.com/post/usermod-command-in-linux/)


### -g 修改用户初始组群 GID
`-g` 选项修改用户 GID

![1](https://img-blog.csdnimg.cn/7a807ba27c4642cdbb10d0ac1bf34cd5.png)

### -G 修改用户附加组 
`-G` 选项修改附加组。

![1](https://img-blog.csdnimg.cn/0dbf2314dc5c444cbafb2c79f9160d08.png)

![2](https://img-blog.csdnimg.cn/f1edd5b4198d4e3c873eb69f30f23518.png)

### -aG 添加附加组
`-G` 修改附加组，会完全替换之前的附加组，如果想在原来基础上添加附加组，加上 `-a` 选项。
注意要写 `-aG`，如果写 `-Ga` 失败：

![1](https://img-blog.csdnimg.cn/68f5a02015234f80857b9cf1683fb6b8.png)![2](https://img-blog.csdnimg.cn/220a4a94cf124074a8780a86be3c3ba0.png)


### -d -m修改家目录
`-d` 选项修改家目录，但**不会创建该家目录**，也不会将原来家目录内容移到新目录中。

![1](https://img-blog.csdnimg.cn/c8cbb47b12a54370a55448252cef055b.png)
<br/>

加上 `-m` 选项可**新建家目录并将原来目录改为新目录**。

![2](https://img-blog.csdnimg.cn/7fbfc90850cf4a94a1b0a3eb1849e4f6.png)

### -s 修改用户默认 shell
![1](https://img-blog.csdnimg.cn/d2c8eec1c01d4ad39369836e0ba7b4e1.png)

### -u 修改用户 UID
`-u` 选项修改 UID，和添加用户时使用规则相同，注意范围，以及修改的 UID 不能和已存在的相同，如果添加相同的 UID，需要加上 `-o` 选项。![1](https://img-blog.csdnimg.cn/e425dca499f542eb9be0e39a7262120a.png)


### -l 修改用户登录名
- 家目录的名称不变
- GID 对应的组名不变
- 文件中 owner 名改变
![1](https://img-blog.csdnimg.cn/f549dff0456945a3829fe3067b54cf8e.png)

### -e 修改账号过期日期
`-e` 选项，和 `useradd` 使用方法相同。


## 删除账户 userdel
> [How to Delete/Remove Users in Linux (userdel Command)](https://linuxize.com/post/how-to-delete-users-in-linux-using-the-userdel-command/)

### userdel -f
- `userdel` 删除用户，如果用户正在登录，无法删除，需要 `-f` 选项强制删除。
![1](https://img-blog.csdnimg.cn/3ecc9e65bb26470192ba8388c0fdb9f4.png)

### userdel -r 删除家目录和 mail spool 文件
不加 `-r` 删除用户后其家目录以及里面的文件仍存在。
![2](https://img-blog.csdnimg.cn/e64bfc19b88a4c1a98fe3ce7a5de5257.png)
![3](https://img-blog.csdnimg.cn/07e232babe154744a3f4da3842cf9abd.png)
![4](https://img-blog.csdnimg.cn/f7730ba0f7fa43f298a9abf60ec72866.png)


## 账号信息查询
### id 查询 UID GID
`-G` 即 `groups` 里内容，包括主要组和附加组。

![1](https://img-blog.csdnimg.cn/517092a51b0f4bb4878843f8d3e7cba6.png)

### finger

### chfn

### su 切换账号
> [Linux su命令：用户间切换（包含su和su -的区别）](http://c.biancheng.net/view/3089.html)

- 切换普通账号
![1](https://img-blog.csdnimg.cn/18a3775899c34a1392e21c53bd06f83e.png)

- shell 为 /sbin/nologin 的账户登录
[What does "sudo su -s /bin/bash - <username>" do?](https://unix.stackexchange.com/questions/277639/what-does-sudo-su-s-bin-bash-username-do)
对于shell 为 /sbin/nologin 的账户，无法直接切换
![1](https://img-blog.csdnimg.cn/5790232c6695444683e30e2df153ce86.png)
![2](https://img-blog.csdnimg.cn/2624a90ae0954d7b83e0dc9651a2a170.png)

### sudo
> [第十四章、Linux 账号管理与 ACL 权限配置](http://cn.linux.vbird.org/linux_basic/0410accountmanager_4.php#sudo)
> [How to Use the sudo Command in Linux](https://phoenixnap.com/kb/linux-sudo-command)
> [su、sudo、sudo su、sudo -i sudo -l的用法和区别](https://blog.csdn.net/mutou990/article/details/107724302)


使用 sudo 可以执行超级用户权限，且输入的是**自己用户的密码**而非 root 密码，但账号能否使用 sudo 要看 ` /etc/sudoers ` 文件的设置。

![1](https://img-blog.csdnimg.cn/cd8b112bb16544cb879778aae9d4c7c3.png)

- usermod 命令将账户加入 sudo 组使用 sudo 命令
从 `/etc/sudoer` 配置文件可以看见 sudo 组的成员可以执行命令：
![2](https://img-blog.csdnimg.cn/d1b02eee664449909704ff9c7371f181.png)
![3](https://img-blog.csdnimg.cn/66a3ed90223e4312b60e8226914c1e8e.png)
- 添加附加组也可以
![4](https://img-blog.csdnimg.cn/3509498563b245468784e759b31e59e4.png)
![5](https://img-blog.csdnimg.cn/68479d19dae24abdb7870491db6649cc.png)



- 修改 /etc/sudoers 文件 
普通用户可以用 `sudo vi /etc/sudoers` 修改该文件，或者用 **visudo** 来修改。
![1](https://img-blog.csdnimg.cn/938eb5a96be74d02a71809c18a200433.png)
![1](https://img-blog.csdnimg.cn/c01885f953d44d4689cf5d71da8cfdfa.png)

******************************

visudo 的其他用法见 [第十四章、Linux 账号管理与 ACL 权限配置](http://cn.linux.vbird.org/linux_basic/0410accountmanager_4.php#sudo)。


## 用户密码 
> [How to Handle Account Passwords in Linux With passwd Command](https://linuxhandbook.com/passwd-command/)
> [第十四章、Linux 账号管理与 ACL 权限配置](http://cn.linux.vbird.org/linux_basic/0410accountmanager_2.php#passwd)


### 密码格式
![1](https://img-blog.csdnimg.cn/9a1df016c262461f850bfaa64a419e74.png)

### 普通用户修改自己密码 passwd
![1](https://img-blog.csdnimg.cn/8a955746d959419e9c22853b35b29b33.png)

### 修改 root 账号密码 sudo passwd root
![1](https://img-blog.csdnimg.cn/f14726bbf68a433da4aeee103e96d7ac.png)

### 修改其他用户密码
- sudo passwd 用户名
如果普通用户可以执行 sudo 则可以修改其他用户密码，不需要知道其原始密码
![1](https://img-blog.csdnimg.cn/ed5b1b182d2a4b26b7ef51d99082b439.png)

- root 账户修改 passwd 用户名
![2](https://img-blog.csdnimg.cn/420f27a11d06447cb13c456d33d32aaa.png)

### 检查密码状态 passwd -S
![1](https://img-blog.csdnimg.cn/6623a174cc2845109021564e35ef3c99.png)
![2](https://img-blog.csdnimg.cn/6017e9ca0bcf4586b80f3a7600d5a931.png)

<br/>


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
![1](https://img-blog.csdnimg.cn/24b53b29d8cb41318ec0407584d176d6.png)

### 强制用户在下次登录时修改密码
#### passwd -e 用户名
![1](https://img-blog.csdnimg.cn/6dd4c6dcfbad4525bf0b77988e6d5841.png)

#### chage -d 0 用户名
![2](https://img-blog.csdnimg.cn/56f20881ada34fe2bd54b578ea8f753f.png)


### 锁定账户密码 passwd -l
- passwd -l 用户名锁住密码
![1](https://img-blog.csdnimg.cn/b2ac543bd35e4e279715f73dea3934e9.png)

- passwd -u 用户名 解锁密码
![2](https://img-blog.csdnimg.cn/76ef246655c04c7ba9aa37bcb1e53a2d.png)

### 删除密码 passwd -d
![1](https://img-blog.csdnimg.cn/6b5113a5818c47e4a6c15269bc6e243a.png)

### 设置最短密码使用时间
距离上次修改密码后，最短需要等待多少天才能修改密码，默认值为 0，即随时可以修改密码，可以通过 `-n` 选项修改。

![1](https://img-blog.csdnimg.cn/47365da75f1849daa17d378bf0742d7c.png)

### 修改密码过期参数 chage
![1](https://img-blog.csdnimg.cn/8ae921d5d7b340fca5477558d1ecdda7.png)
<br/>

1. 初始：
![1](https://img-blog.csdnimg.cn/7484fb90675247258b9e7539b38550d2.png)

2. 修改最近一次修改密码日期
![2](https://img-blog.csdnimg.cn/c3244c5ddced4c709e1dd6e29974779a.png)
如果设置数值为 0 则密码立即过期，下次登录必须修改修改密码：
![3](https://img-blog.csdnimg.cn/c63a0eb2551941848a94e2e676ebd776.png)


3. 修改最短密码使用天数
![3](https://img-blog.csdnimg.cn/1207c4a7a0464c5ca84292a348120bf8.png)
![4](https://img-blog.csdnimg.cn/6170508e5d5f455ea46ba4e227e973ad.png)
4. 设置账号过期日期
![5](https://img-blog.csdnimg.cn/4197fbebd61e439c8d13761094b496e7.png)

5. 设置密码最长使用天数
![6](https://img-blog.csdnimg.cn/4fe842dd62a541f8afeca35e1c674c23.png)

6. 设置密码过期后的宽限期
![7](https://img-blog.csdnimg.cn/5a46832d47b74473853da696ef99e060.png)
![8](https://img-blog.csdnimg.cn/1157ccbeac7f4c0bb14ea41852bdab8d.png)

### 批量修改密码 chpasswd
> [chpasswd command in Linux with examples](https://www.geeksforgeeks.org/chpasswd-command-in-linux-with-examples/)

![1](https://img-blog.csdnimg.cn/fa314e531a8440b8bacbdf5177548516.png)

### 无交互形式修改密码

![1](https://img-blog.csdnimg.cn/302a18dceb01453194efa57f0f02bb68.png)
![2](https://img-blog.csdnimg.cn/f2dd47040c5147879c1990ceb1ad6f69.png)

# 组
## 用户组分类
- 管理员组
- 系统组
- 普通组

### GID 范围
通过 `/etc/login.def` 文件查看，Ubuntu 22.04.1 查看范围如下：
![1](https://img-blog.csdnimg.cn/8315e27a5cc141408b6b79ea06ea4cdf.png)



## 私有组、主要组和附加组
> [Linux私有组，主要组和附加组 ](https://blog.51cto.com/xinsz08/5022617)


## groupadd 添加群组
> [The groupadd command in Linux – A complete guide](https://www.linuxfordevices.com/tutorials/linux/groupadd-command)
> [groupadd](https://haicoder.net/linux/linux-groupadd.html)


- 添加普通组 groupadd -g GID 组名
![1](https://img-blog.csdnimg.cn/0943533cef424c228e7498e813b5a3fb.png)

- 添加系统组 groupadd -g GID -r 组名
![2](https://img-blog.csdnimg.cn/2d37a36390e344eb86c9bd6c18e1dd78.png)
## groupmod 修改组
- 修改组的名字  groupmod -n
- 修改组的 GID  groupmod -g

![1](https://img-blog.csdnimg.cn/b1de41e80c104215b5affe825e34ca97.png)
## groupdel 删除组
`groupdel 组名`，如果该组是某个用户的主要组（GID 为该组），则无法删除，需要用 `-f` 选项强制删除。

如果要删除的组是某个用户的附加组，则可以正常删除。

![1](https://img-blog.csdnimg.cn/46eb396f2e4e4c4d930b2d0b30ec34d8.png)

## newgrp 切换用户登录的组 
> [Linux newgrp command](https://www.computerhope.com/unix/unewgrp.htm)
> [Linux newgrp命令用法详解：切换用户的有效组](https://blog.csdn.net/digitalkee/article/details/102616038)


- 默认新建一个文件时其组为 GID 对应的那个主要组，如果要**新建文件时组为附加组**，用 **newgrp** 命令
- 与 `su` 和 `su -` 类似，如果切换组时用 `newgrp`则**当前目录不变**，如果用  `newgrp -`则当**前目录改变**


![1](https://img-blog.csdnimg.cn/1d9cd547d21d4f2284334435ac9057f4.png)
![1](https://img-blog.csdnimg.cn/941cd4f7e7474c01ad0437cd2464bf95.png)
![2](https://img-blog.csdnimg.cn/5518e548da5146c5b7360aa218cd84fd.png)


## 查看当前全部组
### /etc/group 文件中查看
![1](https://img-blog.csdnimg.cn/d50ab2ba706c4080a42f95168762d636.png)
![2](https://img-blog.csdnimg.cn/ae4c3f7757134000a3452c3634548f65.png)

### getent group 查看
![2](https://img-blog.csdnimg.cn/f8121ccc97dc468980ed8234521cd123.png)

## 查看某个附加组成员
### getent group 组名
`/etc/group` 中最后一个字段为该组成员，但为用户的附加组，不包括主要组，可以通过 `getent group` 查看：
![1](https://img-blog.csdnimg.cn/8e5509c1021b421b8836d075ee870304.png)

### groupmems 组名
![2](https://img-blog.csdnimg.cn/c17bf8f7c73d4dc9af5e12e3f0e2e283.png)

## 查看用户所在的全部组 
- id
- groups

![1](https://img-blog.csdnimg.cn/689d86cd2d1540e1ba2da7aea0eef482.png)


# 文件权限
> [第六章、Linux 的文件权限与目录配置](http://cn.linux.vbird.org/linux_basic/0210filepermission_2.php)
> [Linux 的文件权限与目录配置](http://cn.linux.vbird.org/linux_basic/0210filepermission_2.php#filepermission_ch)


## 查看文件权限
![1](https://img-blog.csdnimg.cn/d4b55a0d6fbb4acab5032dd955bf6866.png)![2](https://img-blog.csdnimg.cn/b5c37029fb004e7788c9f5c29ca6e739.png)

## 文件和目录权限意义
- **文件存放数据**，**目录**存放内容为**文件名清单**

### 文件权限
- **r（read）**
读取文件内容

- **w（write）**
编辑，新增，修改**文件内容**（不包含删除文件）
![2](https://img-blog.csdnimg.cn/93e0054b81d947938ced6c7309dad1f4.png)

- **x（execute）**
	- 该文件可以被系统执行
	- **Windows** 中文件**是否可执行**是依据**文件的后缀**
	- **Linux** 文件**是否可执行**是依据其**是否有 x 权限**
	- 如果**有 x 权限**但**文件不是可执行文件**也**不能执行**，如给一个文本文件可执行权限也不能执行

**********************

### 目录权限
- **r（read）**
读取目录结构清单，即查看文件名。
![1](https://img-blog.csdnimg.cn/076a98f1086b4a4a8bfcd4c38e28baea.png)
![2](https://img-blog.csdnimg.cn/2a18551685c642d3aadbe0a9abb1c74a.png)
![3](https://img-blog.csdnimg.cn/da75123b240c43718f42908343b4119d.png)


- **w（write）**
	- 创建新的文件或子目录
	- 删除文件或子目录
	- 修改文件或子目录名字
	- 移动文件或子目录的位置

![4](https://img-blog.csdnimg.cn/eb0e33905c02419f933bc2dd38102fa6.png)
![5](https://img-blog.csdnimg.cn/e297a22ad35647bfbdda614653e19d7f.png)
![6](https://img-blog.csdnimg.cn/2689d6a1ed4a4aa78127f771053d0cc1.png)

- **x（execute）**
使用者能进入目录的权限，如果目录只有 w 权限而没有 x 权限，也不能删除或新增文件等操作。

![7](https://img-blog.csdnimg.cn/ef7992d0fa1b41fea790afb89730a67e.png)
![8](https://img-blog.csdnimg.cn/0eed7000597c4a70be1781df726e9464.png)


## 修改所在组 chgrp
新的组必须存在。
普通用户需要用 sudo 执行该命令：

![1](https://img-blog.csdnimg.cn/5b395e7f051846b78ab4f986197e7756.png)

### 修改文件的所属组
![1](https://img-blog.csdnimg.cn/0ca29108f4be49f1a7604f7373ec1b5d.png)

### 修改目录的所属组
![2](https://img-blog.csdnimg.cn/10893450ed5c49a49b9244e4b3c6e7c8.png)

## 修改所有者 chown
普通用户需要用 sudo 执行该命令：

![1](https://img-blog.csdnimg.cn/b88b35c015ef44c1bf64c091e93d6913.png)

### 修改文件所有者
![1](https://img-blog.csdnimg.cn/53ae2c3c525d47fd800f489e7e58168a.png)

### 修改目录的所有者
注意仅修改目录的所有者还是修改目录以及其所有子目录和文件的所有者。

1. 初始：
![1](https://img-blog.csdnimg.cn/37052a3940bd4f1ba015d30053ac1376.png)

2. 仅修改目录 passwd 的用户和所有组
![2](https://img-blog.csdnimg.cn/31917f79fb7048918327de0701aad20f.png)

3. 修改目录以及其全部子目录和文件的用户和组
![3](https://img-blog.csdnimg.cn/9c868fc1f1464bf786eceb09626632ae.png)

## 修改权限 chmod
> [改变权限, chmod](http://cn.linux.vbird.org/linux_basic/0210filepermission_2.php#chmod)
> [Linux chmod命令](https://www.runoob.com/linux/linux-comm-chmod.html)

|权限|二进制|十进制|
|--|--|--|
|r--|100|4|
|-w-|010|2|
|--x|001|1|

如果是目录，需要递归设置目录中所有子目录以及文件的权限，则加上 `-R` 选项。

1. chmod 数字 文件名
![1](https://img-blog.csdnimg.cn/cef700f9da7f40e693be8be3a56034b4.png)
![2](https://img-blog.csdnimg.cn/755532ad023c442cbc87a1f9298fa8a6.png)

2. 符号类型修改

|身份|符号|
|--|--|
|user|u|
|group|g|
|others|o|
|all|a|

|权限设置符号|含义|
|--|--|
|+|加入|
|-|除去|
|=|设置为|

![1](https://img-blog.csdnimg.cn/4aab2996c9b84a918852cb7f47c933a2.png)
![2](https://img-blog.csdnimg.cn/e958e0ab2836439ea9f3559620903df8.png)
![3](https://img-blog.csdnimg.cn/320d1f773552450984cf7b210ab51a36.png)
![4](https://img-blog.csdnimg.cn/392a6421aaad45c9ae28eb95234ea397.png)

*****************
**注意**：
- root 账户，即使文件没有 rw 权限，依旧可以读写
![5](https://img-blog.csdnimg.cn/e1e9518b7d5045d39112dfa1cf92e4f4.png)
- root 账户，如果文件全部身份都没有 x 权限，不能执行文件，但仍可以修改文件权限
![6](https://img-blog.csdnimg.cn/425eadb82172453e8a468b8f5970275f.png)
- root 账户，只要 user，group 或者 other 三者之一有 x 权限，则 root 可以执行文件
![7](https://img-blog.csdnimg.cn/2c3101f82a3a4025bbe8ee0af0e6d0c6.png)

- 文件所有者，即使没有任何权限，仍可以修改权限
![7](https://img-blog.csdnimg.cn/79f250eda33a438c97272abf6b28df3e.png)
- 属于文件所属组的成员也不可以修改文件权限
![8](https://img-blog.csdnimg.cn/fc418f13c1054f4f908d965611b2e615.png)

- `chmod -R` 递归修改目录中文件的权限，只针对已存在的文件，新建的文件仍是默认权限
![9](https://img-blog.csdnimg.cn/07ff8a7dafad4293888ff10ffbb97208.png)

&nbsp;



## 默认权限 umask
> [文件与目录的默认权限与隐藏权限](http://cn.linux.vbird.org/linux_basic/0220filemanager_4.php)
> [Linux umask详解：令新建文件和目录拥有默认权限](http://c.biancheng.net/view/764.html)


1.  文件的最大默认权限为 666（rw-rw-rw-），目录的最大默认权限为777（rwxrwxrwx）。（这个参数在哪查看？）
2. 最大默认权限减去 umask 的值即为新建文件或目录时的权限。

![1](https://img-blog.csdnimg.cn/2b54f99542344007abe24e13ca50aeca.png)
![2](https://img-blog.csdnimg.cn/2b4f397e5e1846f1bd4cd16e89795838.png)

# 文件的隐藏属性
> [文件隐藏属性](http://cn.linux.vbird.org/linux_basic/0220filemanager_4.php#attr)
> [Linux chattr命令详解：修改文件系统的权限属性](http://c.biancheng.net/view/874.html)
> [Linux lsattr命令：查看文件系统属性](http://c.biancheng.net/view/875.html)

![1](https://img-blog.csdnimg.cn/c4e055ef1b8847fb89ba5f65987c9933.png)


那个 `e` 是什么？

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


![](img/2023-03-29-11-50-52.png)
![](img/2023-03-29-11-59-29.png)

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

![2](https://img-blog.csdnimg.cn/bde101cac33343afb5948fb043c0af59.png)


## SBIT 
- sticky bit，仅针对**目录**的权限
- 使用者在该目录下创建的文件或目录只有**自己与 root 能删除**

![3](https://img-blog.csdnimg.cn/1e1a10cb38064fc7871d6ffca5682e98.png)



## 添加特殊权限
1. 数字方法
- SUID 为 4
- SGID 为 2
- SBIT 为 1

将要添加的特殊权限数字写在第一个，如 `chmod 4755`，4 表示特殊权限 SUID，7 为 owner 的权限，第一个 5 为 group 权限，第二个 5 为 other 权限。
如果第一个数字为 6，即同时拥有权限 SUID 和 SGID。

![1](https://img-blog.csdnimg.cn/1e2d1090a73b405f935dd7cf10000398.png)

2. 符号方法
- chmod u+s 添加 SUID 权限
- chmod g+s 添加 GUID 权限
- chmod o+t 添加 SBIT 权限

![2](https://img-blog.csdnimg.cn/156a339c802c4ab88070bbab92c2d512.png)

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
![1](https://img-blog.csdnimg.cn/defdcb810bc948d9a496990083f0f2fa.png)

## setfacl 设置文件 ACL
### 为特定用户设置权限
`setfacl -m u:账号:权限`

![1](https://img-blog.csdnimg.cn/029addef04f64f01921325d6eb7f0e28.png)

### 为特定组设置权限
![1](https://img-blog.csdnimg.cn/6c982c25d7f547dca2dc7a6c79000d8d.png)

### 最大有效权限 mask
- 对文件设置 mask 只针对设置的 ACL 用户、组和默认的组，不影响文件的 owner 和 root 账户。
- 设置 mask 后如果用 setfacl 设置用户或组权限，mask 又恢复为默认值。
- mask 用来限制最大的有效权限，设置的 ACL  用户的权限不能超过 mask  的权限，超过的权限无效。

![1](https://img-blog.csdnimg.cn/6ee41981ea154526953115c1151fbae9.png)
![2](https://img-blog.csdnimg.cn/e66c4894887a42e994288a628f707f6b.png)

### 设置默认 ACL 权限
目录内已有的文件权限不改变，只改变新建的文件权限。

![1](https://img-blog.csdnimg.cn/def894303d314ddcbd2d16ea63897ed8.png)
![2](https://img-blog.csdnimg.cn/b23c85b7c56b48e49da2247ebaf0af51.png)
![3](https://img-blog.csdnimg.cn/240b5c02de494094b648e64045e14545.png)
![4](https://img-blog.csdnimg.cn/00bd0a3677924eddaad6772c5f448c3d.png)

### 设置已有目录及其内容权限
- 默认 `setfacl` 设置目录不影响目录内文件的权限
![1](https://img-blog.csdnimg.cn/12bde60f564649bb9343af12a0308c66.png)

- 修改已存在的目录以及其子文件权限，不改变新建子文件权限
![1](https://img-blog.csdnimg.cn/63d9ead12c814b868f5722fa75af30f4.png)
![2](https://img-blog.csdnimg.cn/986ae44e8e994d39880d5ce973d1df0f.png)

## setfacl 删除 ACL 权限
- 删除单个文件或目录 ACL 权限
![1](https://img-blog.csdnimg.cn/9ecd1329127a41f7a53286570d10bf2f.png)



- 删除目录内全部文件的单个 ACL 权限
	- 初始
	![1](https://img-blog.csdnimg.cn/3a1ac23789d24e98853a738a5d671a21.png)
![2](https://img-blog.csdnimg.cn/9fcca3b41b3640f1a112bf0886a487ac.png)
	- 递归删除目录的 ACL 权限
![3](https://img-blog.csdnimg.cn/b075018a82244e61ac3c888a3ce8743b.png)

- 删除全部的 ACL 权限
	- `setfacl -b filename` 删除该文件或目录的全部 ACL 权限，目录不递归删除其子文件 ACL 权限。
	- `setfacl -b -R filename` 递归删除目录的全部 ACL 权限。


# 文件结构
> [Linux File Structure](https://www.linux.com/training-tutorials/linux-file-structure/)




# 文件种类
> [Linux文件种类与扩展名](http://cn.linux.vbird.org/linux_basic/0210filepermission_2.php#filepermission_type)


# 查看文件类型 file
> [Linux file命令](https://www.runoob.com/linux/linux-comm-file.html)

![1](https://img-blog.csdnimg.cn/9135fcb7ca8a4a99813f5d5c9a911fe6.png)
![2](https://img-blog.csdnimg.cn/f40c44c4dc3148c693c383fb29f0a512.png)


# stat 查看文件状态 四种时间信息

> [Stat Command in Linux](https://linuxize.com/post/stat-command-in-linux/)


![1](https://img-blog.csdnimg.cn/69f6b1842acc416bb1f08ee84221bf6a.png)

## stat -L 查看符号链接对应的源文件的文件信息
- 默认查看符号链接时查看的信息是链接文件而非源文件的文件信息
- 加上 `-L` 选项后查看的是源文件的信息

![1](https://img-blog.csdnimg.cn/607fac6619174e449b62f01c233eee4e.png)

## stat -f 查看文件系统的信息
![1](https://img-blog.csdnimg.cn/4a9eb750a9ac4c02a41300c6eecdb4e7.png)

## stat --format="format" 指定输出格式
- `man stat` 查看帮助文档可查看格式介绍
![1](https://img-blog.csdnimg.cn/6f3945db1e5e46c2993519b3cf0ea682.png)
![2](https://img-blog.csdnimg.cn/1205f86ca2694d3998989f3616a510a4.png)


# 文件的三种时间 mtime ctime atime
> [ Useful Examples of Touch Command in Linux](https://phoenixnap.com/kb/touch-command-in-linux)

# 查看文件时间
## stat 一次查看全部时间
![1](https://img-blog.csdnimg.cn/87a7d2c850f24c1b96959a4ef4ca3b94.png)

## ll 查看文件时间
### ll 查看 mtime
	- `ll` 命令看到的时间默认是修改时间（modification time）。
	- **文件内容**改变时更新该时间。
	- 加上 `--full-time` 选项查看完整时间。
![1](https://img-blog.csdnimg.cn/77c155214b9d4d22bce7671c4219d210.png)

### ll -c 查看 ctime
	- ll -c 命令看到的时间为 change time。
	- 文件的**属性和权限**改变时，修改文件名，移动文件等会更该时间。
![2](https://img-blog.csdnimg.cn/e2d7f2fbf79947a6a4cb7c87ccb1a0e8.png)

### ll -u 查看 atime
> [3.8. Configuring atime Updates](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/global_file_system_2/s1-manage-atimeconf)
> [Linux File Timestamps Explained: atime, mtime, and ctime](https://www.howtogeek.com/517098/linux-file-timestamps-explained-atime-mtime-and-ctime/)


- ll -u 查看 access time
- **查看文件内容**时更新该时间，如 `cat` 查看，但不一定每次读取都会更新，可能延迟
- 更新的有规则
![1](https://img-blog.csdnimg.cn/637268ca844f4a9ba102ee6aaab40fea.png)

### ll --time= 查看特定时间
![4](https://img-blog.csdnimg.cn/aa73af50723a4c289455801811e61fe4.png)

### ll --full-time 查看完整时间
- 可以直接用 `stat` 查看所有时间的完整显示
![1](https://img-blog.csdnimg.cn/6ffb94033c1345ffa54cf42c6c701d83.png)

# touch 修改文件时间
> [How To Use the touch Command in Linux](https://phoenixnap.com/kb/touch-command-in-linux#set-timestamp-using-a-reference-file)
> [Touch Command in Ubuntu 22.04](https://linuxhint.com/touch-command-linux/)


![1](https://img-blog.csdnimg.cn/81897b1c06fc4bf4a9a4a379b28e202d.png)

## touch 已存在的文件后更新全部时间
![在这里插入图片描述](https://img-blog.csdnimg.cn/a5e696c1066c4947abd060a330800390.png)

##  touch -c：更新文件的全部时间为当前时间
- `-c` 选项可以避免创建文件，默认文件不存在则创建
- 如果文件存在，则更新文件的全部时间为当前时间

![1](https://img-blog.csdnimg.cn/38b68a28633b4646a5ce95943738e201.png)
![2](https://img-blog.csdnimg.cn/e8835e927e2b46efbcd14e58b455028d.png)
![3](https://img-blog.csdnimg.cn/26575601867c42efb00da88de0abcf5a.png)

&nbsp;

## touch -d：更新文件的 mtime 和 atime 
- `touch --date=STRING` 
- `touch -d` 可以同时修改 mtime 和 atime 的时间，后面参数为日期，以当前日期为参考；修改后 ctime 会变成当前日期和时间

![1](https://img-blog.csdnimg.cn/544d05726b52488b87e5426956bce8d7.png)
![2](https://img-blog.csdnimg.cn/a708e6ab7632465db2fa664bdb2da1e5.png)
![1](https://img-blog.csdnimg.cn/65cdae35362a4b8687d858dfc8af1c3d.png)
![2](https://img-blog.csdnimg.cn/f8cd2fa19e124713ab88f9bc6606358e.png)

## touch -t：更新文件的 mtime 和 atime 
- 和 `touch -d` 一样，不修改 ctime，但 ctime 的时间还是会变成当前时间


![0](https://img-blog.csdnimg.cn/a4ec7357fbe141439c41c6e6b9ed7ab6.png)
![1](https://img-blog.csdnimg.cn/e2cf71313d61460ca7129e980008c327.png)
![2](https://img-blog.csdnimg.cn/70939eb1aa8143e194bbe318cb988dea.png)
![3](https://img-blog.csdnimg.cn/5be08991666e46f6a3585faf541c7353.png)

## touch -mt：仅修改 mtime
- 修改后 ctime 的时间变为当前时间。

- **touch -m 修改 mtime 为当前时间**
![1](https://img-blog.csdnimg.cn/8e261a16e8184c7ab052c43ab16d7d5d.png)

- **修改 mtime 为指定时间**
![1](https://img-blog.csdnimg.cn/919dc41bf8b44479bbb8a798bd6f71b6.png)

## touch -at：仅修改 atime
- mtime 的日期和时间都不变，但 ctime 的时间变为当前时间。

- **修改 atime 为当前时间**
![1](https://img-blog.csdnimg.cn/38e0eb6a1b2c4ff980d7704c6b971bef.png)

- **修改 atime 为指定时间**
![2](https://img-blog.csdnimg.cn/a47ba39ff3814a918322f910d75eb87b.png)


## touch -amt 修改 mtime 和 atime 为指定时间
- 修改后 ctime 会变成当前时间。

![1](https://img-blog.csdnimg.cn/96fe2d8260954d68955540652a520edc.png)


## touch -r 将文件的时间改为另一个文件的时间
- 第一个文件为参考文件，第二个文件为要修改的文件
- atime 和 mtime 修改为参考文件的对应时间，ctime 修改为当前时间

![1](https://img-blog.csdnimg.cn/e08c1f6a045c4029af753da75c4fc3fb.png)
![2](https://img-blog.csdnimg.cn/09e2b57340ef42118e09b7cbcbbbbfe8.png)

## touch -h：修改符号链接文件时间
- 硬链接和源文件是同一个文件，inode 相同，因此修改其中一个时间，另一个同步改变
- 修改符号链接时间，默认会修改到源文件而非符号链接文件


![1](https://img-blog.csdnimg.cn/35c2695bb2994c1d824ede4df0d75309.png)
![2](https://img-blog.csdnimg.cn/99b2a91aa75d49ac83f11b207ba0cc6d.png)
![3](https://img-blog.csdnimg.cn/1280c69c1d4b48d091663aa368f4ce81.png)

&nbsp;


# touch 创建新文件
> [Useful Examples of Touch Command in Linux](https://linuxhandbook.com/touch-command/)
> [How To Use the touch Command in Linux](https://phoenixnap.com/kb/touch-command-in-linux)
> [修改文件时间或建置新档： touch](http://cn.linux.vbird.org/linux_basic/0220filemanager_3.php#touch)


## 创建的文件已存在
- 创建的文件已存在，会修改文件的时间，三个时间均更新为当前时间

![1](https://img-blog.csdnimg.cn/971f957524cf468ea711be304b8c3789.png)


## 创建多个文件

![1](https://img-blog.csdnimg.cn/ba5d4942a01c4adb983faad92f21d62e.png)

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

![1](https://img-blog.csdnimg.cn/898cf91feab74c0792e482d92ddd48bc.png)

## whereis
> [Linux whereis命令](https://www.runoob.com/linux/linux-comm-whereis.html)

![1](https://img-blog.csdnimg.cn/3377f8eb8c5c446e98aeb448795f0a79.png)
![2](https://img-blog.csdnimg.cn/a0df71ce0acc4b88b526c87a7ef14c10.png)
![3](https://img-blog.csdnimg.cn/25daaba010fd4ccfaffdab97d595cf78.png)


<br/>

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


&nbsp;

//LABEL: find
## find
> [find](http://cn.linux.vbird.org/linux_basic/0220filemanager_5.php#find)
> [Linux find 命令](https://www.runoob.com/linux/linux-comm-find.html)
> 例子说明：[35 Practical Examples of Linux Find Command](https://www.tecmint.com/35-practical-examples-of-linux-find-command/)
> 命令参数讲解：[Linux find command](https://www.computerhope.com/unix/ufind.htm)
> [How to Use All Linux’s Search Commands](https://www.howtogeek.com/425408/how-to-use-all-linuxs-search-commands/)
> [Linux find命令：在目录中查找文件](http://c.biancheng.net/view/779.html)
> [15 Super Useful Examples of the Find Command in Linux](https://linuxhandbook.com/find-command-examples/)

<br/>

![1](https://img-blog.csdnimg.cn/e95e08f31182446ab6b1bb05f6cbb927.png)


### <font color=red>find 查找没有 x 权限的目录</font>

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

<br/>

### find -name 按文件名在特定目录查找
- 直接指定文件名为精确查找

![1](https://img-blog.csdnimg.cn/a3a9923d02b94c189107b9dd08ebf26a.png)

![](img/2023-03-15-10-30-04.png)
<br/>

- 可以使用通配符
![](img/2023-03-19-09-41-48.png)
  

### <font color=red>find -regex 利用正则表达式查找文件</font>
> [8.5.2 ‘emacs’ regular expression syntax](https://www.gnu.org/software/findutils/manual/html_node/find_html/emacs-regular-expression-syntax.html)

- 用 Emacs 正则表达式

![](img/2023-03-19-10-43-36.png)
![](img/2023-03-19-10-48-25.png)
![](img/2023-03-19-11-22-58.png)

### find -type 指明文件类型查找

![1](https://img-blog.csdnimg.cn/adbd3a5b27b248dfaae8d4e692fd7786.png)

![2](https://img-blog.csdnimg.cn/275a735af0014429b56dc702195b73f2.png)
![3](https://img-blog.csdnimg.cn/e004236c423e4e81865da24c9395109c.png)

<br/>

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
- `find -perm /002` 则 `other` 必须要有 `w` 权限，其他权限位的 `0` 不是只可以没有权限

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

### <font color=red>find -prune 不递归查找目录</font>
- 不能和 `-delete` 一起使用，`-delete` 默认递归处理目录
- 要实现该功能可以用 `-maxdepth` 指定深度

![](img/2023-03-19-14-58-32.png)
![](img/2023-03-19-14-59-39.png)


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

<br/>

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

<br/>

### 查找隐藏的文件或目录
![1](https://img-blog.csdnimg.cn/675a1bb674e54d039e29b09726542bfe.png)

<br/>

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

<br/>

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

<br/>


### 操作符
> [Linux find command](https://www.computerhope.com/unix/ufind.htm#syntax)
> [What is meant by POSIX compliant?](https://teacherscollegesj.org/what-is-meant-by-posix-compliant/)



![1](https://img-blog.csdnimg.cn/d513e67ad06e4d4bb3afadef927131f9.png)
![2](https://img-blog.csdnimg.cn/2c081937ac6541fca663cbb765392306.png)


- 注意 `( expr )` 使用时括号要转义，即 `\( expr \)`，括号内左右两边有空格


# 绝对路径和相对路径
> [绝对路径与相对路径](http://cn.linux.vbird.org/linux_basic/0210filepermission_3.php#dir_path)


![1](https://img-blog.csdnimg.cn/44953df763b84402bc133e5fbd131d35.png)
![2](https://img-blog.csdnimg.cn/bf1d988ac5cb4f289c0f343b775284c3.png)

# Linux 目录
## Linux 目录配置
> [Linux目录配置](http://cn.linux.vbird.org/linux_basic/0210filepermission_3.php)


## 切换目录 cd
> [目录的相关操作](http://cn.linux.vbird.org/linux_basic/0220filemanager_1.php#dir_opdir)

![1](https://img-blog.csdnimg.cn/fc84238b2b5b48208c3c2251fa185256.png)

![2](https://img-blog.csdnimg.cn/960ac5ce93fa4ca4839a20e5b8fd35bb.png)

## 显示当前目录 pwd
![1](https://img-blog.csdnimg.cn/fb4790dacc2c4c13a9ae5b865a1fe141.png)

## 创建目录 mkdir
![1](https://img-blog.csdnimg.cn/668b0eb4694341a4912041d3a2c79ab4.png)

## 删除空目录 rmdir
![1](https://img-blog.csdnimg.cn/27df270623284bbb9143f23cbb522598.png)
![2](https://img-blog.csdnimg.cn/af88523932464511aa2e66f9f931d6dd.png)
![3](https://img-blog.csdnimg.cn/742299a6dc944373b14426176dcd7bad.png)
![4](https://img-blog.csdnimg.cn/45470dee9eec49a6bd44e46dfe7c2cec.png)



# 查看文件系统信息
[Linux dumpe2fs命令：查看文件系统信息](http://c.biancheng.net/view/889.html)


# wc 统计文件字数、字节数和行数
[Linux命令 wc - 统计文件的字节数、字数、行数](https://www.w3cschool.cn/linuxc/linuxc-rhp23mam.html)
[wc command in Linux with examples](https://www.geeksforgeeks.org/wc-command-linux-examples/)


![1](https://img-blog.csdnimg.cn/66aa9dc631f549ef889ba761604e6b39.png)
![2](https://img-blog.csdnimg.cn/be91fea971844138adb0335e91c21363.png)


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

- `ll` 查看的目录大小并非目录的实际大小
![](img/2023-03-13-18-05-05.png)

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
- 硬链接和 源文件的 inode 相同，因此其权限属性等相同，一个修改，其他同步改变

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


![1](https://img-blog.csdnimg.cn/e2aebcc33ee94bd591b585bafd8b43ff.png)
![2](https://img-blog.csdnimg.cn/1684a8510d504d59aa7bf63f0e93f0ff.png)
![3](https://img-blog.csdnimg.cn/3cbfaa27bd714d3d8756c7d5862b36a2.png)
![4](https://img-blog.csdnimg.cn/3d21d81648414e7aa8a1f775f49dde72.png)
![5](https://img-blog.csdnimg.cn/85c80fea2512414ea1cee64f64635789.png)

<br/>

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



//LABEL ls
# 查看文件目录内容 ls
> [Linux ls Options](https://ipcisco.com/lesson/linux-ls-command/)
> [文件与目录的检视： ls](http://cn.linux.vbird.org/linux_basic/0220filemanager_2.php#ls)


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

#### <font color=red>目录</font>
> [Why is the size of a directory either 0 or 4096?](https://unix.stackexchange.com/questions/503048/why-is-the-size-of-a-directory-either-0-or-4096)
> [`ls -lS` isn't showing true size of directory](https://unix.stackexchange.com/questions/365369/ls-ls-isnt-showing-true-size-of-directory)

- 目录的 size 并非目录的实际大小
![](img/2023-03-13-18-05-05.png)

## ls -a 查看全部文件，包含隐藏文件 

![1](https://img-blog.csdnimg.cn/48d8064f80ab43bca74fe35e0ca9ef90.png)

## ls -A 查看全部文件，不包括 . 和 .. 

- `.` 为当前目录，`..` 为上级目录。
![1](https://img-blog.csdnimg.cn/c45cf82acba2404b86ea8fa5167f2af7.png)


## ls 仅列出隐藏文件

![](img/2023-04-07-11-08-37.png)

## ls -d 仅列出目录，而不列出目录的内容

![1](https://img-blog.csdnimg.cn/72892ec1b5a045aba10483a53cb3dae3.png)

<br/>

## ls -F 在列出的文件后加符号表明其类型
目录加 `/`，可执行文件加 `*`，socket 文件加 `=`

![1](https://img-blog.csdnimg.cn/f4878771c914459c8ee584c27e6d4828.png)
![2](https://img-blog.csdnimg.cn/9a44a1d8d5b14b7f93c9898fd9663c75.png)

## 文件大小以较易读的方式显示
![1](https://img-blog.csdnimg.cn/e4dfcf4e493e4367b76fc858dd5f3db2.png)

<br/>

## ls -i 列出 inode 号码

![1](https://img-blog.csdnimg.cn/37acdd0ac833481499730db1c514eae3.png)

<br/>

## ll -n 用 UID 和 GID 代替使用者和群组的名称
![1](https://img-blog.csdnimg.cn/2a305e1d0c4349e88d41944213d36dd4.png)

<br/>

## ls -R 查看目录中所有子目录的信息 

![1](https://img-blog.csdnimg.cn/d68034ef44e84a4ab5af0800d852484a.png)

<br/>

## ls -s 
> [Why does ls -l output a different size from ls -s?](https://askubuntu.com/questions/269480/why-does-ls-l-output-a-different-size-from-ls-s)

- `ls -s` 列出的不是文件的真是大小
![](img/2023-03-19-11-59-59.png)

## ll 常用组合 
![1](https://img-blog.csdnimg.cn/161e9d543c264b43bfb419ddd6cf9aa3.png)


# Linux 处理多个连续的路径分隔符
> [How does Linux handle multiple consecutive path separators (/home////username///file)?](https://unix.stackexchange.com/questions/1910/how-does-linux-handle-multiple-consecutive-path-separators-home-username)



# 目录最后是否带 / 的差异
> [When should I use a trailing slash on a directory? [duplicate]](https://unix.stackexchange.com/questions/50499/when-should-i-use-a-trailing-slash-on-a-directory)


- 移动文件
![1](https://img-blog.csdnimg.cn/15237352ede346b99dd475f576ce19c8.png)
- 移动目录
![1](https://img-blog.csdnimg.cn/c0d9d8199fb34e28a9b412982a4d638d.png)![2](https://img-blog.csdnimg.cn/33a2827316eb49cab330b992cd62bf8e.png)
![3](https://img-blog.csdnimg.cn/3f2e426c77a04e7385132e8bcfe7087a.png)
![4](https://img-blog.csdnimg.cn/1c9933ce374f4e7f9e72cdcf2376ffd3.png)![5](https://img-blog.csdnimg.cn/5ada1b8b5d03482fa90ed57138d64dee.png)
![6](https://img-blog.csdnimg.cn/ac1aef3c6a5540ef9e07f3ab1f6dcf4a.png)

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
> [Copying with Linux CP Command](https://www.ionos.com/digitalguide/server/configuration/linux-cp-command/)

- 可以用 `cp -b`，但这样备份的文件名固定，如果再备份一次会覆盖，这种写法不能指定参数
- `cp --backup=numbered` 会为备份的文件创建数字，多备份几次会有不同的文件名


![](img/2023-03-12-10-56-59.png)

### 复制多个文件到同一个目录中
- 目录必须存在

![1](https://img-blog.csdnimg.cn/200eced9121d43aab6df47ff8213485d.png)
![2](https://img-blog.csdnimg.cn/e44132b116064242904ce277334eb2d6.png)


### 将一个文件复制多份
> [linux系统如何将一个文件同时复制多份](https://www.cnblogs.com/liujiaxin2018/p/9405079.html)

#### 利用 tee 命令
![1](https://img-blog.csdnimg.cn/415156de2ea8443991093570b859542d.png)


&nbsp;

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


![](img/2023-03-11-20-02-49.png)

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


//TODO 待补充
## 同一分区和不同分区移动文件

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

<br/>

- cat f - g  
![1](https://img-blog.csdnimg.cn/4ed436c0d7c2495fbd11d1d1b17d273d.png)
![2](https://img-blog.csdnimg.cn/908df607be954097bb2f11ce47ea30fb.png)

#### 合并被分割的文件
可以合并被分割的二进制文件或文本文件。

![1](https://img-blog.csdnimg.cn/a632f49cd12a4cf7997cde24829a93f3.png)

####  cat -n 显示内容时标注行号
空白行也会标记

![1](https://img-blog.csdnimg.cn/4122847d4bad48f59679af0ed9e0500b.png)

#### cat -b 标注行号不包括空白行
![1](https://img-blog.csdnimg.cn/977fba59db4748e195507a9304d2dcae.png)


#### cat -s 压缩连续的空白行
![1](https://img-blog.csdnimg.cn/5baa2c8033c24b41874c0f69933a7812.png)

<br/>

#### cat -E
- 每行结束位置显示 `$`


#### cat -A 显示非打印字符
- 注意 windows 格式和 Linux 格式的文件显示隐藏字符不同

![1](https://img-blog.csdnimg.cn/f74d98d00cd54b7b8d92395249433e47.png)
![](img/2023-03-17-09-58-44.png)

<br/>

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


## tail
![1](https://img-blog.csdnimg.cn/e41fbc0ce43449e1ab672625052d2f9c.png)

### tail -n NUM

![1](https://img-blog.csdnimg.cn/26c79f356d4b4a04813b81fc853cf6d6.png)
![2](https://img-blog.csdnimg.cn/57f59673a6d647b8ab57be97a94b17f2.png)


### tail -c NUM

![1](https://img-blog.csdnimg.cn/987e4855448a41e68505683c883e0405.png)
![2](https://img-blog.csdnimg.cn/ae795be7d099484fba77e3ebf81cb684.png)


### tail -f

![1](https://img-blog.csdnimg.cn/3cad37030307458ba10f821dc8624c3f.png)


## cut
> [Linux cut命令](https://www.runoob.com/linux/linux-comm-cut.html)
> 


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

### hexdump
> [Linux命令学习总结：hexdump](https://www.cnblogs.com/kerrycode/p/5077687.html)



//TODO: 补充
# inode
> [理解inode](http://www.ruanyifeng.com/blog/2011/12/inode.html)
> [认识 EXT2 文件系统](http://cn.linux.vbird.org/linux_basic/0230filesystem_1.php)


- 不同文件系统的 inode
- 文件系统没有 inode 号，但还有存储空间，也不能新建文件
- inode 部分看深入理解计算机系统页表
- cp mv inde 是否在同一个文件系统
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

&nbsp;

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
&nbsp;

- tee [FILE1] [FILE2] 标准输入保存到多个文件
![4](https://img-blog.csdnimg.cn/9ddd9ad488634c8aa861e7dabf89cc05.png)
- 不显示标准输出的内容
![5](https://img-blog.csdnimg.cn/9ee5539ca98c46aca81e93d6970fd152.png)
![6](https://img-blog.csdnimg.cn/44aa08666420415385eee96b98b37587.png)


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
- 和 `compress -d` 效果一样
![3](https://img-blog.csdnimg.cn/4198d6608c8e4f15853b274f4608d698.png)

<br/>

## gzip 压缩文件
> [Linux gzip命令：压缩文件或目录](http://c.biancheng.net/view/783.html)


- gzip  只能压缩文件，不能压缩目录
![1](https://img-blog.csdnimg.cn/32dc7ecdccad49d1a1a05260e8a8c067.png)
![2](https://img-blog.csdnimg.cn/1e66a044043d4f3087ba4a8f3800de13.png)

### gzip 可以压缩空的或很小的文件
![1](https://img-blog.csdnimg.cn/ec18fbf933fd44f1b0be35d35d940dfd.png)
![2](https://img-blog.csdnimg.cn/e6863e9b7edd47a9ae5a4347f2cef360.png)

&nbsp;

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
- gzip 不能压缩目录，递归压缩的只是文件，文件未打包，是单个文件
![6](https://img-blog.csdnimg.cn/63d110a870c04c04976041b0c025d59a.png)

<br/>

### gunzip 解压 .gz 文件
- 相当于 `gzip -d`

### zcat zmore zless 查看 .gz 压缩文件内容
![1](https://img-blog.csdnimg.cn/40fc75e036a14760a8d46c2bd4415540.png)

<br/>

## bzip2 压缩文件
![1](https://img-blog.csdnimg.cn/97990f9c50fa41f98deea28079039ccc.png)

&nbsp;

### bzip2 能压缩空文件
![1](https://img-blog.csdnimg.cn/ded648f8d1014598bd6bbd1f987bcf25.png)

&nbsp;

### bzip2 不能压缩目录
- bzip2 没有 `-r` 选项，不能递归压缩目录中的文件

![1](https://img-blog.csdnimg.cn/0fcac291480e49c3adeccddd9eee65d6.png)
![2](https://img-blog.csdnimg.cn/b21640cff794424ca0c17cc9f1f8f893.png)

<br/>


### bzip2 -v 显示压缩比
![2](https://img-blog.csdnimg.cn/2d79504d2baa4006a99adb562867bb2c.png)

### bzip2 -d 解压缩 .bz2 的文件
![3](https://img-blog.csdnimg.cn/ae65eb366f1144e4b33afe311df9daf9.png)

### bzip2 -k 压缩文件并保留源文件
- `--keep` keep input files during compression or decompression

![4](https://img-blog.csdnimg.cn/b81b051a54d14702b213feb1c5286de0.png)

### bzip2 -c 
- 将压缩的文件输出到标准输出
- 直接输出到终端会提示错误
- 可以结合重定向将输出的压缩文件内容重定向到一个文件

![1](https://img-blog.csdnimg.cn/578a796155eb48ed9273a31bf2f7a431.png)
![1](https://img-blog.csdnimg.cn/21fb597fc5664a0c8f00bdefdd789167.png)



### bzip2 -数字 设置压缩比
- 和 gzip 相同

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



### tar -cf 创建打包文件
- `-c` 选项创建打包文件
- `-f` 选项指明打包后文件名，**后面必须为文件名不能是其他选项**
![1](https://img-blog.csdnimg.cn/4d31ff829f254528857198da12fd97bc.png)
- 如果打包目录，默认将目录中全部内容**递归打包**
![2](https://img-blog.csdnimg.cn/08b55f65a6aa431399587e43648e9e6b.png)
![3](https://img-blog.csdnimg.cn/3846b7e0686c417aa1d1ee42aa5e1099.png)
![4](https://img-blog.csdnimg.cn/c1b0800e81664c8ab366cd29f4725d42.png)
&nbsp;

### -v 显示正在处理的文件
![1](https://img-blog.csdnimg.cn/1f70d848bb13474583a1bc94dfd25313.png)

<br/>

### -t 查看打包的文件名
- List the contents of an archive

![1](https://img-blog.csdnimg.cn/e481b9e488a042c68b1dfd9fca143ff5.png)

- 加上 `-v` 选项可查看文件的属性等信息
![2](https://img-blog.csdnimg.cn/56cba031887d4ae8a90844ef0ab79ae1.png)

<br/>

### -z 创建 gzip 压缩的打包文件
- `-z` 选项表明采用 gzip 压缩
- 打包文件后缀最好为 `.tar.gz` 

![1](https://img-blog.csdnimg.cn/f9c3e556409a4a399a2c34a82dbda567.png)

<br/>

### -j 创建 bzip2 压缩的打包文件
- `-j` 选项采用 bzip2 压缩打包文件
- 打包文件的后缀最好为 `.tar.bz2` 

![1](https://img-blog.csdnimg.cn/d1fb648194e34ef5882fd7662563eb96.png)

### -J 创建 xz 压缩的打包文件
- `-J` 选项采用 xz 压缩打包文件
- 打包文件的后缀最好为 `.tar.xz` 

![1](https://img-blog.csdnimg.cn/0ae2672a51454d4cbade0dc3b58a3bef.png)

<br/>

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

<br/>

### 打包多个文件
![1](https://img-blog.csdnimg.cn/96a774a4ec844b45980c5e540c611ee5.png)

### --exclude 打包时排除部分文件或目录
注意 --exclude 的位置：

![1](https://img-blog.csdnimg.cn/7213e3eee84c4e1ca2de5738e15e4e29.png)
![2](https://img-blog.csdnimg.cn/a5100d5f4af245ba85f3cfb85904e70a.png)

<br/>

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

# tree


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

<br/>

- `cat -v` 
Windows 格式的文件显示最后的 `^M` 标记，linux 格式文件不显示
![](img/2023-03-17-09-58-44.png)

- `cat -T` 将制表符显示为 `^I` 符号
- `cat -E` 将行末的结束符显示出来


## vim 中 list 模式显示制表符和行结束符号$
![1](https://img-blog.csdnimg.cn/4a66d80b7db847a295f69a4c46dd005e.png)
![2](https://img-blog.csdnimg.cn/ab4cc700bebd4648a896364af42241dd.png)

<br/>

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

- 帮助文档说 `-r` 参数不显示软连接，但 ubunut 22.04 测试，符号链接文件在当前搜索目录时，能显示，符号链接文件在子目录时，只有 `-R` 能显示

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

# grep 中正则表达式应用
## <font color=red>grep 取出首尾单词相同的行</font>

![](img/2023-03-14-20-36-34.png)


## grep "[0-Z]" 匹配

![](img/2023-03-15-09-13-39.png)


## [:digit:] 和 [[:digit:]]

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
- ``\\$` 匹配以 `\` 结尾的字符串

#### `[a-zA-Z0-9]` 匹配字母和数字
- 数字和字母



### 扩展正则表达式
> [5.4 Overview of extended regular expression syntax](https://www.gnu.org/software/sed/manual/sed.html#ERE-syntax)


#### 特殊字符匹配本身需要转义
- ?
- +
- {}
- ()
- |

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

#### \`

#### \'


### 转义字符
> [5.8 Escape Sequences - specifying special characters](https://www.gnu.org/software/sed/manual/sed.html#Escapes)


## 命令格式
- `sed [OPTION]... {script-only-if-no-other-script} [input-file]...`


![](img/2023-03-31-19-54-15.png)

- 选项：可选
- scrip：必须有，如果没有命令，则用空 `''`
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


### sed 命令
> [sed commands summary](https://www.gnu.org/software/sed/manual/sed.html#sed-scripts)


#### p 打印模式空间的内容
- 默认区分大小写
- `IP` 忽略大小写
![](img/2023-04-01-12-16-00.png)


#### P 打印模式空间的内容直到第一个换行符
- Print the pattern space, up to the first <newline>.

#### a\ 在行后添加内容
- 用 `a\` 后面写要添加的内容
![](img/2023-04-01-11-49-32.png)  
- 可以用 `\n` 添加多行
![](img/2023-04-01-11-50-48.png)

#### d 删除内容
- 直到范围后删除匹配的行
![](img/2023-04-01-11-51-43.png)

#### c\ 替换行
- change lines with text
- 在 `\c` 后写入替换的文本，可以用 `\n` 换行
![](img/2023-04-01-11-53-30.png)

#### e command 执行命令替换输出内容
- Executes command and sends its output to the output stream. The command can run across multiple lines, all but the last ending with a back-slash.
![](img/2023-04-01-11-57-55.png)


#### i\ text 在行前插入内容
![](img/2023-04-01-11-59-50.png)

#### r filename 读取文件内容到匹配的行后
![](img/2023-04-01-12-20-14.png)

#### w filename 保存模式空间的内容到指定文件
![](img/2023-04-01-12-23-58.png)

#### = 为输出的内容打印行号
- 行号后带换行符，即行号单独占一行，在实际行的上面
- 空行也有行号
![](img/2023-04-01-12-26-33.png)

#### { cmd ; cmd ... } 组合多个命令
![](img/2023-04-01-12-59-15.png)


#### q[exit-code] 退出
- 下面的例子不执行后面的 `5d`，但输出不是 `2 4 5 6` 而是 `2`
![](img/2023-04-01-13-03-25.png)

#### s/regexp/replacement/[flags] 查找替换
> [The s Command](https://www.gnu.org/software/sed/manual/sed.html#The-_0022s_0022-Command)


- 和 vim 中使用语法类似

##### flags
- g
![](img/2023-04-01-13-12-21.png)

- p
打印替换后模式空间的结果

- i|I 忽略大小写
默认区分大小写

- m|M 多行匹配


## 处理多个命令
> [Multiple commands syntax](https://www.gnu.org/software/sed/manual/sed.html#Multiple-commands-syntax)


### `sed` 命令用 newlines 分隔

![](img/2023-03-31-20-47-55.png)

### 用 `;` 分隔一些命令

![](img/2023-03-31-20-49-33.png)

### 用 `-e` 选项




## 处理标准输入的内容


## s/regexp/replacement/ 查找替换
- 不改变源文件的内容，仅将修改输出显示
- 类似 vim 中的查找替换
- 不加标志则，默认只替换一行中的第一个符合的字符
- 标志位类似 vim 中替换的标志位，但不是全都支持
- 可用标志位
	- g
	将**一行**中全部符合条件的均替换，而不是只替换第一个符合之处
	- i 和 I
    大写和小写的 i 均是忽略大小写，和 vim 不同，不加则区分大小写
- 分隔符 `/` 可以换成其他符号，如 `#` 或 `@` 等，当搜索的内容有 `/` 符号时，可以换成其他分隔符


![](img/2023-03-16-20-01-49.png)
![](img/2023-03-16-20-03-39.png)
![](img/2023-03-16-20-34-38.png)

### 指明行范围
- `$` 表示最后一行
- `1,3` 表示第 1 行到第 3 行
- `1,+2` 表示第 1 行到第 1 行再加 2 行的位置
- `1,/pattern/` 起始为第 1 行，结束根据模式匹配到的行

![](img/2023-03-16-20-37-53.png)
![](img/2023-03-16-21-13-27.png)

### 处理一行中其中一个匹配内容
![](img/2023-03-16-20-45-45.png)




# UID, EUID, RUID and SUID
> [euid,ruid,suid](https://book.hacktricks.xyz/linux-hardening/privilege-escalation/euid-ruid-suid)

## UID

## EUID

## RUID

## SUID


# chroot
> [chroot](https://wiki.archlinux.org/title/chroot)
> [How to Use the chroot Command on Linux](https://www.howtogeek.com/441534/how-to-use-the-chroot-command-on-linux/)
> [chroot command in Linux with examples](https://www.geeksforgeeks.org/chroot-command-in-linux-with-examples/)





**************************


# 重启网络

- ubuntu 20.04
![](img/2023-03-17-14-38-13.png)

- ubuntu 22.04
没有 `/etc/init.d/network` 文件 ？



# dd
> [https://www.lanqiao.cn/courses/1/learning/?id=62&compatibility=true](https://www.lanqiao.cn/courses/1/learning/?id=62&compatibility=true)


## 生成任意大小的文件
- 文件单位
![](img/2023-03-19-16-21-58.png)


![](img/2023-03-19-16-22-38.png)
![](img/2023-03-19-16-21-08.png)

# xeyes
> [xeyes](https://www.lanqiao.cn/courses/1/learning/?id=59)



# 好玩工具
> [11 Fun Linux Command-Line Programs You Should Try When Bored](https://www.makeuseof.com/fun-linux-command-line-programs/)

## cmatrix


*********************************
//LABEL: 软件管理
# 软件管理
> [鸟哥的 Linux 私房菜](http://cn.linux.vbird.org/linux_basic/linux_basic.php)

## 软件包管理
- 为了更好安装、卸载软件等，不用每次都要通过源码编译安装软件
- 将软件所有相关文件打包成一个特殊格式的文件
- 打包的文件包含**预先侦测系统**和**相依赖的脚本**
- 打包的文件会记录软件提供的所有文件信息等
- 安装软件时会进行环境检查，查看当前环境是否满足
- 安装软件时会进行属性依赖检查，即安装某个软件可能需要依赖其它一些软件，不安装依赖则无法安装该软件


## 软件包的分类
> [What are *-devel packages?](https://stackoverflow.com/questions/2358801/what-are-devel-packages)

- 一般软件内容分为一般使用和开发使用（devel package）
- 很多软件会以函数库的方式释放出部分功能以供其他软件调用

![](img/2023-03-21-15-41-06.png)
- 如安装 httpd 时有如下几个包
![](img/2023-03-21-16-30-44.png)
![](img/2023-03-21-16-32-10.png)
![](img/2023-03-21-16-32-40.png)


## 软件源
### AppStream
> [RHEL 8 - RHEL自带AppStream应用模块管理](https://blog.csdn.net/weixin_43902588/article/details/117589073)
> [Chapter 1. Using AppStream](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/installing_managing_and_removing_user-space_components/using-appstream_using-appstream)
> [Chapter 9. 使用AppStream](https://xy2401.com/local-docs/redhat/8.zh-Hans/installing-managing-and-removing-user-space-components/OEBPS/using-appstream_using-appstream.html)


### BaseOS


## 获取软件包的途径

- 官方网站


## RPM 
- 环境：rocky 8.6
- 最早由 Red Hat 开发的包管理器
- Package Manager
- 软件已经事先被编译过，因此软件安装时对主机环境有要求
- 安装软件前检查硬盘容量、操作系统版本等环境
- RPM 文件提供软件版本信息、相关依赖、软件用途、所含文件等信息
- RPM 文件使用数据库记录软件安装时必须具备的依赖属性软件以及其他参数等，便于软件升级、移除、验证、查询等
- 通常不同的 distribution 所释出的 RPM 文件不能用在其他的 distributions 上

![](img/2023-03-21-17-46-43.png)
### RPM 文件名
> [Package filename and label](https://en.wikipedia.org/wiki/RPM_Package_Manager#Package_filename_and_label)


![](img/2023-03-21-11-45-30.png)

- 版本号后面的 release 第一个数字为相同的版本 rebuilt 的次数，可能是修复一些小 bug 或重设一些编译参数等
- release 中的 `el` 时 `Red Hat Enterprise Linux` 的缩写，`8.7.0` 是适配 red hat 以及 centos 8.7.0 以上的版本 
- 硬件操作平台常用种类
  - i386
  - i686
  - x86_64
  - noarch
  没有硬件平台的限制


### RPM 仓库
> [The Origin of RPM Content](https://docs.pulpproject.org/en/2.19/plugins/pulp_rpm/tech-reference/rpm.html#)


![](img/2023-03-21-18-04-01.png)
![](img/2023-03-21-18-07-30.png)

- 根据功能不同将软件放在不同的仓库中，如 `AppStream` 和 `BaseOS`
- 仓库中，如 `AppStrem` 中有两个目录
	- Packages
	rpm 安装包
	- repodata
	存放元数据，用来描述 RPM 包的信息


### RPM 数据库目录 /var/lib/rpm
> [What is the purpose of the '/var/lib/rpm' directory?](https://access.redhat.com/solutions/439953)

- `/var/lib/rpm` 目录中包含 RPM 数据库
- RPM 数据库包含系统中安装的 RPM 包的信息
- 当使用 rpm 命令时会用到 RPM 数据库
- 当安装或移除 rpm 包时会修改数据库
- 但软guanguan其释放的软件内的文件放在其他目录中，如软件的使用手册说明放在 `/usr/share/doc` 目录中


![](img/2023-03-21-15-32-45.png)


### 安装软件包
环境
- rocky 8.6
- 虚拟机

#### 从光盘安装包
- rocky 8.6
- 从系统的光盘中获取 rpm 包
![](img/2023-03-21-17-00-05.png)
![](img/2023-03-21-17-01-17.png)

- 将光盘挂载到一个空目录
	- `lsblk` 查看光盘的文件
	
	- 光盘文件在 `/dev/cdrom` （`/dev/sr0` 软连接）
	
	- 新建一个目录 `/mnt/cdrom`，利用 `mount /dev/sr0 /mnt/cdrom` 挂载光盘 
	![](img/2023-03-21-17-13-02.png)
	![](img/2023-03-21-17-15-31.png)
	
	- 查看光盘的内容，包主要在两个仓库中：BaseOS 和 AppStream
		- BaseOS 放操作系统核心安装包
		- AppStream 仓库放用户常用的安装包

- 利用 rpm 安装，需要指定安装包的完整路径和文件名
![](img/2023-03-21-18-13-14.png)
![](img/2023-03-21-18-14-36.png)

- 如果安装的包需要依赖，则 rpm 不能装成功
![](img/2023-03-21-18-16-01.png)
  

### rpm -i 安装软件
- 如果安装包需要依赖则安装不成功

- 从本地仓库安装需要写明完整路径
![](img/2023-03-21-18-14-36.png)

- rpm -i 安装软件包

- 加上 `-v` 选项显示 
![](img/2023-03-21-20-01-34.png)

- 加上 `-h` 选项显示安装进度条
![](img/2023-03-21-20-03-15.png)

- 安装选项
![](img/2023-03-21-20-12-51.png)

#### --test 安装前检查
- `-i` 选项后可以加一些选项，`--test` 可以不安装，仅检查能否安装
![](img/2023-03-21-20-12-22.png)
![](img/2023-03-21-20-14-35.png)

#### --replacepkgs 安装已经装过的软件
![](img/2023-03-21-20-18-50.png)

#### --replacefiles 覆盖文件
![](img/2023-03-21-20-20-30.png)


#### --justdb 更新数据库
- 如果 RPM 数据库破损或产生错误时，该选项可更新软件在数据库中的信息
![](img/2023-03-21-20-21-31.png)


#### --nosignature 跳过数字签名检查

#### --noscripts 不执行某些脚本
- RPM 在软件安装过程中会自动执行一些操作，可加该选项禁止执行
![](img/2023-03-21-20-26-22.png)


### 升级与更新
![](img/2023-03-21-20-33-50.png)

- rpm -Uvh 
	- 如果软件没安装过，则安装，和 `-i` 相同，除了安装后会删除其他版本

- rpm -Fvh
	- freshen
	- 只有软件安装过才更新，不会安装未安装的软件

### 安装旧版本
- rpm -Uvh --oldpackage packageName.rpm

### rpm -q 查询 RPM 包
- 查询是在 `/var/lib/rpm` 目录中查找数据库文件
![](img/2023-03-21-20-40-36.png)
![](img/2023-03-21-20-41-43.png)

#### rpm -qa 查询已安装的全部软件
- `rpm -qa` 不加文件名则查找全部已安装的软件
- 支持通配符查找某个软件
- 查找软件安装包时只用写包名字，不用写路径

![](img/2023-03-21-20-47-04.png)

#### rpm -q 查询某个软件是否已安装
- 后面接软件包的名字，不用写全路径
- 软件包的名字必须写对，不用写后面的版本号，只用写包名
![](img/2023-03-21-20-44-44.png)
![](img/2023-03-21-20-57-40.png)

#### rpm -qi 列出软件的详细信息
- `--info` 
![](img/2023-03-21-21-00-25.png)

#### rpm -ql 列出软件中的全部文件
- 列出软件安装完后释放出的文件列表以及完整的路径
![](img/2023-03-21-21-05-29.png)

#### rpm -qc 列出软件中的配置文件
- `--configfiles` 仅列出配置文件，即 `/etc/`目录下的文件
![](img/2023-03-21-21-06-17.png)

#### rpm -qd 列出说明文档
- `--artifactfiles` 仅列出说明文档，`/usr/share/doc` 和 `/usr/share/man` 目录中的文档

![](img/2023-03-21-21-09-58.png)

#### rpm -qR 列出软件依赖
- `--requires` 
![](img/2023-03-21-21-11-49.png)





### 查询

## SRPM
- Source RPM，即 RPM 文件里含的未编译的源代码
- 文件的扩展名为 `*.src.rpm`
- SRPM 中包含了软件所需的相关依赖性说明以及 RPM 文件提供的数据
- 提供了参数配置文件，如 configure 与 makefile
- 要以 RPM 管理的方式编译成 RPM 文件再安装
- SRPM 可以通过修改配置参数来编译生成适合自己的 RPM 文件


## YUM
> [yum](https://en.wikipedia.org/wiki/Yum_(software))


- Yellow Dog Updater, Modified
- The YUM is a free and open-source command-line package-management utility for computers running the Linux operating system using the **RPM Package Manager**.
- 为了解决 RPM 属性相依的问题
- 安装软件时可自动装上需要的依赖

## dpkg
- Debian 社区开发的包管理器
- Debian Package
- 软件包后缀为 .deb


### 仓库种类
#### Ubuntu 仓库种类
> [Repositories](https://help.ubuntu.com/community/Repositories)
> [What are Repositories](https://help.ubuntu.com/community/Repositories/Ubuntu)


ubuntu 仓库分成 4 种类：
- main
包含大多数需要使用的开源应用程序，包括安装 Ubuntu 时默认装上的软件
- restricted
- universe
- multiverse

### 安装软件
#### 从光盘安装包
- ubuntu 22.04 虚拟机
- 将光盘挂载到一个空目录
![](img/2023-03-21-19-22-16.png) 
- 软件安装包在 pool 目录中

### Verify 校验文件
- `man rpm` 搜索 `Verify`
- 校验功能用于检查文件是否修改过
- 软件安装包中的文件修改后卸载后会备份
  
![](img/2023-03-20-14-29-12.png)
![](img/2023-03-20-14-30-20.png)


## rocky 配置私有 yum 仓库
环境：rocky 8.6

- 安装 httpd
```bash
sudo yum install -y httpd
```
- 开启 httpd 服务
```bash
systemctl restart httpd.service
```
- 关闭防火墙
```bash
sudo systemctl stop firewalld.service
```



# curl

## 判断一个网站能否访问
- `curl www.baidu.com` 可以测试写的网站能否访问
- 能访问则返回 0，不能访问返回非0

![](img/2023-03-28-20-04-43.png)


# scp

//TODO: sleep 问题
# sleep

![](img/2023-03-30-17-52-06.png)


//TODO: 分区、文件系统 和 挂载
# 不同设备在 linux 中的文件名
- 鸟哥的Linux私房菜 基础篇 2.1.3

# lsblk 


# df 
- 只能看正在挂载的文件系统

# blkid 查看文件的 UUID

# 磁盘分区
操作环境：虚拟机

## 分区的目的
- 为什么要分区


## 分区方式
- 不同分区方式的差别
- 一个硬盘能否有不同分区方式
- 跨分区的文件使用有什么限制
	- 硬链接
### MBR 分区
- 有主分区和扩展分区组成，最多 4 个
- 扩展分区只能 1 个，或者没有，即 4 个主分区
- 扩展分区不能直接使用，必须在扩展分区中划分逻辑分区来使用


#### 主分区
- 主分区是否可以扩展和缩减
- 一个主分区的大小是否有限制
- 设备名不会因为其他设备删除而动态变化

#### 逻辑分区
- 在扩展分区中划分
- 为什么叫逻辑分区
- 逻辑分区的个数和容量是否有限制
- 主分区和逻辑分区在使用上的区别
- 逻辑分区是否可以扩容和缩减
- 逻辑分区的设备名至少从  5 开始，如 `sda5`，前面的 4 个数字是留给主分区和扩展分区使用
- 设备名可能变化，如果删除 `sda5`，则原来的设备 `sda6` 变为 `sda5`，因此表示设备时用 `UUID` 更好

### GPT 分区

## 新增磁盘
> [ Virtual Hard Disk is added, but not showing using lsblk -d command](https://www.linuxquestions.org/questions/linux-newbie-8/virtual-hard-disk-is-added-but-not-showing-using-lsblk-d-command-4175645367/)
> [How to detect new hard disk attached without rebooting?](https://unix.stackexchange.com/questions/404405/how-to-detect-new-hard-disk-attached-without-rebooting)
> [How to Scan Newly added Disks in Linux Easily](https://www.learnitguide.net/2016/02/how-to-scan-newly-added-disks-in-linux.html)
> [How to Scan\Detect new LUN’s & SCSI disks in Linux](https://www.2daygeek.com/scan-detect-luns-scsi-disks-on-redhat-centos-oracle-linux/)

- 是否需要关机状态新增硬盘
- 新增硬盘后让系统识别到新硬盘
	- 重启系统
	- 重新扫描硬盘
	![](img/2023-04-01-21-31-47.png)




- 需要 root 权限

### fdisk -l device 查看设备分区
### fdisk device 为设备创建分区

#### m 查看帮助


#### 查看内核是否识别新的分区
- 用 `lsblk` 命令查看是否有新分区信息
- `cat /proc/partitions` 查看内核是否识别新的分区
- 上面两种方式区别？

#### partprobe 分区后同步分区表
- 内核中的分区表信息和硬盘分区表同步
- CentOS 7，8 同步分区表

## gdisk 创建 GPT 分区

![](img/2023-04-01-17-48-07.png)


# 查询已打开文件
## fuser
- fuser  displays  the PIDs of processes using the specified files or file systems.
- 找出使用文件或文件系统的进程

```bash
fuser: Invalid option --help
Usage: fuser [-fIMuvw] [-a|-s] [-4|-6] [-c|-m|-n SPACE]
             [-k [-i] [-SIGNAL]] NAME...
       fuser -l
       fuser -V
Show which processes use the named files, sockets, or filesystems.

  -a,--all              display unused files too
  -i,--interactive      ask before killing (ignored without -k)
  -I,--inode            use always inodes to compare files
  -k,--kill             kill processes accessing the named file
  -l,--list-signals     list available signal names
  -m,--mount            show all processes using the named filesystems or
                        block device
  -M,--ismountpoint     fulfill request only if NAME is a mount point
  -n,--namespace SPACE  search in this name space (file, udp, or tcp)
  -s,--silent           silent operation
  -SIGNAL               send this signal instead of SIGKILL
  -u,--user             display user IDs
  -v,--verbose          verbose output
  -w,--writeonly        kill only processes with write access
  -V,--version          display version information
  -4,--ipv4             search IPv4 sockets only
  -6,--ipv6             search IPv6 sockets only
  -                     reset options

  udp/tcp names: [local_port][,[rmt_host][,[rmt_port]]]
```

## lsof 列出被程序所打开的文件
- 找出进程打开或使用的文件

## pidof 查看正在运行的程序的 PID
- find the process ID of a running program.

```bash
pidof usage: [options] <program-name>

 -c           Return PIDs with the same root directory
 -d <sep>     Use the provided character as output separator
 -h           Display this help text
 -n           Avoid using stat system function on network shares
 -o <pid>     Omit results with a given PID
 -q           Quiet mode. Do not display output
 -s           Only return one PID
 -x           Return PIDs of shells running scripts with a matching name
 -z           List zombie and I/O waiting processes. May cause pidof to hang.
```

```bash
[14:40 lx@ubunut22 ~/Documents]$pidof init
1
```


# SELinux
- 避免资源误用，如不小心将某个重要程序权限设置为 777 而引发的安全隐患
- 进行程序、文件等细部权限设置依据的一个核心模块

## 自助式存取控制 DAC
- Discretionary Access Control
- 传统的文件权限与账号关系
- 依据程序的拥有者和文件资源的 rwx 权限绝对有无存取能力

缺点：
- root 有最高权限，若不小心被其他人获取，则该程序可以在系统上进行任何资源的存取
- 使用者可以取得程序来变更文件资源的存取权限

## 委任式存取控制 MAC
- Mandatory Access Control
- 可以对特定程序与特定的文件资源来进行权限控制
- SELinux 提供一些默认政策，并在该政策中提供多个规则，来选择是否启用该控制规则
- 控制的主体是程序

## SELinux 运行模式
- 通过 MAC 管理程序
- 控制的主体为程序
- 目标为该程序能否读取的文件资源
- 通过制定政策来管理
- 政策中有详细的规则指定不同的服务的开放的资源
	- targeted
	针对网络服务限制多，本机限制少，默认政策
	- minimum
	仅针对选择的程序保护
	- mls
	限制较严格
- 主体与目标的安全性文本（security context）必须一致才能存取目标，类似 rwx
- SELinux 放行后，最终能否存取目标还是要看文件系统的 rwx 权限
- 安全性文本在 inode 中，可以通过 `ls -Z` 查看，前提是开启 SELinux

## SELinux 三种模式
- enforcing
强制模式，SELinux 运行中，且已开始限制 domain/type
- permissive
宽容模式，SELinux 运行中，但不实际限制，仅警告
- disabled
SELinux 未运行

## getenforce 查看 SELinux 模式

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

## sestatus 查看 SELinux 政策
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

## 修改 SELinux 的模式
### 配置文件修改 SELinux 的模式
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

### setenforce  
- 不能关闭，仅其他两种模式切换
- 修改后要重启，因为 SELinux 在内核中

```bash
[lx@Rocky8 ~]$ setenforce --help
usage:  setenforce [ Enforcing | Permissive | 1 | 0 ]

[lx@Rocky8 ~]$ sudo setenforce 0
[lx@Rocky8 ~]$ getenforce 
Permissive
```




//LABEL：文件系统
# 文件系统


## 目录结构
### /proc 查看内存数据
- 程序在内存中，内存的数据写入到 `/proc` 目录下
- 主机上各程序的 PID 以目录的形式在 `/proc` 目录中，目录的名为 PID
- 开机的第一个程序 `systemd` 的 PID 为 1，因此在 `/proc/1` 目录中

![](img/2023-04-13-14-11-38.png)



## 文件系统的定义
- 什么是文件系统


## 文件系统的作用
- 为什么需要文件系统
## 文件系统类型
- 为什么有不同类型的文件系统
- 不同类型的文件系统有什么区别
- 不同类型的文件系统上的文件使用有什么区别
- 一个分区上能否有多个不同的文件系统
- 
### ext4 
- 支持扩容和缩减

### xfs

### swap



## 虚拟文件系统 VFS
- 屏蔽不同文件系统的差异


## 创建文件系统
### mkfs

## 查看文件系统的属性

### clean 状态

### block size
- 跟文件系统的大小有关，如常用的 4KB
- 存放文件的最小单位
	- ll 查看目录时显示的大小为 4kB 
	- df 查看文件的大小和 ll 查看文件的大小
	- ls -s 查看文件的大小

- mkfs.ext -b 创建文件系统时指定文件大小
- 一旦文件系统创建完成，不能修改块的大小



### Reserved blocks
- 保留块，预留给 root 使用，普通用户无法使用，应急



### tune2fs 查看 ext4 文件系统属性

### xfs_info 查看 xfs 文件系统属性



# 挂载
- 挂载的目录必须先存在
- 挂载的文件夹最好用空目录，否则挂载后原来的文件看不到，除非解除挂载
- 一个设备可以同时挂载到多个挂载点


## 挂载的定义

## 挂载的目的
- 为什么要挂载


## mount 临时挂载

### -o ro 只读

### -a

### unmount 接触挂载

## 永久挂载
### 写配置文件 `/etc/fstab`
	- 设备名或UUID
	UUID 在用 mount 挂载后会生成，可以用 blkid 查看，该方式更好
	- 挂载点
	- 文件系统类型
	- 选项
	如 `ro` 只读

### 让配置文件生效
- mount -a 对配置文件中新增的行可以生效，但修改配置文件或删除不能生效
- mount -o remount 挂载点名 可以让配置文件生效


# 逻辑卷轴管理器 LVM
## 什么时 LVM


## 为什么需要逻辑卷

## 逻辑卷使用和物理卷区别

## 能否将全部分区都用逻辑卷


## 逻辑卷的性能


## 物理卷
### 查看物理卷的信息
#### pvs


#### pvdisplay 
- 更详细


## PE

## VG 卷组
- volumn group


### 查看卷组信息
#### vgs 

#### vgdisplay


## LV 逻辑卷
- logical volumn

### lvcreate 创建逻辑卷
- 创建完的逻辑卷是软连接
![](img/2023-04-01-20-18-26.png)



### 查看逻辑卷的信息
#### lvs

### lvdisplay

![](img/2023-04-01-20-20-51.png)



## 创建逻辑卷的过程
### 创建分区

### 修改分区的类型为 LVM
	- MBR 类型
	- GPT 类型

### 安装 lvm2 软件包
	- rocky : yum -y install lvm2
	- ubuntu: apt -y install lvm2

### pvcreate 创建物理卷
- 如 `pvcreate /dev/sdb{1..3}
- 


### vgcreate 创建卷组
- 如 `vgcreate vg_demo /dev/sdb{1..3}`
- 可以指定 PE 大小，加上 `-s` 选项，不指定则使用默认值


### lvcreate 创建逻辑卷
- `lvcreate  `

![](img/2023-04-02-09-43-42.png)
#### -n 指定逻辑卷名字

#### -L 指定逻辑卷的大小
- 可以直接指定 size，如 `6G`
- 如果指定的大小不是 PE 的整数倍怎么处理？
- 指定的大小不能超过卷组的大小

#### -l 指定逻辑卷的大小
- 指定 PE 的个数

#### 指明逻辑卷的卷组
- 一个逻辑卷能否能否从多个卷组组合？
- 能否不指明卷组


### 为逻辑卷创建文件系统
- 如 `mkfs.xfs /dev/vg_demo/lv1`

![](img/2023-04-01-20-27-21.png)


### 挂载
- 创建一个空目录如 `/log` 作为挂载点，如果该目录已存在，则换一个名字
- 用 `lsblk -f` 或者 `blkid` 查看逻辑卷的 UUID
- 修改 `/etc/fstab` 配置文件，注意挂载点必须存在，且最好是空目录，否则原来目录的内容会被覆盖
![](img/2023-04-01-20-48-47.png)
- 让配置文件生效 
	- `mount -a`，该命令对配置文件中新增或删除的项有效
	- 如果修改配置项后需要生效，用 `mount -o remount mountpoint` 
- 用 `lsblk` 可以查看逻辑卷有了挂载点的信息
![](img/2023-04-02-10-05-27.png)



## lvextend 扩展逻辑卷
- 在卷组的多余空间中扩容
- 先查看卷组是否还有空间进行扩展，用 `vgs` 查看 `VFree` 选项的值即为剩余的空间
- 用 `lvextend` 命令扩展，`-L` 选项指定大小，如 `lvextend -L +4G` 在原来的基础上增加 `4G`，必须卷组有 `4G` 的空间
![](img/2023-04-02-10-22-10.png)

### 扩展条件
- 已经有文件系统，已经有数据，能否扩容
- 先看卷组是否还有空间
![](img/2023-04-01-21-00-02.png)


### -L 指定大小
- 如 `lvextend -L +4G` 原来的基础上增加 `4G`，必须卷组有 `4G` 的空间
![](img/2023-04-01-21-06-39.png)



### -l 指定 PE 个数

### -r 自动重置文件系统大小



# 信号（Signals）
> 深入理解计算机系统——第八章 Exceptional Control Flow

## kill -L|-l 查看全部信号 
- `kill -l` 或 `kill -L` 查看全部信号和对应编号
- 信号可以写全程或者简写（省略 `SIG`）

```bash
[lx@Rocky8 ~]$ kill -L
 1) SIGHUP	 2) SIGINT	 3) SIGQUIT	 4) SIGILL	 5) SIGTRAP
 6) SIGABRT	 7) SIGBUS	 8) SIGFPE	 9) SIGKILL	10) SIGUSR1
11) SIGSEGV	12) SIGUSR2	13) SIGPIPE	14) SIGALRM	15) SIGTERM
16) SIGSTKFLT	17) SIGCHLD	18) SIGCONT	19) SIGSTOP	20) SIGTSTP
21) SIGTTIN	22) SIGTTOU	23) SIGURG	24) SIGXCPU	25) SIGXFSZ
26) SIGVTALRM	27) SIGPROF	28) SIGWINCH	29) SIGIO	30) SIGPWR
31) SIGSYS	34) SIGRTMIN	35) SIGRTMIN+1	36) SIGRTMIN+2	37) SIGRTMIN+3
38) SIGRTMIN+4	39) SIGRTMIN+5	40) SIGRTMIN+6	41) SIGRTMIN+7	42) SIGRTMIN+8
43) SIGRTMIN+9	44) SIGRTMIN+10	45) SIGRTMIN+11	46) SIGRTMIN+12	47) SIGRTMIN+13
48) SIGRTMIN+14	49) SIGRTMIN+15	50) SIGRTMAX-14	51) SIGRTMAX-13	52) SIGRTMAX-12
53) SIGRTMAX-11	54) SIGRTMAX-10	55) SIGRTMAX-9	56) SIGRTMAX-8	57) SIGRTMAX-7
58) SIGRTMAX-6	59) SIGRTMAX-5	60) SIGRTMAX-4	61) SIGRTMAX-3	62) SIGRTMAX-2
63) SIGRTMAX-1	64) SIGRTMAX	
```

## kill -l|L sigNumber 根据编号查看信号名称
- `sigNumber` 为信号的编号，返回的是信号的简写，如 `HUB` 表示 `SIFHUB`

```bash
[lx@Rocky8 ~]$ kill -l 1
HUP
[lx@Rocky8 ~]$ 
[lx@Rocky8 ~]$ kill -L 1
HUP
[lx@Rocky8 ~]$ 
[lx@Rocky8 ~]$ kill -l | head -n1
 1) SIGHUP	 2) SIGINT	 3) SIGQUIT	 4) SIGILL	 5) SIGTRAP
```


//LABLE：工作管理
# 工作管理（Job Control）



## 背景（background）
- 不能被 `Ctrl c` 中断


## & 将工作放到背景
- 放到当前终端的背景，非系统的背景
- 背景的工作与终端绑定
一个终端中将一个工作放到背景，用 `ctrl z` 快捷键
```bash
[1]+  Stopped                 vim 1.txt
[lx@Rocky8 ~]$ jobs
[1]+  Stopped                 vim 1.txt
[lx@Rocky8 ~]$ tty
/dev/pts/0
[lx@Rocky8 ~]$ 
```
在另一个终端打开，用 jobs 查看，无背景工作：
```bash
[lx@Rocky8 ~]$ jobs
[lx@Rocky8 ~]$ tty
/dev/pts/1
[lx@Rocky8 ~]$ 
```

## nohup 后台执行，与终端无关


## kill -signal %jobnumber 处理背景中工作
- `signal` 可以是具体信号名或信号编号
- 

```bash
[lx@Rocky8 ~]$ jobs
[1]-  Stopped                 vim 1.txt
[2]+  Stopped                 vim 2.txt
[lx@Rocky8 ~]$ 
[lx@Rocky8 ~]$ kill -15 %1
[lx@Rocky8 ~]$ 

[1]+  Stopped                 vim 1.txt
[lx@Rocky8 ~]$ jobs
[1]+  Stopped                 vim 1.txt
[2]-  Stopped                 vim 2.txt
[lx@Rocky8 ~]$ 
[lx@Rocky8 ~]$ kill -15 %1
[lx@Rocky8 ~]$ jobs
[1]+  Stopped                 vim 1.txt
[2]-  Stopped                 vim 2.txt
[lx@Rocky8 ~]$ kill -9 %1

[1]+  Stopped                 vim 1.txt
[lx@Rocky8 ~]$ 
[1]+  Killed                  vim 1.txt
[lx@Rocky8 ~]$ kill -l 9
KILL
[lx@Rocky8 ~]$ kill -KILL %1
-bash: kill: %1: no such job
[lx@Rocky8 ~]$ jobs
[2]+  Stopped                 vim 2.txt
[lx@Rocky8 ~]$ kill -KILL %2

[2]+  Stopped                 vim 2.txt
[lx@Rocky8 ~]$ jobs
[2]+  Killed                  vim 2.txt
[lx@Rocky8 ~]$ jobs
[lx@Rocky8 ~]$ ls 
```


//LABEL: 进程
# 进程管理
结合 **深入理解计算机系统——第八章 Exceptional Control Flow ** 看，理解进程和信号的概念

## 进程介绍


## 进程的状态
> [Process state](https://en.wikipedia.org/wiki/Process_state)
> [States of a Process in Operating Systems](https://www.geeksforgeeks.org/states-of-a-process-in-operating-systems/)

> These distinct states may not be recognized as such by the operating system kernel. However, they are a useful abstraction for the understanding of processes.
> &nbsp;
> ![](img/2023-04-12-20-41-10.png)

### Created
- The process awaits admission to the "ready" state.
- Admission will be approved or delayed by a long-term, or admission, scheduler.

- 需要申请一个空白的 PCB，完成资源分配

### Ready
- A "ready" or "waiting" process has been loaded into main memory and is awaiting execution on a CPU. 

### Running
- A process moves into the running state when it is chosen for execution.
- There is at most one running process per CPU or core.
- A process can run in either of the two modes, namely kernel mode or user mode.

### Blocked
- A process transitions to a blocked state when it cannot carry on without an external change in state or event occurring.
- For example, a process may block on a call to an I/O device such as a printer, if the printer is not available.
- Processes also commonly block when they require user input,
- or require access to a critical section which must be executed [atomically](https://stackoverflow.com/questions/15054086/what-does-atomic-mean-in-programming).
- Such critical sections are protected using a synchronization object such as a semaphore or mutex.


### Terminated
- A process may be terminated, either from the "running" state by completing its execution or by explicitly being killed.
- The terminated process remains in the process table as a zombie process until its parent process calls the `wait` system call to read its exit status, at which point the process is removed from the process table, finally ending the process's lifetime.
- If the parent failes to call `wait`, this process continues to consume the process table entry (concretely the process identifier or PID), and causes a resource leak.


### Additional process states
> Two additional states are available for processes in systems that support virtual memory. 
> In both of these states, processes are "stored" on secondary memory (typically a hard disk).

#### stoped
- 进程被**挂起**（suspended）且**不会被调度**。
A process **stops** as a result of receiving a **SIGSTOP**, **SIGTSTP**, **SIGTTIN**, or **SIGTTOU** signal, 
and it **remains** **stopped** **until** it receives a **SIGCONT** signal, at which point it becomes running again.

- 按 `Ctrl z` 可以让进程处于 suspended 的状态，相当于发送信号 `SIGSTOP` 


##### Swapped out and waiting
- suspended and waiting
- The process is removed from main memory and placed on external storage by the scheduler.
- It may be swapped back into the waiting state.
##### Swapped out and blocked
- suspended and blocked
- The process is both blocked and swapped out
- It may be swapped back in again under the same circumstances as a swapped out and waiting process.


## 进程执行优先级 Priority 和 NICE
- Linux 给予一个进程的 Priority，即 PRI，该值越优先级越高，即更快被执行
- PRI 由 CPU 动态调整，使用者无法直接调整 PRI 的值
- 使用者可以通过调整 NICE 的值来修改优先级，PRI (new) = PRI (old) + NICE

### NICE 值的范围
- -20 ~ 19
- root 可以随意调整自己或他人程序的 NICE 值，且范围 -20 ~ 19
- 一般使用者仅可调整自己程序的 NICE 值，范围为 0 ~ 19，避免一般用户抢占系统资源
- 一般使用者仅可将 NICE 值调高，即降低优先级，不能调低

### 设置 NICE 值
#### 执行程序时设置 NICE 值
- `nice [-n num] command`，普通用户数值 num 为 0 ~ 19，不在该范围会设置失败
![](img/2023-04-13-10-55-15.png)


#### 调整某个已存在的 PID 的 NICE 值
- renice 
`renice [num] PID`
可通过 `ps -l` 查看 PID

- top
`top -p PID` 查看进程信息，按 `r` 后根据指示调整 NICE，只能调高不能调低

## 查看进程的状态
### ps 查看某个时间点进程的状态
- report a snapshot of the current process

#### ps 显示和当前用户相同 UID 且相同终端的进程

> By default, ps selects all processes with the same effective user ID (euid=EUID) as the
> current user and associated with the same terminal as the invoker.  


- 如果用 `su -l` 切换到另一个用户，用 `ps -l` 看不到之前用户所在 bash 的进程，
  只看到进程 UID 和当前用户 UID 相同的进程 
- 用 `sudo` 命令以 root 身份执行一个命令，`ps` 也看不到，因为 UID 不同
- 当前 bash 相关，如果在当前终端 bash 中又输入 bash 打开一个子进程，也会显示出来，
  后面的为当前 bash 的子进程，同属于一个终端


#### ps -l 查询当前 bash 相关程序
- `ps` 命令的长格式

```bash
[lx@Rocky8 ~]$ vim 1.txt &
[1] 5212
[lx@Rocky8 ~]$ ps -l
F S   UID     PID    PPID  C PRI  NI ADDR SZ WCHAN  TTY          TIME CMD
0 S  1004    4461    4456  0  80   0 - 58874 -      pts/1    00:00:00 bash
0 S  1004    5170    4461  0  80   0 - 58447 -      pts/1    00:00:00 sh
0 S  1004    5171    5170  0  80   0 - 58813 -      pts/1    00:00:00 bash
0 T  1004    5212    5171  5  80   0 - 60829 -      pts/1    00:00:00 vim
0 R  1004    5213    5171  0  80   0 - 63823 -      pts/1    00:00:00 ps

[1]+  Stopped                 vim 1.txt
[lx@Rocky8 ~]$ 
```

- F
进程标志，process flags
	- 4：表示进程的权限为 root
	- 1：forked but didn't exec

- S
process stat codes
```bash
D    uninterruptible sleep (usually IO)
I    Idle kernel thread
R    running or runnable (on run queue)
S    interruptible sleep (waiting for an event to complete)
T    stopped by job control signal
t    stopped by debugger during the tracing
W    paging (not valid since the 2.6.xx kernel)
X    dead (should never be seen)
Z    defunct ("zombie") process, terminated but not reaped by its parent
```


- UID
该进程被该 UID 拥有，如果执行的文件有 SUID，权限有可能和执行的用户不同，

- PID
进程 ID

- PPID
父进程 PID

- C
CPU 使用率，百分比

- PRI/NI
Priority/Nice，表示进程被 CPU 调度的优先顺序，数值越小则优先级越高，越快被 CPU 执行

- ADDR
kernel function，指出程序在内存的哪个部分
running 的程序，显示 `-`

- SZ
表示程序用掉多少内存


- WCHAN
表示目前程序是否运行中，`-` 表示在运行中

- TTY
登陆者终端机的位置，用 `tty` 命令看到的结果

- TIME
进程实际使用 CPU 的时间

-CMD
造成次进程的触发指令


#### ps -A 显示所有进程

#### ps -a 不与 terminal 有关的所有 process

#### ps -u 有效使用者（effective user）相关进程

#### ps aux 查看系统所有进程


### top 动态观察进程的变化
- 相比 ps 只能查看此刻的进程状态，top 可以动态持续的查看进程状态


#### ?|h 查看帮助
- `top` 进入页面后按 `?` 或 `h` 查看帮助


#### top -d 指定刷新的秒数
- 指定以多少秒刷新一次，rocky8.6 默认 3 秒，可以通过最上面一行第一个当前时间看到刷新频率


#### top -p PID 查看指定进程的数据
- `echo $$` 可以查看当前 bash 的PID

#### 实时修改排序
- 默认排序是 CPU 使用率
- `P` 大写，以 CPU 使用率排序，%CPU 字段
- `M` 大写，以内存使用率排序，%MEM 字段
- `T` 大写，以 CPU 使用时长排序，TIME+ 字段

#### 实时修改 NI 数值
- 在数据显示界面，按 `r` 修改 NI 值，即 renice
- 需要先输入要修改的 PID，不输入则默认修改第一个进程
- 然后输入要改的 NI 值


### pstree 进程树显示程序的相关性


#### pstree -A 以 ASCII 字符 
- 不同语系可能出现乱码问题，用 `-A` 克服线段乱码问题



#### pstree -u 列出 uid 
- 只有和父进程 uid 不同时才会列出，在小括号中显示
- 如果同时指定了 `-p` 选项，即显示 PID，则和父进程 uid 不同时列在 PID 后面

![](img/2023-04-12-19-58-00.png)


#### pstree -sp 列出 PID
- `pstree -p` 列出进程树时显示 PID
- `pstree -sp PID` 列出某个指定进程的信息，加上 `-s` 可以列出其父进程信息

![](img/2023-04-12-20-00-00.png)
![](img/2023-04-12-20-12-21.png)

#### pstree -T 不显示线程
- `--hide-threads`
- 默认显示线程，用 `{}` 显示

![](img/2023-04-12-20-16-32.png)






## kill -signal PID
The **/bin/kill** program **sends** an **arbitrary signal** to another **process**. 

下面命令发送信号 9（SIGKILL）到进程 15213：
```bash
linux> /bin/kill -9 15213
```

**PID为负数时**：下面命令发送信号 9（SIGKILL）到进程组 15213 中的每个信号：
```bash
linux> /bin/kill -9 -15213
```


# 观察系统资源
## free 观察内存使用
```bash
Usage:
 free [options]

Options:
 -b, --bytes         show output in bytes
     --kilo          show output in kilobytes
     --mega          show output in megabytes
     --giga          show output in gigabytes
     --tera          show output in terabytes
     --peta          show output in petabytes
 -k, --kibi          show output in kibibytes
 -m, --mebi          show output in mebibytes
 -g, --gibi          show output in gibibytes
     --tebi          show output in tebibytes
     --pebi          show output in pebibytes
 -h, --human         show human-readable output
     --si            use powers of 1000 not 1024
 -l, --lohi          show detailed low and high memory statistics
 -t, --total         show total for RAM + swap
 -s N, --seconds N   repeat printing every N seconds
 -c N, --count N     repeat printing N times, then exit
 -w, --wide          wide output

     --help     display this help and exit
 -V, --version  output version information and exit
```

```bash
[11:10 lx@ubunut22 ~]$free -ht
               total        used        free      shared  buff/cache   available
Mem:           3.8Gi       1.8Gi       1.0Gi        27Mi       1.0Gi       1.7Gi
Swap:          3.8Gi          0B       3.8Gi
Total:         7.6Gi       1.8Gi       4.8Gi
[11:11 lx@ubunut22 ~]$
```

## uname 查看系统和内核相关信息

```bash
Usage: uname [OPTION]...
Print certain system information.  With no OPTION, same as -s.

  -a, --all                print all information, in the following order,
                             except omit -p and -i if unknown:
  -s, --kernel-name        print the kernel name
  -n, --nodename           print the network node hostname
  -r, --kernel-release     print the kernel release
  -v, --kernel-version     print the kernel version
  -m, --machine            print the machine hardware name
  -p, --processor          print the processor type (non-portable)
  -i, --hardware-platform  print the hardware platform (non-portable)
  -o, --operating-system   print the operating system
      --help     display this help and exit
      --version  output version information and exit
```

```bash
[11:15 lx@ubunut22 ~]$uname -a
Linux ubunut22 5.19.0-38-generic #39~22.04.1-Ubuntu SMP PREEMPT_DYNAMIC Fri Mar 17 21:16:15 UTC 2 x86_64 x86_64 x86_64 GNU/Linux
[11:15 lx@ubunut22 ~]$
[11:15 lx@ubunut22 ~]$uname -s
Linux
[11:15 lx@ubunut22 ~]$
[11:15 lx@ubunut22 ~]$uname -n
ubunut22
[11:15 lx@ubunut22 ~]$
[11:15 lx@ubunut22 ~]$uname -r
5.19.0-38-generic
[11:15 lx@ubunut22 ~]$uname -v
#39~22.04.1-Ubuntu SMP PREEMPT_DYNAMIC Fri Mar 17 21:16:15 UTC 2
[11:16 lx@ubunut22 ~]$
[11:16 lx@ubunut22 ~]$uname -m
x86_64
[11:16 lx@ubunut22 ~]$uname -p
x86_64
[11:16 lx@ubunut22 ~]$uname -i
x86_64
[11:16 lx@ubunut22 ~]$uname -o
GNU/Linux
[11:16 lx@ubunut22 ~]$
```

## uptime 观察系统启动时间
```bash
Usage:
 uptime [options]

Options:
 -p, --pretty   show uptime in pretty format
 -h, --help     display this help and exit
 -s, --since    system up since
 -V, --version  output version information and exit
```

```bash
[11:19 lx@ubunut22 ~]$uptime
 11:19:18 up 27 min,  2 users,  load average: 0.14, 0.17, 0.18
[11:19 lx@ubunut22 ~]$
[11:19 lx@ubunut22 ~]$uptime -p
up 28 minutes
[11:19 lx@ubunut22 ~]$uptime -s
2023-04-13 10:51:23
```

## netstat 追踪网络
> [How to Install netstat on Ubuntu 20.04 LTS (Focal Fossa)](https://www.cyberithub.com/how-to-install-netstat-on-ubuntu-20-04-lts-focal-fossa/)


- ubuntu 22.04 安装需要先装 `net-tools` 包

```bash
usage: netstat [-vWeenNcCF] [<Af>] -r         netstat {-V|--version|-h|--help}
       netstat [-vWnNcaeol] [<Socket> ...]
       netstat { [-vWeenNac] -i | [-cnNe] -M | -s [-6tuw] }

        -r, --route              display routing table
        -i, --interfaces         display interface table
        -g, --groups             display multicast group memberships
        -s, --statistics         display networking statistics (like SNMP)
        -M, --masquerade         display masqueraded connections

        -v, --verbose            be verbose
        -W, --wide               don't truncate IP addresses
        -n, --numeric            don't resolve names
        --numeric-hosts          don't resolve host names
        --numeric-ports          don't resolve port names
        --numeric-users          don't resolve user names
        -N, --symbolic           resolve hardware names
        -e, --extend             display other/more information
        -p, --programs           display PID/Program name for sockets
        -o, --timers             display timers
        -c, --continuous         continuous listing

        -l, --listening          display listening server sockets
        -a, --all                display all sockets (default: connected)
        -F, --fib                display Forwarding Information Base (default)
        -C, --cache              display routing cache instead of FIB
        -Z, --context            display SELinux security context for sockets

  <Socket>={-t|--tcp} {-u|--udp} {-U|--udplite} {-S|--sctp} {-w|--raw}
           {-x|--unix} --ax25 --ipx --netrom
  <AF>=Use '-6|-4' or '-A <af>' or '--<af>'; default: inet
```

```bash
[11:31 lx@ubunut22 ~]$netstat -tulnp
(Not all processes could be identified, non-owned process info
 will not be shown, you would have to be root to see it all.)
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name    
tcp        0      0 127.0.0.53:53           0.0.0.0:*               LISTEN      -                   
tcp        0      0 127.0.0.1:6010          0.0.0.0:*               LISTEN      -                   
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      -                   
tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN      -                   
tcp        0      0 127.0.0.1:631           0.0.0.0:*               LISTEN      -                   
tcp6       0      0 :::22                   :::*                    LISTEN      -                   
tcp6       0      0 :::80                   :::*                    LISTEN      -                   
tcp6       0      0 ::1:631                 :::*                    LISTEN      -                   
tcp6       0      0 ::1:6010                :::*                    LISTEN      -                   
udp        0      0 0.0.0.0:631             0.0.0.0:*                           -                   
udp        0      0 0.0.0.0:5353            0.0.0.0:*                           -                   
udp        0      0 127.0.0.53:53           0.0.0.0:*                           -                   
udp        0      0 0.0.0.0:55580           0.0.0.0:*                           -                   
udp6       0      0 :::46208                :::*                                -                   
udp6       0      0 :::5353                 :::*                                -                   
```


## dmesg 分析内核产生的消息
- 需要 root 权限才能查看
- 系统开机和运行过程中内核产生的信息会记录到一个保护区段，可以通过 `dmesg` 查看


## vmstat 查看虚拟内存的状态

```bash
Usage:
 vmstat [options] [delay [count]]

Options:
 -a, --active           active/inactive memory
 -f, --forks            number of forks since boot
 -m, --slabs            slabinfo
 -n, --one-header       do not redisplay header
 -s, --stats            event counter statistics
 -d, --disk             disk statistics
 -D, --disk-sum         summarize disk statistics
 -p, --partition <dev>  partition specific statistics
 -S, --unit <char>      define display unit
 -w, --wide             wide output
 -t, --timestamp        show timestamp

 -h, --help     display this help and exit
 -V, --version  output version information and exit

For more details see vmstat(8)
```

```bash
[11:36 lx@ubunut22 ~]$vmstat
procs -----------memory---------- ---swap-- -----io---- -system-- ------cpu-----
 r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa st
 0  0      0 715812  56024 1297232    0    0   189    73   92  155  1  1 97  0  0
[11:36 lx@ubunut22 ~]$
[11:36 lx@ubunut22 ~]$whatis vmstat
vmstat (8)           - Report virtual memory statistics
[11:36 lx@ubunut22 ~]$
```



******************

# 端口号
> [Port (computer networking)](https://en.wikipedia.org/wiki/Port_(computer_networking))
> [TCP port 0 reserved for what purpose?](https://networkengineering.stackexchange.com/questions/11234/tcp-port-0-reserved-for-what-purpose)


- 不是所有的应用程序都有端口，如不需要网络的应用程序，不需要端口号
- 应用程序进行网络连接时才分配端口号
- 端口号 0 是保留端口号，不能使用


## 熟知端口号
- 熟知端口号为服务器的端口号，非客户端的端口号，客户端的端口号是随机动态分配
- 熟知端口号是服务器默认端口号，不指定时默认使用的端口号，但也可以修改，修改后访问服务器时需要指定新端口号
- `cat /etc/services | less` 查看熟知端口号，部分内容如下：


```bash
# /etc/services:
# $Id: services,v 1.49 2017/08/18 12:43:23 ovasik Exp $
#
# Network services, Internet style
# IANA services version: last updated 2016-07-08
#
# Note that it is presently the policy of IANA to assign a single well-known
# port number for both TCP and UDP; hence, most entries here have two entries
# even if the protocol doesn't support UDP operations.
# Updated from RFC 1700, ``Assigned Numbers'' (October 1994).  Not all ports
# are included, only the more common ones.
#
# The latest IANA port assignments can be gotten from
#       http://www.iana.org/assignments/port-numbers
# The Well Known Ports are those from 0 through 1023.
# The Registered Ports are those from 1024 through 49151
# The Dynamic and/or Private Ports are those from 49152 through 65535
#
# Each line describes one service, and is of the form:
#
# service-name  port/protocol  [aliases ...]   [# comment]

tcpmux          1/tcp                           # TCP port service multiplexer
tcpmux          1/udp                           # TCP port service multiplexer
rje             5/tcp                           # Remote Job Entry
rje             5/udp                           # Remote Job Entry
echo            7/tcp
echo            7/udp
discard         9/tcp           sink null
discard         9/udp           sink null
systat          11/tcp          users
systat          11/udp          users
daytime         13/tcp
daytime         13/udp
qotd            17/tcp          quote
qotd            17/udp          quote
chargen         19/tcp          ttytst source
chargen         19/udp          ttytst source
ftp-data        20/tcp
ftp-data        20/udp
# 21 is registered to ftp, but also used by fsp
ftp             21/tcp
ftp             21/udp          fsp fspd
ssh             22/tcp                          # The Secure Shell (SSH) Protocol
ssh             22/udp                          # The Secure Shell (SSH) Protocol
telnet          23/tcp
telnet          23/udp
# 24 - private mail system
lmtp            24/tcp                          # LMTP Mail Delivery
lmtp            24/udp                          # LMTP Mail Delivery
smtp            25/tcp          mail
smtp            25/udp          mail
time            37/tcp          timserver
time            37/udp          timserver
rlp             39/tcp          resource        # resource location
rlp             39/udp          resource        # resource location
nameserver      42/tcp          name            # IEN 116
nameserver      42/udp          name            # IEN 116
nicname         43/tcp          whois
nicname         43/udp          whois
tacacs          49/tcp                          # Login Host Protocol (TACACS)
tacacs          49/udp                          # Login Host Protocol (TACACS)
re-mail-ck      50/tcp                          # Remote Mail Checking Protocol
re-mail-ck      50/udp                          # Remote Mail Checking Protocol
domain          53/tcp                          # name-domain server
domain          53/udp
whois++         63/tcp          whoispp
whois++         63/udp          whoispp
```




# 网络配置
- ip
- netmask
- getway

# 查看启动方式

- VMware ---> 虚拟机 ---> 设置 ---> 选项 ---> 高级
![](img/2023-04-02-15-27-03.png)

# 添加一块新网卡
- 环境：虚拟机（VMware） Rocky 8.6
- VMware ---> 虚拟机 ---> 设置
![](img/2023-04-02-13-38-54.png)

- `ip a` 可以看到新网卡名，但没 ip 等信息

- `nmcli connection` 查看生效的网卡，绿色为正常状态
![](img/2023-04-02-13-42-40.png)

- 配置网卡信息
	- 进入 `/etc/sysconfig/network-scripts/` 目录，可看到有 `ifcfg-` 开头的文件名 
	![](img/2023-04-02-13-54-45.png)
	- 在该目录下新建网卡配置文件，如 `ifcfg-eth1`，网卡名为 `eth1`
	![](img/2023-04-02-14-25-16.png)

- 

# 修改网卡名
- 修改 `/etc/default/grub` 配置文件，在 `GRUB_CMDLINE_LINUX` 中的内容最后追加 `net.ifnames=0`
- 修改网卡配置文件，修改 `/etc/sysconfig/network-scripts/` 目录中对应的配置文件的名字
- 修改网卡配置文件中 `DEVICE` 和 `NAME` 都修改，`DEVICE` 为网卡名 
- 如原来的网卡名为 `ens160`，则配置文件名为 `ifcfg-ens160`，将其改为 `ifcfg-eth0`

- 重读网卡配置文件
	- UEFI 模式引导的系统重读配置
	
	- BIOS 模式引导的系统重读配置 
    ![](img/2023-04-02-15-25-37.png)

- 重启使配置文件生效

`nmcli connection reload` 和 `nmcli connection up NAME`
## 网络连接模式

### 桥接

### 仅主机
- 配置文件无网关
- 可以设置 DCPH 自动分配 IP

### NAT

## 识别新网卡
- 先用 `nmcli connection` 查看是否有新网卡

# 查看是 BIOS 还是
# 修改网卡名
- 为什么修改网卡名
- CentOS 7 以后用硬件生成的网卡名，不会和其他重复，插入新网卡也不会重复
- 但网卡名不方便管理，不能标准化，不好大规模管理


# 添加域名解析服务器地址
- 修改 `/etc/sysconfig/network-scripts/ifcfg-eth0` 配置文件，其中 `eth0` 为网卡名
	- 添加 `DNS1=10.0.0.2`，`DNS2=服务器地址` 

- 让配置生效
	- `nmcli connection reload`
	- `nmcli connection up eth1`，其中 `eth1` 不是网卡名，而是配置文件中写的 `NAME`

- `cat /etc/resolv.conf` 查看
![](img/2023-04-02-13-18-33.png)
![](img/2023-04-02-13-26-38.png)

- 判断域名解析是否生效
	- host
	- nslookup
	![](img/2023-04-02-13-25-22.png)


## Rocky8.6
- 修改配置文件 `/etc/default/grub` 中在 `GRUB_CMDLINE_LINUX` 行的内容中追加 `net.ifnames=0`

- DEVICE 
网卡名
- NAME
配置文件名 `nmcli connection` 第一列显示的名称


- nmcli connection 让配置文件生效
- 
- ## Ubuntu22.04

# 网卡配置
## Red Hat 系列



## Ubuntu



************************

# 域名解析
- host 文件中列出域名与 IP 对应的关系
- DNS 服务器解析域名

# hosts 文件
- `/etc/hosts` 
- 主机中的文本文件，定义域名和 IP 地址的对应关系
- DNS 解析时最先查看的文件，找到对应 IP 则直接请求 IP 地址，如 ping 命令会找该文件，但有些域名解析工具会忽略该文件
- hosts 文件中找不到，则会向本机配置的 DNS 服务器提出域名解析请求
- 修改该文件后会立即生效，除非某些情况该文件被应用程序缓存了


## hosts 文件引入
- hosts 文件解析域名是早期网络规模较小时使用的方案
- 管理机构提供该文件的下载地址并定期更新
- 但目前网络



# DNS 域名系统
> [DNS Records Explained](https://www.youtube.com/watch?v=HnUDtycXSNE&list=LL&index=1&t=625s&ab_channel=PowerCertAnimatedVideos)


- DNS 只解析域名，不负责 IP 是否可达

# 公有云上配置 DNS 解析



# DNS 检测工具
## dig


### cname 查询别名


## host 根据域名查询 IP 
- DNS lookup utility
- 不会查本地 hosts 文件中的域名和 IP 对应


```bash
[lx@Rocky8 ~]$ host www.baidu.com
www.baidu.com has address 220.181.38.150
www.baidu.com has address 220.181.38.149
www.baidu.com is an alias for www.a.shifen.com.
www.baidu.com is an alias for www.a.shifen.com.
```

### host -a 显示全部信息


### host -c 指定查询类型


## nslookup 查询域名
- name server lookup
- 不会查本地 hosts 文件中的域名和 IP 对应
- 不能指定用递归还是迭代方式查询
- 支持交互式和非交互式
- windows 和 linux 都能用

### 交互式查询

### 非交互式查询


## whois 查询域名注册信息


### nslookup


# bind 自建 DNS 

域名劫持

## bind 配置文件
### /etc/named.conf

### /etc/named.rfc1912.zones
- 存放域名和具体解析规则对应关系


# DNS 自解析

# 主从 DNS

## 主从 DNS 区别
- master DNS server 停了后对 slave DNS server 的影响？

# DNS 反解析

# DNS 缓存

## nscd

# DNS 子域

# DNS 视图

named.conf zone . 为什么删掉
增加网卡用 仅主机？




# 负载均衡

## GLSB 全球负载均衡
- Global Server Load Balancing
- 



## CND
- Content Delivery Network
- 静态资源加速
- 在各地建大量机房
- cname 

# 网站测速

www.boce.com


****************************

# 网络安全

# 入侵检测系统 IDS
- Instrusion Detection System
- 旁路部署
- 监听设备，类似监控摄像头，只能记录，不能阻止
- 不影响网络通信，网络流量不经过 IDS
- 清洗统计，找到入侵和攻击数据，发现后阻止吗？

## 基于主机的 IDS

## 基于网络

# 入侵防御系统 IPS
- Instrusion Prevention System
- 串行方式接入系统
- 发现网络攻击可以采取措施


# 防水墙
- 防止内部信息泄露的安全产品
- 防止内部人员攻击


# 防火墙
- 隔离功能
- 串行方式接入系统
- 所有流入流出的数据都经过防火墙
- 工作在网络模型的哪层？可能多层都有防火墙？如在核心层只上设防火墙

DMZ 非军事化区


## 防火墙的作用
- 安全
- 路由器无法安全隔离



## 分类
### 保护范围划分
#### 主机防火墙
- 防火墙在一个主机中，保护该主机
All-in-One


#### 网络防火墙
- 保护一个网络


### 实现方式划分
#### 硬件防火墙

#### 软件防火墙

### 网络协议划分

#### 网络层防火墙
- 根据包头的协议端口号等过滤
- 不能过滤实际应用层数据
- 包含 OSI 模型的下四层，又称包过滤防火墙

53/tcp 53/udp ?



#### 应用层防火墙
- 部署在主链路上
- 包含 OSI 模型 7 层
- 比网络层防火墙更安全
- 又称 proxy 代理网关
- 消耗资源更多，增加防火墙的负载

带机量


*******************************

# Linux 防火墙
- Linux 内核提供一个默认防火墙

内核配置，内核中的文件
```bash
[lx@Rocky8 ~]$ ll /boot/config-4.18.0-372.9.1.el8.x86_64 -rw-r--r--. 1 root root 195983 May 10  2022 /boot/config-4.18.0-372.9.1.el8.x86_64
```


## 关闭系统默认防火墙策略
- 关闭后为了以后自定义防火墙策略

```bash
systemctl disable --now firewalld
```

# netfilter
- Linux 内核中的模块
- 工作在内核空间
- linux 内核的子系统
- 模块化设计
- Linux 防火墙由 Linux 内核的模块 Netfilter 组件提供
- Linux 2.4.x 之后新一代的 Linux 防火墙机制


## 五个勾子函数
- 五个勾子函数对外开放使用

### PRE_ROUTING

### LOCAL_IN

### FORWARD

### LOCAL_OUT


### POST_ROUTING



# iptables
- 命令行工具，用来配置 netfilter
- 工作在用户空间
- 编写规则后送到 netfilter
- 自定义防火墙规则先关闭默认 firewalld 防火墙，防止规则冲突


```bash


```

## 五链
- 对应 netfilter 五个勾子函数 

## 五表

### filter
- 过滤规则表，根据预定义的规则过滤符合条件的数据报
- 默认表

### nat
- NAT 地址转换规则表


### mangle
- 修改数据标记规则表


### raw
- 关闭启用的连接跟踪机制，加快封包穿越防火墙速度

### security 
- 由 SELinux 实现


## 表和链的对应关系



## 五表优先级
- 一个链上可以支持多个表，多个表可能会冲突，因此有优先级



*********************
```bash
对 10.0.0.151 主机限制，DROP 
iptables -A INPUT -s 10.0.0.151 -j DROP
ping 无法和 10.0.0.151 通信

网络不通分析
一个终端 ping 10.0.0.151 
另一个终端监控分析
tcpdump -i eth0 -nn 10.0.0.151

结果如下：
# 本机 10.0.0.158 目标 10.0.0.151 本机网卡名：eth0

结果和视频不同，也能看到 151 回来的报文?
```


## iptables 格式

```bash
iptables v1.8.4

Usage: iptables -[ACD] chain rule-specification [options]
        iptables -I chain [rulenum] rule-specification [options]
        iptables -R chain rulenum rule-specification [options]
        iptables -D chain rulenum [options]
        iptables -[LS] [chain [rulenum]] [options]
        iptables -[FZ] [chain] [options]
        iptables -[NX] chain
        iptables -E old-chain-name new-chain-name
        iptables -P chain target [options]
        iptables -h (print this help information)

Commands:
Either long or short options are allowed.
  --append  -A chain            Append to chain
  --check   -C chain            Check for the existence of a rule
  --delete  -D chain            Delete matching rule from chain
  --delete  -D chain rulenum
                                Delete rule rulenum (1 = first) from chain
  --insert  -I chain [rulenum]
                                Insert in chain as rulenum (default 1=first)
  --replace -R chain rulenum
                                Replace rule rulenum (1 = first) in chain
  --list    -L [chain [rulenum]]
                                List the rules in a chain or all chains
  --list-rules -S [chain [rulenum]]
                                Print the rules in a chain or all chains
  --flush   -F [chain]          Delete all rules in  chain or all chains
  --zero    -Z [chain [rulenum]]
                                Zero counters in chain or all chains
  --new     -N chain            Create a new user-defined chain
  --delete-chain
             -X [chain]         Delete a user-defined chain
```



## iptables -nvL 查看定义的规则
- L 要写在后面

```bash
[root@Rocky8 lx]# iptables -nvL
Chain INPUT (policy ACCEPT 935 packets, 60528 bytes)
 pkts bytes target     prot opt in     out     source               d
  417 35017 DROP       all  --  *      *       10.0.0.151           0

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               d

Chain OUTPUT (policy ACCEPT 1155 packets, 117K bytes)
 pkts bytes target     prot opt in     out     source 
```

- 如果不指定源地址，如具体主机 ip 或某个网段，如 `10.0.0.0/24`，则表示全部对象
```bash
# 拒绝全部
iptables -A INPUT -j REJECT
```



### 规则顺序影响
- 如果有多条规则，冲突，以前面的为准，检查到第一个满足的规则时就会停止检查，因此后面的规则不会生效
- 因此条件范围越小的放前面，如针对某个 IP 设定的规则放前面，针对包含该 IP 的网络的规则放后面
- 如果多个规则无包含关系，最好将范围大的放在前面，效率更高
- 

## 最佳规则方案
- 默认规则，即无匹配时的默认规则 



## 查看规则编号
```bash
iptables -vnL --line-number
```



## 规则制定方案

### 白名单
- 指定允许访问的，其他的不能访问

### 黑名单
- 只指定拒绝的，其他的都能访问



## 指定匹配条件
### -s 指定源地址
- `--source address[/mask][,...]`
- `Address` can be either a network name，hostname, network IP address (with `/mask`), or a plain IP address.
- hostname will be resolved once only, before the rule is submitted to the kernel.
- An iptables mask of `24` is equivalent to `255.255.255.0`
- A `!` before the address specification `inverts` the sense of the address.
地址前加 `!` 表示除了该地址外的其他是所有地址


```bash


```

### -d 指定目标地址
- 多网卡多 ip 时可以指定目标地址

```bash

```

### -p 指定协议
- 不指定默认全部协议
- `[!] -p, --protocol protocol`
- The  protocol  of  the  rule  or  of  the  packet to check.  
- The specified protocol can be one of `tcp, udp, udplite, icmp, ikmpv6,esp, ah, sctp, mh`
- or the special keyword **all**, 
- or it can be a **numeric value**, representing one of these protocols or a different one.  
- A protocol name from /etc/protocols is also allowed. 
- A `!` argument **before** the protocol inverts the test.  
- The number **zero** is equivalent to **all**. 
- **all** will match with all protocols and is taken as default when this option is omitted.  
- Note that, in **ip6tables**, IPv6 extension headers except **esp** are not allowed.  
- esp and ipv6-nonext can be used with Kernel version 2.6.11 or later.  
- The number **zero** is equivalent to **all**, which means that you cannot test the protocol field for the value 0 directly.
- To match on a HBH header, even if it were the last, you cannot use -p 0, but always need -m hbh.
```





### -i 指定数据报文流入的接口 
- --in-interface
- only for packets entering the `INPUT, FORWARD and PREROUTING` chains.
- When the `!` argument is used before the interface name, the sense is inverted.
- If the interface name ends in a `+`, then any interface which begins with this name will match. 
- If this option is omitted, any interface name will match.
- 如指定网卡


### -o 指定报文流出的接口
- --out-interface name
- Name of an interface via which a packet is going to be sent.
- For packets entering the `FORWARD, OUTPUT and POSTROUTING` chains.
- When the `!` argument is used before the interface name, the sense is inverted.
- If the interface name ends in a `+`, then any interface which begins with this name will match. 
- If this option is omitted, any interface name will match.


## iptables 扩展匹配条件
- 需要加载扩展模块
- `man iptables-extensions` 查看扩展模块
- 不同模块的选项不同
- rocky8.6 `rpm -ql iptables` 可查看 `iptables` 中的模块
```bash
[lx@Rocky8 ~]$  rpm -ql iptables | grep -i "tcp"
/usr/lib64/xtables/libxt_TCPMSS.so
/usr/lib64/xtables/libxt_TCPOPTSTRIP.so

/usr/lib64/xtables/libxt_tcp.so

/usr/lib64/xtables/libxt_tcpmss.so

[lx@Rocky8 ~]$  rpm -ql iptables | grep -i "udp"
/usr/lib64/xtables/libxt_udp.so

[lx@Rocky8 ~]$  rpm -ql iptables | grep -i "icmp"
/usr/lib64/xtables/libip6t_icmp6.so
/usr/lib64/xtables/libipt_icmp.so
```

### 隐式扩展
- 不需要显示的用 `-m` 指定模块，如指定 tcp 协议
```bash
iptables -p tcp 
```


### 显示扩展
`ss -nlt`
`arp -n`
修改 MAC 地址：
编辑网卡配置文件`/etc/sysconfig/network-scripts/ifcfg-网卡名`，添加 MAC 地址：
```
MACADDR=MAC 地址
```
然后重启服务 `systemctl restart network`


#### multiport 多端口匹配
- 定义多端口匹配
- 最多指定 15 个端口


#### iprange 连续的 ip 地址范围



#### mac 指明源的目标地址
- 为什么没有目标地址？

#### string 应用层数据做字符串模式匹配检测
- 如筛选敏感词

算法的影响

 bm aparch 可以，ngnix 有问题
 kbm 支持 ngnix 




#### time 根据报文到达的时间匹配
- 报文到达的时间于指定的时间范围进行匹配
- UTC 时区

#### connlimit 根据客户端 ip 做并发连接数量匹配
- 针对特定 IP 并发连接数
- 可防止 Dox 攻击


#### limit 根据收发报文的速率做匹配
- 可控制一段时间内总的连接数

icmp 如果限制 20/minute ，因为默认 ping 是 60/minute, 限制后变为 1/3s，即 3s 才反馈，3s 才刷新一次


#### state 

- NEW
第一次连接

拒绝新用户连接
```
iptables -A INPUT -m state --state NEW -j REJECT
```

- ESTABLISHED
回应的报文不是 NEW？
- RELATED
有些协议会打开其他端口，如 ftp 是 21 端口，但又会打开 20 端口

- INVALID
无效的连接
已经追踪到的并记录在内存中下来的
/proc/net/nf

能记录的最大连接数查看：
 nf_conntrack table full,  以达到连接数最大数目


定时清理记录，

sysctl -p 



lsmod 显示模块
lsmod | grep nf 

- UNTRACKED

#### Target
自定义，如记录日志
记录日志
/var/log/syslog ubutnu
/var/log/message



## 规则管理类选项

### -A 在最后追加规则
- 追加的规则放在最后

### -I [rulenum] 在指定的编号前插入规则
- 不指定编号则默认在最前面插入

### -D 删除规则

### -R 替换规则

### -Z 清空计数

### iptables -F
清空表中的全部规则
- 不指定表则默认表为 filter


## iptables -P 修改默认规则

```bash
Chain INPUT (policy ACCEPT 3141 packets, 19M bytes)
 pkts bytes target     prot opt in     out     source               destination         
 3123   19M LIBVIRT_INP  all  --  *      *       0.0.0.0/0            0.0.0.0/0           

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 LIBVIRT_FWX  all  --  *      *       0.0.0.0/0            0.0.0.0/0           
    0     0 LIBVIRT_FWI  all  --  *      *       0.0.0.0/0            0.0.0.0/0           
    0     0 LIBVIRT_FWO  all  --  *      *       0.0.0.0/0            0.0.0.0/0 
```

- 第一行圆括号中 policy 后面的即为默认规则
- 不在匹配项的均采用默认规则
- 修改后要重启？


## 保存 iptables 规则
- 在命令中用 iptables 命令制定的规则只是临时生效
- 生效期限为 kernel 的存活期限

### 写到文件中设置开机执行
要重定向到文件，还需要设置开机加载
iptables-save > 

iptables -S 

iptables-restore < 规则文件

开机启动执行脚本
开机加载规则文件
/etc/rc.local 

### iptables-services 装软件包


iptables 和 firewalld 都是指定防火墙规则，同时启动会冲突
## 默认规则文件



# 网络防火墙
- iptables 是针对一个主机保护

## NAT 

> NAT 原理看 计算机网络-谢希仁-第7版 4.8.2

NAT 作用
- 安全，保护内网私有 IP 主机？

- 局域网用私有地址，更安全
- ipv4 地址不够

### SNAT
```bash

```

拨号网络 ？ 
动态的公网 IP ?

winvr



### DNAT


### PNAT NAPT 


### REDIRECT
- 本机端口转发



## 查看主机访问公网时的 IP 地址
```bash

```



route -n
ip_forward

iptables -vnL -t nat 

ab 命令

互联网来源端口和被访问主机的端口 可以不一样

常用端口号 80 81 等


ss -ntlp 监听端口，监听应用程序，不能看到 netfilter 内核的监听端口


FORWARD 和 INPUT ?

******************

## 自定义链
- 类似函数

## iptables -N 新增自定义链
```bash
iptables -N cusChain
```

## iptables -E 重命名自定义链
- `--rename-chain old new`

## 删除自定链表




# firewalld
- 和 iptables 类似，同样命令行工具，管理 netfilter
- 和 iptables 冲突，只用一个



## nftables
- netfilter 升级

## n






## kvm
