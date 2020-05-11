#!/usr/bin/env bash

if [[ "$1" != "debug" ]]; then
  echo "Running local hosting container"
  docker stop hosting-test 2> /dev/null
  docker rm hosting-test 2> /dev/null
  docker build -t hosting-test hosting
  docker run -v /var/run/docker.sock:/var/run/docker.sock -d -P --rm --name hosting-test hosting-test
fi

PORT=$(docker port hosting-test 22 | cut -d ':' -f2)

echo -e "[test]\nroot@127.0.0.1 ansible_port=${PORT} ansible_password=test" > inventory

# Make role accessible
mkdir roles 2> /dev/null
ln -s ../.. roles/practical-ansible.nginx-docker 2> /dev/null 

export ANSIBLE_HOST_KEY_CHECKING=False
ansible-playbook test-deploy.yml -i inventory -vvv

if [[ "$1" != "inspect" ]] && [[ "$1" != "debug" ]]; then
  docker stop hosting-test info-test
fi
