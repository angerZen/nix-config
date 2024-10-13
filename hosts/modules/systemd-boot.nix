{pkgs, ...}: {
  boot = {
    loader.efi.canTouchEfiVariables = true;
    loader.systemd-boot = {
      enable = true;
      consoleMode = "auto";
    };
    tmp.cleanOnBoot = true;
    kernelPackages = pkgs.linuxPackages_zen;

    kernelParams = ["nvidia_drm.fbdev=1"];
    kernel.sysctl = {
      "vm.max_map_count" = 16777216;
    };
  };
}
