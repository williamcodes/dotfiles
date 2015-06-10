alias reload!='. ~/.zshrc'
alias e='vim'

# vagrant
alias vs="vagrant status"
alias vu="vagrant up"
alias vp="vagrant provision"

# ssh keys
# pipe public key to clipboard.
alias pubkey="more ~/.ssh/id_dsa.public | pbcopy | echo '=> Public key copied to pasteboard.'"

# cd
alias ..='cd ..'

# ls aliases
# alias ls='ls -la'
# alias la='ls -A --color'
# alias l='ls -CF --color'
# alias ls='ls -o --color --group-directories-first'

# ruby
alias be='bundle exec'

# programs
alias mou='open /Applications/Mou.app'

# git
alias grvd='git review develop'
alias gcma='git commit --amend'
alias gcod='git checkout develop'
alias gcob='git checkout -b'
alias gst='git status'

# alias gl='git pull --prune'
# alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
# alias gp='git push'
# alias gd='git diff'
# alias gc='git commit'
# alias gca='git commit -a'
# alias gco='git checkout'
# alias gb='git branch'
# alias gs='git status -sb'
# alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"

# docker
alias dk='docker'
alias gear='nocorrect gear'
alias gearbox="sudo -E bundle exec gearbox"

# knife
alias kcu='knife cookbook upload'
alias krff='knife role from file' 

# shortcut to add aliases
alias zea='$EDITOR ~/.zsh/aliases.zsh'

# todo.sh: https://github.com/ginatrapani/todo.txt-cli
function t() { 
  if [ $# -eq 0 ]; then
    todo.sh ls
  else
    todo.sh $*
  fi
}

# always start tmux with 256 color support
alias tmux="tmux -2"
