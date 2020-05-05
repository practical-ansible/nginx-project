# Nginx node for ansible

[![CircleCI](https://img.shields.io/circleci/project/github/practical-ansible/nginx-node.svg)](https://circleci.com/gh/practical-ansible/nginx-node)
[![Quality](https://img.shields.io/ansible/quality/39746.svg)](https://galaxy.ansible.com/practical-ansible/nginx_node)
[![Downloads](https://img.shields.io/ansible/role/d/39746.svg)](https://galaxy.ansible.com/practical-ansible/nginx_node)

Deploy Node.js projects to Nginx with systemd. Orignial idea was to use uwsgi, but that is [not quite ready](https://uwsgi-docs.readthedocs.io/en/latest/V8.html) for this task. This role installs the nodejs application as systemd service.

## Prerequisities

* project artifact
* systemd on target machine
* npm > 5 on target machine because we use `npm ci` command

## Variables

|Name|Required|Default|Description|
|----|--------|-------|-----------|
|`node_archive`|no|(what you get from `npm pack`)|Path to the packaged application, for example 'node-application-1.0.0.tgz'. Should work with any archive ansible can unpack.|
|`node_env_config`|no||Environment variables configuration separated by space, for example: `API_URL=http://example.com OAUTH_TOKEN=j12kkjjkdl$$`|
|`node_max_fileupload_size`|yes|1M|Maximum file upload size for Nginx|
|`node_project_environment`|yes|staging|Project environment name|
|`node_project_port`|yes||Port to run the node project on, for example: `3000`|
|`node_server_name`|yes||Hostname to reference the application, for example: `mysite.example.com,mysite.example.cz`|

### Overrides

You can override these variables, but you should never need this.

|Name|Description|
|----|-----------|
|`node_group`|Unix group name that runs the project on target machine. Defaults to `www-data`|
|`node_project_name`|Name of the project used to reference the project on host file system. It is read from package.json by default.|
|`node_project_id`|Project id to reference it in system settings. Defaults to `node-{node_project_name}-{node_project_environment}`|
|`node_projects_directory`|Directory where you usually put projects on the target machine. Defaults to `/var/www`|
|`node_systemd_dir`|Where your systemd services live, defaults to `/etc/systemd/system`|
|`node_user`|User name that runs the project on target machine. Defaults to `www-data`|
|`node_version`|Project version, important for the version store on server. Read from package.json by default.|

## TODO

* Auto select port based on config
