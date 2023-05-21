> [5. LVS-NAT](https://docs.huihoo.com/hpc-cluster/linux-virtual-server/HOWTO/LVS-HOWTO.LVS-NAT.html)

> [The Linux Enterprise Cluster: Build a Highly Available Cluster with Commodity Hardware and Free Software](https://books.google.co.jp/books?id=wiCGoCq8n4oC&pg=PA196&lpg=PA196&dq=LVS-NAT&source=bl&ots=NsZuExpQ3q&sig=ACfU3U2oy5ADOp1o8KTUTiiXlELmxqlfSQ&hl=zh-CN&sa=X&ved=2ahUKEwjo-cbF1vj-AhW6gVYBHd-uDgMQ6AF6BAgYEAM#v=onepage&q=LVS-NAT&f=false)



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