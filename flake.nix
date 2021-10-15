{
  description = "Nix overlay for projects by the Hack Club community";
  
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, flake-utils, nixpkgs }: 
    let 
      overlay = ./pkgs;
    in flake-utils.lib.eachSystem flake-utils.lib.allSystems (system: {
       overlays = [overlay];
    }); 
}

