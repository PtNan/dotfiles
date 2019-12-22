cd ~
# command line tool
xcode-select --install
# homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
#im-select
curl -Ls https://raw.githubusercontent.com/daipeihust/im-select/master/install_mac.sh | sh
# vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# font
cd /Applications/Utilities/Terminal.app/Contents/Resources/Fonts/
cp *.otf ~/Library/Fonts/

# dotfile
mkdir -p ~/.config/nvim
cp -i coc-settings.json init.vim  ~/.config/nvim

# homebrew
brew install git
brew install go
brew install neovim
brew install node
brew install ripgrep
brew install unrar
brew install yarn


# brew cask
brew cask install appcleaner
brew cask install basictex
brew cask install iina
brew cask install iterm2
brew cask install shadowsocksx-ng-r

# coc
mkdir -p ~/.config/coc/extensions
cd ~/.config/coc/extensions
if [ ! -f package.json ]
then
  echo '{"dependencies":{}}'> package.json
fi
# Change arguments to extensions you need
yarn add coc-explorer coc-git coc-go coc-highlight coc-json coc-lists coc-pairs coc-snippets coc-word coc-yank
