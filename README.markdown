# thedeeno's ~/

### Install Common Packages

```sh
sudo apt-get install git-core git-gui gitg meld vim-gnome curl
sudo apt-get install build-essential bison openssl libssl-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libmysqlclient-dev libxslt-dev libxml2-dev 
```

#### Install Dotfiles

    git clone git://github.com/thedeeno/dotfiles ~/code/dotfiles 
    cd ~/code/dotfiles
    rake install

### Install Zsh

  ```sh
  sudo apt-get install zsh
  zsh
  # (optionally) set zsh as your default shell
  chsh -s $(which zsh)
  ```


### Install Ruby (and the environment manager)

clone rbenv + ruby-build

    git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
    git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

install ruby prereqs

    # readline
    sudo apt-get install libreadline-dev

    # zlib
    sudo apt-get install libssl-dev zlib1g-dev

install rubies

    rbenv install 2.0.0-p247
    rbenv rehash

### Build / Install vim from source (to use latest plugins)

https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source

1.  First, install all the prerequisite libraries, including Mercurial. For a Debian-like Linux distribution like Ubuntu, that would be the following:

        sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev \
        libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
        libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev ruby-dev mercurial

2. Once everything is installed, getting the source is easy:

        cd ~/code/
        hg clone https://code.google.com/p/vim/
        cd vim
        ./configure --with-features=huge \
                    --enable-rubyinterp \
                    --enable-pythoninterp \
                    --enable-perlinterp \
                    --enable-gui=gtk2 --enable-cscope --prefix=/usr
        make VIMRUNTIMEDIR=/usr/share/vim/vim73

3. Copy binary to PATH

       cp ~/code/vim/src/vim ~/bin/

#### Install Vundle (vim plugin manager)

  ```sh
  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

  # from vim run
  :BundleInstall
  ```

#### Compile Plugins (downloaded with vundle)
  
  ```sh
  sudo apt-get install cmake python-dev
  cd ~/.vim/bundle/YouCompleteMe
  ./install.sh
  ```

### Setup Pry
  
  Install gems (or add to a project's gemfile):

  ```sh
  gem install pry pry-doc pry-debugger pry-stack_explorer awesome_print 
  gem install rails-env-switcher rspec-console cucumber-console commands
  ```

```ruby
group :development, :test do
  gem 'pry'
  gem 'pry-doc'
  gem 'pry-debugger'
  gem 'pry-stack_explorer'
  gem 'awesome_print'
  gem 'rails-env-switcher'
  gem 'rspec-console'
  gem 'cucumber-console'
  gem 'commands'
end
```

### Install Solarized (theme)

### overwrite gnome color profiles with solarized light/dark

Create two new color profiles with gnome terminal's preferences gui
(it's not accessible from the command line).

    cd ~/code
    git clone git://github.com/sigurdga/gnome-terminal-colors-solarized.git
    cd gnome-terminal-colors-solarized
    ./install.sh

## Install Headless Browser (for testing)
### phantomjs

The latest instructions are [here](http://code.google.com/p/phantomjs/wiki/BuildInstructions), but the following should probably work:

```sh
sudo apt-get install libqt4-dev libqtwebkit-dev qt4-qmake
cd ~/code
git clone git://github.com/ariya/phantomjs.git && cd phantomjs
git checkout master # or whatever version you want
qmake-qt4 && make

## link it to your path
ln -s ~/code/phantomjs/bin/phantomjs ~/bin/phantomjs

## test
phantomjs --version
```

You're Done.

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
considerably different, but they were fantastic inspiration.
