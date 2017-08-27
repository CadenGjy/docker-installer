#!/bin/sh
if [ `whoami` = "root" ];then
    date
else  
    echo "Superuser privileges are required to run this script."
    echo "e.g. \"sudo sh $0\""
    exit 1
fi
dpkg -i *.deb
sleep 1
systemctl daemon-reload
systemctl restart docker
docker -v
docker images
usermod -aG docker azureuser
