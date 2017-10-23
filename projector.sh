PROJECTOR_PATH='.bash_project'

projector_prompt() {
  test -f "$PROJECTOR_PATH" && source_bash_project
}

source_bash_project() {
  source "$PROJECTOR_PATH" && \
    PROJECT_HOME="$PWD"
}
