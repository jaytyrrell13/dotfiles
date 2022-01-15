source ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=true

PROMPT="\u:\w\$ "

# "\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$"

PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1 " (%s)")\$ '

alias cl="clear"
alias _="sudo"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ll="ls -lah"

alias gst="git status"
alias ga="git add"
alias gaa="git add ."
alias gpl="git pull"
alias gc="git commit"
alias gps="git push"
alias gco="git checkout"
alias gb="git branch"
alias gm="git merge"
alias gcd="git checkout dev"
alias gcm="git checkout master"
alias gcp="git cherry-pick"
alias nah="git reset --hard; git clean -df;"

alias a="php artisan"
alias p="vendor/bin/phpunit"

function pag() {
    ps aux | grep $1
}

function createBranch() {
    BRANCH=$1
    ORIGIN_BRANCH=${2:-origin/master}

    stp
    git fetch
    git checkout -b ${BRANCH} ${ORIGIN_BRANCH}
    git push origin ${BRANCH}
    git branch --set-upstream-to=origin/${BRANCH} ${BRANCH}
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
