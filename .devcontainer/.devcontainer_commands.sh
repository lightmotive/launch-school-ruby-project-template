#!/bin/zsh

function pgcmd_with_conn_args() {
  cmds=($1)
  cmds+=("${PGCMD_CONN_ARGS[@]}" "${@:2:99}")

  printf "Executing w/ default args & '~/.pgpass':\n"
  printf '%q ' "${cmds[@]}"
  printf '\n\n'

  "${cmds[@]}"
}

function dpsql() {
  cmd="psql"

  if [[ $1 == "--show-command" ]]; then
    printf "That executes the following (user password configured in ~/.pgpass):"
    printf "\n$cmd "
    printf '%q ' "${PGCMD_CONN_ARGS[@]}"
    printf '\n\n'
    printf "Other commands that use default conn args: dcreatedb, ddropdb"
    printf '\n'
    return 0
  fi

  pgcmd_with_conn_args $cmd "${@:1:99}"
}

function dcreatedb() {
  pgcmd_with_conn_args 'createdb' "${@:1:99}"
}

function ddropdb() {
  pgcmd_with_conn_args 'dropdb' "${@:1:99}"
}
