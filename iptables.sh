# 服务器重启需要运行改脚本
port=4433
iptables -I INPUT -p tcp --dport ${port} -j ACCEPT
iptables -I INPUT -p udp --dport ${port} -j ACCEPT
iptables -A FORWARD -s 10.10.1.0/21 -j ACCEPT
iptables -t nat -A POSTROUTING -s 10.10.1.0/21 -o ens5 -j MASQUERADE
