#!/bin/bash
# https://github.com/rtbrick/BGP-CP-DP-Testing/blob/main/generate_routes.sh 

bgpupdate -a 65001 -l 100 -f rx1.bgp --local-pref 100 -n 172.16.2.2 -N 1 -p 11.0.0.0/24 -P 10000 --end-of-rib \
    -s streams.json \
    --stream-direction downstream \
    --stream-pps 1 \
    --stream-interface veth4:10 

bgpupdate -a 65001 -f rx1-withdraw.bgp --local-pref 100 -n 172.16.2.2 -N 1 -p 11.0.0.0/24 -P 10000 --withdraw --end-of-rib

bgpupdate -a 65001 -f rx2.bgp --local-pref 10 -n 172.16.3.2 -N 1 -p 11.0.0.0/24 -P 10000 --end-of-rib
bgpupdate -a 65001 -f rx2-withdraw.bgp --local-pref 10 -n 172.16.3.2 -N 1 -p 11.0.0.0/24 -P 10000 --withdraw --end-of-rib
