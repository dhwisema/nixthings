
{ config, pkgs, ... }:

{
  virtualisation.oci-containers = {
    backend = "podman"; # or "docker" if you prefer

    containers.mc = {
      image = "itzg/minecraft-server:latest";

      # tty = true;
      # stdinOpen = true;

      ports = [
        "25565:25565"
      ];

      environment = {
        EULA = "TRUE";
        TYPE = "FABRIC";
        MODRINTH_PROJECTS = ''
          lithium
          ferrite-core
          carpet
          clumps
          hurricane
          shulker-drops-two
          phantom-spawning
          view-distance-fix
          https://modrinth.com/datapack/terralith
          towns-and-towers
          https://modrinth.com/datapack/structory
          https://modrinth.com/datapack/incendium
          https://modrinth.com/datapack/structory-towers
          https://modrinth.com/datapack/remove-terralith-intro-message
          noisiumforked
        '';
        VERSION = "1.21.11";
        MEMORY = "16384M";
        USE_MEOWICE_FLAGS = "true";
        TZ = "America/New_York";
      };

      volumes = [
        "/home/irrelevancy/mc/data:/data"
      ];
    };
  };
}
