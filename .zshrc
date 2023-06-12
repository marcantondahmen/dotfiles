# The personal zsh config file of Marc Anton Dahmen

# Path
export PATH="/usr/local/sbin:/usr/local/opt/python/libexec/bin:$PATH"

# Keep the SSH user and server in a separate file in order to exclude it from the repository.
if [ -f ~/.mad_www ]
then
	source ~/.mad_www
fi

# Aliases
alias la="ls -la"
alias dotfiles='/opt/homebrew/bin/git --git-dir=/Users/marcantondahmen/.dotfiles/ --work-tree=/Users/marcantondahmen'
alias dotls='dotfiles ls-tree --full-tree --name-only -r HEAD'
alias dotst='dotfiles status'
alias dev=fzfProjects

# Prompt
autoload -Uz compinit && compinit
export TERM="xterm-256color" CLICOLOR=1
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# fzf
source ~/.config/fzf/fzf.zsh
