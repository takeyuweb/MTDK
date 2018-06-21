#!/bin/sh
set -e

echo "mysql -uroot -proot -e \"CREATE DATABASE mt DEFAULT CHARACTER SET utf8;\""
mysql -uroot -proot -e "CREATE DATABASE mt DEFAULT CHARACTER SET utf8;"
