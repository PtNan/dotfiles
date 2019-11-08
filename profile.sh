cd ~
# command line tool
xcode-select --install
# homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
#im-select
curl -Ls https://raw.githubusercontent.com/daipeihust/im-select/master/install_mac.sh | sh
# fish
brew install fish
# fisher
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
fisher add rafaelrinaldi/pure
fisher add jethrokuan/z
# vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# font
cd /Applications/Utilities/Terminal.app/Contents/Resources/Fonts/
cp *.otf ~/Library/Fonts/

# dotfile
mkdir -p ~/.config/nvim
mkdir -p ~/.config/fish
cp -i .latexmkrc .clang-format ~/
cp -i coc-settings.json init.vim  ~/.config/nvim
cp -i config.fish ~/.config/fish


# homebrew
brew install clang-format
brew install git
brew install go
brew install --HEAD neovim
brew install node
brew install llvm
brew install p7zip
brew install ripgrep
brew install unrar
brew install --HEAD universal-ctags/universal-ctags/universal-ctags
brew install yarn


# brew cask
brew cask install appcleaner
brew cask install basictex
brew cask install iina
brew cask install iterm2
brew cask install motrix
brew cask install shadowsocksx-ng-r


# basictex
sudo tlmgr install latexmk
sudo tlmgr install lstaddons

# coc
mkdir -p ~/.config/coc/extensions
cd ~/.config/coc/extensions
if [ ! -f package.json ]
then
  echo '{"dependencies":{}}'> package.json
fi
# Change arguments to extensions you need
yarn add coc-explorer coc-git coc-go coc-highlight coc-json coc-lists coc-pairs coc-snippets coc-word coc-yank

