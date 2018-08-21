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
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\W\[\033[\$(git_color)\]\$(parse_git_branch)\[\033[34m\] $\[\033[00m\] "
#version with timestamp:
# export PS1="\W\[\033[94m\] \t\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
