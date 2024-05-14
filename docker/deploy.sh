#!/bin/sh

# 使用说明，用来提示输入参数
usage() {
	echo "Usage: sh 执行脚本.sh [port|base|modules|stop|rm]"
	exit 1
}

# 开启所需端口
port(){
	firewall-cmd --add-port=8110/tcp --permanent
	firewall-cmd --add-port=8120/tcp --permanent
	firewall-cmd --add-port=8130/tcp --permanent
	firewall-cmd --add-port=8140/tcp --permanent

	firewall-cmd --add-port=8100/tcp --permanent
	firewall-cmd --add-port=8848/tcp --permanent
	firewall-cmd --add-port=9848/tcp --permanent
	firewall-cmd --add-port=9849/tcp --permanent
	firewall-cmd --add-port=6379/tcp --permanent
	firewall-cmd --add-port=3306/tcp --permanent
	firewall-cmd --add-port=8104/tcp --permanent
	firewall-cmd --add-port=8105/tcp --permanent
	firewall-cmd --add-port=8101/tcp --permanent
	firewall-cmd --add-port=8102/tcp --permanent
	firewall-cmd --add-port=8103/tcp --permanent
	firewall-cmd --add-port=8106/tcp --permanent
	firewall-cmd --add-port=8107/tcp --permanent
  firewall-cmd --add-port=8108/tcp --permanent
  firewall-cmd --add-port=8109/tcp --permanent
	service firewalld restart
}

# 启动基础环境（必须）
base(){
	docker-compose up -d cxblog-mysql cxblog-redis cxblog-nacos
}

# 启动程序模块（必须）
modules(){
	docker-compose up -d cxblog-nginx cxblog-gateway cxblog-auth cxblog-modules-gen cxblog-modules-job cxblog-modules-monitor cxblog-modules-file cxblog-modules-blog cxblog-modules-msg cxblog-modules-payment
}

# 关闭所有环境/模块
stop(){
	docker-compose stop
}

# 删除所有环境/模块
rm(){
	docker-compose rm
}

# 根据输入参数，选择执行对应方法，不输入则执行使用说明
case "$1" in
"port")
	port
;;
"base")
	base
;;
"modules")
	modules
;;
"stop")
	stop
;;
"rm")
	rm
;;
*)
	usage
;;
esac
