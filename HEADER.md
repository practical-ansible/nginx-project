# Nginx-docker for ansible

[![Quality](https://img.shields.io/ansible/quality/48591.svg)](https://galaxy.ansible.com/practical-ansible/nginx_docker)
[![Downloads](https://img.shields.io/ansible/role/d/48591.svg)](https://galaxy.ansible.com/practical-ansible/nginx_docker)
[![Role](https://img.shields.io/ansible/role/48591)](https://galaxy.ansible.com/practical-ansible/nginx_docker)

Use Ansible to deploy Docker projects to Nginx with or without https. This role does not really care what language you used to create your app.

## Prerequisities

* target user with rights to config nginx
* target user with rights to run docker
* exported docker image

## Install

```shell
ansible-galaxy install practical-ansible.nginx_docker
```

## Example

```yaml
---
- name: Deploy to testing Docker container
  hosts: test
  vars:
    admin_email: 'admin@test.info'
    image: 'test_app.tar'
    project_port: '3000'
    project_name: 'info-test'
    project_version: '0.1.99'
    server_names: 'localhost,www.localhost'
    ssl_sign_by: 'self'
    env:
      print_this: 'Testing deployment: X Æ A-12'
  roles:
    - role: practical-ansible.nginx-docker
```
