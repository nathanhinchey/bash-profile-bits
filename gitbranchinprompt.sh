# Git branch in prompt.

git_color() {
  # `git status --porcelain` returns empty string if the working tree is clean
  # `2> /dev/null` just discards stderr
  if [[ $(git status --porcelain 2> /dev/null) ]]; then
    echo "33m" #yellow
  else
    echo "32m" #green
  fi
}

parse_git_branch() {
  # `git branch 2> /dev/null | sed` run sed on git branch, discarding stderr
  # `sed -e '/^[^*]/d'` deletes lines not beginning with * literal
  # capture groups are surrouded with escaped parentheses
  # `/* \(.*\)/` finds a * literal, space literal, then captures the rest
  # `sed -e 's/toss \(keep\)/(\1)/'` replaces `toss keep` with `(keep)`
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\W\[\033[\$(git_color)\]\$(parse_git_branch)\[\033[34m\] $\[\033[00m\] "
#version with timestamp:
# export PS1="\W\[\033[94m\] \t\[\033[\$(git_color)\]\$(parse_git_branch)\[\033[34m\] $\[\033[00m\] "
