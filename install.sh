#!/bin/bash

PROJECTOR_URL="https://raw.githubusercontent.com/kalouantonis/projector/master/projector.sh"
PROJECTOR_PATH="$HOME/.projector"

PROJECTOR_BASH_URL="https://raw.githubusercontent.com/kalouantonis/projector/master/projector_bash.sh"
PROJECTOR_BASH_PATH="$HOME/.projector_bash"

PROJECTOR_ZSH_URL="https://raw.githubusercontent.com/kalouantonis/projector/master/projector_zsh.sh"
PROJECTOR_ZSH_PATH="$HOME/.projector_zsh"

function install() {
  download "$PROJECTOR_ZSH_URL" "$PROJECTOR_ZSH_PATH" && \
    download "$PROJECTOR_BASH_URL" "$PROJECTOR_BASH_PATH" && \
    download "$PROJECTOR_URL" "$PROJECTOR_PATH" && \
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

install $@ && echo success || echo failure
