#!/usr/bin/env python
import sys
import subprocess
import json
# import fileinput


def hostvars(host):
    name = host['name']
    ip_addr = None

    for iface in host['network_interfaces']:
        try:
            ip_addr = iface['primary_v4_address']['one_to_one_nat']['address']
            break
        except KeyError:
            continue

    return {'name': name, 'ip_addr': ip_addr}

instances = json.loads(subprocess.check_output('yc compute instances list --format=json'.split()))
hosts = [ hostvars(x) for x in instances ]

ip_list = [ x['ip_addr'] for x in hosts]

output = { 'all': {'hosts': ip_list },
            '_meta': {  # ansible magic
                "hostvars": {}
                }
            }

print(json.dumps(output, indent=4, sort_keys=False))
