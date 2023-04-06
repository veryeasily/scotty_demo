{ nixpkgs ? import <nixpkgs> {  } }:

let
  pkgs = [
    nixpkgs.vscode
  ];
in
nixpkgs.haskellPackages.developPackage {
  root = ./.;
  modifier = drv:
    nixpkgs.haskell.lib.addBuildTools drv (with nixpkgs.haskellPackages;
      [ cabal-install
        ghcid
      ]);
}
