{config, ...}: {
  imports = [../modules/variables-config.nix];

  config.var = {
    hostname = "ganymede";
    username = "angerzen";
    homeDirectory = "/home/" + config.var.username;
    configDirectory = config.var.homeDirectory + "/.config/nixos";

    keyboardLayout = "us";

    timeZone = "America/Chicago";
    defaultLocale = "en_US.UTF-8";
    extraLocale = "en_US.UTF-8";

    git = {
      username = "angerZen";
      email = "67027795+angerZen@users.noreply.github.com";
    };

    autoUpgrade = false;
    autoGarbageCollector = false;

    # USBGuard
    # If usbguard enabled: set yours pref USB devices (change {id} to your trusted USB device), use `lsusb` command (from usbutils package) to get list
    # of all connected USB devices including integrated devices like camera, bluetooth, wifi, etc. with their IDs or just disable `usbguard`
    # allow id {id} # device 1...
    usbguard = false;
    usbguardRules = "";
  };
}
