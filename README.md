# configs

A collection of my dotfiles. This is evolving all the time.

## Nix home-manager

Apply configuration:
```shell
cd nix/
home-manager switch --flake .#sesav
```

Update dependencies:
```shell
nix flake update
home-manager switch --flake .#sesav
```
