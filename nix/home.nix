{ pkgs, ... }:
{
  home.stateVersion = "24.11";

  imports = [
    ./neovim.nix
  ];

  home.packages = with pkgs; [
    # build
    autoconf
    cmake
    flex
    gcc
    gnumake
    m4
    pkgconf
    swig

    # Shell & terminal
    bash
    fish
    less
    mc
    starship
    tmux

    # Editors
    # ed
    # nano

    # VS 
    git
    gh
    tig

    # Search & navigation
    fd
    fzf
    jq
    ripgrep
    tree

    # GNU utilities
    coreutils
    diffutils
    findutils
    gawk
    gettext
    gnugrep
    gnused
    gnutar
    which
    gzip
    patch

    # Lang & runtimes
    go
    jdk
    lua
    lua-language-server
    luarocks
    nodejs_24
    poetry
    rustup
    uv
    yarn
    zig

    # DevOps & Cloud
    ansible
    docker
    docker-compose
    kubernetes-helm
    k9s
    kcat
    kubectl
    kubectx
    minikube

    # Databases
    postgresql_16
    redis

    # Security & crypto
    age
    gnupg
    gpg-tui
    pass

    # Network tools
    curl
    iperf
    nmap
    syncthing
    trippy
    wget
    wrk

    # Media & conversion
    exiftool
    ffmpeg
    graphviz
    pandoc
    plantuml
    yt-dlp

    # Sys utilities
    htop
    restic
    screen
    tldr
    tree-sitter
    unzip
    watch
    zip

    # Dev
    ctags
    stylua

    # Shell enhancements
    zsh-syntax-highlighting

    # Other
    home-manager
    zola
  ];
}
