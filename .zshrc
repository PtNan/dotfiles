# PATH
export EDITOR="vim"
export FZF_DEFAULT_COMMAND="git ls-tree -r --name-only HEAD || rg --hidden --files"
export ZSH=$HOME/.oh-my-zsh

# alias
alias zshconf='vim $HOME/dotfiles/.zshrc'
alias rgf='rg --files | rg'
alias dc='docker compose'

if [[ ! -d $HOME/.oh-my-zsh ]]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ln -Fnvs ~/dotfiles/.zshrc ~/.zshrc
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
