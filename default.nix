{
  lib,
  config,
  dream2nix,
  ...
}: {
  imports = [
    dream2nix.modules.dream2nix.nodejs-package-lock-v3
    dream2nix.modules.dream2nix.nodejs-granular-v3
  ];

  mkDerivation = {
    src = builtins.fetchGit {
      shallow = true;
      #url = "https://github.com/actualbudget/actual-server";
      url = "https://github.com/marksort/actual-server";
      ref = "master";
      #rev = "6b57e45e047bb076e17bf27ac4ad3239efaaa050";
      rev = "b9d93c4606e9892e34a65e4b56379b1b2bd4d55a";
    };
  };

  deps = {nixpkgs, ...}: {
    inherit
      (nixpkgs)
      fetchFromGitHub
      stdenv
      ;
  };

  nodejs-package-lock-v3 = {
    packageLockFile = "${config.mkDerivation.src}/package-lock.json";
  };

  name = "actual-server";
  version = "24.8.0";
}
