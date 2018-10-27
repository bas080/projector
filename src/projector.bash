export PROJECTOR_FILENAME=".local.bashrc"

projector_shell() {
  local tmp="$(mktemp)"
  local source_file="$1/$PROJECTOR_FILENAME"

  echo """
  PROJECTOR_HOME=\"$1\"
  PROJECTOR_ON_EXIT=\"$2\"
  """ > "$tmp"

  cat /etc/bash.bashrc "$HOME/.bashrc" "$source_file" >> "$tmp"

  bash --rcfile "$tmp"
}

echo "$PROMPT_COMMAND" | grep -q 'projector_prompt;' \
  || PROMPT_COMMAND="projector_prompt;$PROMPT_COMMAND"
