{
  pkgs,
  config,
  ...
}: {
  
  services.xserver.videoDrivers = ["nvidia"]; # or "nvidiaLegacy470 etc.

  environment.variables = {
    __GL_GSYNC_ALLOWED = "1";
  };

  environment.systemPackages = with pkgs; [
    nvidia-vaapi-driver
    libva-utils
  ];

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
      package = config.boot.kernelPackages.nvidiaPackages.latest;
    };
  };
}
