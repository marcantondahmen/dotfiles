# Marc's macOS Dotfiles

This repository contains all _dotfiles_ that I, [Marc Anton Dahmen](https://marcdahmen.de), use on my private macOS machines.
It is supposed to be used as a bare repository inside of the home directory in `~/.dotfiles`.

## Usage

In order to be able to interact with the repository and add files from within the home directory the `dotfiles` alias
can be used instead of the regular `git` command. The `dotfiles` command essentially is an alias for:

```bash
$BREW/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME
```

Therefore files can be added or updated using:

```bash
dotfiles add .filename
dotfiles commit -m "add .filename"
dotfiles push
dotfiles log
```

### Gitui

It is also possible to use `gitui` in order to manage the repository using the `dot` alias.

## Setup

> Note that these instructions assume that `git` was installes using `brew`.

In order to setup to a new machine or migrate dotfiles to an old one, the repository has to be clones as a _bare_ one as follows:

```bash
git clone --bare git@github.com:marcantondahmen/dotfiles.git $HOME/.dotfiles
```

Then the alias has to be defined for the current session:

```bash
alias dotfiles='/opt/homebrew/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

And then finally the files can be checked out:

```bash
dotfiles checkout
```

> Note that some files might already be existing and therefore an error is expected. Those files have to be removed first.

In a last step the new local clone has to be configured to hide untracked files.

```bash
dotfiles config --local status.showUntrackedFiles no
```

## Requirements

The following applications should be installed:

- [aerospace](https://github.com/nikitabobko/AeroSpace)
- [wezterm](https://wezfurlong.org/wezterm/index.html)
- [tmux](https://github.com/tmux/tmux)
- [starship](https://starship.rs)
- [fzf](https://github.com/junegunn/fzf)
- [fd](https://github.com/sharkdp/fd)
- [bat](https://github.com/sharkdp/bat)
- [tig](https://jonas.github.io/tig/)
- [gsed](https://formulae.brew.sh/formula/gnu-sed) (as replacement for the sed that is shipped with macOS)
- [bash](https://formulae.brew.sh/formula/bash) (newer version of bash than the one shipped with macOS)

---

&copy; 2024 Marc Anton Dahmen, MIT license
