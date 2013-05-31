
# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# Source customizations
for file in $HOME/.zsh/**/*.zsh; do
  if [ -f "$file" ] ; then
    source "$file"
  fi
done

# Customizations
zstyle ':prezto:module:prompt' theme 'sorin'
# zstyle ':prezto:module:terminal' auto-title 'no'

autoload -U colors && colors

# PROMPT='%(1j.%j.)%{$reset_color%}%{$fg[red]%}:%{$reset_color%}%{$fg[cyan]%}%0~%{$reset_color%}%{$fg[red]%}|%{$reset_color%}$(git_prompt_info)%{$fg[cyan]%}⇒%{$reset_color%}  '

eval "$(rbenv init -)"

# use dvorak as the basis for spell checking
# setopt DVORAK
unsetopt correct_all
