# thedeeno's dotfiles

This repo contains my development env settings. I use a customized janus vim distribution for the editor and zsh for the shell. It's optimized for my rails/javascript workflow.

## install

```sh
# install packages
sudo apt-get install git-core git-gui gitg meld vim-gnome curl

# install rvm and build 1.9.3-head
sudo apt-get install automake

# download setup rvm
bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer )

# install 1.9.3-head
rvm install 1.9.3-head
rvm use 1.9.3-head --default

# grab oh-my-zsh (use my fork until my change are merged)
git clone git://github.com/thedeeno/oh-my-zsh.git ~/.oh-my-zsh
cd ~/.oh-my-zsh
git checkout -b local_custom origin/local_custom

# install janus
curl -Lo- http://bit.ly/janus-bootstrap | bash

# install dotfiles
git clone git://github.com/thedeeno/dotfiles ~/.dotfiles 
cd ~/.dotfiles
git submodule update --init
rake install

# install and run zsh
sudo apt-get install zsh
zsh
# (optionally) set zsh as your default shell
chsh -s $(which zsh)

# ack also might need to be symlinked (on ubuntu)
sudo apt-get install ack-grep
sudo ln -s /usr/bin/ack-grep /usr/local/bin/ack
```

`rake install` will symlink the appropriate files in `.dotfiles` to your home directory. Everything is configured and tweaked within `~/.dotfiles`.

## what's inside

- Custom settings for Janus vim distribution
- Custom settings for Oh-My-Zsh
- Bash customizations
- Some useful commandline tools
- Many aliases

## notes
- `c` is an autocomplete shortcut for `~/code`. For example, 
  `c myp<tab>` will autocomplete to `~/code/myproject`.
- `h` autocompletes your home directory.
- `check [filename]` is a quick script that tells you whether a domain is
  available to register.
- `backup` is a quick hook into `rsync` to backup a selection of files.

## thanks

I forked [Zach Holeman's](http://github.com/holman) and later merged in 
[Ryan Bate's](http://github.com/ryanb)' dotfiles. This repository is now
considerably different, but they were a fantastic starting point.
