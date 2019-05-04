import os

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']).get_hosts('all')


def test_hub_file_present(host):
    f = host.file('/root/.bin/hub')

    assert f.exists
    assert f.user == 'root'
    assert f.group == 'root'


def test_tmp_file_absent(host):
    f = host.file('/tmp/hub/')

    assert f.exists, False
