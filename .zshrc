# prompt
setopt prompt_subst  # enable variable substitution
source ~/.git_prompt.sh
PS_L1="%F{blue}╭─"
PS_L2="%F{blue}╰─"
PS_TIME="%F{blue}[%*]"
PS_LOGIN="%F{green}%n@%m"
PS_PWD="%F{yellow}%~"
PS_BRANCH='$(__git_ps1 " (%s")$(changes=$(git status --porcelain 2>/dev/null); [[ "$changes" != "" ]] && echo "%F{cyan} 𝚫%F{yellow}")$(__git_ps1 ")")'
PS_ELAPSED='[]'
PS_EXIT_STATUS="%0(?.. %F{red}[%?])"
PS_PROMPT=" %F{none}$ "
PS1="${PS_L1}${PS_TIME} ${PS_LOGIN}: ${PS_PWD}${PS_BRANCH}
${PS_L2}${PS_ELAPSED}${PS_EXIT_STATUS}${PS_PROMPT}"

# git completion
fpath=(~/.zsh $fpath)
zstyle ':completion:*:*:git:*' script ~/.git_completion.bash
autoload -Uz compinit && compinit

# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

#TODO
#- conditional ssh red PS_LOGIN
#- elapsed time
#- migrate tool configs from bash_profile
