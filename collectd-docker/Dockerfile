FROM ubuntu:18.04
RUN apt-get update && apt-get install -y \
    python \
    python-pip \
    collectd-core \
  && rm -rf /var/lib/apt/lists/*

ADD docker-collectd-plugin /usr/share/collectd/docker-collectd-plugin
RUN pip install -r /usr/share/collectd/docker-collectd-plugin/requirements.txt

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ADD collectd_types.db /usr/share/collectd/types.db
ADD collectd.conf /etc/collectd/collectd.conf

ENTRYPOINT ["/entrypoint.sh"]
