.PHONY: ping \
	docker selinux firewall syntax-check linger docker-user

ping:
	ansible homelan -m ping

# ANSIBLE_OPTS can be overridden when calling make
ANSIBLE_OPTS ?= --ask-become-pass

docker:
	ansible-playbook $(ANSIBLE_OPTS) playbooks/install_docker.yml

selinux:
	ansible-playbook $(ANSIBLE_OPTS) playbooks/disable_selinux.yml

firewall:
	ansible-playbook $(ANSIBLE_OPTS) playbooks/disable_firewalld.yml

linger:
	ansible-playbook $(ANSIBLE_OPTS) playbooks/enable_linger.yml

docker-user:
	ansible-playbook $(ANSIBLE_OPTS) playbooks/docker_user.yml

syntax-check:
	ansible-playbook $(ANSIBLE_OPTS) --syntax-check playbooks/*.yml
