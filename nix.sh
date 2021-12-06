sh <(curl -L https://nixos.org/nix/install) --darwin-use-unencrypted-nix-store-volume
sudo nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
sudo nix-channel --update
nix-shell '<home-manager>' -A install
# /bin/bash -c "$(curl -fsSL http://kratos.bilibili.co/x/kratos/install.sh)"
