#!/bin/bash
export TERM=xterm-256color

case $1 in
  bash)
    /bin/bash
  ;;
  *)
    /usr/local/bin/doctoc --github \
      --title 'Table Of Contents' \
      --maxlevel 4 \
      "$@"
  ;;
esac
