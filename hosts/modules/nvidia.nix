{
  pkgs,
  config,
  ...
}: {
  
  services.xserver.videoDrivers = ["nvidia"]; # or "nvidiaLegacy470 etc.

  environment.variables = {
    __GL_GSYNC_ALLOWED = "1";
    LIBVA_DRIVER_NAME= "nvidia";
    XDG_SESSION_TYPE = "wayland";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    NIXOS_OZONE_WL = "1";
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
