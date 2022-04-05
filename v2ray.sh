#!/usr/bin/env bash

id=$(cat /proc/sys/kernel/random/uuid)
path=$(cat /proc/sys/kernel/random/uuid)
dockerDataPath="/app/dockerTest"
v2rayPort=44444

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
	start_menu
}

# 安装v2ray
installV2ray() {
	mkdir -p ${dockerDataPath}/v2ray
	cat <<EOF >${dockerDataPath}/v2ray/config-ws.json
{
    "inbounds": [
        {
            "port": ${v2rayPort},
            "protocol": "vless",
            "settings": {
                "clients": [
                    {
                        "id": "${id}",
                        "level": 0
                    }
                ],
                "decryption": "none"
            },
            "streamSettings": {
                "network": "ws",
                "security": "none",
                "wsSettings": {
                    "path": "/${path}"
                }
            }
        }
    ],
    "outbounds": [
        {
            "protocol": "freedom"
        }
    ]
}
EOF
	start_menu
}

#开始菜单
start_menu() {
	clear
	echo && echo -e " v2ray 一键安装管理脚本
id : ${id}
path : ${path}
————————————脚本列表————————————
0. 退出脚本
1. 安装docker
2. 安装v2ray
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
	2)
		installV2ray
		;;
	*)
		clear
		echo -e "请输入正确数字"
		start_menu
		;;
	esac
}

start_menu
