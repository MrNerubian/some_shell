#!/bin/bash

echo "--------------------------------"
echo "欢迎使用死链接查找工具"
read -p "请输入目录路径：" path
echo "--------------------------------"
if [ -d $path ];then 

	for file in $(find $path -type l)
	do
		test -e $file;

		if [ $? = 0 ];then
			continue
		else			
			echo $file
			ls $file &> /dev/null
		fi
	done
else 
	echo "路径不存在，程序结束"	
	echo "--------------------------------"
	exit
fi
echo "--------------------------------"
echo "程序执行完毕"
