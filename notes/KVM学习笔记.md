KVM 学习笔记


# 虚拟化介绍
- 什么是虚拟化


# 虚拟化用处
- 为什么用虚拟化技术


# 不同对象虚拟化类型



# 虚拟机

# 虚拟机监视器 VMM
- 也叫 Hypervisor
- 运行在物理服务器和操作系统之间的中间层
- 允许多个操作系统共享底层的内存、CPU、磁盘等硬件

## VMM 类型

### 裸金属型
- 裸机虚拟化环境（Bare-Metal Hardware）
- VMM 在硬件上，在 VMM 上安装多个虚拟机（VM）



### 宿主型
- 主机虚拟化环境（Hosted Virtualization）
- 硬件上原本有操作系统，在操作系统上安装 VMM，虚拟机再装在 VMM 上
- 类似 windows 系统中装 VMWare，然后 VMWare 上装虚拟机


# 虚拟化技术实现类型

## 全虚拟化

### 软件辅助的全虚拟化
- 如 VMWare 

### 硬件辅助的全虚拟化 HVM
- 如 KVM


## 半虚拟化
- 运行在 VMM 中的操作系统需要修改内核源码




# KVM
- KVM 已成为 Linux 内核中集成的功能
- KVM 中的每个虚拟机被当作常规的 Linux 进程，由标准的 Linux 调度程序进行调度
- 单机运行，如果需要跨主机统一管理多个虚拟机，需要其他的虚拟化管理平台



## KVM 虚拟化实现
- KVM 内核模块


- QEMU 进程
工作在用户空间，实现模拟 IO 设备，如显卡、网卡、硬盘等
qemu-kvm 进程：用于实现一个虚拟机实例

- libvirt
提供统一的 API，守护进程 libvirtd 和相关工具，如 virsh,virt-manager 等




# 虚拟化管理平台

## OpenStack

