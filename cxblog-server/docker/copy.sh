#!/bin/sh

# 复制项目的文件到对应docker路径，便于一键生成镜像。
usage() {
	echo "Usage: sh copy.sh"
	exit 1
}


# copy sql
echo "begin copy sql "
cp ../sql/cxblog-cloud.sql ./mysql/db
cp ../sql/cxblog-nacos.sql ./mysql/db

# copy html
echo "begin copy html "
cp -r ../cxblog-ui/dist/** ./nginx/html/dist


# copy jar
echo "begin copy cxblog-gateway "
cp ../cxblog-gateway/target/cxblog-gateway.jar ./cxblog/gateway/jar

echo "begin copy cxblog-auth "
cp ../cxblog-auth/target/cxblog-auth.jar ./cxblog/auth/jar

echo "begin copy cxblog-visual "
cp ../cxblog-visual/cxblog-monitor/target/cxblog-visual-monitor.jar  ./cxblog/visual/monitor/jar

echo "begin copy cxblog-modules-system "
cp ../cxblog-modules/cxblog-system/target/cxblog-modules-system.jar ./cxblog/modules/system/jar

echo "begin copy cxblog-modules-file "
cp ../cxblog-modules/cxblog-file/target/cxblog-modules-file.jar ./cxblog/modules/file/jar

echo "begin copy cxblog-modules-job "
cp ../cxblog-modules/cxblog-job/target/cxblog-modules-job.jar ./cxblog/modules/job/jar

echo "begin copy cxblog-modules-gen "
cp ../cxblog-modules/cxblog-gen/target/cxblog-modules-gen.jar ./cxblog/modules/gen/jar

