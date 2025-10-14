.PHONY: ping \
	docker selinux firewall syntax-check linger docker-user

syntax-check:
	ansible-playbook --syntax-check playbooks/*.yml

ANSIBLE_OPTS ?= --ask-become-pass

ENV ?= stage
INVENTORIES := -i stage.ini
ifeq ($(ENV), prod)
	INVENTORIES := -i production.ini
else ifeq ($(ENV), all)
	INVENTORIES += -i production.ini
endif

ping:
	ansible homelan -m ping $(INVENTORIES)

docker:
	ansible-playbook $(ANSIBLE_OPTS) playbooks/install_docker.yml $(INVENTORIES)

selinux:
	ansible-playbook $(ANSIBLE_OPTS) playbooks/disable_selinux.yml $(INVENTORIES)

firewall:
	ansible-playbook $(ANSIBLE_OPTS) playbooks/disable_firewalld.yml $(INVENTORIES)

linger:
	ansible-playbook $(ANSIBLE_OPTS) playbooks/enable_linger.yml $(INVENTORIES)

docker-user:
	ansible-playbook $(ANSIBLE_OPTS) playbooks/docker_user.yml $(INVENTORIES)

shutdown:
	ansible-playbook $(ANSIBLE_OPTS) playbooks/shutdown.yml $(INVENTORIES)
