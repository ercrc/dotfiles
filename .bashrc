test -s ~/.alias && . ~/.alias || true
eval "$(starship init bash)"

alias nb="newsboat"
alias img="wezterm imgcat"
alias nv="nvim"
alias py="python3"
alias ls="ls --color=auto"
alias sway="dbus-run-session -- sway"
alias xq="xbps-query -Rs"
alias xi="sudo xbps-install -Su"
alias xr="sudo xbps-remove"
alias pwroff="loginctl poweroff"
alias sus="loginctl hibernate"
alias reboot="loginctl reboot"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/steinway/.sdkman"
[[ -s "/home/steinway/.sdkman/bin/sdkman-init.sh" ]] && source "/home/steinway/.sdkman/bin/sdkman-init.sh"
. "$HOME/.cargo/env"
