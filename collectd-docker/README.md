# docker-collectd
[![build](https://img.shields.io/docker/cloud/automated/asdfgasfhsn/collectd-docker.svg?style=for-the-badge)](https://hub.docker.com/r/asdfgasfhsn/collectd-docker)

A collectd container with the [docker-collectd-plugin](https://github.com/lebauce/docker-collectd-plugin/).

Designed to be used with the accompanying [docker compose template](https://github.com/asdfgasfhsn/dockerfiles/blob/master/collectd-docker/docker-compose.yml)
to allow collection of local container stats.

## Docker Compose Usage
First thing, to make your life easier you will want to clone the following repo:
- https://github.com/asdfgasfhsn/dockerfiles/

In the `collectd-docker` you will find all the files needed to use the compose
template.

The compose template configures and starts:
- influxdb:1.7.4
- grafana/grafana:5.1.0

### Step 1: Set Up Local Storage
Create the required directories to allow influxdb and grafana to persist data:

```shell
mkdir -p ${HOME}/.stats/influxdb
mkdir -p ${HOME}/.stats/grafana
chmod 0777 ${HOME}/.stats/grafana
```

### Step 2: Start Up
Start everything up:
```shell
docker-compose -p stats up -d
```

Note: be sure to use a compose project name to make sure name resolution for
services works.

### Step 3: Connect To Grafana
Log in to Grafana:

- url: http://localhost:3000
- user: admin
- pass: secret

### Step 4: Configure Grafana Datastore
Configure the datastore as influxdb with the following:
- url: http://influx:8086
- access: server
- database: collectd
- user: admin
- password: secret
