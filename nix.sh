sh <(curl -L https://nixos.org/nix/install) --darwin-use-unencrypted-nix-store-volume
sudo nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
sudo nix-channel --update
nix-shell '<home-manager>' -A install
ln -Fhnvs ~/dotfiles/nixpkgs ~/.config/nixpkgs
home-manager switch
ln -Fhnvs ~/dotfiles/nvim/lua ~/.config/nvim/lua
nix-env -i go
# /bin/bash -c "$(curl -fsSL http://kratos.bilibili.co/x/kratos/install.sh)"
