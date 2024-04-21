# The personal zsh config file of Marc Anton Dahmen

export PATH="/opt/homebrew/bin:/usr/local/sbin:/usr/local/opt/python/libexec/bin:$PATH"

# Keep things such as SSH users and servers in a separate file in order to exclude it from the repository.
if [ -f ~/.private ]
then
	source ~/.private
fi

BREW=$(brew --prefix)

# Aliases
alias ls="ls --color=always"
alias la='ls -la'
alias cat='bat'

alias dot='gitui --directory=$HOME/.dotfiles/ --workdir=$HOME'
alias dotfiles='$BREW/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dotls='dotfiles ls-tree --full-tree --name-only -r HEAD'
alias dotst='dotfiles status'

alias dev=fzfProjects
alias f=fzfFindDir
alias ff=fzfFindFile

alias srv='sh ~/MAD-Dev/server-switcher/server-switcher.sh'

alias ld='lazydocker'

alias tl=fzfTmuxList
alias ta='tmux attach -t'
alias td='tmux detach'
alias tn='tmux new -s'
alias tr='tmux rename-session'
alias xx='exit'

alias gl="git log \
	--graph --decorate --branches --color \
	--pretty=format:'%>|(18)%C(blue)%h   %C(auto)%d %Creset%s %C(#1abc9c)%cr %C(#545c7e)%ce%Creset' | \
	less -RC"

# Prompt
autoload -Uz compinit && compinit
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"
source $BREW/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Filter json with jq
# use like:
# jf file.json regex
jf() {
	cat $1 | jq "with_entries( select(.key | test(\"$2\"; \"i\")) )"
}

# fzf
source ~/.config/fzf/fzf.zsh

# Fix SSH agent forwarding in tmux
updateTmuxEnv() {
  if [ -n "$TMUX" ]; then
    eval $(tmux showenv -s)
  fi
}

preexec() {
    updateTmuxEnv
}
