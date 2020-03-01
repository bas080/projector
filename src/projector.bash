#!/usr/bin/env bash

export PROJECTOR_FILENAME=".local.bashrc"
export PROJECTOR_HISTFILE=".local.bash_history"

projector_shell() {
  bash --rcfile <((projector_rcfile "$@"))
}

projector_rcfile() {
  local source_file="$1/$PROJECTOR_FILENAME"

  printf 'export PROJECTOR_FILE="%s"\n' "$source_file"
  printf 'export PROJECTOR_HOME="%s"\n' "$1"
  printf 'export PROJECTOR_ON_EXIT="%s"\n' "$2"
  printf 'export HISTFILE="%s/%s"\n' "$1" "$PROJECTOR_HISTFILE"

  cat /etc/bash.bashrc "$HOME/.bashrc" "$source_file"
}

echo "$PROMPT_COMMAND" | grep -q 'projector_prompt;' \
  || PROMPT_COMMAND="projector_prompt;$PROMPT_COMMAND"
