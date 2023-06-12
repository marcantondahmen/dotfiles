# Dotfiles

This is the personal _dotfiles_ repository of Marc Anton Dahmen.
It is supposed to be used as a bare repository inside of the home directoty in `~/.dotfiles`.

## Usage

In order to be able to interact with the repository and add files from within the home directory the `dotfiles` alias
can be used instead of the regular `git` command. The `dotfiles` command essentially is an alias for:

```bash
/opt/homebrew/bin/git --git-dir=/Users/marcantondahmen/.dotfiles/ --work-tree=/Users/marcantondahmen
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
alias dotfiles='/opt/homebrew/bin/git --git-dir=/Users/marcantondahmen/.dotfiles/ --work-tree=/Users/marcantondahmen'
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

- [fzf](https://github.com/junegunn/fzf)
- [fd](https://github.com/sharkdp/fd)
- [starship](https://starship.rs)
