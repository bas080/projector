source ~/.projector

PROJECTOR_PROMPT_FUNCTION_NAME='projector_prompt'

echo $PROMPT_COMMAND | grep "$PROJECTOR_PROMPT_FUNCTION_NAME" || \
  PROMPT_COMMAND="$PROJECTOR_PROMPT_FUNCTION_NAME; $PROMPT_COMMAND"
