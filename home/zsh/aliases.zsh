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
alias lsr='ls -altr'
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
alias git="hub"
alias gst="git status"
alias gl="git pull"
alias glr="git pull --rebase"
alias gp="git push"
alias gd="git diff | mate"
alias gc="git commit -v"
alias gca="git commit -v -a"
alias gb="git branch"
alias gba="git branch -a"
alias gco="git checkout"
alias gcob="git checkout -b"
alias ga="git add"
alias ga.="git add --all ."
alias gcm="git commit -m"
alias gcma="git commit --amend"
alias gcod="git checkout develop"
alias gf="git fetch"
alias grb="git rebase"
alias grvd="git review develop"
alias grbd="git rebase develop"
alias gsh="git stash"
alias gshp="git stash pop"
alias gshl="git stash list"
alias gbr="git branch"
alias gbra="git branch --all"
alias gbrd="git branch -D"
alias gpr="git pull-request"
alias st="open -a SourceTree"

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

#RSpec
alias r="rspec --color --format=documentation"
alias rf="rspec --color --fail-fast --order=default"

#Zsh
alias zrc="subl ~/.zshrc"
alias cdx="cd /Users/William.Jeffries/Documents/Projects/xhome-web"
alias rchrome="osascript -e 'tell application \"Google Chrome\" to tell the active tab of its first window to reload'"

#Sublime
alias s.="subl ."

#Neovim
alias n="nvim"
