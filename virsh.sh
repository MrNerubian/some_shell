#!/bin/bash
# KVM虚拟机管理工具

workdir=/home/vmm
xml=/etc/libvirt/qemu
img=/var/lib/libvirt/images
vmxmlroot=$workdir/centos7/centos7u6.xml
vmdiskroot=$workdir/centos7/centos7u6.qcow2

sys_a=centos7.6-minimal
sys_b=windows7

menu() {
	cat <<- EOF
			KVM虚拟机管理工具-测试版
	-------------------------------------
            A.部署<$sys_a>系统
            B.部署<$sys_b>系统
	-------------------------------------
	EOF
}
menu

read -p "请选择您需要安装的操作系统类型（可选择A|B）:" choose

case $choose in
        A|a)
                read -p "请自定义域名(要求唯一):" name
                vmname=${name}
                vmuuid=${uuidgen}
                vmdisk=${name}.qcow2
                vmmac="52:54:$(dd if=/dev/urandom count=1 2>/dev/null | md5sum | sed -r 's/^(..)(..)(..)(..).*$/\1:\2:\3:\4/')"

                cp $vmxmlroot $xml/${vmname}.xml

                qemu-img create -f qcow2 -b $workdir $img/${vmdisk} &> /dev/null

                sed -ri "s#vmname#${vmname}#" $xml/${vmname}.xml
                sed -ri "s#vmuuid#${vmuuid}#" $xml/${vmname}.xml
                sed -ri "s#vmdisk#$img/${vmdisk}#" $xml/${vmname}.xml
                sed -ri "s#vmmac#${vmmac}#" $xml/${vmname}.xml
                virsh define $xml/${vmname}.xml
                echo $sys_a 已安装完成
                ;;
        B|b)
                read -p "请自定义域名(要求唯一):" name
                vmname=${name}
                vmuuid=${uuidgen}
                vmdisk=${name}.qcow2
                vmmac="52:54:$(dd if=/dev/urandom count=1 2>/dev/null | md5sum | sed -r 's/^(..)(..)(..)(..).*$/\1:\2:\3:\4/')"

                cp $vmxmlroot $xml/${vmname}.xml

                qemu-img create -f qcow2 -b $workdir $img/${vmdisk} &> /dev/null

                sed -ri "s#vmname#${vmname}#" $xml/${vmname}.xml
                sed -ri "s#vmuuid#${vmuuid}#" $xml/${vmname}.xml
                sed -ri "s#vmdisk#$img/${vmdisk}#" $xml/${vmname}.xml
                sed -ri "s#vmmac#${vmmac}#" $xml/${vmname}.xml
                virsh define $xml/${vmname}.xml
                echo $sys_b 已安装完成
                ;;    
			   

        *)
                echo "Error！请按菜单选择(A|B)"
esac

virt-manager


