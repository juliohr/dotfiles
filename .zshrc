# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="sunrise"
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# export MANPATH="/usr/local/man:$MANPATH"

#LOAD RVM CONFIGS

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

#fix for alt + arrow jump word on bash

bindkey "[C" forward-word
bindkey "[D" backward-word

#Git aliases
alias __git_ps1="git branch 2>/dev/null | grep '*' | sed 's/ \(.*\)/(\1)/'"
alias g='git'
alias gbc='git branch | grep -e ^* | awk "{ print \$2 }" | pbcopy'
alias gpfl='git push --force-with-lease'
alias gbs='search_branch'
alias gcmb='git prune origin && git branch --merged | egrep -v "master" | xargs git branch -d'
alias gclb='git branch --merged | \
  grep -v "master" > \
  /tmp/merged-branches && \
  vi /tmp/merged-branches && \
  xargs git branch -d < /tmp/merged-branches'
function search_branch() {
  git branch -l | grep "$1"
}

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

#npm alias
alias ns='clear && npm start'

#ruby alias
alias srb='bundle exec standardrb --fix'

#rails alias
alias be='bundle exec'
alias br='bin/rails'
alias rs='bin/rails s'
alias rc='bin/rails c' 
alias rt='bin/rspec spec/'
alias cart='bin/rspec'
alias rdb='bin/rails db:migrate'

#screen sharing
function pair() {
 COMPUTER_IP=$(dscacheutil -q host -a name $1.local | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}')
  open vnc://$COMPUTER_IP
}

#mongdb 3.6 setting
export PATH="/usr/local/opt/mongodb-community@3.6/bin:$PATH"

#elm format settings
export PATH="$PATH:/Users/julio.feijo/.asdf/shims/elm-format"

#asdf installation guide steps
. $HOME/.asdf/asdf.sh

# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit
compinit

#ruby alias

alias rubomod='git ls-files -m | xargs ls -1 2>/dev/null | grep '\.rb$' | xargs bundle exec rubocop -a'
alias rubocommit='git diff-tree -r --no-commit-id --name-only @\{u\} head | xargs bundle exec rubocop -a'

#CA aliases

alias ca='cd ~/workspace/CultureAmp'

# installed by cultureamp/big-frontend-repo
bfr() {
  ${HOME}/workspace/CultureAmp/big-frontend-repo/tools/cli/run.sh $@
}
