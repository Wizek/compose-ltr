{ mkDerivation, base, hspec, QuickCheck, stdenv }:
with import <nixpkgs>{};
mkDerivation {
  pname = "compose-ltr";
  version = "0.2.4";
  src = ./.;
  libraryHaskellDepends = [ base ];
  testHaskellDepends = [ base hspec QuickCheck ];
  description = "More intuitive, left-to-right function composition";
  license = stdenv.lib.licenses.mit;
}
