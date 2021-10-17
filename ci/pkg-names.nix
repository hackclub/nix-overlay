let
  f = builtins.getFlake (toString ./..);
  pkgNames' = builtins.attrNames f.packages.${builtins.currentSystem};
in
  builtins.concatStringsSep "\n" (map (s: ".#${s}") pkgNames')
