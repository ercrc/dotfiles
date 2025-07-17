test -s ~/.config/bash/git && . ~/.config/bash/git || true
test -s ~/.config/bash/alias && . ~/.config/bash/alias || true
test -s ~/.config/bash/yazi && . ~/.config/bash/yazi || true
test -s ~/.extras && . ~/.extras || true

export EDITOR="nvim"
export PS1="\[$(tput setaf 5)\][\[$(tput setaf 2)\]\w\[$(tput setaf 5)\]]\`parse_git_branch\` \[$(tput setaf 6)\]\\$ \[$(tput sgr0)\]"

eval "$(zoxide init bash)"
