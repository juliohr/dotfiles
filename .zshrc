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
   
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

#npm alias
alias ns='clear && npm start'

#rails alias
alias be='bundle exec'
alias ber='bundle exec rails'
alias rs='bundle exec rails s'
alias rc='bundle exec rails c' 
alias rt='bundle exec rspec spec/'
alias cart='bin/rspec'
alias rdb='bundle exec rails db:migrate'

#screen sharing
function pair() {
 COMPUTER_IP=$(dscacheutil -q host -a name $1.local | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}')
  open vnc://$COMPUTER_IP
}

alias rwifi="networksetup -setairportpower en0 off && networksetup -setairportpower en0 on"

### end of Ambush settings

#mongdb 3.4 setting
export PATH="/usr/local/opt/mongodb@3.4/bin:$PATH"

#elm format settings
export PATH="$PATH:/Users/julio.feijo/.asdf/shims/elm-format"

#asdf installation guide steps
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

#ruby alias

alias rubomod='git ls-files -m | xargs ls -1 2>/dev/null | grep '\.rb$' | xargs bundle exec rubocop -a'
alias rubocommit='git diff-tree -r --no-commit-id --name-only @\{u\} head | xargs bundle exec rubocop -a'

#CA aliases

alias murmur='cd ~/workspace/CultureAmp/murmur'
alias influx='cd ~/workspace/CultureAmp/influx'
alias cafe='bin/webpack-dev-server --host=0.0.0.0 --port=9876 --disable-host-check --progress'
alias caee='script/employees_event_reader'
alias cabgjob='bin/rake jobs:work'
alias is='be foreman start'
alias iw='USE_LOCAL_RUNNER=true script/work'
