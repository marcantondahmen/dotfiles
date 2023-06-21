BREW=$(brew --prefix)

# Setup fzf
if [[ ! "$PATH" == *$BREW/opt/fzf/bin* ]]; then
	PATH="${PATH:+${PATH}:}$BREW/opt/fzf/bin"
fi

export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_DEFAULT_OPTS="--color=16 --cycle --preview-window=border-sharp --no-scrollbar"

# Auto-completion
[[ $- == *i* ]] && source "$BREW/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
source "$BREW/opt/fzf/shell/key-bindings.zsh"

# Custom functions
fzfProjects() {
	local projects=$(fd '\.git$' ~/MAD-Dev --exclude node_modules --hidden --no-ignore -t d -x dirname {} \; 2>/dev/null)
	local items="$projects\n$HOME/.config/nvim/"
	local preview='(cd {1} && [ -f README.* ] && bat --color=always --style=numbers README.* || ls -l)'
	local selected=$(printf "$items" | fzf --no-multi --preview="$preview")

	if [ ! -z "$selected" ]
	then
		cd $selected
		nvim
	fi
}

fzfOpen() {
	local filePreview='if file -b --mime-type {} | grep -qiE "text|json"; then bat --color=always --style=numbers {}; else echo "Binary file"; fi'
	local dirPreview='echo "Directory contents:" && ls -lA --color=always {} | awk '"'"'{print $9}'"'"''
	local selected=$(fd -H -I -E node_modules -E cache -E .git . $(pwd) | \
		fzf \
		--no-multi \
		--preview="if [ -f {} ]; then $filePreview; else $dirPreview; fi" \
	)

	if [ ! -z $selected ]
	then
		if [ -f "$selected" ]
		then
			cd $(dirname "$selected") && nvim "$selected"
		else
			cd "$selected" 
		fi
	fi
}

fzfTmuxList() {
	local session=$(tmux ls | fzf --height=30% --layout=reverse | awk -F: '{print $1}')

	if [ ! -z $session ]
	then
		tmux attach -t "$session"
	fi
}

