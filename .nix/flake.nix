{
  description = "Repository maintenance tooling for vscode-container";

  nixConfig.extra-experimental-features = [
    "nix-command"
    "flakes"
  ];

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = {nixpkgs, ...}: let
    systems = [
      "aarch64-darwin"
      "aarch64-linux"
      "x86_64-darwin"
      "x86_64-linux"
    ];

    forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f system);
  in {
    devShells = forAllSystems (system: let
      pkgs = import nixpkgs {
        inherit system;
      };
      deps = import ./deps.nix {inherit pkgs;};
    in {
      default = pkgs.mkShellNoCC {
        packages = deps.packages;
      };
    });
  };
}
