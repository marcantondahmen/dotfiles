#!/bin/bash

selection=$(
	{
		if [[ -f package.json ]]; then
			jq -r '.scripts | keys[] | "npm\t" + . + "\t  " + .' package.json
		fi

		fd -e sh -d 3 | sed $'s|.*|bash\t&\t  &|'
	} | fzf --delimiter=$'\t' --with-nth=3 --layout=reverse
)

[[ -z $selection ]] && exit 0

type=$(cut -f1 <<<"$selection")
script=$(cut -f2 <<<"$selection")

case "$type" in
npm) cmd="npm run $script" ;;
bash) cmd="bash $script" ;;
esac

tmux new-window -c "$(pwd)" -n "$script" "$cmd; echo 'Press enter to close'; read"
