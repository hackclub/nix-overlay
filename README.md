# `nix-overlay`
This is Hack Club's [nix](https://nixos.org) overlay used to package the projects made by the community for nix.

## Usage

### Flakes

*RECOMMENDED USAGE:* 
Add the packages to your `home.packages` or `environment.systemPackages` by adding `hackclub` as an input:
```nix
# flake.nix
{
  ...
  inputs.hackclub.url = "github:hackclub/nix-overlay";
}
```

Add `hackclub.overlay` in your pkgs' overlays. [Example](https://github.com/tejasag/nixos-configs/blob/flakes/delphin/flake.nix#L24)
Then use packages from the overlay normally how you would use a package from the official nix repository.

### Channels

```nix
let
  hackclub = import (builtins.fetchTarball "https://github.com/hackclub/nix-overlay/archive/main.tar.gz");
in
{
  # install packages
  environment.systemPackages = [ 
    hackclub.packages.x86_64-linux.<package>
  ];

  # or with home manager:
  home.packages = [
    hackclub.packages.x86_64-linux.<package>
  ];
}
```


