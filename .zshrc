# PATH
export EDITOR="nvim"
export GOPATH=$HOME/go
export FZF_DEFAULT_COMMAND="git ls-tree -r --name-only HEAD || rg --hidden --files"
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH:$GOBIN

# alias
alias zshconf='nvim ~/.zshrc'
alias packerconf='nvim ~/.config/nvim/lua/plugins.lua'
alias rgf='rg --files | rg'
alias px='export all_proxy=http://127.0.0.1:7890'
alias upx='unset all_proxy'
alias dc='docker compose'
px

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node \
    OMZ::plugins/extract\
    OMZ::plugins/safe-paste \
    OMZ::plugins/sudo \
    zdharma/history-search-multi-word

zinit ice lucid wait="0" atload='_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions

zinit ice lucid wait='0'
zinit light zsh-users/zsh-completions

zinit ice lucid wait='0' atinit='zpcompinit'
zinit light zdharma/fast-syntax-highlighting

zinit light agkozak/zsh-z

zinit snippet OMZ::lib/clipboard.zsh

zinit snippet OMZ::lib/completion.zsh

zinit snippet OMZ::lib/history.zsh

zinit snippet OMZ::lib/key-bindings.zsh

zinit snippet OMZ::lib/git.zsh

zinit snippet OMZ::lib/theme-and-appearance.zsh

zinit snippet OMZ::plugins/git/git.plugin.zsh

zinit snippet OMZ::plugins/golang/golang.plugin.zsh

zinit snippet OMZ::plugins/brew/brew.plugin.zsh

zinit ice as"completion"
zinit snippet OMZ::plugins/docker/_docker

zinit as"null" wait"2" lucid from"gh-r" for \
    sbin"fzf"  junegunn/fzf

zinit as"null" wait"2" lucid from"gh-r" for \
    sbin"*/rg" BurntSushi/ripgrep

### End of Zinit's installer chunk

eval "$(starship init zsh)"
