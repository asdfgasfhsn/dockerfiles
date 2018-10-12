#!/bin/bash
export TERM=xterm-256color
declare -r LINT_PATH='/home/shlint/lint/'
export SHFMT_OPTS="${SHFMT_OPTS:--w -d -i 2 -ci}"
export SHELLCHECK_OPTS="${SHELLCHECK_OPTS:-}"
export filename="${*: -1}"
case $1 in
  shellcheck)
    /bin/shellcheck "${LINT_PATH}${filename}"
    ;;
  shfmt)
    # shellcheck disable=SC2086
    /bin/shfmt ${SHFMT_OPTS} "${LINT_PATH}${filename}"
    ;;
  lint)
    echo "Parsing ${filename} with shellcheck..."
    /bin/shellcheck "${LINT_PATH}${filename}"
    echo "Parsing ${filename} with shfmt..."
    # shellcheck disable=SC2086
    /bin/shfmt ${SHFMT_OPTS} "${LINT_PATH}${filename}"
    ;;
  *)
    "$@"
    ;;
esac
