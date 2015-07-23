# Vagrant with Ansible on VirtualBox

This example demonstrates the use of Vagrant with Ansible to create two VMs that can communicate to each other.

Please let me know if you find any error or you think something can be done better.

## Notes
- The current version has a hack to replace the ip_resolver of the Vagrant Host Manager plugin (see the [Vagrantfile](Vagrantfile)).

## Instructions
1. Make sure that you have installed [VirtualBox](https://www.virtualbox.org), [Vagrant](https://www.vagrantup.com) and [Ansible](http://www.ansible.com/home).

2. Install the Vagrant Host Manager plugin

  ```vagrant plugin install vagrant-hostmanager```

3. Run ```vagrant up```. When it is done, both machines should be up and running.

4. Log in to the "client" machine
```vagrant ssh client```
and ping the server and the apache service on it by calling the following two scripts:
  * ```ping_server.sh```
  * ```ping_apache.sh```
