# Setup fzf
if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
	PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
fi

export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_DEFAULT_OPTS="--color=16 --cycle --preview-window=border-left"

# Auto-completion
[[ $- == *i* ]] && source "/opt/homebrew/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"

# Custom functions
source "$(dirname "$0")/fzf-projects.sh"

