{
  description = "Sergey's home-manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    snitch.url = "github:karol-broda/snitch";
  };

  outputs = { nixpkgs, home-manager, snitch, ... }:
    let
      mkHomeConfiguration = system: username: home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        modules = [
          ./home.nix
          {
            home.username = username;
            home.homeDirectory = if nixpkgs.legacyPackages.${system}.stdenv.isDarwin
              then "/Users/cwm"
              else "/home/${username}";
          }
          snitch.homeManagerModules.default
          {
            programs.snitch = {
              enable = true;
              package = snitch.packages.${system}.default;
              settings = {
                defaults = {
                  theme = "catppuccin-mocha";
                  interval = "2s";
                  resolve = true;
                };
              };
            };
          }
        ];
      };
    in {
      homeConfigurations = {
        # x86_64 Linux
        "sesav@x86_64-linux" = mkHomeConfiguration "x86_64-linux" "sesav";
        # macOS
        "sesav@aarch64-darwin" = mkHomeConfiguration "aarch64-darwin" "sesav";
      };
    };
}
