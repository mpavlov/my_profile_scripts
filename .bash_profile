export CLICOLOR=1
export CLICOLOR_FORCE=1
WHITE_ON_RED="\e[0;37;41m"
BLACK_ON_YELLOW="\e[0;30;43m"
BLACK_ON_CYAN="\e[0;34;46m"
BLACK_ON_RED="\e[0;33;41m"
RED="\e[0;31m"
GREEN="\e[0;32m"
YELLOW="\e[0;33m"
BLUE="\e[0;34m"
MAGENTA="\e[0;35m"
NONE="\e[0m"

source ~/.git_completion.bash
source ~/.git_prompt.sh
PROMPT_COMMAND='exitStatus=$?; echo -ne "\033]0; ${PWD##*/}\007"'
PS_HOST_COLOR=$([[ "$SSH_CLIENT" ]] && echo "\[$RED\]" || echo "\[$GREEN\]")
PS_CONDITIONAL_VIRTUALENV='$([[ "$VIRTUAL_ENV" ]] && echo "\['$MAGENTA'\][$(basename $VIRTUAL_ENV)]")'
PS_CONDITIONAL_GIT_BRANCH='$(__git_ps1 "(%s)")'
PS_CONDITIONAL_EXIT_STATUS='$(if [[ $exitStatus != 0 ]]; then echo "\['$RED'\][$exitStatus]"; fi)'
PS_LOGIN_AND_PWD="${PS_HOST_COLOR}\u@\h\[$NONE\]: \[$YELLOW\]\w"
PS_TIMESTAMP="\[$BLUE\][\t]"
PS_PROMPT_SYMBOL="\[$NONE\]\$ "
export PS1="${PS_LOGIN_AND_PWD} ${PS_CONDITIONAL_GIT_BRANCH}\n${PS_CONDITIONAL_VIRTUALENV}${PS_TIMESTAMP}${PS_CONDITIONAL_EXIT_STATUS}${PS_PROMPT_SYMBOL}"

export LSCOLORS="dxgxcxfxcxegedhbagacad"  # for osx ls
alias vless="vim -u ~/.vimrc.less -"
export LESS='-R'

# personal aliases
alias grep='grep --color=auto'
alias tree='tree -CA'
alias dush='du -sh *'
alias tailf='less -S +F'
alias vim_bash_profile='vim ~/.bash_profile'
alias source_bash_profile='source ~/.bash_profile'
alias refresh_dns_cache='sudo discoveryutil udnsflushcaches'  # as of OSX Yosemite
alias pwdworkon='VENV=$(basename "$PWD") && ((lsvirtualenv -b | grep "$VENV") || mkvirtualenv "$VENV") && workon "$VENV"'
#alias portopen='sudo /sbin/iptables -I INPUT -p tcp -j ACCEPT --dport'  # centos only?
alias mongod='mongod --config /usr/local/etc/mongod.conf'
alias ipynb='cd ~/src/my_ipython_notebooks && pwdworkon && ipython notebook'

# general dev paths
export GITHUB_HOST=github.wgenhq.net
export PYNEST=/opt/wgen/
#export PYTHONSTARTUP=~/.pystartup  # enable if startup scripts desired
export PYTHONPATH=~/bin/python
export PIP_FIND_LINKS='http://packages.wgenhq.net/pynest'

# PATH
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:/usr/local/bin:/usr/local/git/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/bin
export PATH=$PATH:~/bin:~/bin/disco

# virtualenv and wrapper
export VIRTUAL_ENV_DISABLE_PROMPT=1
export WORKON_HOME=~/.virtualenvs
export PROJECT_HOME=~/dev
#export VIRTUALENVWRAPPER_HOOK_DIR=$WORKON_HOME  # no longer needed in new version of virtualenv?
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true
[[ -s "/usr/local/bin/virtualenvwrapper.sh" ]] && source "/usr/local/bin/virtualenvwrapper.sh"

# ruby rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# helper functions
highlight() {
  cat - | perl -pe "s/${1:-ø}/$BLACK_ON_YELLOW$&$NONE/g" | perl -pe "s/${2:-ø}/$BLACK_ON_CYAN$&$NONE/g" | perl -pe "s/${3:-ø}/$BLACK_ON_RED$&$NONE/g"
}

# conda - enable if you use it
#PATH=$HOME/anaconda/bin:$PATH

# ssh agent - enable if you tunnel often
#[[ "$SSH_CLIENT" ]] || ssh-add ~/.ssh/id_rsa
