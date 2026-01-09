# configs

A collection of my dotfiles. This is evolving all the time.

## Nix home-manager

Apply configuration:

## On Linux

```shell
cd nix/
home-manager switch --flake .#sesav@x86_64-linux
```

## On macOS:

```shell
cd nix/
home-manager switch --flake .#sesav@aarch64-darwin
```

Update dependencies:
```shell
nix flake update
home-manager switch --flake .#sesav@<arch>
```
