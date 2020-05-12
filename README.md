# Nginx-docker for ansible

[![Integration](https://github.com/practical-ansible/nginx-docker/workflows/CI/badge.svg)](https://github.com/practical-ansible/nginx-docker/actions)
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

Use this to avoid Burnout Syndrome when deploying your Docker wrapped application to nginx.

## Table of content

* [Default Variables](#default-variables)
  * [admin_email](#admin_email)
  * [client_max_body_size](#client_max_body_size)
  * [env](#env)
  * [group](#group)
  * [image](#image)
  * [project_environment](#project_environment)
  * [project_name](#project_name)
  * [project_port](#project_port)
  * [project_version](#project_version)
  * [projects_directory](#projects_directory)
  * [server_names](#server_names)
  * [ssl_sign_by](#ssl_sign_by)
  * [use_ssl](#use_ssl)
  * [user](#user)
* [Dependencies](#dependencies)
* [License](#license)
* [Author](#author)

---

## Default Variables

### admin_email

E-mail address of the project manager. Used by Let's encrypt as a account

#### Default value

```YAML
admin_email: ''
```

### client_max_body_size

Maximum file upload size for Nginx. Value as defined by [nginx documentation](http://nginx.org/en/docs/http/ngx_http_core_module.html#client_max_body_size)

#### Default value

```YAML
client_max_body_size: 1M
```

### env

Dictionary of environment variables that will be passed to the docker container.

#### Default value

```YAML
env:
  nginx_docker: true
```

#### Example usage

```YAML
env:
  PORT: 80
  SECRET_TOKEN: xa2z3ik6
```

### group

Unix group name that runs the project on target machine.

#### Default value

```YAML
group: www-data
```

### image

Path to the extracted docker image. When empty, the role will attempt to build the image on local host before uploading the image to the remote. Expects the Dockerfile to be present in the same directory as the playbook.

#### Default value

```YAML
image: ''
```

#### Example usage

```YAML
image: './dist/my-app.tar
```

### project_environment

Name of the project environment. The role expects that you host multiple instances of the application on one machine. The usual names are just "production" and "staging", but it can be anything as long as you keep it UNIX path friendly.

#### Default value

```YAML
project_environment: production
```

### project_name

Name of the project used to reference the project on host file system. Make sure that this name is equal to the name of the produced docker image. Role will attempt to read this from package manager metadata.

#### Default value

```YAML
project_name: ''
```

#### Example usage

```YAML
project_name: 'my-app'
```

### project_port

Inner port number of the container. The role will map this port from docker to nginx proxy|

#### Default value

```YAML
project_port: 80
```

#### Example usage

```YAML
project_port: 3000
```

### project_version

Project version, important for the version store on server. Role will attempt to read this from package manager metadata. The version can be overriden, for example when deploying nightly version, you can just set it to "staging" or "nightly". The version can be anything as long as you keep it UNIX path friendly.

#### Default value

```YAML
project_version: staging
```

#### Example usage

```YAML
project_version: '0.1.0'
```

### projects_directory

Directory where you usually put projects on the target machine

#### Default value

```YAML
projects_directory: /var/www
```

### server_names

List of hostnames used by the application. All of these will be proxied to the application.

#### Default value

```YAML
server_names: ''
```

#### Example usage

```YAML
server_names: 'mysite.example.com,mysite.example.cz'
```

### ssl_sign_by

Authority signing the SSL certificate for the application. Can be one of: 'letsencrypt', 'self'

#### Default value

```YAML
ssl_sign_by: letsencrypt
```

### use_ssl

Configure nginx to use SSL when proxying requests to the docker configuration.

#### Default value

```YAML
use_ssl: true
```

#### Example usage

```YAML
use_ssl: false
```

### user

User name that runs the project on target machine.

#### Default value

```YAML
user: www-data
```

## Dependencies

None.

## License

MIT

## Author

Pavel Žák
