# PATH
export EDITOR="vim"
export ZSH=$HOME/.oh-my-zsh

# alias
alias zshconf='vim $HOME/dotfiles/.zshrc'

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
