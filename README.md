# Dotfiles

This is the personal _dotfiles_ repository of Marc Anton Dahmen.
It is supposed to be used as a bare repository inside of the home directory in `~/.dotfiles`.

## Usage

In order to be able to interact with the repository and add files from within the home directory the `dotfiles` alias
can be used instead of the regular `git` command. The `dotfiles` command essentially is an alias for:

```bash
/opt/homebrew/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME
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

- [tmux](https://github.com/tmux/tmux)
- [starship](https://starship.rs)
- [fzf](https://github.com/junegunn/fzf)
- [fd](https://github.com/sharkdp/fd)
- [bat](https://github.com/sharkdp/bat)

## SSH Agent Forwarding in `tmux`

In order to make ssh agent forwarding work when attaching to a tmux session after reconnecting over ssh,
the following script has to be added to the `~/.ssh/rc` file:

```bash
#!/bin/sh

if test "$SSH_AUTH_SOCK" ; then
	ln -sf $SSH_AUTH_SOCK /tmp/ssh_auth_sock_tmux
fi
```

Inside the `tmux.conf` the `SSH_AUTH_SOCK` variable will be set accordingly to always point to that link.
