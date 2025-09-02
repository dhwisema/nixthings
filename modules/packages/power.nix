{pkgs,config,lib,...}:{

options = {
    power.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable tuned configurations.";
    };
  };


    config = lib.mkIf config.power.enable {
        services.tuned = {
            enable = true;
            settings = {
                dynamic_tuning = true;
            };
        };
    };
}