#/bin/bash

yum update -y
yum upgrade -y
yum install epel-release -y
yum install docker docker-compose wget git -y

chkconfig docker on
service docker start

git clone ***
wget https://getgrav.org/download/core/grav-admin/1.3.1 -O grav.zip
unzip grav.zip
mv grav-admin/* html/
