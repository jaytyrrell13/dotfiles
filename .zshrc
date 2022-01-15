export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/Users/jay/.composer/vendor/bin:$PATH"
export EDITOR="nvim"

source ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=true

setopt PROMPT_SUBST ; PS1='%B%F{2}%n%b%F{3}:%B%F{4}%c$(__git_ps1 " (%s)")%b%F{15}\$ '

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
alias cda="composer dump-autoload"
alias jigsaw="vendor/bin/jigsaw"

alias chronicle="cd ~/Code/chronicle && nvim ."
alias monies="cd ~/Code/monies && nvim ."

alias o="open ."
alias sublime="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl ."

function pag() {
    ps aux | grep $1
}

function createBranch() {
    BRANCH=$1
    ORIGIN_BRANCH=${2:-origin/master}

    git fetch
    git checkout -b ${BRANCH} ${ORIGIN_BRANCH}
    git push origin ${BRANCH}
    git branch --set-upstream-to=origin/${BRANCH} ${BRANCH}
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
