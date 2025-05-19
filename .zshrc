# made by lunatronia with <3
# this is so stupid, it hilariously slows down your terminal when turned on

SNITCH_CONFIG_FILE="$HOME/.snitchrc"
DISCORD_WEBHOOK="YOUR WEBHOOK HERE"

if [[ -f "$SNITCH_CONFIG_FILE" ]]; then
  export COMMAND_SNITCH_ENABLED=$(<"$SNITCH_CONFIG_FILE")
else
  export COMMAND_SNITCH_ENABLED=false
fi

function send_to_discord() {
  if [[ "$COMMAND_SNITCH_ENABLED" == true ]]; then
    local user_command="$1"
    curl -s -H "Content-Type: application/json" \
      -X POST \
      -d "{\"content\": \"\`$(whoami)@$(hostname)\`: \`\`\`${user_command}\`\`\`\"}" \
      "$DISCORD_WEBHOOK" > /dev/null 2>&1
  fi
}

function snitch_on() {
  echo "true" > "$SNITCH_CONFIG_FILE"
  export COMMAND_SNITCH_ENABLED=true
  echo "command snitching ENABLED"
}

function snitch_off() {
  echo "false" > "$SNITCH_CONFIG_FILE"
  export COMMAND_SNITCH_ENABLED=false
  echo "command snitching DISABLED"
}

preexec_functions+=(send_to_discord)

