#!/bin/bash
#内网自动时间同步程序

#参数定义区
win=0
echo '-————————————————————————————-'
echo '| 欢迎使用局域网时间同步工具 |'
echo '-————————————————————————————-'
echo "输入时间同步服务器IP地址"
read -p ":" ip
echo "输入同步间隔时间（天>d 小时>h 分钟>m 秒>s）"
read -p ":" time
echo "输入成功日志发送间隔次数"
read -p ":" nu

#网络判断区
echo "开始检查网络,请等待片刻"
ping -c 3 $ip &> /dev/null ;sleep 3s
if [ $? -ne 0 ];then
	echo "网络不通，请检查网络。"
	exit
else
	echo "网络通畅，进行下一步。"
fi

#同步循环区
echo '时间同步程序工作中> > > > >'
echo '工作状态请查看/var/log/message文件'
echo '结束程序请使用 ctrl+C '
while true
do
	rdate $ip &>/dev/null
	if [ $? -ne 0 ];then 
		logger "时间同步失败"
		sleep $time
	else
		if [ $win -eq $nu ];then
			logger "时间同步成功" 
			win=0
		fi
		
		sleep $time
		let win++

	fi
done
echo "时间同步程序已结束"
