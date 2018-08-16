#!/bin/bash
export TERM=xterm-256color

case $1 in
  bash)
    /bin/bash
  ;;
  *)
    /usr/local/bin/tb "$@"
  ;;
esac
