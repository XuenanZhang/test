#!/bin/sh

if [ "$1" = "" ]; then
    echo "param is null"
	return 
fi

echo "Start build server....."

SERVER_NAME=$1
MYSQL_NAME=mysql

PACK_SERVER_NAME=temp_server_$SERVER_NAME
PACK_MYSQL_NAME=temp_mysql_$SERVER_NAME

if [ ! -f /data/back/$PACK_SERVER_NAME.tar ] || [ ! -f /data/back/$PACK_MYSQL_NAME.tar ]; then
    echo "file is not exist"
    return
fi

#--> 解压
echo "uncompress ..."
cd /data/back
tar -xf $PACK_SERVER_NAME.tar
tar -xf $PACK_MYSQL_NAME.tar
rm -f $PACK_SERVER_NAME.tar $PACK_MYSQL_NAME.tar

#--> 配置文件
echo "config file..."
\cp -f /data/config/$SERVER_NAME/$SERVER_NAME/* $PACK_SERVER_NAME/
\mv -f $PACK_SERVER_NAME/ServerList.xml $PACK_SERVER_NAME/map/
\cp -f /data/config/$SERVER_NAME/$MYSQL_NAME/* $PACK_MYSQL_NAME/
\mv -f $PACK_MYSQL_NAME/ServerList.xml $PACK_MYSQL_NAME/map/
if [ -f $PACK_MYSQL_NAME/phpInfo.xml ]; then
	\mv -f $PACK_MYSQL_NAME/phpInfo.xml $PACK_MYSQL_NAME/map/
fi

chown -R server.server $PACK_SERVER_NAME/
chown -R server.server $PACK_MYSQL_NAME/

chmod -R +x $PACK_SERVER_NAME/
chmod -R +x $PACK_MYSQL_NAME/

if [ ! -d /data/server/$SERVER_NAME ]; then
	mkdir /data/server/$SERVER_NAME
fi

mv $PACK_SERVER_NAME /data/server/$SERVER_NAME/
mv $PACK_MYSQL_NAME /data/server/$SERVER_NAME/

cd /data/server/$SERVER_NAME
if [ -d /data/server/$SERVER_NAME/$SERVER_NAME ]; then
	#--> 关服
	echo "stop server ..."
	cd $SERVER_NAME
	su server -s RunServer.sh stop
	cd ../$MYSQL_NAME
	su server -s RunServerMysql.sh stop
	cd ..
	rm -rf $SERVER_NAME $MYSQL_NAME
fi


#--> 开服
echo "start server ..."
mv $PACK_MYSQL_NAME $MYSQL_NAME
cd $MYSQL_NAME
su server -s RunServerMysql.sh start
cd ..
mv $PACK_SERVER_NAME $SERVER_NAME
cd $SERVER_NAME
su server -s RunServer.sh start

echo "" 
echo "" 
echo  "                       Open the server successfully !!

  
                                  _oo8oo_
                                 o8888888o
                                 88\" . \"88
                                 (| -_- |)
                                 0\  =  /0
                               ___/'==='\___
                             .' \\\\|     |// '.
                            / \\\\|||  :  |||// \ 
                           / _||||| -:- |||||_ \ 
                          |   | \\\\\\  -  /// |   |
                          | \_|  ''\---/''  |_/ |
                          \  .-\__  '-'  __/-.  /
                        ___'. .'  /--.--\  '. .'___
                     .\"\" '<  '.___\_<|>_/___.'  >' \"\".
                    | | :  '- \'.:'\ _ /':.'/ -'  : | |
                    \  \ '-.   \_ __\ /__ _/   .-' /  /
                ====='-.____'.___ \_____/ ___.'____.-'=====
                                  '=---='
  
  
               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
                          佛祖保佑         永不宕机/永无bug

"




