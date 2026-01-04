{ pkgs, ... }:
{
  home.stateVersion = "24.11";

  imports = [
    ./neovim.nix
  ];

  home.packages = with pkgs; [
    autoconf
    bash
    cmake
    fd
    fish
    flex
    fzf
    gcc
    gh
    git
    gnumake
    htop
    jq
    less
    m4
    mc
    pkgconf
    restic
    ripgrep
    screen
    starship
    swig
    tig
    tldr
    tmux
    tree
    tree-sitter
    unzip
    watch
    zip

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
    python314
    go
    jdk
    lua
    lua-language-server
    luarocks
    nodejs_24
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
    postgresql_18
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
