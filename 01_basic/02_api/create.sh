echo "CREATE TEST INSTANCE: E01_02_API"
curl -i --location --request PUT 'http://127.0.1:8001/api/v1/instances/E01_02_API' \
--header 'Content-Type: application/json' \
--data-raw '{
    "__comment__": "E01_02_API",
    "interfaces": {
        "network": [
            {
                "__comment__": "veth2:10 to RBFS hostif-0/0/2",
                "interface": "veth2",
                "vlan": 10,
                "address": "172.16.2.2/24",
                "gateway": "172.16.2.1",
                "address-ipv6": "fc66:1337:7331:2::2/64",
                "gateway-ipv6": "fc66:1337:7331:2::1"
            },
            {
                "__comment__": "veth3:10 to RBFS hostif-0/0/3",
                "interface": "veth3",
                "vlan": 10,
                "address": "172.16.3.2/24",
                "gateway": "172.16.3.1",
                "address-ipv6": "fc66:1337:7331:3::2/64",
                "gateway-ipv6": "fc66:1337:7331:3::1"
            },
            {
                "__comment__": "veth4:10 to RBFS hostif-0/0/4",
                "interface": "veth4",
                "vlan": 10,
                "address": "172.16.4.2/24",
                "gateway": "172.16.4.1",
                "address-ipv6": "fc66:1337:7331:4::2/64",
                "gateway-ipv6": "fc66:1337:7331:4::1"
            }
        ]
    },
    "streams": [
        {
            "__comment__": "hostif-0/0/2 -> hostif-0/0/3",
            "name": "IPv4-H2-3",
            "type": "ipv4",
            "direction": "downstream",
            "network-interface": "veth2:10",
            "destination-ipv4-address": "172.16.3.2"
        },
        {
            "__comment__": "hostif-0/0/2 -> hostif-0/0/4",
            "name": "IPv4-H2-4",
            "type": "ipv4",
            "direction": "downstream",
            "network-interface": "veth2:10",
            "destination-ipv4-address": "172.16.4.2"
        }
    ]
}'
