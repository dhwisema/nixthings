{
  config,
  lib,
  ...
}: {
  # Add an option to enable or disable sound
  options = {
    sound.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable sound.";
    };
  };

  config = lib.mkIf config.sound.enable {
    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
}
