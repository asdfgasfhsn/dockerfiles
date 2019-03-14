#!/bin/bash

set -e

if [ -d /mnt/proc ]; then
  echo "[INFO] /mnt/proc detected, remounting as /proc to expose host process info"
  umount /proc
  mount -o bind /mnt/proc /proc
fi

if [ -z "$@" ]; then
  cmd='/usr/sbin/collectd -C /etc/collectd/collectd.conf -f'
  echo "[INFO] exec \"${cmd}\""
  exec ${cmd}
else
  exec $@
fi
