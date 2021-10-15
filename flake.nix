{
  description = "Nix overlay for projects by the Hack Club community";
  
  inputs = {
    flake-utils.url = "github.com:numtide/flake-utils";
  };

  outputs = { self, flake-utils, nixpkgs }: 
    let 
      overlay = ./pkgs;
    in flake-utils.lib.eachDefaultSystem (system:
      overlays = [overlay];
    ); 
}

