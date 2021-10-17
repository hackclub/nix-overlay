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
  # At the time of writing, latest rev is 42e5cca32712f31fa7bab8e02030050cd94b85b7
  # Make sure to add a sha256 so that it isn't unnecessarily refetched
  hackclub-overlay = import (builtins.fetchTarball {
    url = "https://github.com/hackclub/nix-overlay/archive/<rev>.tar.gz";
    sha256 = "NIX_BUILD_RETURNS_ERROR_PUT_SHA256_HERE";
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
