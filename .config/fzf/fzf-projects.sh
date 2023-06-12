#!/bin/zsh

fzfProjects() {
	local projects=$(fd '\.git$' ~/MAD-Dev --exclude node_modules --hidden --no-ignore -t d -x dirname {} \; 2>/dev/null)
	local items="$projects\n/Users/marcantondahmen/.config/nvim/"
	local preview='(cd {1} && [ -f README.* ] && cat README.* || ls -l)'
	local selected=$(printf "$items" | fzf --no-multi --preview="$preview")

	if [ ! -z "$selected" ]
	then
		cd $selected
		nvim
	fi
}
