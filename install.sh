#!/bin/bash

# 安装依赖
sudo apt-get update
sudo apt-get install build-essential libboost-all-dev qt4-dev-tools libaudio-dev libgtk-3-dev libxt-dev flex bison libbison-dev libqt4-dev libxpm-dev libxt-dev libpng-dev libglib2.0-dev libfreetype6-dev libxrender-dev libxext-dev libfontconfig-dev libxi-dev -y

# 版本配置
RCSSSERVER="rcssserver-15.4.0"
RCSSMONITOR="rcssmonitor-15.2.1"
RCSSLOGPLAYER="rcsslogplayer-15.2.1"
LIBRCSC="librcsc-4.1.0"
SOCCERWINDOW="soccerwindow2-5.1.1"
FEDIT="fedit2-0.0.1"

# 添加安装项
arr=($RCSSSERVER $RCSSMONITOR $RCSSLOGPLAYER $LIBRCSC $SOCCERWINDOW $FEDIT)

# 解压、配置、编译、安装、删除安装包
for var in ${arr[@]}; 
do
	tar -zxvf $var.tar.gz && cd $var && ./configure && make && sudo make install && cd .. && rm -rf $var
done

# 添加rcsc动态库路径
# sudo echo "/usr/local/lib" >> /etc/ld.so.conf
echo "include /etc/ld.so.conf.d/*.conf
/usr/local/lib" > ld.so.conf
sudo mv ld.so.conf /etc
sudo ldconfig
