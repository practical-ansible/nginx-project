#!/usr/bin/env bash

PORT=$(docker port test_ssh 22)

# Make role accessible
mkdir roles 2> /dev/null
ln -s ../.. roles/practical-ansible.nginx-docker 2> /dev/null 

# Build and export the image from docker
docker build -t info-test:0.1.0 test
docker save info-test > test_app.tar

# Image must be removed, so we can test that it was added
docker image rm info-test:0.1.0

export ANSIBLE_HOST_KEY_CHECKING=False
ansible-playbook test-deploy.yml -i inventory -vvv
