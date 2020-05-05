#!/usr/bin/env bash
docker build -t test_ssh .
docker stop test_ssh 2> /dev/null
docker rm test_ssh 2> /dev/null
docker run -v /var/run/docker.sock:/var/run/docker.sock -d -P --rm --name test_ssh test_ssh

PORT=$(docker port test_ssh 22 | cut -d ':' -f2)

echo -e "[test]\nroot@127.0.0.1 ansible_port=${PORT} ansible_password=test" > inventory

docker port test_ssh 22

