# docker-collectd
[![build](https://img.shields.io/docker/cloud/automated/asdfgasfhsn/collectd-docker.svg?style=for-the-badge)](https://hub.docker.com/r/asdfgasfhsn/collectd-docker)

A collectd container with the [docker-collectd-plugin](https://github.com/lebauce/docker-collectd-plugin/).

Designed to be used with the accompanying compose template for local stats
collection.

## Compose Template
If you want to collect metrics for local containers you can use the compose
template in this dir. The following steps are all you need:

### Set Up Local Storage
```shell
mkdir -p ${HOME}/.stats/influxdb
mkdir -p ${HOME}/.stats/grafana
chmod 0777 ${HOME}/.stats/grafana
```

### Start Up
```shell
docker-compose -p stats up -d
```

### Accessing Grafana

- url: http://localhost:3000
- user: admin
- pass: secret
