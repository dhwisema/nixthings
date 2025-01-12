# nixthings
My nix configs
if this is the first time using remember to follow/ copy
https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent


also also nix run 'gitlab:ncsulug/eduroam-script'

if chrome has an issue after hostname change delete a lock file in .config

fix flatpak issues:
flatpak list --columns=application | xargs -I %s -- flatpak run --command=fc-cache %s -f -v

testing 

wallpapers throguh::https://github.com/NotAShelf/wallpkgs 

if hm breaks run
journalctl -xe --unit home-manager-howard
