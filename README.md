# dotfiles

> **NOTICE** If you are looking for my old dotfiles (which do not use stow), you can find them in https://github.com/maxhu08/dotfiles-old

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

You will also need to change the `.stowrc` file to set the target to your home directory. By default it's set to the user `mh`

```shell
# .stowrc

--target=/home/mh
```

After that, you just need to run the stow command to symlink the dotfiles you want

```shell
# you can stow multiple things in one command!
stow alacritty fish kitty nvim picom tmux vscode xorg
```

That's it!

## star-history

[![Star History Chart](https://api.star-history.com/svg?repos=maxhu08/dotfiles&type=Date)](https://star-history.com/#maxhu08/dotfiles&Date)
