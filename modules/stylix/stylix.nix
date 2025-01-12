{
  config,
  lib,
  stylix,
  pkgs,
  ...
}: {
  stylix.enable = true;
  stylix.image = pkgs.fetchurl {
    url = "https://github.com/NotAShelf/wallpkgs/blob/main/wallpapers/cities/14.jpg";
    sha256 = "940d83575aab170fa96b1f468f71cc8a4ac3ffdf4ccf0917dea13088c09b9cc6";
  };
  stylix.polarity = "dark";
  stylix.autoEnable = true;
}
