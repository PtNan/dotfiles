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

# font
cd /Applications/Utilities/Terminal.app/Contents/Resources/Fonts/
cp *.otf ~/Library/Fonts/

# dotfile
mkdir -p ~/.config/nvim
cp -i coc-settings.json init.vim  ~/.config/nvim

# homebrew
brew instal fzf
brew instal git
brew instal go
brew instal neovim
brew instal node
brew instal ripgrep
brew instal unrar
brew instal yarn
brew instal zplug

# brew cask
brew cask instal appcleaner
brew cask instal basictex
brew cask instal iina
brew cask instal iterm2
brew cask instal shadowsocksx-ng-r
