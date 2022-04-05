#!/usr/bin/env bash

#开始菜单
start_menu(){
clear
echo && echo -e " v2ray 一键安装管理脚本
————————————内核管理————————————
1. 安装 docker
————————————————————————————————" && echo
echo
read -p " 请输入数字 [0-11]:" num
case "$num" in
	0)
	exit 1
	;;
	1)
	check_sys_bbr
	;;
	*)
	clear
	echo -e "请输入正确数字 [0-11]"
	sleep 5s
	start_menu
	;;
esac
}
start_menu
