#!/bin/bash

PROJECTOR_PROMPT_FUNCTION_NAME='projector_prompt'
PROJECTOR_PATH='.bash_project'

projector_prompt() {
  test -f "$PROJECTOR_PATH" && source_bash_project
}

source_bash_project() {
  source "$PROJECTOR_PATH" && \
    PROJECT_HOME="$PWD"
}

# only add prompt command when not added already
echo $PROMPT_COMMAND | grep "$PROJECTOR_PROMPT_FUNCTION_NAME" || \
   PROMPT_COMMAND="$PROJECTOR_PROMPT_FUNCTION_NAME; $PROMPT_COMMAND"
