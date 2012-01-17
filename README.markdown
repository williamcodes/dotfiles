# My dotfiles

## install
grab oh-my-zsh
- `git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh`

install janus
- `curl -Lo- http://bit.ly/janus-bootstrap | bash`

bring in personal settings
- `git clone git://github.com/thedeeno/dotfiles ~/.dotfiles`
- `cd ~/.dotfiles`
- `rake install`

The install rake task will symlink the appropriate files in `.dotfiles` to your
home directory. Everything is configured and tweaked within `~/.dotfiles`.

## what's inside

- Custom settings for the Janus vim distribution
- Custom settings for Oh-My-Zsh
- Bash customizations
- Some useful commandline tools

###features
- `c` is an autocomplete shortcut to your projects directory. For example, 
  `c myp<tab>` will autocomplete to `~/code/myproject`.
- `check [filename]` is a quick script that tells you whether a domain is
  available to register.
- `smartextract [filename]` will extract about a billion different
  compressed/uncompressed/whatever files and you'll never have to remember the
  syntax.
- `backup` is a quick hook into `rsync` to backup a selection of files. Check
  out the comments for more details.

## thanks

I forked [Zach Holeman's](http://github.com/holman) and later merged in 
[Ryan Bate's](http://github.com/ryanb)' dotfiles. This repository is now
considerably different, but they were a fantastic starting point.
