#!/usr/bin/env bash

# https://dev.mysql.com/doc/refman/8.0/en/connecting.html

mysql -u root -proot -h localhost -P 8306 --protocol=TCP -e "CREATE DATABASE IF NOT EXISTS smarthome_usermanager CHARACTER SET utf8 COLLATE utf8_general_ci;"
mysql -u root -proot -h localhost -P 8306 --protocol=TCP -e "CREATE DATABASE IF NOT EXISTS smarthome_housemanager CHARACTER SET utf8 COLLATE utf8_general_ci;"