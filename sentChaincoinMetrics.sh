#!/bin/bash
#set -xe
source /usr/local/bin/ddhelper.sh

host=$(hostname)
coin="chaincoin"
role="masternode"
username=$(whoami)
coindaemon="chaincoind"
coincli="chaincoin-cli"

metricname="blocks"
value=$(/usr/local/bin/$coincli getblockcount)
    sentMetric $host $coin $metricname $value $role $username

metricname="connections"
value=$(/usr/local/bin/$coincli getconnectioncount)
    sentMetric $host $coin $metricname $value $role $username

metricname="enabled"
pubilcip=$(curl -s ipecho.net/plain)
value=$(/usr/local/bin/$coincli masternode list full | /bin/grep $pubilcip | /bin/grep -w ENABLED | /usr/bin/wc -l)
    sentMetric $host $coin $metricname $value $role $username

metricname="status"
value=$(/usr/local/bin/$coincli mnsync status | /bin/grep AssetID | /usr/bin/awk -F' ' '{printf "%s",$2}' | /usr/bin/tr -d ",")
    sentMetric $host $coin $metricname $value $role $username