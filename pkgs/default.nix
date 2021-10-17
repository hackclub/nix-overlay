extraPkgs:
final: prev: let
  /* FIXME: prev.callPackages doesn't work, infinite recursion? */
  callPackages_ = fn: args: let
    lib = prev.lib;
    f = if lib.isFunction fn then fn else import fn;
    auto = builtins.intersectAttrs (lib.functionArgs f) prev;
    origArgs = auto // args;
  in
    f origArgs;
in callPackages_ (import ./all-pkgs.nix extraPkgs) { }
