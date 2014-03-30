FROM ubuntu:precise
MAINTAINER thedeeno

ENV HOME /root
ENV LC_ALL C.UTF-8
ENV TERM xterm-256color

run apt-get update

# install thedeeno's dotfiles into home
add lib /root/lib
run /root/lib/prepare
run /root/lib/install_packages
run /root/lib/install_zsh
run /root/lib/install_vim
run /root/lib/install_tmux
run /root/lib/install_rbenv
run /root/lib/install_ruby
run /root/lib/install_gems
run /root/lib/install_dotfiles
run /root/lib/install_vim_plugins

# RUN curl -s https://raw.githubusercontent.com/thedeeno/dotfiles/master/install | sudo bash

WORKDIR /root
ENTRYPOINT ["/root/bin/tmux"]
