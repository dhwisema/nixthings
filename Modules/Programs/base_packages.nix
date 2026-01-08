{pkgs, ...}: {
  environment.systemPackages = with pkgs; [



    #usbmuxd 
    #git
    #btop



    #udisks
    #nautilus
    #vscode-fhs
    #libsecret
 
    #gcc
    #jq 
    curl 
    wget
  ];

  #why tf are some of thesehere lol



}
