#!/bin/bash

log () {
  echo "[ $1 ] $2"
}

log "install", "packages"

apt-get install -y \
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



log "source-install", "vim"
apt-get install -y \
  libncurses5-dev \
  libgnome2-dev \
  libgnomeui-dev \
  libgtk2.0-dev \
  libatk1.0-dev \
  libbonoboui2-dev \
  libcairo2-dev \
  libx11-dev \
  libxpm-dev \
  libxt-dev \
  python-dev \
  ruby-dev \
  mercurial
hg clone https://code.google.com/p/vim/ ~/code/vim
cd vim
./configure --with-features=huge \
  --enable-rubyinterp \
  --enable-pythoninterp \
  --enable-perlinterp \
  --enable-gui=gtk2 --enable-cscope --prefix=/usr
make VIMRUNTIMEDIR=/usr/share/vim/vim73
cp src/vim $HOME/bin
cd $HOME



log "setup", "vim"
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
# install plugins
vim +PluginInstall +qall
# compile plugins
apt-get install -y \
  cmake \
  python-dev
cd ~/.vim/bundle/YouCompleteMe
./install.sh
cd $HOME



log "source-install", "tmux"
apt-get install -y \
  libevent-1.4 \
  libevent-dev \
  libncurses5-dev
git clone git://git.code.sf.net/p/tmux/tmux-code ~/code/tmux-code
cd ~/code/tmux-code
git tag -l
git checkout tags/1.9a
autoreconf -fis
./configure
make
make install
cd ~



log "prepare", "ruby"
git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
apt-get install -y \
  libreadline-dev \
  libssl-dev \
  zlib1g-dev
export PATH=~/.rbenv/bin:~/.rbenv/shims:$PATH



# install ruby
ruby_version="2.1.1"
log "build", "ruby $ruby_version"
rbenv install ruby_version
rbenv rehash



log "install", "dev gems"
gem install          \
  pry                \
  pry-doc            \
  pry-debugger       \
  pry-stack_explorer \
  pry-rails          \
  awesome_print      \



log "set", "zsh to default shell"
chsh -s $(which zsh)



log "install", "dotfiles"
cd ~/code/dotfiles
rake install
cd $HOME
