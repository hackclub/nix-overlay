extraPkgs:
{ callPackage, lib }:
let
  rd = builtins.readDir ./.;
  rd' = lib.filterAttrs (k: v: v == "directory") rd;
  dirs = lib.attrNames rd';
in
  (lib.genAttrs
    dirs
    (name: callPackage (./. + ("/" + name)) { }))
  // extraPkgs
