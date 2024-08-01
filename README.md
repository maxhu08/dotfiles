# dotfiles

> [!IMPORTANT] If you are looking for my old dotfiles (which do not use stow), you can find them [here](https://github.com/maxhu08/dotfiles-old)

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

> [!WARNING] This isn't a full list of all the packages. To get all the packages, check out my [rebos-config](https://github.com/maxhu08/rebos-config-arch) for arch

Install on arch (with paru):

```shell
paru -S \
  fish zsh \
  alacritty kitty \
  tmux vim neovim ripgrep fzf zoxide \
  xorg-server xorg-xinit \
  xorg-xrandr xf86-input-libinput \
  xorg-xrdb xorg-xset \
  feh picom-simpleanims-git \
  materia-gtk-theme bibata-cursor-theme-bin \
  papirus-icon-theme papirus-folders-git \
  noto-fonts ttf-roboto \
  ttf-jetbrains-mono ttf-jetbrains-mono-nerd \
  ttf-apple-emoji \
  visual-studio-code-bin nemo brave-bin \
  obs-studio pavucontrol \
```

That's it!

> [!CAUTION] If you are Ubuntu `build-essential` `fzf` `python3-all-venv` `nodejs` & `npm` must be installed before running `stow nvim` & `nvim`

## star-history

[![Star History Chart](https://api.star-history.com/svg?repos=maxhu08/dotfiles&type=Date)](https://star-history.com/#maxhu08/dotfiles&Date)
