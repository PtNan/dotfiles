# PATH
export EDITOR="nvim"
export GOPATH=$HOME/go
export FZF_DEFAULT_COMMAND='fd --type f'
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH:$GOBIN

DISABLE_LS_COLORS=true

# alias
alias nvimconfig='nvim ~/.config/nvim/init.vim'
alias zshconfig='nvim ~/.zshrc'
alias rgf='rg --files | rg'
alias psrg='ps -a | rg'
alias px='export all_proxy=http://127.0.0.1:7890'
alias upx='unset all_proxy'
alias ls=exa
alias dc='docker-compose'

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
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node \
    OMZ::plugins/extract\
    OMZ::plugins/safe-paste \
    OMZ::plugins/sudo \
    zdharma/history-search-multi-word

zinit ice lucid wait="0" atload='_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions
zinit ice lucid wait='0' atinit='zpcompinit'
zinit light zdharma/fast-syntax-highlighting
zinit ice lucid wait='0'
zinit light zsh-users/zsh-completions
zinit ice \
  atclone'rm -rf conf.d; rm -rf functions; rm -f *.fish;' \
  pick'init.sh' \
  nocompile'!' \
  wait'!0' 
zinit light b4b4r07/enhancd 

zinit as="null" wait="1" lucid from="gh-r" for \
    mv="exa* -> exa"  sbin       ogham/exa \
    mv="*/rg -> rg"   sbin		BurntSushi/ripgrep \
    mv="fd* -> fd"    sbin="fd/fd"  @sharkdp/fd

zinit ice from"gh-r" as"program"
zinit load junegunn/fzf-bin

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
zinit ice as"completion"
zinit snippet OMZ::plugins/docker-compose/_docker-compose
zinit ice as="completion"
zinit snippet OMZ::plugins/cargo/_cargo
### End of Zinit's installer chunk

eval "$(starship init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
