{
  config,
  lib,
  ...
}: {
  # Add an option to enable or disable
  options = {
    foo.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable foo.";
    };
  };

  config =
    lib.mkIf config.foo.enable {
    };
}
