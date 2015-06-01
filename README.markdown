# thedeeno's ~/
My development environment

```
# install tools and dependencies + download source codes
curl -s https://raw.githubusercontent.com/thedeeno/dotfiles/master/install | sh

# link dotfiles
(cd $HOME/code/dotfiles; ./relink)
```

# Post Install
Configure desktop wall movement with ccsm
Adjust keyboard delay/speed via Keyboard Menu
Add Custom Keyboard Shortcuts in Keyboard > Shortcuts

  Ctrl + Alt + T
  Name: Launch Terminal Maximized
  Command: gnome-terminal --window --maximize

  Ctrl + Alt + F
  Name: Launch Firefox
  Command: firefox

# Manual Install

## *NIX

### Clone Dotfiles

<!-- ### Install node version manager (and the build plugin) -->
<!--  -->
<!--     git clone https://github.com/riywo/ndenv ~/.ndenv -->
<!--     git clone https://github.com/riywo/node&#45;build.git ~/.ndenv/plugins/node&#45;build -->
<!--  -->
### Install Packages

    sudo apt-get install -y  \
      curl               \
      build-essential    \
      git-core           \
      git-gui            \
      gitg               \
      libssl-dev         \
      libxml2-dev        \
      libxslt-dev        \
      openssl            \
      zsh

### Install Rubies

    # clone rbenv and ruby-build
    git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
    git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

    # install readline
    sudo apt-get install libreadline-dev
    # install zlib
    sudo apt-get install libssl-dev zlib1g-dev

    # setup current session
    export PATH=~/.rbenv/bin:~/.rbenv/shims:$PATH

    # build rubies
    rbenv install <your version>
    rbenv rehash

### Make zsh default shell

    chsh -s $(which zsh)

### Install Dotfiles

    git clone git://github.com/thedeeno/dotfiles ~/code/dotfiles 
    cd ~/code/dotfiles
    rake install

### Install GOLANG

Download and Install

    wget http://go.googlecode.com/files/go1.2.1.linux-amd64.tar.gz -O /tmp/go
    sudo tar -C /usr/local -xzf /tmp/go
    sudo rm /tmp/go

### Install TMUX from source

    sudo apt-get install libevent-1.4 libevent-dev libncurses5-dev
    git clone git://git.code.sf.net/p/tmux/tmux-code ~/code/tmux-code 
    git tag -l
    git checkout tags/1.9a

    autoreconf -fis
    ./configure
    make
    sudo make install


### Install vim from source (to use latest plugins)

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

### Install Vundle (vim plugin manager)

    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

    # install dotfile's vim plugins by running in vim:
    :BundleInstall

### Compile Plugins (downloaded with vundle)
  
```sh
sudo apt-get install cmake python-dev
cd ~/.vim/bundle/YouCompleteMe
./install.sh
```

### Setup Pry
  
Install pry plugins and runtime development gems:

    gem install          \ 
      pry                \
      pry-doc            \
      pry-debugger       \
      pry-stack_explorer \
      pry-rails          \
      awesome_print      \

## Install Phantomjs from source (headless browser)

The latest instructions are [here](http://code.google.com/p/phantomjs/wiki/BuildInstructions), but the following should probably work:

    sudo apt-get install libqt4-dev libqtwebkit-dev qt4-qmake
    cd ~/code
    git clone git://github.com/ariya/phantomjs.git && cd phantomjs
    git checkout master # or whatever version you want
    qmake-qt4 && make

    # link it to your path
    ln -s ~/code/phantomjs/bin/phantomjs ~/bin/phantomjs

    # test
    phantomjs --version

You're Done.

## Notes
- `c` is an autocomplete shortcut for `~/code`. For example, 
  `c myp<tab>` will autocomplete to `~/code/myproject`.
- `h` autocompletes your home directory.
- `check [filename]` is a quick script that tells you whether a domain is
  available to register.
- `backup` is a quick hook into `rsync` to backup a selection of files.

## Ssh setup notes (only relevant for me)

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

# TODO

DONE:
  make s a motion
  add vim-repeat
  remap spacebar write to freeup spacebar namespace
  add space bar namespace for navigation
  add unimpaired
  mechanism to change html tags
  better scrolling

DOING:

TODO:
  Change error colors to be more subtle
  snippets via snipmate
  single command to open browser next to terminal in split
  integrate https://github.com/suan/vim-instant-markdown
  javascript function text object
  create list of commands to practice on daily
  add mappings for unimpaired
  make `m# move tab in tmux
  getting silver search to work better (or find something else)
  better global search/replace
  wtf is with our colos
  better multi-line comments in js/css
  steal colorscheme fallback from andrew fallows
  stop markdown from auto collapsing
  steal fast snippet editing shortcuts from andrew
  github-falvored-marked
  task-paper
