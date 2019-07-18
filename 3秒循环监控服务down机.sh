#!/bin/bash

while true 
do 

netstat -lnpt | grep 80 > /dev/null
if [ $? -eq 1 ] ;then
 echo "nginx服务器dowm掉了`date +%F-%T`" >> /rom.log
fi

netstat -lnpt | grep 9000 > /dev/null
if [ $? -eq 1 ] ; then
 echo "php服务器dowm掉了`date +%F-%T`" >> /rom.log
fi

netstat -lnpt | grep 3309 > /dev/null
if [ $? -eq 1 ] ; then
 echo "mysql服务器dowm掉了`date +%F-%T`" >> /rom.log
fi

sleep 3

done 

