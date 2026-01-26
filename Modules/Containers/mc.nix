{ config, pkgs, ... }:
{
  networking.firewall.allowedUDPPorts = [25565];
  networking.firewall.allowedTCPPorts = [25565];
  #change default security list in oci management to allow above ports
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
        RCON_CMDS_STARTUP = ''
        chunky radius 7000 
        chunky start '';
      RCON_CMDS_ON_CONNECT =  ''
        chunky stop '';
      RCON_CMDS_LAST_DISCONNECT = ''
        chunky start '';
        EULA = "TRUE";
        TYPE = "FABRIC";
        PLUGINS = ''
            https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/fabric
          '';
        MODRINTH_PROJECTS = ''
          lithium
          carpet
          fabric-api
          ferrite-core
          clumps
          shulker-drops-two
          phantom-spawning
          view-distance-fix
          towns-and-towers
          noisiumforked
          floodgate
          chunky
          structurify
          mes-moogs-end-structures
          moogs-voyager-structures
          mns-moogs-nether-structures
          mss-moogs-soaring-structures
          mtr-moogs-temples-reimagined
          datapack:dungeons-and-taverns
          datapack:dnt-enchant-disabler
          datapack:explorify
          datapack:terralith
          datapack:structory
          datapack:incendium
          datapack:structory-towers
                          '';

                   VIEW_DISTANCE = "18";
       OPS = ''        Huntingdog5 '';
      EXISTING_OPS_FILE = "SYNCHRONIZE";
      ENABLE_WHITELIST = "true";
      WHITELIST = ''
        Huntingdog5  
        DancingCat524
        ThinkingWithTime
				manaexons
		'';
        VERSION = "1.21.11";
        MEMORY = "16384M";
        TZ = "America/New_York";
        MODRINTH_DOWNLOAD_DEPENDENCIES = "required";
        MODRINTH_ALLOWED_VERSION_TYPE =  "alpha";
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
    
