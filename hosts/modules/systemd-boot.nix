{pkgs, ...}: {
  boot = {
    loader.efi.canTouchEfiVariables = true;
    loader.systemd-boot = {
      enable = true;
      consoleMode = "auto";
    };
    tmp.cleanOnBoot = true;
    kernelPackages = pkgs.linuxKernel.packages.linux_xanmod_latest;
    kernelModules = [
      "nvidia_uvm"
      "nvidia_modeset"
      "nvidia_drm"
      "nvidia"
    ];
    kernelParams = ["nvidia_drm.fbdev=1"];
    kernel.sysctl = {
      "vm.max_map_count" = 16777216;
    };
  };
}
