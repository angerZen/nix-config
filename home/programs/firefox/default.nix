{  pkgs, inputs, ... }: {
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
      isDefault = true;
      settings = {
        "browser.startup.homepage" = "http://10.0.0.5:3000";
        "browser.search.defaultenginename" = "angerSearch";
        "browser.search.order.1" = "angerSearch";
      };
      search = {
        force = true;
        default = "angerSearch";
        engines = {
          "angerSearch" = {
                urls = [{ template = "http://10.0.0.5:6060/?q={searchTerms}"; }];
                iconUpdateURL = "https://nixos.wiki/favicon.png";
                updateInterval = 24 * 60 * 60 * 1000; # every day
                definedAliases = [ "@as" ];
              };
          "Nix Packages" = {
            urls = [
              {
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "type";
                    value = "packages";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];

            icon = "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = ["@np"];
          };
        };
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
      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        ublock-origin
        proton-pass
      ];
    };
  };
  home.sessionVariables = {
    MOZ_DISABLE_CONTENT_SANDBOX = 1;
  };
}
