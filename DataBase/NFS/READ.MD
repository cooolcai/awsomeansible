# 安装步骤
yum -y install nfs-utils rpcbind
编辑配置文件
/export/nfs 10.43.10.0/24(rw,no_root_squash,no_all_squash,sync)
/export/consul_data_10.30 10.43.10.0/24(rw,no_root_squash,no_all_squash,sync)
/export/consul_data_10.65 10.43.10.0/24(rw,no_root_squash,no_all_squash,sync)
/export/domaingateway 10.43.10.0/24(rw,no_root_squash,no_all_squash,sync)

 1009  vim /etc/exports
 1010  mkdir -p /export/consul_data_10.45
 1011  ll /export/consul_data_10.45
 1012  cd /
 1013  ls
 1014  cd export/
 1015  ls
 1016  chmod 777 consul_data_10.45/
 1017  ll
 1018  service rpcbind status
 1019  service nfs status
 1020  service nfs start
 1021  showmount -e localhost
 1022  showmount -e 10.42.40.49

RQUOTAD_PORT=40081
LOCKD_TCPPORT=40082
LOCKD_UDPPORT=40082
MOUNTD_PORT=40083
STATD_PORT=40084  

firewall-cmd --zone=public --add-port=40081/tcp --permanent
firewall-cmd --zone=public --add-port=40082/tcp --permanent
firewall-cmd --zone=public --add-port=40083/tcp --permanent
firewall-cmd --zone=public --add-port=40084/tcp --permanent
firewall-cmd --zone=public --add-port=2049/tcp --permanent
firewall-cmd --zone=public --add-port=111/tcp --permanent
firewall-cmd --zone=public --add-port=40081/udp --permanent
firewall-cmd --zone=public --add-port=40082/udp --permanent
firewall-cmd --zone=public --add-port=40083/udp --permanent
firewall-cmd --zone=public --add-port=40084/udp --permanent
firewall-cmd --zone=public --add-port=2049/udp --permanent
firewall-cmd --zone=public --add-port=111/udp --permanent

服务端需要固定端口
客户端需要安装同一个软件，但是不要求服务必须启动。