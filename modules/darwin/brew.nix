{config, pkgs, ...}:

{
    homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
    };

    brews = [ ];

    casks = [
      "discord"
      "bitwarden"
      "brave-browser"
      "element"
      "exifcleaner"
      "firefox"
      "google-chrome"
      "imageoptim"
      "loom"
      "lulu"
      "onlyoffice"
      "raycast"
      "spotify"
      "swiftdefaultappsprefpane"
      "telegram"
      "tor-browser"
      "vlc"
    ];
  };
}