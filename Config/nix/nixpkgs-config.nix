# See https://ihp.digitallyinduced.com/Guide/package-management.html

{ ihp, additionalNixpkgsOptions, ... }:

import "${toString ihp}/NixSupport/make-nixpkgs-from-options.nix" {
    inherit ihp additionalNixpkgsOptions;
    haskellPackagesDir = ./haskell-packages/.;
}
