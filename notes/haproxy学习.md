反向代理 Haproxy 学习


Haproxy 比 nginx 做反向代理性能更好

Haproxy VS LVS 
- LVS 只支持 4 层
- Haproxy 支持四层和七层
Haproxy 同 nginx 差不多，分别和两端握手，不像 LVS 直接透过

接入层

cpu 多核
多线程非多进程


nginx 健康检查 懒检查，访问时检查
haproxy 健康检查  主动定期检查，设置区间，不精确
在某个点，否则出现高峰期


proxy 代理配置
Listen 一个前端和一个后端绑定
一个前端对应多个后端：如动静分离


nginx 缓存功能，如果 wget 限速度，后端服务器一次
发送数据到 nginx 缓存

sed -i '/127.0.0.1/s/^/#/' /etc/mysql/my.conf.d/mysqld.conf


mysql 工作在 4 层，利用 tcp/IP 协议

restart 会停止服务，reload 不停止服务时重新加载配置文件

https 

.pem 是 .key and .crt merged ?