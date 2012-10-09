# thedeeno's dotfiles

my ~/

## install

```sh
# install packages
sudo apt-get install git-core git-gui gitg meld vim-gnome curl

sudo apt-get install build-essential bison openssl libreadline5 zlib1g zlib1g-dev libssl-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libmysqlclient-dev libxslt-dev libxml2-dev 

# resolve gtk warning (if you get it)
sudo apt-get install gtk2-engines-pixbuf

# install rvm and build 1.9.3-head
sudo apt-get install automake

## download setup rvm
bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer )

## install 1.9.3
rvm install 1.9.3
rvm use 1.9.3 --default

# grab oh-my-zsh (use my fork until my change are merged)
git clone git://github.com/thedeeno/oh-my-zsh.git ~/.oh-my-zsh
cd ~/.oh-my-zsh
git checkout -b local_custom origin/local_custom

# install dotfiles
git clone git://github.com/thedeeno/dotfiles ~/code/dotfiles 
cd ~/code/dotfiles
rake install

# install vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# exec vundle install
from vim run
:BundleInstall

# install and run zsh
sudo apt-get install zsh
zsh
# (optionally) set zsh as your default shell
chsh -s $(which zsh)

# ack also might need to be symlinked (on ubuntu)
sudo apt-get install ack-grep
sudo ln -s /usr/bin/ack-grep /usr/local/bin/ack
```

`rake install` will symlink the appropriate files to your home directory. Everything is configured and tweaked within `dotfiles`.

# solarized

## overwrite gnome color profiles with solarized light/dark

Create two new color profiles with gnome terminal's preferences gui
(it's not accessible from the command line).

cd ~/code
git clone git://github.com/sigurdga/gnome-terminal-colors-solarized.git
cd gnome-terminal-colors-solarized
./install.sh

### phantomjs

Optionally build and install phantomjs (headless browser). The
latest instructions are [here](http://code.google.com/p/phantomjs/wiki/BuildInstructions), but the following should probably work:

```sh
sudo apt-get install libqt4-dev libqtwebkit-dev qt4-qmake
cd ~/code
git clone git://github.com/ariya/phantomjs.git && cd phantomjs
git checkout master # or whatever version you want
qmake-qt4 && make

# link it to your path
ln -s ~/code/phantomjs/bin/phantomjs ~/bin/phantomjs

# test
phantomjs --version
```
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

## ssh setup notes (only relevant for me)

After generating a new key pair on a new machine do the following to add
it to servers:

- login to servers with lish 
  - change `/etc/ssh/sshd_config` `PasswordAuthenticate` to `yes`
  - `sudo service ssh restart`
- on client
  - `ssh-copy-id username@host` # to append pub key to server user
- on server
  - copy appended key in `$HOME/.ssh/authorized_keys` 
  - append copy to `/home/<gitolite-user>/.ssh/authorized_keys` honoring the command prefix
- verify ssh only login
- verify `git clone <user>@<host>:gitolite-admin.git`
- revert sshd config
  - change `/etc/ssh/sshd_config` `PasswordAuthenticate` to `no`
  - `sudo service ssh restart`

## thanks

I forked [Zach Holeman's](http://github.com/holman) and later merged in 
[Ryan Bate's](http://github.com/ryanb)' dotfiles. This repository is now
considerably different, but they were a fantastic starting point.
