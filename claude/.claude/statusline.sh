#!/usr/bin/env bash

input=$(cat)

# ANSI
RESET=$'\033[0m'
BLUE=$'\033[34m'
GREY=$'\033[90m'

# Data
cwd=$(echo "$input" | jq -r '.workspace.current_dir')
model=$(echo "$input" | jq -r '.model.display_name')
effort=$(echo "$input" | jq -r '.effort.level')

# Branch
branch=$(git branch --show-current 2>/dev/null || true)

if [[ -n "$branch" ]]; then
	branch="  󰘬 $branch"
fi

# Shorten home directory for display
[[ "$cwd" == "$HOME"/* ]] && cwd="~${cwd#$HOME}"

# Output
echo -e "$BLUE$cwd$GREY$branch  󰚩 $model   $effort$RESET"
