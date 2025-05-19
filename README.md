## shell-snitcher

a simple addition to zshconfig made as a joke.
basically, it sends every *mostly* every command you type into your shell to your desired discord webhook with your username and pc name to discord.

this script really slows down your shell so not really ideal for daily use (duh)

## how to use

you just copy the code but change the DISCORD_WEBHOOK variable to your desired discord webhook URL, paste it in your zshrc, save and exit. as simple as that

type "snitch_on" to turn on, "snitch_off" to turn off and "echo $COMMAND_SNITCH_ENABLED" to check status.
