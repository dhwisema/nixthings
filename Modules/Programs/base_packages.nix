{pkgs, ...}: {
  environment.systemPackages = with pkgs; [



    #usbmuxd 
    #git
    #lazygit
    #btop
    #brillo
    #alejandra
    #nil
    #gvfs
    #udisks
    #nautilus
    #vscode-fhs
    #libsecret
    #seahorse
    #gcc
    #jq 
    
  ];

  #why tf are some of thesehere lol

  fonts.packages = with pkgs; [
    nerd-fonts.hack
    nerd-fonts.fira-code
  ];

}
