export PATH=$PATH:/Users/jfeijo/Downloads
export PATH=$PATH:/usr/local
alias __git_ps1="git branch 2>/dev/null | grep '*' | sed 's/ \(.*\)/(\1)/'"
alias g='git'
alias gbc='git branch | grep -e ^* | awk "{ print \$2 }" | pbcopy'
alias pam='cd ~/workspace/GAP/pam'
alias pamweb='cd ~/workspace/GAP/pam/PamWeb'
alias gap='cd ~/workspace/GAP/'
alias gr='grunt'
alias graun='grunt autotest:unit:nodirective'
alias grt='grunt test'
alias grtu='grunt test:unit'
alias grd='grunt dev'
alias grb='grunt build'


export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/bin:$PATH


pete_db() {
	psql -h sflpamdbc001.gid.gap.com -U allocation gidallocd1
}

pete_db_perf(){
	psql -h sflpamdbz001.gid.gap.com -U allocation_id1 gdallocc1
}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
