# your project folder that we can `c [tab]` to
export PROJECTS=~/code

# source every .zsh file in this rep
for config_file (~/zsh/*.zsh) source $config_file

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && . ~/.localrc

# initialize autocomplete here, otherwise functions won't be loaded
autoload -U compinit
compinit
