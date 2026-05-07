# Git — bàsics
alias gst='git status'
alias ga='git add'
alias gc='git commit'
alias gca='git commit -a'
alias gc!='git commit --amend'
alias gp='git push'
alias gl='git pull'
alias gm='git merge'

# Git — branques
alias gco='git checkout'
alias gcb='git checkout -b'
alias gb='git branch'
alias gbd='git branch -d'

# Git — diff & log
alias gd='git diff'
alias gdca='git diff --cached'
alias glog='git log --oneline --decorate --graph'

# Log interactiu amb fzf: navega commits i veu el diff al preview
gfzf() {
  git log --oneline --decorate --color=always "$@" | \
    fzf --ansi --no-sort --reverse \
        --preview 'git show --stat --color=always {1}' \
        --preview-window=right:60% \
        --bind 'enter:execute(git show --color=always {1} | less -R)' \
        --bind 'ctrl-d:preview-page-down,ctrl-u:preview-page-up'
}

# Git — stash
alias gsta='git stash push'
alias gstp='git stash pop'
alias gstl='git stash list'

# Git — rebase
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
