#!/bin/bash
echo "欢迎使用文件权限判断工具"

read -p "输入一个文件名: " file
echo "当前文件："
ls -ld $file &>/dev/null
if [ $? -eq 0 ];then
	if [ -r $file ]	;then
		echo "可读"
	else 
		echo "不可读"
	fi

	if [ -w $file ]	;then
		echo "可写"
	else
		echo "不可写"
	fi

	if [ -x $file ]	;then
		echo "可执行"
	else
		echo "不可执行"
	fi
else 
	echo "不存在"
fi
