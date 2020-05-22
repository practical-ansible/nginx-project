# Nginx-project for ansible

[![Integration](https://github.com/practical-ansible/nginx-project/workflows/CI/badge.svg)](https://github.com/practical-ansible/nginx-project/actions)
[![Quality](https://img.shields.io/ansible/quality/48591.svg)](https://galaxy.ansible.com/practical-ansible/nginx_docker)
[![Downloads](https://img.shields.io/ansible/role/d/48591.svg)](https://galaxy.ansible.com/practical-ansible/nginx_docker)
[![Role](https://img.shields.io/ansible/role/48591)](https://galaxy.ansible.com/practical-ansible/nginx_docker)

This is a base for all practical-ansible nginx roles. It does only initial configuration, like create working directory for the project and obtain SSL certificate

## Prerequisities

* Target user with rights to config nginx

## Install

```shell
ansible-galaxy install practical-ansible.nginx_project
```

# Reference manual

Base library for other Practical Ansible projects

## Table of content

* [Default Variables](#default-variables)
  * [admin_email](#admin_email)
  * [group](#group)
  * [project_environment](#project_environment)
  * [project_name](#project_name)
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

### group

Unix group name that runs the project on target machine.

#### Default value

```YAML
group: www-data
```

### project_environment

Name of the project environment. The role expects that you host multiple instances of the application on one machine. The usual names are just "production" and "staging", but it can be anything as long as you keep it UNIX path friendly.

#### Default value

```YAML
project_environment: production
```

### project_name

Name of the project used to reference the project on host file system. Role will attempt to read this from package manager metadata, like npm.

#### Default value

```YAML
project_name: ''
```

#### Example usage

```YAML
project_name: 'my-app'
```

### projects_directory

Directory where you usually put projects on the target machine

#### Default value

```YAML
projects_directory: /var/practical-ansible
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
