{ pkgs, ... }:
{
  home.stateVersion = "25.11";

  # imports = [
  #   ./neovim.nix
  # ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  home.packages = with pkgs; [
    # Lang & runtimes
    go
    jdk
    lua
    lua-language-server
    luarocks
    nodejs_24
    # (python314.withPackages (ps: with ps; [
    #   ipykernel
    #   ipython
    #   jupyter
    #   pip
    #   setuptools
    #   virtualenv
    #   wheel
    #   msgspec
    #   pydantic
    # ]))
    uv
    ranger
    yarn
    zig

    # DevOps & Cloud
    ansible
    k9s
    # Temporary workaround for nixpkgs avro-c++ build failure on darwin.
    (kcat.overrideAttrs (old: {
      buildInputs = builtins.filter
        (pkg: !(builtins.elem pkg [ avro-c libserdes ]))
        old.buildInputs;
    }))
    kubectl
    kubectx
    kubernetes-helm
    minikube

    # Databases
    # postgresql_18
    # redis

    # Other
    home-manager
    zola
  ] ++ pkgs.lib.optionals (!pkgs.stdenv.isLinux) [
    autoconf
    bat
    btop
    cmake
    fd
    flex
    jq
    less
    m4
    mc
    rclone
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

    # Shells
    bash
    fish

    # GNU utilities
    coreutils
    diffutils
    findutils
    gawk
    gcc
    gettext
    gnugrep
    gnumake
    gnused
    gnutar
    gzip
    patch
    which

    # Media & conversion
    exiftool
    ffmpeg
    graphviz
    pandoc
    plantuml
    # Work around secretstorage/jeepney DBus check failures on darwin.
    (yt-dlp.overridePythonAttrs (old: {
      dependencies = builtins.filter
        (dep: (dep.pname or "") != "secretstorage")
        old.dependencies;
    }))

    # Network tools
    curl
    iperf
    nmap
    syncthing
    trippy
    wget
    wrk

    # Dev
    ctags
    fzf
    gh
    git
    just
    pgcli
    ruff
    stylua
    tig
    tmux
    tokei
    watchexec
    zoxide

    # Shell enhancements
    zsh-syntax-highlighting

    # Security & crypto
    age
    gnupg
    gpg-tui
    pass
  ];
}
