开源负载均衡器 Linux Virtual Server


# 资源
> 维基百科介绍：[Linux Virtual Server](https://en.wikipedia.org/wiki/Linux_Virtual_Server)
> 红帽介绍文档：[Virtual Server Administration](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/4/html/virtual_server_administration/index)

> [5. LVS-NAT](https://docs.huihoo.com/hpc-cluster/linux-virtual-server/HOWTO/LVS-HOWTO.LVS-NAT.html)
> [The Linux Enterprise Cluster: Build a Highly Available Cluster with Commodity Hardware and Free Software](https://books.google.co.jp/books?id=wiCGoCq8n4oC&pg=PA196&lpg=PA196&dq=LVS-NAT&source=bl&ots=NsZuExpQ3q&sig=ACfU3U2oy5ADOp1o8KTUTiiXlELmxqlfSQ&hl=zh-CN&sa=X&ved=2ahUKEwjo-cbF1vj-AhW6gVYBHd-uDgMQ6AF6BAgYEAM#v=onepage&q=LVS-NAT&f=false)


# 提升性能的两种方式 —— Scaling UP and Scaling out
> [Growing compute by scaling up and scaling out](https://developer.ibm.com/articles/scale-up-and-scale-out-vms-vs-containers/)



- Scaling up 
垂直扩展，即提升机器的性能
例如普通的马换成汗血宝马

- Scaling out
水平扩展，即增加机器的数量
如原来一匹马变为一群马



两种方式看具体场景选择

# 分布式系统
> [Distributed computing](https://en.wikipedia.org/wiki/Distributed_computing) 

分布式系统是由多个相互协作的计算机组成的计算机系统，这些计算机通过网络或其他通信媒介互相连接和通信，
以协调它们的行为来提供一个统一的服务或执行一个共同的任务。

分布式系统可以分为以下几类：

1. 客户端-服务器系统：客户端发送请求，服务器响应请求并提供服务，常见的应用包括Web应用、数据库系统等。
2. 对等式系统：对等式系统由多个节点组成，每个节点都可以提供服务并请求其他节点提供服务，常见的应用包括文件共享、P2P 网络等。
3. 事件驱动系统：事件驱动系统由多个组件组成，每个组件都有自己的状态和事件，通过事件的触发和处理来实现系统的功能，常见的应用包括传感器网络、电力系统等。
4. 分布式计算系统：分布式计算系统是一种将大规模的计算任务分解为小的计算子任务并分配到多个计算节点上进行计算的系统，常见的应用包括科学计算、数据分析等。

分布式系统的优点包括可扩展性、可靠性和容错性等。
但是，分布式系统在设计、实现和管理方面存在一些挑战，例如，一致性、并发性、性能和安全等问题，需要采用适当的技术和策略来解决。


# 集群 Cluster
> [Computer cluster](https://en.wikipedia.org/wiki/Computer_cluster)
> [An Overview of Cluster Computing](https://www.geeksforgeeks.org/an-overview-of-cluster-computing/)


- 多个计算机组合起来形成单个系统
- 集群中的每个节点（node）执行相同的任务，由软件控制和调度
- 集群中的各节点通常在一个局域网（fast LANs）中
- 通常集群中的各节点有相同的硬件和操作系统（不是一定的）

## 集群的作用
> [Benefits](https://en.wikipedia.org/wiki/Computer_cluster#Benefits)


> In terms of scalability, clusters provide this in their ability to add nodes horizontally. This means that more computers may be added to the cluster, to improve its performance, redundancy and fault tolerance. 

- 水平扩展改善性能
- 冗余（redundancy） 
- 容错（fault tolerance）


### 冗余（redundancy）和容错（tolerance）
- 来自 ChatGPT v3.5 回答

Redundancy and fault tolerance both refer to the ability of a system to continue operating normally even in the face of failures or faults. 

However, they are not the same thing.  

Redundancy refers to the use of extra or backup resources or components that provide redundancy in case of failures or downtime. 
For example, adding extra hard drives to a server as a RAID configuration or using multiple power supplies.
Redundancy aims to prevent failure or downtime by ensuring that there are backup resources available in case of a failure.

Fault tolerance, on the other hand, refers to a system's ability to continue operating normally in the event of a failure or fault in one or more components, without any disruption to the normal operation of the system. Fault tolerance typically involves designing a system with redundancy, load balancing, and failover mechanisms so that if one component fails or becomes unavailable, the system can continue to operate with no noticeable impact on users or applications.

In summary, redundancy is the provision of extra or backup resources to prevent failure or downtime, while fault tolerance is the ability of a system to continue operating normally even in the presence of component failures or faults. Redundancy is a technology or approach used to achieve fault tolerance, but it is not the same thing as fault tolerance itself.


- 冗余在于提供一些备份资源，可以在一个资源出问题时替代
- 容错则是在出问题后能在不影响正常操作时恢复正常，
一个有容错能力的系统通常会做 redundancy，load balancing 和 failover machanisms
- 冗余是实现容错的一种方法，但不是容错


## 集群的类型
> [An Overview of Cluster Computing](https://www.geeksforgeeks.org/an-overview-of-cluster-computing/)


- High performance (HP) clusters

> HP clusters use computer clusters and supercomputers to solve advance computational problems.
> They are designed to take benefit of the parallel processing power of several nodes.

通常用于解决高计算能力需求的场景，并行处理需求


-  Load-balancing clusters

> This type of distribution is generally used in a web-hosting environment.

避免单个节点接受大量的任务，通常用于 web 服务，可以分担任务


- High Availability (HA) Clusters

高可用集群，避免单点失败（single point of failure）
增加冗余节点来避免失败


# SLA (Service level agreement)

- 服务等级协议
- 服务提供商和用户间定义的一种双方认可的协议，来约定服务的可用性
- 例如定义服务保持多久在线


计划外停机时间是指系统或服务在未经预先安排的维护期之外无法提供服务的时间。
以下是常见的三个SLA可用性级别以及对应的计划外停机时间：

1. 90%的可用性：计划外停机时间为36.5天（即，365天中有36.5天无法提供服务）。
2. 99%的可用性：计划外停机时间为3.65天（即，365天中有3.65天无法提供服务）。
3. 99.9%的可用性：计划外停机时间为8.76小时（即，365天中有8.76小时无法提供服务）。

计算公式：Total downtime = (100% - Availability%) x Total time in the period
例如：90 = (1-90%)*365 = 36.5

注意，这三个级别仅供参考，实际的SLA级别和计划外停机时间将取决于具体的服务类型、应用场景和客户需求等因素。


# LB Cluster 负载均衡集群

## 按实现方式分类

### 硬件
> [F5 Big-IP](https://community.f5.com/t5/technical-articles/what-is-big-ip/ta-p/279398)

- F5 Big-IP

### 软件
- lvs
- [SLB](https://developer.aliyun.com/article/1803)
- nginx
- haproxy
- ats
- perlbal
  
## 按工作的协议层次划分

### 传输层（运输层）
LB Cluster是一种基于协议层次划分的负载均衡集群，可以分为传输层和应用层的负载均衡集群。

传输层负载均衡主要是基于传输层协议（如TCP、UDP等）实现负载均衡，通过端口和IP地址等信息将请求分发到不同的负载均衡节点。
传输层负载均衡集群可以实现基本的负载均衡功能，如可靠性、容错性、服务质量等，但对于应用层的负载均衡功能支持相对较弱，对于某些特定的应用场景可能无法满足需求。

应用层负载均衡主要是基于应用层协议（如HTTP、SMTP等）实现负载均衡，通过解析HTTP请求头、URL、Cookie等信息将请求分发到不同的负载均衡节点。
应用层负载均衡集群可以实现更加细粒度的负载均衡和应用层面的优化，如会话保持、内容缓存、动态路由、应用防火墙等高级功能，可以满足各种复杂的应用场景。

LB Cluster可以根据实际业务需求和技术特点选择不同的负载均衡方案，如基于传输层负载均衡的LB Cluster适用于简单的网络服务，如DNS、SMTP、FTP等服务；基于应用层负载均衡的LB Cluster适用于Web应用、API服务、微服务等具有复杂业务逻辑和交互模式的应用场景。


常见的基于传输层的负载均衡集群包括：

1. LVS（Linux Virtual Server）：基于Linux内核实现的负载均衡软件，支持四层（IP/TCP/UDP）负载均衡及基于IP隧道的三层负载均衡。

2. F5 BIG-IP：商业负载均衡硬件设备和软件，支持四层和七层负载均衡，具有高可用性、高性能、可扩展性和灵活性等优势。

3. Citrix ADC：商业负载均衡硬件设备和软件，支持四层和七层负载均衡，具有高可用性、灵活性、安全性和性能优势。

### 应用层

1. Nginx：开源Web服务器和反向代理软件，支持HTTP、HTTPS、SMTP、POP3等协议的七层负载均衡和反向代理，具有高性能、高可靠性和高可扩展性等优势。

2. Apache HTTP Server：开源Web服务器软件，支持HTTP、HTTPS和FTP等协议的七层负载均衡和反向代理，具有灵活性和可扩展性等优势。

3. HAProxy：开源的七层负载均衡软件，支持HTTP、HTTPS、TCP和UDP等协议的负载均衡和反向代理，具有高性能、高可靠性和灵活性等优势。


# 负载均衡的会话保持

## session sticky
同一用户调度固定的服务器

- 基于Cookie
将用户的会话ID存储到Cookie中，并设置Cookie的过期时间，使得客户端下次请求时会带上该Cookie，
以便后端服务器获取会话ID，从而保持会话状态。

- 基于IP地址
将用户的IP地址作为会话ID存储到共享存储中，例如Redis、Memcached等，当后续请求到来时，
负载均衡器通过IP地址识别出用户，并将请求转发到之前处理该用户请求的服务器上。

- 基于URL重写
将用户的会话ID作为URL的一部分，例如在URL后添加一些参数，或者在URL中添加特殊标记，
使得请求携带会话信息，并将会话ID传递给后端服务器，以保持会话状态。

需要注意的是，会话保持会对负载均衡集群带来额外的负担和风险，
如会话信息泄露、性能损耗、单点故障等，因此应根据具体应用场景和业务需求确定是否需要会话保持，并选择合适的实现方式。

## session replication
每台服务器都有全部的 session

- session multicast cluster

## session server
用专门的 session 服务器

将会话信息存储在中心化服务器上的技术，具备较好的可扩展性和高可用性。
在Session Server方案中，所有后端服务器都从共享的Session服务器上获取会话信息，
并将处理结果写回到Session服务器上，这样就能保证多个后端服务器之间的会话信息同步和访问一致性。







# LVS-NAT
> [Virtual Server via NAT](http://www.linuxvirtualserver.org/VS-NAT.html)


2. router
eth0 host-only
eth1 host-only
```bash
root@router netplan $ ls
eth0.yaml  eth1.yaml
root@router netplan $ ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 00:0c:29:e7:c8:8e brd ff:ff:ff:ff:ff:ff
    altname enp2s1
    altname ens33
    inet 192.168.10.2/24 brd 192.168.10.255 scope global noprefixroute eth0
       valid_lft forever preferred_lft forever
    inet6 fe80::20c:29ff:fee7:c88e/64 scope link
       valid_lft forever preferred_lft forever
3: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 00:0c:29:e7:c8:98 brd ff:ff:ff:ff:ff:ff
    altname enp2s5
    altname ens37
    inet 172.16.18.2/24 brd 172.16.18.255 scope global noprefixroute eth1
       valid_lft forever preferred_lft forever
    inet6 fe80::20c:29ff:fee7:c898/64 scope link
       valid_lft forever preferred_lft forever

```
```bash
# This is the network config written by 'subiquity'
network:
  version: 2
  renderer: NetworkManager
  ethernets:
    eth0:
      dhcp4: false
      addresses:
      - 192.168.10.2/24
```
```bash
# This is the network config written by 'subiquity'
network:
  version: 2
  renderer: NetworkManager
  ethernets:
    eth1:
      dhcp4: false
      addresses:
      - 172.16.18.2/24

```
3. LVS
eth0 NAT
eth1 host-only
```bash
[root@lvs netplan]$ ls
bak  eth0.yaml  eth1.yaml
[root@lvs netplan]$ ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 00:0c:29:1d:76:d4 brd ff:ff:ff:ff:ff:ff
    altname enp2s1
    altname ens33
    inet 10.0.0.202/24 brd 10.0.0.255 scope global noprefixroute eth0
       valid_lft forever preferred_lft forever
    inet6 fe80::20c:29ff:fe1d:76d4/64 scope link
       valid_lft forever preferred_lft forever
3: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 00:0c:29:1d:76:de brd ff:ff:ff:ff:ff:ff
    altname enp2s5
    altname ens37
    inet 172.16.18.4/24 brd 172.16.18.255 scope global noprefixroute eth1
       valid_lft forever preferred_lft forever
    inet6 fe80::20c:29ff:fe1d:76de/64 scope link
       valid_lft forever preferred_lft forever
```

```bash
  # This file describes the network interfaces available on your system
  1 # For more information, see netplan(5).
  2 network:
  3   version: 2
  4  #renderer: networkd
  5   renderer: NetworkManager
  6   ethernets:
  7     eth0:
  8       match:
  9         name: eth0
 10       addresses:
 11       - 10.0.0.202/24
 12      #gateway4: 10.0.0.2
 13       routes:
 14       - to: default
 15         via: 10.0.0.2
 16       nameservers:
 17         addresses: [10.0.0.2]

```
```bash
 # This file describes the network interfaces available on your system
  1 # For more information, see netplan(5).
  2 network:
  3   version: 2
  4  #renderer: networkd
  5   renderer: NetworkManager
  6   ethernets:
  7     eth1:
  8       addresses:
  9       - 172.16.18.4/24
 10       routes:
 11       - to: 192.168.10.0/24
 12         via: 172.16.18.2
 13

```

```bash
[root@lvs netplan]$ route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
0.0.0.0         10.0.0.2        0.0.0.0         UG    100    0        0 eth0
10.0.0.0        0.0.0.0         255.255.255.0   U     100    0        0 eth0
172.16.18.0     0.0.0.0         255.255.255.0   U     101    0        0 eth1
192.168.10.0    172.16.18.2     255.255.255.0   UG    101    0        0 eth1
[root@lvs netplan]$

```

# LVS_DR
> [7. LVS-DR](https://docs.huihoo.com/hpc-cluster/linux-virtual-server/HOWTO/LVS-HOWTO.LVS-DR.html)