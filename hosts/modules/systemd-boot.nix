{ pkgs, ... }: {
  boot = {
    loader.efi.canTouchEfiVariables = true;
    loader.systemd-boot = {
      enable = true;
      consoleMode = "auto";
    };
    tmp.cleanOnBoot = true;
    kernelPackages = pkgs.linuxPackages_latest; # _zen, _hardened, _rt, _rt_latest, etc.
    kernel.sysctl = {
      "vm.max_map_count" = 16777216;
      "fs.file-max" = 524288;
    };
  };
}
