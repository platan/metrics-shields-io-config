## Ansible consiguration for metrics.shields.io


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
