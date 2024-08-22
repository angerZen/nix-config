{
  pkgs,
  config,
  inputs,
  ...
}: {
  programs.firefox = {
    enable = true;
    package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
      extraPolicies = {
        CaptivePortal = false;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableTelemetry = true;
        DisableFirefoxAccounts = true;
        NoDefaultBookmarks = true;
        OfferToSaveLogins = false;
        OfferToSaveLoginsDefault = false;
        PasswordManagerEnabled = false;
        FirefoxHome = {
          Search = false;
          Pocket = false;
          Snippets = false;
          TopSites = true;
          Highlights = false;
        };
        UserMessaging = {
          ExtensionRecommendations = false;
          SkipOnboarding = true;
        };
      };
    };
    profiles.default = {
      id = 0;
      name = "angerzen";
      search = {
        force = true;
        default = "DuckDuckGo";
      };
      settings = {
        "general.smoothScroll" = true;
        "browser.toolbars.bookmarks.visibility" = "always";
        "privacy.webrtc.legacyGlobalIndicator" = false;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "layers.acceleration.force-enabled" = true;
        "gfx.webrender.all" = true;
        "svg.context-properties.content.enabled" = true;
        "browser.compactmode.show" = true;
        "browser.search.region" = "us";
        "distribution.searchplugins.defaultLocale" = "en-US";
        "general.useragent.locale" = "en-US";
      };
      extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
        ublock-origin
        tabliss
        pywalfox
        proton-pass
      ];
    };
  };
  home.sessionVariables = {
    MOZ_DISABLE_CONTENT_SANDBOX = 1;
  };
}
