{
  ...
}: {
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };


  # Enable OpenGL
hardware.opengl = {
  enable = true;
  driSupport = true;
  driSupport32Bit = true;
  extraPackages = with pkgs; [
    vulkan-loader
    vulkan-validation-layers
    vulkan-extension-layer
  ];
};  
}
