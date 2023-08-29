#!/usr/bin/env bash
set -ex
file=/usr/lib/dnsmasq.blacklist.txt
rm "$file" ||:
wget -O "$file" https://github.com/notracking/hosts-blocklists/raw/master/dnsmasq/dnsmasq.blacklist.txt
systemctl restart NetworkManager.service
# or systemctl restart dnsmasq
