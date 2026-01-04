{
  description = "Sergey's home-manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      mkHomeConfiguration = system: username: home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        modules = [
          ./home.nix
          {
            home.username = username;
            home.homeDirectory = if nixpkgs.legacyPackages.${system}.stdenv.isDarwin
              then "/Users/${username}"
              else "/home/${username}";
          }
        ];
      };
    in {
      homeConfigurations = {
        # x86_64
        "sesav@x86_64-linux" = mkHomeConfiguration "x86_64-linux" "sesav";
        # macOS
        "cwm@aarch64-darwin" = mkHomeConfiguration "aarch64-darwin" "cwm";
        "sesav" = mkHomeConfiguration "aarch64-darwin" "sesav";
        "cwm" = mkHomeConfiguration "aarch64-darwin" "cwm";
      };
    };
}
