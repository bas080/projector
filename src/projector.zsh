export PROJECTOR_FILENAME=".local.zshrc"

projector_shell() {
  local tmp="$(mktemp)"
  local source_file="$1/$PROJECTOR_FILENAME"

  cat /etc/zsh/zshenv /etc/zsh/zshrc /home/superman/.zcompdump /home/superman/.zshrc $source_file > "$tmp"

  echo """
  PROJECTOR_HOME=\"$1\"
  PROJECTOR_ON_EXIT=\"$2\"
  """ >> "$tmp"

  zsh -c "ARGV0=sh ENV=$tmp exec zsh"
}

precmd_functions=(projector_prompt)
