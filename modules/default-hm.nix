{
  lib,
  pkgs,
  config,
  nur,
  ...
}: {
  imports = [
    ./desktops/niri/niri-hm.nix
    ./desktops/niri/rofi-wayland/rofi-wayland.nix
    ./waybar/waybar.nix
    ./desktops/niri/swaylock.nix
    ./mako.nix
  ];
  nixpkgs.config.allowUnfree = true;
  stylix.enable = true;
  stylix.targets.firefox.enable = true;
  stylix.autoEnable = true;
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "howard";
  home.homeDirectory = "/home/howard";
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.fish.enable = true;
  programs.fish.shellInit = ''set -gx _JAVA_AWT_WM_NONREPARENTING 1'';
  home.sessionVariables = {
    _JAVA_AWT_WM_NONREPARENTING = "1";
  };

  programs.firefox = {
    enable = true;

    profiles = {
      profile_0 = {
        # choose a profile name; directory is /home/<user>/.mozilla/firefox/profile_0
        id = 0; # 0 is the default profile; see also option "isDefault"
        name = "profile_0"; # name as listed in about:profiles
        isDefault = true; # can be omitted; true if profile ID is 0
        userChrome = ''

          #main-window[tabsintitlebar="true"]:not([extradragspace="true"]) #TabsToolbar > .toolbar-items {
            opacity: 0;
            pointer-events: none;
          }

          #main-window:not([tabsintitlebar="true"]) #TabsToolbar {
              visibility: collapse !important;

          }
        '';
        settings = {"toolkit.legacyUserProfileCustomizations.stylesheets" = true;};
        extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          tree-style-tab
          multi-account-containers
          bitwarden
          firefox-color
        ];
        # settings = {
        #   # specify profile-specific preferences here; check about:config for options
        #   "browser.newtabpage.activity-stream.feeds.section.highlights" = false;
        #   "browser.startup.homepage" = "https://nixos.org";
        #   "browser.newtabpage.pinned" = [
        #     {
        #       title = "NixOS";
        #       url = "https://nixos.org";
        #     }
        #   ];
        #   # add preferences for profile_0 here...
        # };
      };
    };
  };
  programs.zed-editor = {
    enable = true;
    extensions = ["verilog" "rose-pine-theme" ];
  };

  home.packages = with pkgs; [
    ghostty
    art
    libreoffice-fresh
    yazi
    kdePackages.konsole
    distrobox-tui
    vesktop
    distrobox
  ];
}
