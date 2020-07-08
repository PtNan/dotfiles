# PATH
export EDITOR="nvim"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH:~/.cargo/bin
export GOPROXY=https://goproxy.io
export NVM_LAZY_LOAD=true
export NVM_LAZY_LOAD_EXTRA_COMMANDS=('nvim')

# alias
alias zshconfig='nvim ~/.zshrc'
alias rgf='rg --files | rg'
alias psrg='ps -a | rg'
alias gom='go mod'
alias proxy='export all_proxy=socks5://127.0.0.1:7891'
alias unproxy='unset all_proxy'
alias b='brew'
alias bu='brew update && brew cleanup'

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

zinit ice lucid wait="0" atload='_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions
zinit ice lucid wait='0' atinit='zpcompinit'
zinit light zdharma/fast-syntax-highlighting
zinit ice lucid wait='0'
zinit light zsh-users/zsh-completions

zinit snippet OMZ::lib/clipboard.zsh
zinit snippet OMZ::lib/completion.zsh
zinit snippet OMZ::lib/history.zsh
zinit snippet OMZ::lib/key-bindings.zsh
zinit snippet OMZ::lib/git.zsh
zinit snippet OMZ::lib/theme-and-appearance.zsh
zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit ice as"completion"
zinit snippet OMZ::plugins/docker/_docker
zinit ice as"completion"
zinit snippet OMZ::plugins/docker-compose/_docker-compose

zinit light lukechilds/zsh-nvm
zinit load zdharma/history-search-multi-word
zinit ice wait'!0'
zinit light b4b4r07/enhancd

zinit as="null" wait="1" lucid from="gh-r" for \
    mv="exa* -> exa"  sbin       ogham/exa \
    mv="*/rg -> rg"   sbin		BurntSushi/ripgrep \
    mv="fd* -> fd"    sbin="fd/fd"  @sharkdp/fd

zinit ice from"gh-r" as"program"
zinit load junegunn/fzf-bin
zinit ice mv="*.zsh -> _fzf" as="completion"
zinit snippet 'https://github.com/junegunn/fzf/blob/master/shell/completion.zsh'
zinit snippet 'https://github.com/junegunn/fzf/blob/master/shell/key-bindings.zsh'
zinit ice as="completion"
zinit snippet 'https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/fd/_fd'
zinit ice mv="*.zsh -> _exa" as="completion"
zinit snippet 'https://github.com/ogham/exa/blob/master/contrib/completions.zsh'
DISABLE_LS_COLORS=true
alias ls=exa
export FZF_DEFAULT_COMMAND='fd --type f'
### End of Zinit's installer chunk

eval "$(starship init zsh)"
