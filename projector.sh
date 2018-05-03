PROJECTOR_SOURCE_PATH='.bash_project'
PROJECTOR_BIN_PATH='projector_bin'

projector_prompt() {
  local projector_path="$(projector_path_find $PWD)"

  test -z $projector_path && return 0

  projector_path_changed "$projector_path" || \
    projector_source_modified "$projector_path" && \
    projector_source_bash_project "$projector_path"

  set_path_with_projector_path "$projector_path" || return 0
}

projector_path_changed() {
  test "$1" != "$PROJECT_HOME"
}

projector_source_modified() {
  test "$PROJECTOR_SOURCE_MOD_DATE" != "$(projector_bash_project_mod_date $1)"
}

projector_bash_project_mod_date() {
  stat -c %y "$1/$PROJECTOR_SOURCE_PATH"
}

projector_source_bash_project() {
  local file="$1/$PROJECTOR_SOURCE_PATH"
  PROJECT_HOME="$1"
  PROJECTOR_SOURCE_MOD_DATE="$(projector_bash_project_mod_date $1)"

  test -f "$file" && \
    source "$file" && projector_log "sourced $file"
}

projector_log() {
  echo "projector: $@"
}

set_path_with_projector_path() {
  local bin_path="$1/$PROJECTOR_BIN_PATH"

  test ! -z "$LAST_PROJECTOR_BIN_PATH" && PATH=$(echo $PATH | sed "s#$LAST_PROJECTOR_BIN_PATH:##g")

  test ! -d "$bin_path" && return 1

  LAST_PROJECTOR_BIN_PATH="$bin_path"

  PATH="$bin_path:$PATH"
}

projector_is_project_dir() {
  test -d "$1/$PROJECTOR_BIN_PATH" || test -f "$1/$PROJECTOR_SOURCE_PATH"
}

projector_path_find() {
  projector_is_project_dir "$1" && echo "$1" && return 0
  test '/' = "$1" && return 1

  projector_path_find "$(dirname $1)"
}
