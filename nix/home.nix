{ pkgs, ... }:
{
  home.stateVersion = "25.11";

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  home.packages = with pkgs; [

    # Other
    home-manager
    zola

  ] ++ pkgs.lib.optionals (!pkgs.stdenv.isLinux) [
    # Shells
    bash
    fish

    # Lang & runtimes
    go
    lua
    luarocks
    nodejs_24
    ranger
    uv
    (python314.withPackages (ps: with ps; [
      ipykernel
      ipython
      jupyter
      pip
      setuptools
      virtualenv
      wheel
      msgspec
      pydantic
    ]))

    # Dev
    bat
    btop
    ctags
    fd
    fzf
    gh
    git
    jq
    just
    mc
    pgcli
    restic
    ripgrep
    ruff
    stylua
    tig
    tldr
    tmux
    tokei
    tree
    neovim
    tree-sitter
    watchexec
    zoxide

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
    unzip
    which

    # Network tools
    curl
    iperf
    nmap
    syncthing
    trippy
    wget
    wrk

    # DevOps & Cloud
    ansible
    kubectl
    kubectx

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

    # Security & crypto
    age
    gnupg
    gpg-tui
    pass
  ];
}
