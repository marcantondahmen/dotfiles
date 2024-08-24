# Marc Anton Dahmen's Dotfiles

This repository contains all [my](https://marcdahmen.de) dotfiles that I use privately on my Macs as well as for my day job as a software engineer on Arch. Feel free to create your own fork and modify them to meet your own requirements. In case you are also looking for a quick way to get Arch-Linux up and running, take a look at the [arch-setup](https://github.com/marcantondahmen/arch-setup) repository.

Note that I keep my Neovim configuration in a separate repository that can be found [here](https://github.com/marcantondahmen/nvim-config).

## Setup

I use [stow](https://www.gnu.org/software/stow/) in order to manage my dotfiles. Therefore `stow` should be installed first:

On macOS:

```bash
brew install stow
```

On Arch:

```bash
sudo pacman -S stow
```

Then simply clone the repository to your home directory and run `stow`:

```bash
cd ~
git clone git@github.com:marcantondahmen/dotfiles.git
cd ~/dotfiles
stow */
```

## macOS

This repository includes configurations for the following macOS applications:

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

## Arch-Linux

Aside from macOS applications, this repository also includes all configuration files for the setup that is installed using the [arch-setup](https://github.com/marcantondahmen/arch-setup) install script.

---

&copy; 2024 [Marc Anton Dahmen](https://marcdahmen.de), MIT license
