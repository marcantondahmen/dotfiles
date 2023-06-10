#!/bin/zsh

fzfProjects() {
	projectsPath=~/MAD-Dev
	projects=$(fd '\.git$' ~/MAD-Dev --exclude node_modules --hidden --no-ignore -t d -x dirname {} \; 2>/dev/null)
	selected=$(printf "$projects\n/Users/marcantondahmen/.config/nvim/" | fzf --no-multi --color=16 --cycle --preview-window=border-left --preview='(cd {1} && [ -f README.* ] && cat README.* || ls -l)')

	if [ ! -z "$selected" ]
	then
		cd $selected
		nvim
	fi
}
