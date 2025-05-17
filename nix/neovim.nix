{ pkgs, ... }:
let
  myPython = pkgs.python3.withPackages (ps: with ps; [ pip pynvim ]);
in {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    withPython3 = true;
    extraPython3Packages = ps: [ ps.pynvim ];
  };

  home.packages = with pkgs; [
    myPython
  ];

  home.sessionVariables = {
    NEOVIM_PYTHON3 = "${myPython}/bin/python3";
    EDITOR = "nvim";
  };

  home.activation = {
    cloneNvimConfig = let
      git = "${pkgs.git}/bin/git";
    in ''
      if [ ! -d "$HOME/.config/nvim" ]; then
        $DRY_RUN_CMD ${git} clone https://github.com/sesav/nvim $HOME/.config/nvim
      fi
    '';
  };
}
