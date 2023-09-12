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