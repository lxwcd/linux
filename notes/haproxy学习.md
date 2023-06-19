反向代理 Haproxy 学习


Haproxy 比 nginx 做反向代理性能更好

Haproxy VS LVS 
- LVS 只支持 4 层
- Haproxy 支持四层和七层
Haproxy 同 nginx 差不多，分别和两端握手，不像 LVS 直接透过

接入层