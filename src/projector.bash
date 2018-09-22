projector_rc() {
  local tmp="$(mktemp)"

  cat \
    /etc/bash.bashrc \
    "$HOME/.bashrc" \
    "$1" \
    > "$tmp"

  echo "$tmp"
}

projector_shell() {
  bash --rcfile "$1"
}

export PROJECTOR_SOURCE_FILENAME=".local.bashrc"

echo "$PROMPT_COMMAND" | grep -q 'projector_prompt;' \
  || PROMPT_COMMAND="projector_prompt;$PROMPT_COMMAND"
