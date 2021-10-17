(import ./flake-compat.nix {
  src = ./.;
}).outputs.overlay.${builtins.currentSystem}
