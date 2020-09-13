Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.network "forwarded_port", guest: 3000, host: 3001
  config.vm.network "forwarded_port", guest: 8081, host: 8081
  config.vm.network "forwarded_port", guest: 8082, host: 8082
  config.vm.network "forwarded_port", guest: 9090, host: 9090
  config.vm.network "forwarded_port", guest: 9273, host: 9273
  config.vm.define "metrics"
  config.vm.provision "shell",
    inline: "sudo apt-get update"
  config.vm.provision "ansible" do |ansible|
    ansible.verbose = "v"
    ansible.playbook = "shields-io-metrics.yml"
    # extra_vars accepts one file only, using raw_arguments to pass two files
    # "-e=@variables-local.yml" works, but "-e @variables-local.yml" does not work
    ansible.raw_arguments = ["-e=@variables-local.yml", "-e=@versions.yml"]
    ansible.skip_tags = ["certbot-obtain", "certbot-nginx"]
    ansible.become = true
    ansible.galaxy_role_file = "requirements.yml"
    ansible.galaxy_roles_path = "roles_for_vagrant"
  end
end
