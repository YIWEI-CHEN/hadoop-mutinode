#!/bin/bash

docker run -d -t --dns 127.0.0.1 -e NODE_TYPE=s -P --name slave1 -h slave1.mycorp.kom yiwei1012/ubuntu-hadoop-dn:1.2
FIRST_IP=$(docker inspect --format="{{.NetworkSettings.IPAddress}}" slave1)
docker run -i -t --dns 127.0.0.1 -e NODE_TYPE=m -e JOIN_IP=$FIRST_IP -v /home/$( whoami )/hadoop_input:/mnt -P --name master -h master.mycorp.kom yiwei1012/ubuntu-hadoop-nn-dn:1.2

