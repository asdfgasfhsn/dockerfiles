FROM ubuntu:18.04
RUN apt-get update && apt-get install -y \
    python \
    python-pip \
    collectd-core \
  && rm -rf /var/lib/apt/lists/*
RUN pip install 'py-dateutil' 'docker-py>=1.0.0'
ADD entrypoint.sh /entrypoint.sh
ADD collectd.conf /etc/collectd/collectd.conf
ADD collectd_types.db /usr/share/collectd/types.db
ADD docker-collectd-plugin /usr/share/collectd/docker-collectd-plugin
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
