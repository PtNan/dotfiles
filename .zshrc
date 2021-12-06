# PATH
export EDITOR="nvim"
export FZF_DEFAULT_COMMAND="git ls-tree -r --name-only HEAD || rg --hidden --files"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH:$GOPATH/bin:/usr/sbin
export ZSH=$HOME/.oh-my-zsh
export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH
export NIXPKGS_ALLOW_UNFREE=1
# export GOPROXY=https://goproxy.io,direct

# alias
alias zshconf='nvim $HOME/dotfiles/.zshrc'
alias nixconf='nvim $HOME/dotfiles/nixpkgs/home.nix'
alias packerconf='nvim $HOME/dotfiles/nvim/lua/plugins.lua'
alias rgf='rg --files | rg'
alias dc='docker compose'

if [[ ! -d $HOME/.oh-my-zsh ]]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ln -Fhnvs ~/dotfiles/nvim/lua ~/.config/nvim/lua
    ln -Fhnvs ~/dotfiles/.zshrc ~/.zshrc
fi

plugins=(
  git
  docker
  safe-paste
  z
  zsh-syntax-highlighting
  zsh-autosuggestions
  history-substring-search
)

source $HOME/.oh-my-zsh/oh-my-zsh.sh
eval "$(starship init zsh)"
