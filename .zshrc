# made by lunatronia with <3
# this is so stupid, it hilariously slows down your terminal.
# so i suggest you don't use this daily

DISCORD_WEBHOOK="YOUR WEBHOOK URL"

function send_to_discord() {
  local user_command="$1"
  curl -s -H "Content-Type: application/json" \
    -X POST \
    -d "{\"content\": \"\`$(whoami)@$(hostname)\`: \`\`\`${user_command}\`\`\`\"}" \
    "$DISCORD_WEBHOOK" > /dev/null 2>&1
}

preexec_functions+=(send_to_discord)

