{ config, pkgs, ... }:

{
  home.username = "ptnan";
  home.homeDirectory = "/Users/ptnan";

  programs.home-manager.enable = true;
  programs.neovim.enable = true; 
  home.packages = [
    pkgs.ripgrep
    pkgs.starship
  ];
}
