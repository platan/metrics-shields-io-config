Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.network "forwarded_port", guest: 8081, host: 8081
  config.vm.network "forwarded_port", guest: 9090, host: 9090
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.define "metrics"
  config.vm.provision "ansible" do |ansible|
    ansible.verbose = "v"
    ansible.playbook = "shields-io-metrics.yml"
    ansible.extra_vars = "variables-local.yml"
    ansible.skip_tags = ["certbot-obtain", "certbot-nginx"]
    ansible.become = true
    ansible.galaxy_role_file = "requirements.yml"
  end
end
