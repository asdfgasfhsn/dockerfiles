#!/bin/bash
export TERM=xterm-256color

case $1 in
shellcheck)
  shift
  args=""
  filename=""
  length="$(($# - 1))"
  if [[ "${length}" -gt 1 ]]; then
    args="${*:1:$length}"
  fi
  filename="${*: -1}"
  /bin/shellcheck "/home/shlint/lint/${*}"
  ;;
shfmt)
  shift
  args=""
  filename=""
  length="$(($# - 1))"
  if [[ "${length}" -gt 1 ]]; then
    args="${*:1:$length}"
  fi
  filename="${*: -1}"
  /bin/shfmt ${args} "/home/shlint/lint/${filename}"
  ;;
*)
  "$@"
  ;;
esac
