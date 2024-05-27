function parse_git_dirty {
  [[ $(git status --porcelain 2> /dev/null) ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ (\1$(parse_git_dirty))/"
}

#export PS1="\[$(tput setaf 1)\][\[$(tput setaf 2)\]\u\[$(tput setaf 6)\]@\[$(tput setaf 5)\]\h \[$(tput setaf 6)\]\W$(parse_git_branch)\[$(tput setaf 1)\]]\[$(tput setaf 3)\]\\$ \[$(tput sgr0)\]"
test -s ~/.alias && . ~/.alias || true
eval "$(starship init bash)"
eval "$(zoxide init bash)"

alias nb="newsboat"
alias nv="nvim"
alias py="python3"
alias ls="ls --color=auto"
alias yz="yazi"
alias pwroff="systemctl poweroff"
alias sus="systemctl suspend"
alias hibernate="systemctl hibernate"
alias reboot="systemctl reboot"
alias img="wezterm imgcat"
alias fzf="fzf | xargs -r nvim"
alias cd="z"

export SDKMAN_DIR="/home/steinway/.sdkman"
[[ -s "/home/steinway/.sdkman/bin/sdkman-init.sh" ]] && source "/home/steinway/.sdkman/bin/sdkman-init.sh"
