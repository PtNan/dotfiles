# PATH
export EDITOR="nvim"
export FZF_DEFAULT_COMMAND="git ls-tree -r --name-only HEAD || rg --hidden --files"
export HOMEBREW=/opt/homebrew/bin
export GOPATH=$HOME/go
export PATH=$PATH:$HOMEBREW:$GOPATH:$GOPATH/bin
# export GOPROXY=https://goproxy.io,direct

# alias
alias zshconf='nvim ~/.zshrc'
alias packerconf='nvim ~/.config/nvim/lua/plugins.lua'
alias rgf='rg --files | rg'
alias dc='docker compose'
alias kins='/bin/bash -c "$(curl -fsSL http://kratos.bilibili.co/x/kratos/install.sh)"'
alias bins='/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

if [[ ! -d $HOME/.g ]]; then
    curl -sSL https://raw.githubusercontent.com/voidint/g/master/install.sh | bash
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
    OMZ::plugins/safe-paste \
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

zinit wait lucid for \
  atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma/fast-syntax-highlighting \
  blockf \
    zsh-users/zsh-completions \
  id-as'brew-zsh-site-functions' run-atpull \
    atclone'zinit creinstall -q $(brew --prefix)/share/zsh/site-functions' \
    atpull'zinit creinstall -q $(brew --prefix)/share/zsh/site-functions' \
    zdharma/null \
  atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions

zinit ice as"completion"
zinit snippet OMZ::plugins/docker/_docker

zinit as"null" wait"2" lucid from"gh-r" for \
    sbin"fzf"  junegunn/fzf

zinit as"null" wait"2" lucid from"gh-r" for \
    sbin"*/rg" BurntSushi/ripgrep

### End of Zinit's installer chunk

eval "$(starship init zsh)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/ptnan/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/ptnan/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/ptnan/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/ptnan/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

unalias g
# ===== set g environment variables =====
export GOROOT="${HOME}/.g/go"
export PATH="${HOME}/bin:${HOME}/.g/go/bin:$PATH"
