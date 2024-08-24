# The personal zsh config file of Marc Anton Dahmen

# Keep things such as SSH users and servers in a separate file in order to exclude it from the repository.
if [ -f ~/.private ]
then
	source ~/.private
fi

# OS specific settings
if [[ $(uname) == 'Linux' ]]; then
	export COLORTERM=truecolor
	export PATH="$HOME/.local/bin:/opt/nvim-linux64/bin:$PATH"
	source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
else
	export PATH="/opt/homebrew/bin:/usr/local/sbin:/usr/local/opt/python/libexec/bin:$PATH"
	BREW=$(brew --prefix)
	source $BREW/share/zsh-autosuggestions/zsh-autosuggestions.zsh 2> /dev/null
fi

# Aliases
alias ls="ls --color=always"
alias la='ls -la'
alias cat='bat'

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

alias gc="git checkout"
alias gp="git pull"
alias gl="git log \
	--graph --decorate --branches --color \
	--pretty=format:'%>|(18)%C(blue)%h   %C(auto)%d %Creset%s %C(#1abc9c)%cr %C(#545c7e)%ce%Creset' | \
	less -RC"

# Prompt
autoload -Uz compinit && compinit
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

# Filter json with jq
# use like:
# jf file.json regex
jf() {
	cat $1 | jq "with_entries( select(.key | test(\"$2\"; \"i\")) )"
}

# fzf
source ~/.config/fzf/fzf.zsh

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Fix SSH agent forwarding in tmux
updateTmuxEnv() {
  if [ -n "$TMUX" ]; then
    eval $(tmux showenv -s)
  fi
}

preexec() {
    updateTmuxEnv
}
