# LAN Fedora Setup

This repository contains Ansible playbooks to configure Fedora machines on a home LAN.

## Prerequisites

- Ansible installed on the control node.
- SSH access to the target hosts from the control node.
- Python installed on the managed nodes.

## Inventory

The `inventory` file should contain the hosts you want to manage.

Example:
```ini
[homelan]
192.168.1.10
192.168.1.11
```

## How to Run Playbooks

To run a playbook, use the `ansible-playbook` command followed by the path to the playbook file.

The `ansible.cfg` file is configured to use the `inventory` file in the root of this repository.

### Available Playbooks

- **`playbooks/disable_firewalld.yml`**: Disables the firewalld service.
- **`playbooks/disable_selinux.yml`**: Disables SELinux. This requires a reboot.
- **`playbooks/enable_linger.yml`**: Enables linger for a user, allowing systemd services to run for that user even when they are not logged in.

### Examples

To disable firewalld on all hosts in the inventory:
```bash
ansible-playbook playbooks/disable_firewalld.yml
```

To disable SELinux on all hosts in the inventory:
```bash
ansible-playbook playbooks/disable_selinux.yml
```

To enable linger for the user `j9` (as defined in the playbook variables):
```bash
ansible-playbook playbooks/enable_linger.yml
```
