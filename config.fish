set PATH $HOME/bin /usr/local/bin $PATH
set PATH /Library/TeX/texbin $PATH
set PATH $GOPATH/bin $PATH
set PATH $HOME/.cargo/bin:$PATH

set -Ux EDITOR nvim

alias v     'nvim'
alias g     'git'
alias ga    'git add -A'
alias gch   'git checkout'
alias gcl   'git clone'
alias gca   'git add -A && git commit -v -a'
alias gf    'git fetch'
alias gp    'git push'
alias gl    'git pull'
alias gm    'git merge'
alias grb   'git rebase'
alias grm   'git rm'
alias gom   'go mod'
alias b     'brew'
alias bu    'brew upgrade && brew cleanup'
alias cc    'cp -rf ~/.config/nvim/init.vim ~/.config/nvim/coc-settings.json ~/.config/fish/config.fish ~/WorkSpace/profile'
alias o     'open $PWD'
alias alp   'export all_proxy=socks5://127.0.0.1:1086'
alias gop   'export GOPROXY=https://goproxy.io'

if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end
