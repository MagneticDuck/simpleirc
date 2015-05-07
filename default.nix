{ nixpkgs ? (import <nixpkgs> {}) }:
let
  inherit (nixpkgs.haskellPackages) cabal network time;

in
  cabal.mkDerivation (self: {
    pname = "simpleirc";
    version = "0.3.0";
    src = ./.;
    buildDepends = [ network time ];
    meta = {
      homepage = "http://github.com/dom96/SimpleIRC";
      description = "Simple IRC Library";
      license = self.stdenv.lib.licenses.bsd3;
      platforms = self.ghc.meta.platforms;
    };
  })
