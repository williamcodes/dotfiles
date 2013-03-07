
source $HOME/.zsh/antigen.zsh
antigen-prezto-lib
antigen-lib

# Download/install bundles
# antigen-bundle git
antigen-bundle https://github.com/sorin-ionescu/prezto.git modules/git
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
PROMPT='%(1j.%j.)%{$reset_color%}%{$fg[red]%}:%{$reset_color%}%{$fg[cyan]%}%0~%{$reset_color%}%{$fg[red]%}|%{$reset_color%}$(git_prompt_info)%{$fg[cyan]%}⇒%{$reset_color%}  '

# PATH
export PATH="$HOME/.bin:$ZSH/bin:$PATH"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# use dvorak as the basis for spell checking
# setopt DVORAK

export EDITOR='vim'

unsetopt correct_all
