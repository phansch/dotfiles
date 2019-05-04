import os

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']).get_hosts('all')


def test_ripgrep_present(host):
    ripgrep = host.package('ripgrep')
    assert ripgrep.is_installed
