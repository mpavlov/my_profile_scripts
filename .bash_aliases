alias grep='grep --color=auto'
alias tree='tree -CA'
alias tailf='less -S +F'
alias vim_bash_profile='vim ~/.bash_profile'
alias source_bash_profile='source ~/.bash_profile'
alias refresh_dns_cache='sudo killall -HUP mDNSResponder'  # as of OSX 10.10.4
alias pwdworkon='VENV=$(basename "$PWD") && ((lsvirtualenv -b | grep "^$VENV\$") || mkvirtualenv "$VENV") && workon "$VENV"'
alias ssh='ssh -o StrictHostKeyChecking=no -o IdentitiesOnly=yes'
alias ipynb='cd ~/src/my_ipython_notebooks && pwdworkon && ipython notebook'
alias vless="vim -u ~/.vimrc.less -"
