Vagrant.configure('2') do |config|
  config.vm.box = 'viruzzo/xubuntu-xenial64'

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  config.vm.provider 'virtualbox' do |vb|
    # Display the VirtualBox GUI when booting the machine
    # vb.gui = true

    # Customize the amount of memory on the VM:
    vb.name = 'dotfiles-dev'
    vb.memory = '512'
  end

  config.vm.hostname = 'dotfiles-dev'

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision 'ansible' do |ansible|
  #   ansible.playbook = './ansible/playbooks/base.yml'
  # end
end
