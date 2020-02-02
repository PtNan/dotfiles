export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

EDITOR=nvim
export EDITOR
export GOPROXY="https://goproxy.io"
export GOPATH="$HOME/go"
export PATH=$PATH:$GOPATH/bin

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$ZPLUG_HOME/zsh_history
setopt append_history
setopt share_history
setopt long_list_jobs
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_find_no_dups
setopt hist_reduce_blanks
setopt hist_verify
setopt hist_no_store
setopt interactivecomments
zstyle ':completion:*' rehash true

alias b='brew'
alias cp='cpv'
alias bu='brew upgrade && brew cleanup'
alias v='nvim'
alias rgf='rg --files | rg'
alias gom='go mod'
alias setproxy='export all_proxy="socks5://127.0.0.1:1086" && export GOPROXY=https://goproxy.io'
alias -s go=v
alias -s rust=v
alias -s mod=v

zplug "mafredri/zsh-async", from:"github", use:"async.zsh"
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
zplug "zsh-users/zsh-completions", defer:2
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:2
zplug "rimraf/k" 
zplug "b4b4r07/enhancd", use:init.sh
zplug "lib/completion", from:oh-my-zsh
zplug "plugins/cp",   from:oh-my-zsh
zplug "plugins/docker",   from:oh-my-zsh
zplug "plugins/docker-compose",   from:oh-my-zsh
zplug "plugins/extract",   from:oh-my-zsh
zplug "plugins/git",   from:oh-my-zsh
zplug "plugins/safe-paste",   from:oh-my-zsh
zplug "plugins/vi-mode",   from:oh-my-zsh

if zplug check b4b4r07/enhancd; then
    export ENHANCD_FILTER=fzf
fi

zplug load

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
