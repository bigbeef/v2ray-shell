#!/usr/bin/env bash

# 安装docker
installDocker() {
	docker >/dev/null 2>&1
	if [[ $? -eq 0 ]]; then
		echo docker已经安装
	else
		curl -fsSL https://get.docker.com/ | sh
		systemctl enable docker.service
		systemctl start docker
	fi

}

#开始菜单
start_menu() {
	clear
	echo && echo -e " v2ray 一键安装管理脚本
————————————脚本列表————————————
0. 退出脚本
1. 安装 docker
————————————————————————————————" && echo
	echo
	read -p " 请输入数字:" num
	case "$num" in
	0)
		exit 1
		;;
	1)
		installDocker
		;;
	*)
		clear
		echo -e "请输入正确数字"
		sleep 5s
		start_menu
		;;
	esac
}

start_menu
