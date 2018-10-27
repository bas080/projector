# Common projector utilities that are used between different shell applicatiobs.

projector_log() {
  echo "projector:" "$@"
}

projector_prompt() {
  test -n "$PROJECTOR_HOME" \
    && projector_prompt_in \
    || projector_prompt_out
}

projector_prompt_in() {
  local dir="$(projector_path "$PWD")"
  local code="$?"

  test "$dir" = "$PROJECTOR_HOME" && return 0

  echo "cd $PWD" >> "$PROJECTOR_ON_EXIT"

  projector_log "exit"

  exit
}

projector_prompt_out() {
  local dir="$(projector_path "$PWD")"
  local on_exit="$(mktemp)"

  test -n "$dir" && {
    projector_log "$dir"
    projector_shell "$dir" "$on_exit"
    source "$on_exit"
    test "$(projector_path "$PWD")" = "$dir" && exit
    projector_prompt_out
  }
}

projector_path() {
  local dir="$1"

  test -f "$dir/$PROJECTOR_FILENAME" && echo "$dir" && return 0
  test '/' = "$dir" && return 1

  projector_path "$(dirname "$1")"
}

projector_is_modified() {
  local modified="$(stat -c %y "$1")"
  test "$modified" = "$PROJECTOR_MODIFIED"
  local code="$?"
  PROJECTOR_MODIFIED="$modified"
  return $code
}
