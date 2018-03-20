#!/bin/bash

PackServer()
{
	echo "start packing the server"

	SERVERLIST=("MasterServer" "DBServer" "MailServer" "SessionServer" "GameServer" "GateServer" "PlatformServer" "PolicyServer")
	SERVER=("gsmaster" "gsdb" "gsmail" "gssession" "gsgame" "gsgate" "gsplatform" "gspolicy")
	
	echo "cp xml"
	cp ../$SERVER_NAME/*xml ./$PACK_SERVER_NAME
	cp ../$SERVER_NAME/RunServer.sh ./$PACK_SERVER_NAME

	echo "cp Server"
	i=${#SERVERLIST[@]}
	while ((i > 0)) 
		do
			let i=i-1
			echo ${SERVERLIST[i]}
			if [ ! -d "${SERVER[i]}" ];then
				mkdir "$PACK_SERVER_NAME/${SERVER[i]}" 
			fi  
			cp ../$SERVER_NAME/${SERVER[i]}/${SERVERLIST[i]} ./$PACK_SERVER_NAME/${SERVER[i]}/
		done

	echo "cp map"
	rsync -r --delete --exclude=".svn" ../$SERVER_NAME/$MAPNAME ./$PACK_SERVER_NAME
	mv ./$PACK_SERVER_NAME/$MAPNAME ./$PACK_SERVER_NAME/map
	
	echo "cp sql"
	rsync -r --delete --exclude=".svn" ../$SERVER_NAME/gssql ./$PACK_SERVER_NAME

	cp -rf ../$SERVER_NAME/monitor.sh ./$PACK_SERVER_NAME

	mkdir ./$PACK_SERVER_NAME/log

	tar czvf $PACK_SERVER_NAME.tar ./$PACK_SERVER_NAME
	rm -rf $PACK_SERVER_NAME
}

PackMysql()
{
	echo "start packing the mysql"

	SERVERLIST=("MasterServer" "MysqlServer" "PlatformServer" "CountServer" "SocialServer" "RankServer")
	SERVER=("gsmaster" "gsmysql" "gsplatform" "gscount" "gssocial" "gsrank")
	
	echo "cp xml"
	cp ../$SERVER_NAME/*xml ./$PACK_MYSQL_NAME
	cp ../$SERVER_NAME/RunServerMysql.sh ./$PACK_MYSQL_NAME

	echo "cp Server"
	i=${#SERVERLIST[@]}
	while ((i > 0)) 
		do
			let i=i-1
			echo ${SERVERLIST[i]}
			if [ ! -d "${SERVER[i]}" ];then
				mkdir "$PACK_MYSQL_NAME/${SERVER[i]}" 
			fi  
			cp ../$SERVER_NAME/${SERVER[i]}/${SERVERLIST[i]} ./$PACK_MYSQL_NAME/${SERVER[i]}/
		done

	echo "cp map"
	rsync -r --delete --exclude=".svn" ../$SERVER_NAME/$MAPNAME ./$PACK_MYSQL_NAME
	mv ./$PACK_MYSQL_NAME/$MAPNAME ./$PACK_MYSQL_NAME/map
	
	echo "cp sql"
	rsync -r --delete --exclude=".svn" ../$SERVER_NAME/gssql ./$PACK_MYSQL_NAME

	cp -rf ../$SERVER_NAME/monitormysql.sh ./$PACK_MYSQL_NAME

	mkdir ./$PACK_MYSQL_NAME/log

	tar czvf $PACK_MYSQL_NAME.tar ./$PACK_MYSQL_NAME
	rm -rf $PACK_MYSQL_NAME
}

SendFile()
{
	echo "start send $PACK_SERVER_NAME.tar"
	
	if [ $NET_PORT = 0 ];then
		scp $PACK_SERVER_NAME.tar root@$NET_IP:/data/back
	else
		scp -P $NET_PORT $PACK_SERVER_NAME.tar root@$NET_IP:/data/back
	fi	

	
	echo "start send $PACK_MYSQL_NAME.tar"
	
	if [ $NET_PORT = 0 ];then
		scp $PACK_MYSQL_NAME.tar root@$NET_IP:/data/back
	else
		scp -P $NET_PORT $PACK_MYSQL_NAME.tar root@$NET_IP:/data/back
	fi
	
	rm -rf $PACK_SERVER_NAME.tar
	rm -rf $PACK_MYSQL_NAME.tar

}

case $1 in
    "")
	echo "input file name!"
    ;;
    *)
	
	if [ ! -d ../$1 ]; then
		echo "$1 is null"
		exit
	fi

	#需要手动修改的文件
	NET_IP=0
	NET_PORT=0
	case $1 in
		"buluo")
		if [ "$2" == "ios" ]; then
			NET_IP=123.207.181.151
		elif [ "$2" == "android" ]; then
			NET_IP=115.159.45.223
		elif [ "$2" == "demo" ]; then
			NET_IP=123.206.203.152
		elif [ "$2" == "test" ]; then
			NET_IP=120.92.116.90
			NET_PORT=8673
		fi  
		;;  
		*) 
			echo "param 2 is not exist"
		;;  
	esac

	if [ $NET_IP == 0 ]; then
		echo "ip error"
		exit
	fi
	
	#密码需要手动输入
	#!XZPzuak9E5bQEND
	
	#######################################
	MAPNAME=map$1
	SERVER_NAME=$1
	PACK_SERVER_NAME=temp_server_$1
	PACK_MYSQL_NAME=temp_mysql_$1

	mkdir $PACK_SERVER_NAME
	PackServer
	
	mkdir $PACK_MYSQL_NAME
	PackMysql
	
	SendFile

	#启动服务器	
	if [ $NET_PORT == 0 ];then
		ssh root@$NET_IP "sh /data/back/bServer.sh $SERVER_NAME"
	else
		ssh -p $NET_PORT root@$NET_IP "sh /data/back/bServer.sh $SERVER_NAME"
	fi
	
    ;;
esac
