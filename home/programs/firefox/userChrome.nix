{
  programs.firefox.profiles.default.userChrome = ''
    :root {
        /* global border radius */
        --uc-border-radius: 0px !important;
        --uc-temp-border-radius: 0px !important;

        /* dynamic url bar width settings */
        --uc-urlbar-width: clamp(250px, 50vw, 600px);

        /* dynamic tab width settings */
        --uc-active-tab-width: clamp(50px, 18vw, 220px);
        --uc-inactive-tab-width: clamp(50px, 15vw, 200px);

        /* if active always shows the tab close button */
        --show-tab-close-button: -moz-inline-box;
        /* DEFAULT: -moz-inline-box; */

        /* if active only shows the tab close button on hover*/
        --show-tab-close-button-hover: -moz-inline-box;
        /* DEFAULT: -moz-inline-box; */

        /* adds left and right margin to the container-tabs indicator */
        --container-tabs-indicator-margin: 0px;

    }

    /*---+---+---+---+---+---+---+
         | B | U | T | T | O | N | S |
         +---+---+---+---+---+---+---*/

    back-button,
    #forward-button,
    #urlbar-zoom-button,
    #PanelUI-button,
    #reader-mode-button,
    #tracking-protection-icon-container,
    .tab-secondary-label,
    #pageActionButton,
    #page-action-buttons,
    #urlbar-go-button,
    #star-button {
        display: none !important;
    }

    #identity-box.extensionPage
    #identity-icon[tooltiptext="Loaded by extension: Tabliss"],
    #urlbar[pageproxystate="invalid"] #identity-box #identity-icon,
    #tracking-protection-icon-container[hidden]
      ~ #identity-box[pageproxystate="valid"].notSecure:not(.chromeUI, .localResource)
      #identity-icon {
      display: none !important;
    }


    #identity-box.extensionPage
    #identity-icon[tooltiptext="Loaded by extension: Tabliss"],
    #urlbar[pageproxystate="invalid"] #identity-box #identity-icon,
    #tracking-protection-icon-container[hidden]
      ~ #identity-box[pageproxystate="valid"].notSecure:not(.chromeUI, .localResource)
      #identity-icon {
      fill-opacity: var(--urlbar-icon-fill-opacity) !important;
      list-style-image: url(chrome://userchrome/content/engines/google.svg) !important;
    }


    /* Hide Extension Name Unless Site Identity Area is Hovered */
    #identity-box.extensionPage:not(:hover) #identity-icon-labels {
      display: none !important;
    }
    #identity-box.extensionPage:hover #identity-icon-labels {
      display: none !important;
    }
    #identity-box.extensionPage #identity-icon-label {
      display: none !important;
    }

    window,
    #main-window,
    #toolbar-menubar,
    #TabsToolbar,
    #PersonalToolbar,
    #navigator-toolbox,
    #sidebar-box,
    #nav-bar {
        -moz-appearance: none !important;
        border: none !important;
        box-shadow: none !important;
    }

    /* grey out ccons inside the toolbar to make it
     * more aligned with the Black & White colour look */
    #PersonalToolbar toolbarbutton:not(:hover),
    #bookmarks-toolbar-button:not(:hover) {
        filter: grayscale(1) !important;
    }

    /* Show Window Control Button */
    .titlebar-buttonbox-container {
        display: none !important;
    }

    /* remove "padding" left and right from tabs */
    .titlebar-spacer {
        display: none !important;
    }

    /* remove gap after pinned tabs */
    #tabbrowser-tabs[haspinnedtabs]:not([positionpinnedtabs])>#tabbrowser-arrowscrollbox>.tabbrowser-tab[first-visible-unpinned-tab] {
        margin-inline-start: 0 !important;
    }

    /* remove tab shadow */
    .tabbrowser-tab>.tab-stack>.tab-background {
        box-shadow: none !important;
    }


    /* active tab background */
    .tabbrowser-tab[selected]>.tab-stack>.tab-background {
        border: 2px solid var(--color2) !important;
    }

    /* tab close button options */
    .tabbrowser-tab:not([pinned]) .tab-close-button {
        display: none !important;
    }

    .tabbrowser-tab:not([pinned]):hover .tab-close-button {
        display: -moz-inline-box !important
    }

    /* adaptive tab width */
    .tabbrowser-tab[selected][fadein]:not([pinned]) {
        max-width: var(--uc-active-tab-width) !important;
    }

    .tabbrowser-tab[fadein]:not([selected]):not([pinned]) {
        max-width: var(--uc-inactive-tab-width) !important;
    }

    /* container tabs indicator */
    .tabbrowser-tab[usercontextid]>.tab-stack>.tab-background>.tab-context-line {
        margin: -1px var(--container-tabs-indicator-margin) 0 var(--container-tabs-indicator-margin) !important;
        border-radius: var(--tab-border-radius) !important;
    }

    /* show favicon when media is playing but tab is hovered */
    .tab-icon-image:not([pinned]) {
        opacity: 1 !important;
    }

    /* Makes the speaker icon to always appear if the tab is playing (not only on hover) */
    .tab-icon-overlay:not([crashed]),
    .tab-icon-overlay[pinned][crashed][selected] {
        top: 5px !important;
        z-index: 1 !important;
        padding: 1.5px !important;
        inset-inline-end: -8px !important;
        width: 16px !important;
        height: 16px !important;
        border-radius: 0px !important;
    }


    .tab-icon-overlay:not([pinned], [sharing], [crashed]):is([soundplaying], [muted], [activemedia-blocked]) {
        margin-inline-end: 9.5px !important;
    }

    .tabbrowser-tab:not([image]) .tab-icon-overlay:not([pinned], [sharing], [crashed]) {
        top: 0 !important;
        padding: 0 !important;
        margin-inline-end: 5.5px !important;
        inset-inline-end: 0 !important;
    }

    #nav-bar {
        border: none !important;
        box-shadow: none !important;
    }

    /* remove border below whole nav */
    #navigator-toolbox {
        border-bottom: none !important;
    }


    /* transition to oneline */
    @media (min-width: 1000px) {
        /* move tabs bar over */
        #TabsToolbar {
            margin-left: var(--uc-urlbar-width) !important;

        }
        /* move entire nav bar  */
        #nav-bar {
            margin: calc((var(--urlbar-min-height) * -1) - 10px) calc(100vw - var(--uc-urlbar-width)) 0 0 !important;
       }
    }

  '';
}
