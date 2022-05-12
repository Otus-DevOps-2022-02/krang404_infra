import os
import pytest

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']).get_hosts('all')

# check if MongoDB is enabled and running
def test_mongo_running_and_enabled(host):
    mongo = host.service("mongod")
    assert mongo.is_running
    assert mongo.is_enabled

# check if configuration file contains the required line
def test_config_file(host):
    config_file = host.file('/etc/mongod.conf')
    assert config_file.contains('bindIp: 0.0.0.0')
    assert config_file.is_file

# check socket is exists
def test_socket_check(host):
    socket = host.socket("tcp://27017")
    unix_socket = host.socket("unix:///tmp/mongodb-27017.sock")
    assert socket.is_listening
    assert unix_socket.is_listening

# check port is reachable
def test_port_check(host):
    localhost = host.addr("localhost")
    assert localhost.port(27017).is_reachable
