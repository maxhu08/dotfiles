# dotfiles

> **NOTICE** If you are looking for my old dotfiles (which do not use stow), you can find them in https://github.com/maxhu08/dotfiles-old

This repo contains all my configs I use.

## getting-started

My dotfiles are managed with `stow`, which manages symlinks so that the files in this dotfiles repo are synced with the actual configs.

To get started with using my dotfiles run these commmands

```shell
sudo pacman -S stow
git clone https://github.com/maxhu08/dotfiles
cd dotfiles

# you can stow multiple things in one command!
stow alacritty fish kitty nvim picom tmux vscode xorg
```

That's it!

## star-history

[![Star History Chart](https://api.star-history.com/svg?repos=maxhu08/dotfiles&type=Date)](https://star-history.com/#maxhu08/dotfiles&Date)
