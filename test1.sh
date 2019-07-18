#!/bin/bash

echo "----------猜数字游戏----------"
echo "总共3位数，每次猜一位"
echo "每位数有5次机会，猜中即可通过本轮，并获得奖金"
echo "五次没有猜中即失败，将失去所有奖金"
echo "猜中第一次可得1万元奖励，第二轮猜中可获得10万元，第三轮猜中可获得100万元奖金！！！！"

read -p "请按任意键继续" iii

num1=$[$RANDOM%9+1]
num2=$[$RANDOM%10]
num3=$[$RANDOM%10]

##########################################################################
#回合2，是否继续判断死循环
yes(){
	while true
	do
		read -p "请选择是否挑战第二轮(y/n)" aa
		if [ $aa = y ];then
			break
		elif [ $aa = n ];then
 		echo "挑战结束，恭喜你最终获得奖金11万元"
		exit
		else
 		echo "输入有误，请重试2"
                fi
		done
		break
}
##########################################################################
echo $num1,$num2,$num3

#次数计数器
cn=0    
############################################################################
echo "第一回合挑战开始"
while true
do	
	#次数判断
	let cn++
	if [ $cn -eq 5 ];then
		echo "次数用尽，挑战失败！"
		exit
	else
		echo "第{$cn}次挑战开始！"
	fi
	
	read -p "猜猜第1位数" gnum1
	
	if [ $gnum1 -gt $num1 ];then
		echo "大了，请重试"
	elif [ $gnum1 -lt $num1 ];then
		echo "小了，请重试"
	elif [ $gnum1 -eq $num1 ];then
		echo "恭喜猜中第一位数，获得奖金1万元"
		echo "当前奖金数：1万元！"
		while true
		do
			read -p "请选择是否挑战第二轮(y/n)" aa
                        if [ $aa = y ];then
                                 break
                        elif [ $aa = n ];then
                                 echo "挑战结束，恭喜你最终获得奖金1万元"
                                 exit
                        else
                                 echo "输入有误，请重试0000"
                        fi
		done
		break
	else
		echo "输入有误，请重试"
		cn=$[$cn-1]
	fi
done
############################################################################
cn2=0
echo "第二回合挑战开始"
while true
do	
	#次数判断
	let cn2++
	if [ $cn2 -eq 5 ];then
		echo "次数用尽，挑战失败！"
		exit
	else
		echo "第{$cn2}次挑战开始！"
	fi
	
	read -p "猜猜第2位数" gnum1
	
	if [ $gnum1 -gt $num2 ];then
		echo "大了，请重试"
	elif [ $gnum1 -lt $num2 ];then
		echo "小了，请重试"
	elif [ $gnum1 -eq $num2 ];then
		echo "恭喜猜中第2位数，获得奖金10万元"
		echo "当前奖金数：11万元！"

		yes
		#	read -p "请选择是否挑战第二轮(y/n)" bb
		#	if [ $bb=y ];then
		#		break
		#	elif [$bb=n];then	
		#		echo "挑战结束，恭喜你最终获得奖金1万元"
		#		exit
		#	else 
		#		echo "输入有误，请重试"
		#	fi
	else
		echo "输入有误，请重试"
		cn2=$[$cn2-1]
	fi
done
############################################################################
cn3=0
echo "第三回合挑战开始"
while true
do	
	#次数判断
	let cn3++
	if [ $cn3 -eq 5 ];then
		echo "次数用尽，挑战失败！"
		exit
	else
		echo "第{$cn3}次挑战开始！"
	fi
	
	read -p "请猜第3位数" gnum3
	
	if [ $gnum3 -gt $num3 ];then
		echo "大了，请重试"
	elif [ $gnum3 -lt $num3 ];then
		echo "小了，请重试"
	elif [ $gnum3 -eq $num3 ];then
		echo "恭喜猜中第3位数，获得奖金100万元"
		echo "挑战结束，恭喜你最终获得奖金111万元"
		exit
	else
		echo "输入有误，请重试"
		cn3=$[$cn3-1]
	fi
done
