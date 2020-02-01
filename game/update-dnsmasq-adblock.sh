#!/usr/bin/env bash
set -e
rm /usr/lib/blocklists/* ||:
wget -P /usr/lib/blocklists https://raw.githubusercontent.com/notracking/hosts-blocklists/master/{domains,hostnames}.txt
systemctl restart NetworkManager.service
# or systemctl restart dnsmasq
