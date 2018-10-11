#!/bin/bash
export TERM=xterm-256color

case $1 in
  shellcheck)
    shift
    /bin/shellcheck "/home/shlint/lint/${*}"
  ;;
  shfmt)
    shift
    /bin/shfmt "/home/shlint/lint/${*}"
  ;;
  *)
    "$@"
  ;;
esac
