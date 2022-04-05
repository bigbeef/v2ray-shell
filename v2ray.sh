#!/usr/bin/env bash
#开始菜单
start_menu(){
clear
echo && echo -e " v2ray 一键安装管理脚本 ${Red_font_prefix}[v${sh_ver}]${Font_color_suffix}
————————————内核管理————————————
 ${Green_font_prefix}1.${Font_color_suffix} 安装 docker
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
	echo -e "${Error}:请输入正确数字 [0-11]"
	sleep 5s
	start_menu
	;;
esac
}
