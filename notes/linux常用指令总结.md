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

# 
