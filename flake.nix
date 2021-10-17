{
  description = "Nix overlay for projects by the Hack Club community";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    sepia.url = "github:rishiosaur/sepiago";
  };

  outputs = extraPkgs''@{ self, nixpkgs, ... }:
    let
      extraPkgs' = builtins.removeAttrs extraPkgs'' [ "self" "nixpkgs" ];
      forAllSystems = f: map f [ "x86_64-linux" "x86_64-darwin" "i686-linux" "aarch64-linux" "aarch64-darwin" ];
    in builtins.foldl' nixpkgs.lib.recursiveUpdate {} (forAllSystems (system: let
      extraPkgs = nixpkgs.lib.mapAttrs (k: f: f.defaultPackage.${system}) extraPkgs';
      pkgs = nixpkgs.legacyPackages.${system};
      overlay' = import ./pkgs/default.nix extraPkgs;
    in nixpkgs.lib.mapAttrs (k: q: { ${system} = q; }) {
      packages = pkgs.callPackages (import ./pkgs/all-pkgs.nix extraPkgs) { };
      overlay = overlay';
      overlays = [ overlay' ];
    }));
}
