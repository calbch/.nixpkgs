{ pkgs, ... }:

let
  name = "cal";
  user = builtins.getEnv "USER";
  home = builtins.getEnv "HOME";
  xdg_configHome = "${home}/.config";
in
{
  documentation.enable = false;
  services.nix-daemon.enable = true;
  nix.package = pkgs.nixFlakes;

  users.users.cal = {
    name = "cal";
    home = "/Users/cal";
  };

  environment.shells = with pkgs; [
    bash
    zsh
  ];

  programs = {
    zsh = {
      enable = true;
      enableFzfHistory = true;
    };

    tmux = {
      enable = true;
      enableFzf = true;
      enableSensible = true;
      enableVim = true;
      extraConfig = ''
        bind-key r source-file ~/.tmux.conf \; display-message "~/.tmux.conf reloaded."

        unbind C-b
        set-option -g prefix C-a
        bind C-a send-prefix

        # vim-like pane switching
        bind -r ^ last-window
        bind -r k select-pane -U
        bind -r j select-pane -D
        bind -r h select-pane -L
        bind -r l select-pane -R

        # pane splitting
        bind | split-window -h -c "#{pane_current_path}"
        bind - split-window -c "#{pane_current_path}"

        bind > swap-pane -D
        bind < swap-pane -U

        bind C command-prompt -p "Window-Name: " "new-window -n '%%'"
        bind Tab last-window

        set -g base-index 1           # start windows numbering at 1
        setw -g pane-base-index 1     # make pane numbering consistent with windows
        setw -g automatic-rename on # rename window to reflect current program
        set -g renumber-windows on    # renumber windows when a window is closed

        # Undercurl
        set -g default-terminal "''\${TERM}"
        set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'  # undercurl support
        set -as terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'  # underscore colours - needs tmux-3.0

        # Enable vim like copy from terminal
        bind -T copy-mode-vi v send-keys -X begin-selection
        bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'pbcopy'
      '';
    };
  };

  security = {
    pam.enableSudoTouchIdAuth = true;
  };

  services = {
    yabai = {
      enable = true;
      enableScriptingAddition = true;
      config = {
        mouse_follows_focus = "off";
        focus_follows_mouse = "off";
        window_origin_display = "default";
        window_placement = "second_child";
        window_topmost = "off";
        window_shadow = "on";
        window_opacity = "off";
        window_opacity_duration = 0.0;
        active_window_opacity = 1.0;
        normal_window_opacity = 0.90;
        window_border = "off";
        window_border_width = 6;
        active_window_border_color = "0xff775759";
        normal_window_border_color = "0xff555555";
        insert_feedback_color = "0xffd75f5f";
        split_ratio = 0.50;
        auto_balance = "off";
        mouse_modifier = "fn";
        mouse_action1 = "move";
        mouse_action2 = "resize";
        mouse_drop_action = "swap";

        # general space settings
        layout = "bsp";
        top_padding = 8;
        bottom_padding = 20;
        left_padding = 8;
        right_padding = 8;
        window_gap = 4;
      };
      extraConfig = ''
        yabai -m rule --add app="^System Preferences$" manage=off
        yabai -m rule --add app="^Finder$" manage=off
        yabai -m rule --add app="^Messages$" manage=off
        yabai -m rule --add app="^SpaceLauncher$" manage=off
      '';
    };

    skhd = {
      enable = true;
      skhdConfig = ''
                # A list of all built-in modifier and literal keywords can
        # be found at https://github.com/koekeishiya/skhd/issues/1

        # focus window
        cmd + alt - h : yabai -m window --focus west
        cmd + alt - j : yabai -m window --focus south
        cmd + alt - k : yabai -m window --focus north
        cmd + alt - l : yabai -m window --focus east

        # swap managed window
        shift + alt - h : yabai -m window --swap west
        shift + alt - j : yabai -m window --swap south
        shift + alt - k : yabai -m window --swap north
        shift + alt - l : yabai -m window --swap east

        # move managed window
        shift + cmd - h : yabai -m window --warp west
        shift + cmd - l : yabai -m window --warp east

        # toggle fullscreen
        cmd + alt - f : yabai -m window --toggle zoom-fullscreen

        # balance size of windows
        shift + alt - 0 : yabai -m space --balance

        # make floating window fill screen
        # shift + alt - up     : yabai -m window --grid 1:1:0:0:1:1

        # make floating window fill left-half of screen
        shift + alt - left : yabai -m window --grid 1:2:0:0:1:1

        # fast focus desktop
        cmd + alt - x : yabai -m space --focus recent
        cmd + alt - 1 : yabai -m space --focus 1
        cmd + alt - 2 : yabai -m space --focus 2
        cmd + alt - 3 : yabai -m space --focus 3
        cmd + alt - 4 : yabai -m space --focus 4

        # increase window size
        ctrl + alt - left : yabai -m window --resize left:-20:0;\
                   yabai -m window --resize right:-20:0
        ctrl + alt - up : yabai -m window --resize top:0:-20;\
                   yabai -m window --resize bottom:0:-20

        # decrease window size
        ctrl + alt - right : yabai -m window --resize left:20:0;\
                           yabai -m window --resize right:20:0
        ctrl + alt - down : yabai -m window --resize top:0:20;\
                           yabai -m window --resize bottom:0:20

        # set insertion point in focused container
        # ctrl + alt - h : yabai -m window --insert west

        # float / unfloat window and center on screen
        cmd + alt - t : yabai -m window --toggle float;\
                  yabai -m window --grid 4:4:1:1:2:2

        # toggle sticky(+float), topmost, picture-in-picture
        cmd + alt - p : yabai -m window --toggle sticky;\
                  yabai -m window --toggle topmost;\
                  yabai -m window --toggle pip

        # open terminal, blazingly fast compared to iTerm/Hyper
        # * cmd + alt - return : /Applications/kitty.app/Contents/MacOS/kitty --single-instance -d ~ */
        cmd + alt - return : /Applications/Alacritty.app/Contents/MacOS/alacritty --working-directory ~
        cmd + alt + shift - return : /Applications/Alacritty.app/Contents/MacOS/alacritty --working-directory ~/Code/
      '';
    };
  };

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

  system.defaults = {
    NSGlobalDomain = {
      AppleFontSmoothing = 2;
      AppleKeyboardUIMode = 3;
      AppleMeasurementUnits = "Centimeters";
      AppleMetricUnits = 1;
      AppleShowAllExtensions = true;
      AppleShowAllFiles = true;
      AppleShowScrollBars = "Always";
      AppleTemperatureUnit = "Celsius";
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticDashSubstitutionEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      NSAutomaticQuoteSubstitutionEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;
      NSDocumentSaveNewDocumentsToCloud = false;
      NSNavPanelExpandedStateForSaveMode2 = true;
      PMPrintingExpandedStateForPrint = true;
      # com.apple.mouse.tapBehavior = 1;
      # com.apple.swipescrolldirection = false;
    };

    dock = {
      autohide = true;
      autohide-delay = 0.0;
      autohide-time-modifier = 0.0;
      show-recents = false;
      showhidden = true;
      wvous-bl-corner = 1;
      wvous-br-corner = 1;
      wvous-tl-corner = 1;
      wvous-tr-corner = 1;
    };
    finder = {
      CreateDesktop = false;
      FXDefaultSearchScope = "SCcf";
      ShowPathbar = true;
      _FXShowPosixPathInTitle = true;
    };
    loginwindow.GuestEnabled = false;
    screencapture.disable-shadow = true;
  };
}
