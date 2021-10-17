{ system ? builtins.currentSystem or "unknown-system" }:
(import ./flake-compat.nix {
  src = ./.;
}).outputs.packages.${system}
