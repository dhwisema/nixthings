{
  config,
  lib,
  pkgs,
  ...
}: {
  # Add an option to enable or disable iphone pairing for ethernet/file transfer
  options = {
    Idevice.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable Idevice.";
    };
  };

  config = lib.mkIf config.Idevice.enable {
    environment.systemPackages = with pkgs; [
      libimobiledevice
      ifuse
    ];
  };
}
