if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
    fisher add b4b4r07/enhancd
    fisher add jhillyerd/plugin-git
    fisher add sijad/gitignore
    fisher add oh-my-fish/plugin-extract
end

set -Ux EDITOR nvim
set -Ux GOPATH $HOME/go
set -Ux GOPROXY "https://goproxy.io"
set -gx PATH $PATH $GOPATH/bin

alias b='brew'
alias bu='brew upgrade && brew cleanup'
alias v='nvim'
alias rgf='rg --files | rg'
alias gom='go mod'
alias setproxy='set -xg all_proxy socks5://127.0.0.1:1080 && set GOPROXY https://goproxy.io'
alias fishconfig='nvim ~/.config/fish/config.fish'
alias vconfig='nvim ~/.config/nvim/init.vim'

fish_vi_key_bindings
starship init fish | source
