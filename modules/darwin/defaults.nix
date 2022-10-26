{ config, pkgs, ... }:

{
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