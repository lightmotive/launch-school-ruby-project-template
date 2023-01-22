#!/bin/zsh

function dpsql() {
  if [[ $1 == "--show-command" ]]; then
    printf 'Connect to psql (~/.pgpass): '
    printf '%q ' "${DPSQL_CONNECT[@]}"
    printf '\n'
    return 0
  fi

  # Execute default `psql` connect command with params appended
  DPSQL_CONNECT+=("${@:1:99}")
  "${DPSQL_CONNECT[@]}"
}
