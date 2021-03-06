let
  ihp = builtins.fetchGit {
    url = "https://github.com/digitallyinduced/ihp.git";
    ref = "refs/tags/v0.16.0";
  };
  haskellEnv = import "${ihp}/NixSupport/default.nix" {
    inherit ihp;

    haskellDeps = p: with p; [
      cabal-install
      base
      wai
      text
      hlint
      p.ihp

      statistics
    ];

    otherDeps = p: with p; [
      # Native dependencies, e.g. imagemagick
    ];

    projectPath = ./.;
  };
in
  haskellEnv
