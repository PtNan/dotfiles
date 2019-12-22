export ZSH="/Users/xujingnan/.oh-my-zsh"

ZSH_THEME="agnoster"

EDITOR=nvim
export EDITOR
export GOPROXY=https://goproxy.io

plugins=(git \
    z \
    zsh-syntax-highlighting \
    zsh-autosuggestions \
    vi-mode \
    safe-paste \
    extract \
    history-substring-search \
    cp \
    )

alias b='brew'
alias cp='cpv'
alias bu='brew upgrade && brew cleanup'
alias v='nvim'
# alias rgf='rg --files | rg'
alias gom='go mod'
alias setproxy='export all_proxy="socks5://127.0.0.1:1086" && export GOPROXY=https://goproxy.io'
alias -s go=v
alias -s rust=v
alias -s mod=v

function rgf() {
    z $1 && rg --files | rg $2
}

source $ZSH/oh-my-zsh.sh

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
