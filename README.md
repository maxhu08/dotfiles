# dotfiles

> [!IMPORTANT] If you are looking for my old dotfiles (which do not use stow), you can find them [here](https://github.com/maxhu08/dotfiles-old)

This repo contains all my configs I use.

## getting-started

My dotfiles are managed with `stow`, which manages symlinks so that the files in this dotfiles repo are synced with the actual configs.

To get started with using my dotfiles run these commmands:

```shell
# arch
sudo pacman -S stow

# gentoo
doas emerge -av app-admin/stow

git clone https://github.com/maxhu08/dotfiles
cd dotfiles
```

After that, you just need to run the stow command to symlink the dotfiles you want.

> [!CAUTION] I would not recommend stowing stuff like `git` because that contains my .gitconfig or `xorg` because thats specific to my monitor setup

```shell
# you can stow multiple things in one command!
stow alacritty fish kitty nvim picom tmux vscode xorg
```

## install-packages

Make sure to install the programs, stow just symlinks the configs. You still need to install the programs!

To get all the packages, check out my [rebos-config](https://github.com/maxhu08/rebos-config-arch) for arch.

## wallpapers

My wallapers are not in this repo. To access all my of wallpapers, check out my [wallpapers](https://github.com/maxhu08/wallpapers) repo.

## star-history

[![Star History Chart](https://api.star-history.com/svg?repos=maxhu08/dotfiles&type=Date)](https://star-history.com/#maxhu08/dotfiles&Date)
