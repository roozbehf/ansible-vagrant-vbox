BOX_NAME = ENV['VAGRANT_BOX_NAME'] || 'ubuntu/trusty64'

Vagrant.configure(2) do |config|

  config.hostmanager.enabled = true
  config.hostmanager.ignore_private_ip = true
  # config.hostmanager.manage_host = true

  config.vm.provision "ansible" do |ansible|
      ansible.playbook = "playbook.yml"
      ansible.sudo = true
      ansible.groups = {
        "server" => ["server"],
        "client" => ["client"]
      }
  end

  config.vm.define 'server' do |a|
    a.vm.box = BOX_NAME
    a.vm.network "public_network"
    a.vm.hostname = 'server'
  end

  config.vm.define 'client' do |a|
    a.vm.box = BOX_NAME
    a.vm.network "public_network"
    a.vm.hostname = 'client'
  end

  # A hack to do a manual ip resolving, due to a bug in the current version of hostmanager
  config.hostmanager.ip_resolver = proc do |vm, resolving_vm|
    result = ""
    if hostname = (vm.ssh_info && vm.ssh_info[:host])
      vm.communicate.execute('host ' + vm.name.to_json) do |type, data|
          result << data if type == :stdout
      end
    end
    result.split("\n").first[/(\d+\.\d+\.\d+\.\d+)/, 1]
  end

  config.vm.provision :hostmanager
end
