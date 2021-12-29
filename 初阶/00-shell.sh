#!/bin/zsh
7.条件判断 [   ]
格式：空格隔开
适用范围：系统变量，位置变量各种变量、常量、字符串是否相等、数值等
7.1字符串判断（逻辑判断）
&& 且 前面任务成功，才执行后续任务
|| 或 前面任务失败，才执行后续任务
;       前面任务有没有由执行完，都执行后面的任务。
==  等于
!=    不等于
--------------------------
ls && ls
ls || ls
ls ; ls
[ abc == abc ]     //常量对比，echo $?得到结果为0
[ abc == xyz ]     //常量对比，echo $?得到结果为非0
[ %USER == root ]  //使用环境变量与常量对比
[ $USER == root ]
[ $USER != root ]
[ $USER == root ] && echo 123 ---如果当前用户等于root时，输出 123
[ $USER != root ]  && echo 123 ---如果当前用户不等于root时，输出 123
[ $USER != root ]  || echo 123 ---如果当前用户不等于root时，输出123
[ $USER == root ] || echo 123 ---如果当前用户等于root时，不输出123

7.2多个逻辑判断(背下来)，存在为真0，不存在为假1。都可加! 如 !-e  !-f
涉及符号：
字符串对比（!-z  -z -e -a -f  -r -w -x  -a -o !   ）
纯数字对比(-eq等于 -ne不等于 -gt大于 -ge大于等于 -lt小于  -le小于等于 )
-a  与(两真为真)且
-o  或(一真为真)
!     非
-r  可读
-w 可写
-x  可执行
-z 是否为空,类别为字符串、变量
-e 是否存在,不分文件类别(文件目录都行)
-f  是否存在，类别为文件
-d 是否存在，类别为目录
-n 判断字符串str是否为空，字符串长度大于0则表达式为真，否则为假。这时候就要加引号。[ a -n "&a" ]
----------------
a=10
[ -z $a ]
echo $?  --?
[ ! -z $a ]
echo $?  --?
[ -e $a ]
echo $?  --?
[ abc == abc ]  && echo 123 && echo 456
123
456
[ 0123 == 123 ];echo $?
[ 0123 -eq 123 ];echo $?
x=20
[ $x -ge 10 ] && echo "大于或等于" || echo “否”    --如果变量x大于或等于20则输出 大于或等于 否则 输出 否
[ "$x" -ge "10" ] && echo "大于或等于" || echo “否”    --如果变量x大于或等于20则输出 大于或等于 否则 输出 否  --最好加上双引号
作业：
编写脚本，每2分钟检查系统登录的用户数量，如果大于3，则向管理员报警。
#!/bin/bash
a=`who |wc -l`
[ "$a" -gt 3 ] && echo "登录用户超过3，请检查系统用户"|mail -s test root || exit

-------------------------------------------------------------------
8.if判断
回顾
"" '' ``
== != ! -z -f -e -d -n(测试时，变量需加引号)  -r -w -x
-eq -ne -gt -ge -lt -let
&& || ;
----------------------
很多逻辑判断时，这样写也可以但是很长，最好别超过三个。以下有三个。
[ -f /opt/abc ] && echo "存在且是普通文件" || echo ”文件不存在或不是普通文件“

所以我们用到了if 选择结构，条件测试=表达式
if 单分支---语法结构
if 条件测试 ;then
    命令序列1
fi(结尾)
例子：
#!/bin/bash
read -p "请输入用户名" u
if [ -z "$u" ];then
    echo “必须输入用户名”
    exit
fi
useradd $u

if 双分支---语法结构
if 条件测试 ;then
    命令序列1
else
    命令序列2
fi
例子：
#!/bin/bash
#ping主机测试,结果，只要结果通还是不通？用echo $? 判断 -c ping次数 -i ping每次ping的时间，可使用位置变量结合
a=`ping -c 10 -i 0.2  www.baidu.com &> /dev/null`
if [  $? -eq 0 ];then
    echo "通了"
else
     echo "ping 不通"
fi

if 多分支---语法结构(三个以上)
if 条件测试 ;then
    命令序列1
elif 条件测试;then
    命令序列2
elif 条件测试;then
    命令序列3
else
    命令序列XXX.....
fi
例子：
#!/bin/bash
#猜大小。当前这个只是一次性的，因只是一个判断没有重新定义变量，如果要重新定义变量要用到for,while循环
a=`echo $[RANDOM%11]`
echo $a
read -p "请输入大小：" u
if [ "$u" -gt "$a" ];then
     echo "猜大了！请重新输入"
     exit
elif [ "$u" -lt "$a" ];then
     echo   "猜小了！请重新输入"
     exit
else
     echo "恭喜你！猜对了！"
fi
#!/bin/bash
time=`date +%Y%m%d`
if [ -f "$time"peizhi.tar.gz -a -f "$time"peizhi2.tar.gz -a -f "$time"peizhi3.tar.gz -a -f "$time"peizhi4.tar.gz ]; then
        echo 12345
elif [ -f "$time"peizhi.tar.gz -a -f "$time"peizhi2.tar.gz -a -f "$time"peizhi3.tar.gz ]; then
        echo 1234
elif [ -f "$time"peizhi.tar.gz -a -f "$time"peizhi2.tar.gz ]; then
        echo 123
elif [ -f "$time"peizhi.tar.gz ]; then
        echo 12
elif [ ! -f "$time"peizhi.tar.gz ]; then


9.for循环
#对一个要反复循环的工作，执行诺干次。
#for循环结构，，a=10 值列表支持 常量a {1..10}  `seq $a`
for 变量名 in 值列表
do
     命令序列
done
例子：
#!/bin/bash
#循环两次 i=a, i=b  #echo $i   a b
for i in a b
do
    echo 123
	#echo $i  输出a
	#                      b
done
#!/bin/bash
#循环十次，echo {1..10}
#1 2 3 4 5 6 7 8 9 10
for i in {1..10}
do
    echo 123  --输出 10个123
	#echo $i   输出{1..10}
done

#!/bin/bash
#猜大小。当前使用了while循环结构。猜了几次？
a=`echo $[RANDOM%11]`
echo $a
while :
do
read -p "请输入大小：" u
if [ "$u" -gt "$a" ];then
     echo "猜大了！请重新输入"
elif [ "$u" -lt "$a" ];then
     echo   "猜小了！请重新输入"
else
     echo "恭喜你！猜对了！"
	 exit
fi
done



 while  :
do
	read -p "计算机生成了一个 1‐100 的随机数,你猜: " cai
    if [ $cai -eq $num ]
    then
       	echo "恭喜,猜对了"
       	exit
    	elif [ $cai -gt $num ]
    	then
           	echo "Oops,猜大了"
      	else
           	echo "Oops,猜小了"
 	fi
done