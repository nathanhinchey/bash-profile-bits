# 
# e.g. reset-branch base leaf
# runs `git reset` on output of `git merge-base base leaf`,
# which will be a bunch of commit shas
reset-branch() {
  git reset $(git merge-base $@)
}
