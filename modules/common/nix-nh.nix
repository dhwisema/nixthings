{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    nix
    cachix
  ];
  nixpkgs.config.allowUnfree = true;

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep 5 --keep-since 3d";
  };

  nix = {
    settings = {
      substituters = [
        "https://cache.nixos.org/"
        "https://cache.garnix.io"
        "https://nix-community.cachix.org"
        "https://niri.cachix.org"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
        "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
      ];

      auto-optimise-store = true; # Optimise syslinks
      allow-import-from-derivation = true;
      experimental-features = ["nix-command" "flakes"];
      trusted-users = ["root" "@wheel" "howard"];
    };
  };
}
