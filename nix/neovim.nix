{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    withPython3 = true;
    extraPython3Packages = ps: [ ps.pynvim ps.pip ];
    extraPackages = with pkgs; [
      (python3.withPackages (ps: with ps; [ pynvim pip ]))
    ];
  };

  home.sessionVariables = {
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
