#!/bin/sh

# 复制项目的文件到对应docker路径，便于一键生成镜像。
usage() {
	echo "Usage: sh copy.sh"
	exit 1
}


# copy sql
echo "begin copy sql "
cp ../cxblog-server-cloud/sql/cxblog-cloud.sql ./mysql/db
cp ../cxblog-server-cloud/sql/cxblog-quartz.sql ./mysql/db
cp ../cxblog-server-cloud/sql/cxblog-nacos.sql ./mysql/db
cp ../cxblog-server-cloud/sql/cxblog-seata.sql ./mysql/db
cp ../cxblog-server-cloud/sql/cxblog-file.sql ./mysql/db
cp ../cxblog-server-cloud/sql/cxblog-blog.sql ./mysql/db
cp ../cxblog-server-cloud/sql/cxblog-msg.sql ./mysql/db
cp ../cxblog-server-cloud/sql/cxblog-payment.sql ./mysql/db

# copy html
echo "begin copy html "
cp -r ../cxblog-admin-vue3/admin/** ./nginx/html/admin
cp -r ../cxblog-web-vue3/web/** ./nginx/html/web
#cp -r ../cxblog-uiapp/unpackage/dist/** ./nginx/html/h5
cp -r ../cxblog-doc/doc/** ./nginx/html/doc


# copy jar
echo "begin copy cxblog-gateway "
cp ../cxblog-server-cloud/cxblog-gateway/target/cxblog-gateway.jar ./cxblog/gateway/jar

echo "begin copy cxblog-auth "
cp ../cxblog-server-cloud/cxblog-auth/target/cxblog-auth.jar ./cxblog/auth/jar

echo "begin copy cxblog-visual "
cp ../cxblog-server-cloud/cxblog-visual/cxblog-monitor/target/cxblog-visual-monitor.jar  ./cxblog/visual/monitor/jar

echo "begin copy cxblog-modules-system "
cp ../cxblog-server-cloud/cxblog-modules/cxblog-system/target/cxblog-modules-system.jar ./cxblog/modules/system/jar

echo "begin copy cxblog-modules-file "
cp ../cxblog-server-cloud/cxblog-modules/cxblog-file/target/cxblog-modules-file.jar ./cxblog/modules/file/jar

echo "begin copy cxblog-modules-job "
cp ../cxblog-server-cloud/cxblog-modules/cxblog-job/target/cxblog-modules-job.jar ./cxblog/modules/job/jar

echo "begin copy cxblog-modules-gen "
cp ../cxblog-server-cloud/cxblog-modules/cxblog-gen/target/cxblog-modules-gen.jar ./cxblog/modules/gen/jar

echo "begin copy cxblog-modules-blog "
cp ../cxblog-server-cloud/cxblog-modules/cxblog-blog/target/cxblog-modules-blog.jar ./cxblog/modules/blog/jar

echo "begin copy cxblog-modules-msg "
cp ../cxblog-server-cloud/cxblog-modules/cxblog-msg/target/cxblog-modules-msg.jar ./cxblog/modules/msg/jar

echo "begin copy cxblog-modules-payment "
cp ../cxblog-server-cloud/cxblog-modules/cxblog-payment/target/cxblog-modules-payment.jar ./cxblog/modules/payment/jar

