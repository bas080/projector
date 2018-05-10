#!/bin/bash

function url() {
  local file="$1"
  local branch="${2:-master}"

  echo "https://raw.githubusercontent.com/bas080/projector/$branch/$file"
}

function path() {
  echo "$HOME/$1"
}

function install() {
  download "$(url projector_zsh.sh)" "$(path .projector_zsh)" && \
    download "$(url projector_bash.sh)" "$(path .projector_bash)" && \
    download "$(url projector.sh)" "$(path .projector)" && \
    setup_env "$HOME/.bashrc" "source ~/.projector_bash" && \
    setup_env "$HOME/.zshrc"  "source ~/.projector_zsh"
}

function download() {
  local url="$1"
  local filename="$2"

  curl -f "$url" > "$filename"
}

function setup_env() {
  local source_file="$1"
  local source_command="$2"

  test ! -f $source_file && return 0

  grep -q "$source_command" "$source_file" || \
    echo "$source_command" >> "$source_file"
}

install "$@" && echo succes || echo failure
