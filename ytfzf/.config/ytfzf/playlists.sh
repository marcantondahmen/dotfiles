#!/bin/bash
#
# Select a playlist to be scraped with ytfzf.
# The script takes a path to a text file as single argument.
# It contains a list of name and url/id combinations,
# separated by space, one per line for example:
#
# Playlist A | https://...XXXXXXXXX
# Playlist B | XXXXXXXXX

FILE=~/.local/share/youtube-playlists.txt

if [ ! -f $FILE ]; then
	nvim $FILE
fi

edit='[ EDIT PLAYLISTS ]'
options="$edit\n$(cut -d'|' -f1 $FILE)"
selected=$(printf "$options" | fzf --layout=reverse --height=50%)

if [ -z "$selected" ]; then
	exit 0
fi

if [ "$selected" == "$edit" ]; then
	nvim $FILE
	bash "$0"
else
	line=$(cat $FILE | grep "$selected")
	url=${line#*|}

	ytfzf -slm -c youtube-playlist $url
fi
