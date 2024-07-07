# dotfiles

> [!IMPORTANT] If you are looking for my old dotfiles (which do not use stow), you can find them in https://github.com/maxhu08/dotfiles-old

This repo contains all my configs I use.

## getting-started

My dotfiles are managed with `stow`, which manages symlinks so that the files in this dotfiles repo are synced with the actual configs.

To get started with using my dotfiles run these commmands

```shell
# arch
sudo pacman -S stow

# gentoo
doas emerge -av app-admin/stow

git clone https://github.com/maxhu08/dotfiles
cd dotfiles
```

After that, you just need to run the stow command to symlink the dotfiles you want

> [!CAUTION] I would not recommend stowing stuff like `git` because that contains my .gitconfig or `xorg` because thats specific to my monitor setup

```shell
# you can stow multiple things in one command!
stow alacritty fish kitty nvim picom tmux vscode xorg
```

Make sure to install the programs, stow just symlinks the configs. You still need to install the programs!

Install on arch (with paru):

```shell
paru -S \
  fish zsh \
  alacritty kitty \
  tmux vim neovim ripgrep fzf zoxide \
  xorg-server xorg-xinit \
  xorg-xrandr xf86-input-libinput \
  feh picom-simpleanims-git \
  materia-gtk-theme bibata-cursor-theme-bin \
  papirus-icon-theme papirus-folders-git \
  visual-studio-code-bin nemo brave-bin
```

That's it!

## star-history

[![Star History Chart](https://api.star-history.com/svg?repos=maxhu08/dotfiles&type=Date)](https://star-history.com/#maxhu08/dotfiles&Date)
