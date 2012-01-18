# thedeeno's dotfiles

This repo contains my development env settings. I use a customized janus vim distribution for the editor and zsh for the shell. It's optimized for my rails/javascript workflow.

## install

```sh
# grab oh-my-zsh (use my fork until my change are merged)
git clone git://github.com/thedeeno/oh-my-zsh.git ~/.oh-my-zsh

# install janus
curl -Lo- http://bit.ly/janus-bootstrap | bash

# bring in personal settings
git clone git://github.com/thedeeno/dotfiles ~/.dotfiles 
cd ~/.dotfiles
rake install

# (optionally) set zsh as your default shell
chsh -s $(which zsh)
```

`rake install` will symlink the appropriate files in `.dotfiles` to your home directory. Everything is configured and tweaked within `~/.dotfiles`.

## what's inside

- Custom settings for Janus vim distribution
- Custom settings for Oh-My-Zsh
- Bash customizations
- Some useful commandline tools
- Many aliases

###notes
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
