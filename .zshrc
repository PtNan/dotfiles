# PATH
export EDITOR="nvim"
export FZF_DEFAULT_COMMAND="git ls-tree -r --name-only HEAD || rg --hidden --files"
export HOMEBREW=/opt/homebrew/bin
export GOPATH=$HOME/go
export PATH=$PATH:$HOMEBREW:$GOPATH:$GOPATH/bin
export ZSH=$HOME/.oh-my-zsh
# export GOPROXY=https://goproxy.io,direct

# alias
alias zshconf='nvim ~/.zshrc'
alias packerconf='nvim ~/.config/nvim/lua/plugins.lua'
alias rgf='rg --files | rg'
alias dc='docker compose'
alias kins='/bin/bash -c "$(curl -fsSL http://kratos.bilibili.co/x/kratos/install.sh)"'
alias bins='/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'

if [[ ! -d $HOME/.g ]]; then
    curl -sSL https://raw.githubusercontent.com/voidint/g/master/install.sh | bash
fi

if [[ ! -d $HOME/.oh-my-zsh ]]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ln -Fhnvs ~/dotfiles/nvim ~/.config/nvim
    ln -Fhnvs ~/dotfiles/.zshrc ~/.zshrc
fi

plugins=(
  git
  docker
  safe-paste
  z
  zsh-syntax-highlighting
  zsh-autosuggestions
)

FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

source $HOME/.oh-my-zsh/oh-my-zsh.sh
eval "$(starship init zsh)"

unalias g
# ===== set g environment variables =====
export GOROOT="${HOME}/.g/go"
export PATH="${HOME}/bin:${HOME}/.g/go/bin:$PATH"
