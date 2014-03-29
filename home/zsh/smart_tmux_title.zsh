# Change tmux title to command name before executing
function preexec() {
  # strip bundle exec and only print first word of command
  TITLE=$(echo $1 | sed 's/bundle exec//' | awk '{print $1;}')
  CWD=$(basename $(pwd))
  tmux rename-window "$CWD-$TITLE"
}

# Change tmux title to cwd after command
function precmd() {
  CWD=$(basename $(pwd))
  tmux rename-window $CWD
}
