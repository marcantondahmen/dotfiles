#!/usr/bin/env bash

input=$(cat)

# ANSI
RESET=$'\033[0m'
BLUE=$'\033[34m'
GREY=$'\033[90m'

# Data
cwd=$(jq -r '.workspace.current_dir // .cwd // "."' <<<"$input")
model=$(jq -r '.model.display_name // .model.id // "Claude"' <<<"$input")
effort=$(jq -r '.effort.level // "unknown"' <<<"$input")

# Shorten home directory for display
[[ "$cwd" == "$HOME"/* ]] && cwd="~${cwd#$HOME}"

# Git branch
git_cwd=$(jq -r '.workspace.current_dir // .cwd // "."' <<<"$input")
branch=$(git -C "$git_cwd" branch --show-current 2>/dev/null || true)

if [[ -n "$branch" ]]; then
	branch="  󰘬 $branch"
fi

# Output
echo -e "$BLUE$cwd$GREY$branch  󰚩 $model   $effort$RESET"
