# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Initialise zsh's completion system (tab-completion). Oh My Zsh used to do
# this for us; without it, tab-completion (e.g. git branch names) is off.
autoload -Uz compinit && compinit

# Fix option arrow navigation
bindkey '^[[2;3C' forward-word
bindkey '^[[1;3D' backward-word
# Homebrew config
HOMEBREW_NO_ENV_HINTS=1

# ASDF config
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

export GITLAB_USERNAME="julio.feijo"

# Gradle setup
GRADLE_USER_HOME=$HOME/.gradle

# Tfbackend config
typeset -U path PATH
path=(~/.local/bin $path)
export PATH

# Git aliases
alias g='git'
alias gst='git status -sb'
alias gco='git checkout'
# Make the gco alias inherit `git checkout` completion, so typing a partial
# branch name and pressing tab completes it (as Oh My Zsh's git plugin did).
# Uses git's _git completion, telling it to complete gco as `git checkout`.
compdef _git gco=git-checkout
alias gcb='git checkout -b'
alias gd='git diff'
alias gds='git diff --staged'
alias ga='git add'
alias gc='git commit -v'
alias gpr='git pull --rebase'
alias gp='git push'
alias gpsup='git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)'
alias gc!='git commit --verbose --amend'
alias gcmsg='git commit -m'
alias gl='git log'
alias gls='git log --oneline --decorate'
alias glg="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short"
alias gbc='git branch | grep -e ^* | awk "{ print \$2 }" | pbcopy'
alias gpfl='git push --force-with-lease'
alias gprm='git pull --rebase origin main'
alias grc='git rebase --continue'
alias gbs='search_branch'
alias gcmb='git remote prune origin && git branch --merged | egrep -v "main" | xargs git branch -d'
alias gclb='git branch --merged | \
  grep -v "main" > \
  /tmp/merged-branches && \
  vi /tmp/merged-branches && \
  xargs git branch -d < /tmp/merged-branches'
function search_branch() {
  git branch -l | grep "$1"
}
alias gprw='gh pr view -w'

# Gradle alias
alias bgb='bin/gradle build'
alias bgc='bin/gradle check'
alias gwb='./gradlew build'
alias gwc='./gradlew check'

export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
