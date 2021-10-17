# `nix-overlay`

This is Hack Club's [nix](https://nixos.org) overlay used to package the projects made by the community for nix.

## Usage

### Flakes

_RECOMMENDED USAGE:_
Add the packages to your `home.packages` or `environment.systemPackages` by adding `hackclub` as an input:

```nix
# flake.nix
{
  # ...
  inputs.hackclub.url = "github:hackclub/nix-overlay";
}
```

Add `hackclub.overlay` in your pkgs' overlays:
```nix
{
  # ...
  outputs = { self, nixpkgs, hackclub }: let
    pkgs = import nixpkgs { system = "x86_64-linux"; overlays = [ hackclub.overlay.x86_64-linux ]; };
  in /* ... */ ;
}
```
Then use packages from `pkgs` normally how you would use a package from the official nix repository.

### Channels

To use without flakes:

```nix
let
  # You can also use fetchGit without a rev, but it makes it impure, meaning it'll be refetched
  # for no reason occasionally (1 hour by default)
  hackclub-overlay = import (builtins.fetchGit {
    url = "https://github.com/hackclub/nix-overlay.git";
    name = "hackclub-nix-overlay";
    rev = "<latest HEAD rev>"; # at the time of writing, 42e5cca32712f31fa7bab8e02030050cd94b85b7
  });
  pkgs = import <nixpkgs> { overlays = [ hackclub-overlay ]; };
in
{
  # install packages
  environment.systemPackages = [
    pkgs.<package>
  ];

  # or with home manager:
  home.packages = [
    pkgs.<package>
  ];
}
```
