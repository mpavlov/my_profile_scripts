# prompt
PROMPT_EOL_MARK="🚫"
setopt prompt_subst  # enable variable substitution
function preexec() {
  time_start=$(print -P %D{%s%3.})
}
function precmd() {
  if [ $time_start ]; then
    now=$(print -P %D{%s%3.})
    elapsed=$(echo "scale=3; ($now - $time_start) / 1000" | bc)

    PS_ELAPSED="[+${elapsed}s]"
    unset time_start
  fi
}
source ~/.git_prompt.sh
PS_L1="%F{blue}╭─"
PS_L2="%F{blue}╰─"
PS_TIME="%F{blue}[%*]"
PS_LOGIN="%F{green}%n@%m"
PS_PWD="%F{yellow}%~"
PS_BRANCH='$(__git_ps1 " (%s")$(changes=$(git status --porcelain 2>/dev/null); [[ "$changes" != "" ]] && echo "%F{cyan} 𝚫%F{yellow}")$(__git_ps1 ")")'
PS_EXIT_STATUS="%0(?.. %F{red}[%?])"
PS_PROMPT=" %F{none}$ "
PS1="${PS_L1}"'${PS_ELAPSED}'" ${PS_LOGIN}: ${PS_PWD}${PS_BRANCH}
${PS_L2}${PS_TIME}${PS_EXIT_STATUS}${PS_PROMPT}"

# aliases
alias python=python3

# PATH
export PATH=~/bin:$PATH

# colors
export CLICOLOR=1
export LESS='-R'
export LSCOLORS="dxgxcxfxcxegedhbagacad"  # for osx ls
zstyle ':completion:*' list-colors ${(s.:.)LSCOLORS}

# git completion
fpath=(~/.zsh $fpath)
zstyle ':completion:*:*:git:*' script ~/.git_completion.bash
autoload -Uz compinit && compinit

# helper functions
highlight() {
  BLACK_ON_YELLOW="\e[30;43m"
  BLACK_ON_CYAN="\e[30;46m"
  BLACK_ON_RED="\e[30;41m"
  NONE="\e[0m"
  cat - | perl -pe "s/${1:-ø}/$BLACK_ON_YELLOW$&$NONE/g" | perl -pe "s/${2:-ø}/$BLACK_ON_CYAN$&$NONE/g" | perl -pe "s/${3:-ø}/$BLACK_ON_RED$&$NONE/g"
}
forever() {
  local delay=$1; shift
  while True; do $@; echo -n "┈"; sleep $delay; echo "┈┈"; done
}

# openai
export OPENAI_API_KEY=$(cat $HOME/.secrets/openai.key)

# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/mpavlov/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/mpavlov/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/mpavlov/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/mpavlov/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# pyenv
export PYENV_VIRTUALENV_DISABLE_PROMPT=1  # this will be the default in future versions
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mpavlov/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/mpavlov/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mpavlov/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/mpavlov/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
