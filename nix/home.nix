{ pkgs, ... }:
{
  home.stateVersion = "24.11";

  imports = [
    ./neovim.nix
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  home.packages = with pkgs; [
    autoconf
    fd
    flex
    htop
    jq
    less
    m4
    mc
    restic
    ripgrep
    screen
    starship
    swig
    tldr
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
    gzip
    patch
    which

    # Lang & runtimes
    go
    jdk
    lua
    lua-language-server
    luarocks
    nodejs_24
    (python313.withPackages (ps: with ps; [
      ipykernel
      ipython
      jupyter
      pip
      setuptools
      virtualenv
      wheel
    ]))
    uv
    ranger
    yarn
    zig

    # DevOps & Cloud
    ansible
    k9s
    kcat
    kubectl
    kubectx
    kubernetes-helm
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
    fzf
    gh
    git
    just
    ruff
    stylua
    tig
    tmux
    tokei
    zoxide
    watchexec

    # Shells
    bash
    fish

    # Shell enhancements
    zsh-syntax-highlighting

    # Other
    home-manager
    zola
  ] ++ pkgs.lib.optionals (!pkgs.stdenv.isLinux) [
    cmake
    gcc
    gnumake
  ];
}
