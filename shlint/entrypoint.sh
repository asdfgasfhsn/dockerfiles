#!/bin/bash
export TERM=xterm-256color

declare -r LINT_PATH='/home/shlint/lint/'
shfmt_args="${shfmt_args:--d -i 2 -ci}"

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
    /bin/shellcheck "${args}" "${LINT_PATH}${filename}"
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
    /bin/shfmt "${args}" "${LINT_PATH}${filename}"
    ;;
  lint)
    filename="${*: -1}"
    echo "Parsing ${filename} with shellcheck..."
    /bin/shellcheck "${LINT_PATH}${filename}"
    echo "Parsing ${filename} with shfmt..."
    # shellcheck disable=SC2086
    /bin/shfmt ${shfmt_args} "${LINT_PATH}${filename}"
  ;;
  *)
    "$@"
    ;;
esac
