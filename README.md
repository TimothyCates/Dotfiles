# Dotfiles
These are my personal dotfiles for development on Linux. I mostly use Arch so any scripts you find in here will assume that sort of environment.
This repository is set up for use with GNU Stow you can install it on Arch by using
```bash 
sudo pacman -S stow
```

## My Setup
- **WM:** bspwm
- **Shell:** Zsh
- **Terminal:** Alacritty
- **Bar:** Polybar
- **Compositor:** picom-ibhagwan-git 
- **Notification Daemon:** Dunst
- **Launcher:** Rofi
- **Editor:** neovim

## Requirements
- **Nerd Fonts:** If a config can specify a font I specify a Nerd Font
- **Paper Icon Theme:** The bar and by extension rofi use the Paper Icon Theme
- **Python Virtual Env:** coq.nvim relies on Python Virtual Environment being present

## Installation
### Using Stow without arguments
To use Stow without arguments you need to have this repo in your home folder, for example into a .dotfiles subdirectory
```bash 
cd ~
git clone https://github.com/timothycates/dotfiles .dotfiles
```
Once that's done you can just cd into your folder and use GNU Stow to manage the symlinks to the proper directories. For example to get my Alacritty config
```bash
cd .dotfiles
stow Alacritty
```
If you're interested in just taking my entire setup you can run
```bash
stow */
```

### Using Stow with arguments
Passing `d` and `t` to Stow will allow us to have our repository anywhere on the system. I prefer this method as I tend to have all my github projects in
```bash
~/Documents/repos
```
First clone and cd into this repository wherever it suites you
```bash
cd ~/Documents/git
git clone https://github.com/timothycates/dotfiles dotfiles
cd dotfiles
```
Now we just need to pass in `t` so that Stow knows where to start the symlinks at.
```bash
stow -t ~/ Alacritty
```
For a quick reference `-t` determines where to put the symlinks and `-d` determines where to get them. For more information I recommend checking the man page on Stow.

## Removing your awful dotfiles
If you need to remove the symlinks created by Stow you need to run the same command you used to `stow` them but with option `-D` added. This will tell Stow to remove symlinks.
```bash
stow -D -t ~/ *
```

