projector_rc() {
  local tmp="$(mktemp)"

  #cat /etc/zsh/zshenv /etc/zsh/zshrc /home/superman/.zcompdump /home/superman/.zshrc > "$tmp"

  cat "$1" > $tmp

  echo "$tmp"
}

projector_shell() {
  echo _shell
  zsh --rcs "$1"
}

export PROJECTOR_SOURCE_FILENAME=".local.zshrc"

precmd_functions=(projector_prompt)
