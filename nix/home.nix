{ pkgs, ... }: 
{
  home.username = "sesav";
  home.homeDirectory = "/home/sesav";
  home.stateVersion = "24.11";

  imports = [
    ./neovim.nix
  ];

  home.packages = with pkgs; [
    home-manager
    cmake
    fd
    gcc
    git
    gnumake
    go
    lua
    lua-language-server
    luarocks
    nodejs_24
    ripgrep
    rustup
    stylua
    tig
    tmux
    tree-sitter
    unzip
    uv
    wget
  ];
}
