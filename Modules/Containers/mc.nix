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
          carpet
          fabric-api
          ferrite-core
          clumps
          shulker-drops-two
          phantom-spawning
          view-distance-fox
          towns-and-towers
          noisiumforked
          floodgate
                  datapack:terralith
          datapack:structory
           datapack:incendium
           datapack:structory-towers
           datapack:remove-terralith-intro-message
                 '';
        VERSION = "1.21.11";
        MEMORY = "16384M";
        TZ = "America/New_York";
        MODRINTH_DOWNLOAD_DEPENDENCIES = "optional";
        MODRINTH_ALLOWED_VERSION_TYPE =  "beta";
      };
       extraOptions = [
        "--interactive"
        "--tty"
      ];
      volumes = [
        "/home/irrelevancy/mc/data:/data"
      ];
    };
  };
}
    
