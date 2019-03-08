## Ansible configuration for https://metrics.shields.io

This [Ansible](https://www.ansible.com/) [playbook](https://docs.ansible.com/ansible/latest/user_guide/playbooks.html) can be used to setup monitoring for Shields (https://metrics.shields.io). It installs [Prometheus](https://prometheus.io/), [Grafana](https://grafana.com/), [NGINX](https://www.nginx.com/) and [Let's Encrypt](https://letsencrypt.org/) certificates (using [Certbot](https://certbot.eff.org/)).

### How to use it?

1. Install Ansible ([doc](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html))
1. Prepare an inventory file `inventory.ini`:
```ini
metrics ansible_host=metrics.example.com ansible_port=22 ansible_user=ubuntu ansible_sudo_pass=... ansible_python_interpreter=/usr/bin/python3
```
1. Copy a SSH key to remote server
1. Install required Ansible roles:
```bash
ansible-galaxy install -r requirements.yml
```
1. Define properties in `variables.yml`:
```yml
metrics_domain: metrics.example.com
metrics_port: 80
mertics_grafana_admin_password: grafana_password
metrics_grafana_github_client_id: github_client_id
metrics_grafana_github_client_secret: github_secret_id
mertics_prometheus_password: prometheus_password
metrics_certbot_email: metrics@example.com
```
1. Run a playbook:
```bash
ansible-playbook shields-io-metrics.yml -i inventory.ini -e @variables.yml
```

### Tesing

Vagrant can be used to test the configuration ([documentation](https://docs.ansible.com/ansible/latest/scenario_guides/guide_vagrant.html)).
1. Start a virtual server and run the playbook:
```bash
# go to repo directory
cd repo-dir
vagrant up
```

2. Now you can visit:
- Grafana: http://localhost:8081
- Prometheus: http://localhost:8081/prometheus

Credentials are defined in `variables-local.yml`.

Finally you can stop (`vagrant halt`) or remove (`vagrant destroy`) the virtual server.
