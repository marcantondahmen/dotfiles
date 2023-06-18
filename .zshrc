# The personal zsh config file of Marc Anton Dahmen

export PATH="/usr/local/sbin:/usr/local/opt/python/libexec/bin:$PATH"
export TERM="xterm-256color" CLICOLOR=1

# Keep the SSH user and server in a separate file in order to exclude it from the repository.
if [ -f ~/.mad_www ]
then
	source ~/.mad_www
fi

# Aliases
alias la="ls -la"

alias dot='gitui --directory=$HOME/.dotfiles/ --workdir=$HOME'
alias dotfiles='/opt/homebrew/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dotls='dotfiles ls-tree --full-tree --name-only -r HEAD'
alias dotst='dotfiles status'

alias dev=fzfProjects
alias f=fzfOpen

alias www='sh ~/MAD-Dev/server-switcher/server-switcher.sh'

alias tl=fzfTmuxList
alias ta='tmux attach -t'
alias td='tmux detach'
alias tn='tmux new -s'
alias tr='tmux rename-session'
alias xx='exit'

# Prompt
autoload -Uz compinit && compinit
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# fzf
source ~/.config/fzf/fzf.zsh
