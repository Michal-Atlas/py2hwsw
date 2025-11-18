{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/25.05";
    flake-parts.url = "github:hercules-ci/flake-parts";
    systems.url = "github:nix-systems/default";
  };

  outputs =
    {
      flake-parts,
      systems,
      ...
    }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import systems;
      perSystem =
        {
          pkgs,
          ...
        }:
        {
          devShells.default = import ./py2hwsw/lib/default.nix { inherit pkgs; };
        };
    };
}
