# Dotfiles

My personal configuration files, managed with [GNU Stow](https://www.gnu.org/software/stow/). Stow creates symlinks from each package in this repository into your home directory.

> [!IMPORTANT]
> My [old dotfiles](https://github.com/maxhu08/dotfiles-old) use a different setup and do not use Stow.

## Getting started

Install Stow, clone this repository, and enter it:

```sh
# macOS
brew install stow

# Arch Linux
sudo pacman -S stow

git clone https://github.com/maxhu08/dotfiles
cd dotfiles
```

Stow will not overwrite existing, conflicting config files. Back up or move any existing files before stowing their packages.

## Stow configurations

From the repository directory, stow the packages you want:

```sh
stow alacritty fish kitty nvim picom tmux zed
```

VS Code stores its user configuration in different locations on Linux and macOS. From the repository directory, stow the package for your operating system:

```sh
# macOS
stow vscode-macos

# Linux
stow vscode-linux
```

> [!CAUTION]
> Do not stow or symlink `git/`. Keep `~/.gitconfig` as a regular local file so account switches and other Git config changes do not modify this repository. `git/.gitconfig` contains only the Homebrew-compatible GitHub CLI credential helper; copy that section into your local config if needed, and configure your own name and email locally.
>
> `xorg/` is specific to my monitor setup and is not included in the example command above.

## Packages and wallpapers

Stow only links configuration files; install the corresponding programs separately. For Arch package setup, see my [rebos-config](https://github.com/maxhu08/rebos-config-arch).

Wallpapers are maintained separately in my [wallpapers repository](https://github.com/maxhu08/wallpapers).

## Star history

[![Star History Chart](https://api.star-history.com/svg?repos=maxhu08/dotfiles&type=Date)](https://star-history.com/#maxhu08/dotfiles&Date)
