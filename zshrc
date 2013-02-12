
source $HOME/.zsh/antigen.zsh
antigen-lib

# Download/install bundles
antigen-bundle git
antigen-bundle ruby
antigen-bundle command-not-found

# Load the theme.
antigen-theme "pygmalion"

# Tell antigen we're done.
antigen-apply

# Source customizations
ZDOTDIR=$HOME/.zsh

for file in $ZDOTDIR/**/*.zsh; do
  # don't load antigen twice (maybe it should be somewhere else)
  if [ "$file" = "$ZDOTDIR/antigen.zsh" ] ; then
    continue
  fi

  if [ -f "$file" ] ; then
    source "$file"
  fi
done

# Customizations

# PATH
export PATH=".:bin:$HOME/bin:/usr/local/bin:/usr/local/sbin:$ZSH/bin:$PATH"
export MANPATH="/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"

# use dvorak as the basis for spell checking
# setopt DVORAK

export EDITOR='vim'

unsetopt correct_all
