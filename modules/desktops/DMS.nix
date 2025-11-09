{
  pkgs,
  config,
  inputs,
  ...
}: {
  # imports = [

  # ];

programs.dankMaterialShell = {
  enable = true;
  niri = {
    enableKeybinds = false;  # Automatic keybinding configuration
    enableSpawn = true;      # Auto-start DMS with niri
  };
};
}