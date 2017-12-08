#!/bin/sh
# ping 测试主机网络是否通

# 获取IP
sh_ip=$(ip a | grep 'brd' | grep 'inet' | awk '{print $2}' | cut -d '/' -f1)

# 获取脚本名称
sh_script=$BASH_SOURCE
printf "
#######################################################################
#	     IP: $sh_ip     Script: $BASH_SOURCE		      # 
#                         Ping Test Host                              #
#######################################################################
"

# 检测的ip列表
ip_list="192.168.0.1 192.168.0.6 192.168.0.8 192.168.0.9 192.168.0.248 202.103.24.68 www.baidu.com"

# 循环列表
for ip in $ip_list
do
	if ping -c1 $ip >/dev/null 2>&1 ;then
		ip_msg="$ip_msg \n Date Time:$(date +"%F %T") \t Ping: $ip \t Successfully"
	else
		ip_msg="$ip_msg \n Date Time:$(date +"%F %T") \t Ping: $ip \t Failed"
	fi
done
echo -e $ip_msg

# curl 测试web页面是否能打开
printf "\n\n
#######################################################################
#	     IP: $sh_ip     Script: $BASH_SOURCE		      # 
#			  Curl Test Web				      #
#######################################################################
"
url_list="list.onewtech.com index.onewtech.com zentao.onewtech.com owncloud.onewtech.com onewserverdc.onewtech.com"
for url in $url_list
do
	if curl -m 10 $url >/dev/null 2>&1 ;then
		url_msg="$url_msg \n Date Time:$(date +"%F %T") \t Curl: $url \t Successfully"
	else
		url_msg="$url_msg \n Date Time:$(date +"%F %T") \t Curl: $url \t Failed"
	fi
done
echo -e $url_msg