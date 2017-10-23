#!/bin/bash

SCRIPT_URL="https://raw.githubusercontent.com/kalouantonis/projector/master/projector.sh"
SCRIPT_PATH="$HOME/.projector"
SOURCE_COMMAND="source ~/.projector"
SOURCE_SCRIPT="$HOME/.bash_profile"

curl "$SCRIPT_URL" > "$SCRIPT_PATH" && \
  grep "$SOURCE_COMMAND" "$SOURCE_SCRIPT" || \
  echo "$SOURCE_COMMAND" >> "$SOURCE_SCRIPT"
