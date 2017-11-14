PROJECTOR_SOURCE_PATH='.bash_project'
PROJECTOR_BIN_PATH='projector_bin'

projector_prompt() {
  local projector_path=$(projector_path_find $PWD)

  # do nothing if the project path has not changed
  test "$projector_path" = "$PROJECT_HOME" && return 1

  PROJECT_HOME="$projector_path"

  source_bash_project "$projector_path"
  set_path_with_projector_path "$projector_path"
}

source_bash_project() {
  test -f "$1/$PROJECTOR_SOURCE_PATH" && \
    source "$1/$PROJECTOR_SOURCE_PATH"
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
  # find the nearest projector parent directory
  projector_is_project_dir "$1" && echo "$1" && return 0
  test '/' = "$1" && return 1

  projector_path_find "$(dirname $1)"
}
