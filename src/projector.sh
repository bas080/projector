PROJECTOR_EXIT='exit 1'

projector_prompt() {
  local current_path="$(projector_path_source $PWD)"

  test "$current_path" != "$PROJECTOR_SOURCED_FILENAME" \
    && test -n "$PROJECTOR_SOURCED_FILENAME" \
    && {
      echo "cd \"$PWD\"" > "$PROJECTOR_SOURCE_AFTER"
      eval "$PROJECTOR_EXIT"
    }

  test -z "$PROJECTOR_SOURCED_FILENAME" \
    && projector_init "$current_path"

  test -n "$PROJECTOR_SOURCED_FILENAME" \
    && {
      local mod="$(projector_local_modified_at $PROJECTOR_SOURCED_FILENAME)"
      test "$mod" != "$PROJECTOR_SOURCED_AT" \
        && source $PROJECTOR_SOURCED_FILENAME \
        && PROJECTOR_SOURCED_AT="$mod" \
        && echo "projector: source $PROJECTOR_SOURCED_FILENAME"
    }
}

projector_path_source() {
  local path="$1/$PROJECTOR_SOURCE_FILENAME"

  test -f "$path" && echo "$path" && return 0
  test '/' = "$1" && return 1

  projector_path_source "$(dirname $1)"
}

projector_local_modified_at() {
  stat -c %y "$1"
}

projector_init() {
  test -z "$1" && return 1

  local rc="$(projector_rc $1)"
  local projector_home="$(dirname $1)"

  echo """
  PROJECTOR_SOURCED_AT=\"$(projector_local_modified_at $1)\"
  PROJECTOR_HOME=\"$projector_home\"
  PROJECTOR_SOURCED_FILENAME=\"$1\"
  echo "projector: [$1] $PROJECTOR_INIT $rc"
  """ >> $rc

  export PROJECTOR_SOURCE_AFTER="$(mktemp)"
  eval "$PROJECTOR_INIT $rc" && exit
  echo "projector: [$1] $PROJECTOR_EXIT"
  source "$PROJECTOR_SOURCE_AFTER"
  rm "$PROJECTOR_SOURCE_AFTER"
  projector_prompt
}
