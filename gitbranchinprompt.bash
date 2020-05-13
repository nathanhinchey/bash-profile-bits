# Git branch in prompt.

git_color() {
  # `git status --porcelain` returns empty string if the working tree is clean
  # `2> /dev/null` just discards stderr
  if [[ $(git status --porcelain 2> /dev/null) ]]; then
    echo "33m" #yellow for not clean
  else
    echo "32m" #green for clean
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

# <directory name> (<branch name colored for cleanliness>) $
basic="\[\033[39m\]\W\[\033[\$(git_color)\]\$(parse_git_branch)\[\033[34m\] $\[\033[00m\] "

# <diretory name> <timestamp in blue> (<branch name colored for cleanliness>) $
with_timestamp="\W\[\033[94m\] \t\[\033[\$(git_color)\]\$(parse_git_branch)\[\033[34m\] $\[\033[00m\] "

# <username>@<host>: <directory name> (branch name) $
with_user_host="\[\033[90m\]\u@\h: "$basic

export PS1=$with_user_host
