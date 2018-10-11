#!/bin/bash
export TERM=xterm-256color

case $1 in
shellcheck)
  shift
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
  echo "/bin/shfmt ${args} /home/shlint/lint/${filename}"
  /bin/shfmt ${args} "/home/shlint/lint/${filename}"
  ;;
*)
  "$@"
  ;;
esac
