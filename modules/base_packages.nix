{ pkgs,... }: {
  environment.systemPackages = with pkgs; [
    pkgs.gnome.gnome-software
    pkgs.vesktop
    pkgs.git
    pkgs.lazygit
    pkgs.vscode
    pkgs.usbmuxd
    pkgs.ranger
    pkgs.rclone
    pkgs.rclone-browser
    pkgs.keepassxc
    pkgs.libreoffice-fresh
    pkgs.libimobiledevice
    pkgs.boxbuddy
    pkgs.distrobox
    pkgs.xterm
    pkgs.filezilla
  ];
}

