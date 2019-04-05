source ~/.bash_aliases

export HISTCONTROL=ignoredups:erasedups  # avoid duplicates in shell history
export HISTSIZE=1000000  # limit number of commands in history
shopt -s histappend  # when the shell exits, append to the history file instead of overwriting it

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
PROMPT_COMMAND='exitStatus=$?; echo -ne "\033]0; ${PWD##*/}\007"; '$PROMPT_COMMAND
PS_HOST_COLOR=$([[ "$SSH_CLIENT" ]] && echo "\[$RED\]" || echo "\[$GREEN\]")
PS_CONDITIONAL_VIRTUALENV='$([[ "$VIRTUAL_ENV" ]] && echo "\['$MAGENTA'\][$(basename $VIRTUAL_ENV)]")'
PS_CONDITIONAL_GIT_BRANCH='$(__git_ps1 "(%s)")'
PS_CONDITIONAL_EXIT_STATUS='$(if [[ $exitStatus != 0 ]]; then echo "\['$RED'\][$exitStatus]"; fi)'
PS_LOGIN_AND_PWD="${PS_HOST_COLOR}\u@\h\[$NONE\]: \[$YELLOW\]\w"
PS_TIMESTAMP="\[$BLUE\][\t]"
PS_PROMPT_SYMBOL="\[$NONE\]\$ "
export PS1="${PS_LOGIN_AND_PWD} ${PS_CONDITIONAL_GIT_BRANCH}\n${PS_CONDITIONAL_VIRTUALENV}${PS_TIMESTAMP}${PS_CONDITIONAL_EXIT_STATUS}${PS_PROMPT_SYMBOL}"

export LSCOLORS="dxgxcxfxcxegedhbagacad"  # for osx ls
export LESS='-R'

export PYTHONPATH=~/bin/python

# PATH
export PATH=$PATH:/usr/local/bin:/usr/local/git/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/bin
export PATH=$PATH:~/bin

# helper functions
highlight() {
  cat - | perl -pe "s/${1:-ø}/$BLACK_ON_YELLOW$&$NONE/g" | perl -pe "s/${2:-ø}/$BLACK_ON_CYAN$&$NONE/g" | perl -pe "s/${3:-ø}/$BLACK_ON_RED$&$NONE/g"
}

forever() {
  local delay=$1; shift
  while True; do $@; echo -n "┈"; sleep $delay; echo "┈┈"; done
}

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# nvm
export NVM_DIR="/Users/milen/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# gcloud
source '/Users/milen/Applications/google-cloud-sdk/path.bash.inc'
source '/Users/milen/Applications/google-cloud-sdk/completion.bash.inc'

# jenv
export JAVA_HOME=$(/usr/libexec/java_home)
eval "$(jenv init -)"
