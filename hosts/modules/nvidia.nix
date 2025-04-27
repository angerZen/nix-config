{
  lib,
  config,
  ...
}: {
  
  services.xserver.videoDrivers = ["nvidia"]; # or "nvidiaLegacy470 etc.

  environment.variables = {
    NIXOS_OZONE_WL = "1";
    __GL_GSYNC_ALLOWED = "1";
  };

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    nvidia = {
      open = false;
      nvidiaSettings = true;
      powerManagement.enable = true; # This can cause sleep/suspend to fail and saves entire VRAM to /tmp/
      forceFullCompositionPipeline = true;
      modesetting.enable = true;
      package = config.boot.kernelPackages.nvidiaPackages.beta;
    };
  };
}
