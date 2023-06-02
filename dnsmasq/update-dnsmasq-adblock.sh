#!/usr/bin/env bash
set -e
rm /usr/local/share/dnsmasq.blacklist.txt ||:
wget -O /usr/local/share/dnsmasq.blacklist.txt https://github.com/notracking/hosts-blocklists/raw/master/dnsmasq/dnsmasq.blacklist.txt
systemctl restart NetworkManager.service
# or systemctl restart dnsmasq
