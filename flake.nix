{
  description = "Nix overlay for projects by the Hack Club community";
  
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, flake-utils, nixpkgs }: 
    let
      overlay = import ./pkgs;
      overlays = [ overlay ];
    in {
      inherit overlay overlays;
    } 
}

