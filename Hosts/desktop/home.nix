{
  config,
  pkgs,
  lib,
  ...
}: {
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  imports = [
    ./../../modules/default-hm.nix
  ];

}
