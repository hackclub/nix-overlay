{
  description = "Nix overlay for projects by the Hack Club community";

  outputs = { self, nixpkgs }: 
    let
      overlay = import ./pkgs;
      overlays = [ overlay ];
    in {
      inherit overlay overlays;
    };
}
