{
  config,
  pkgs,
  ...
}: {
  hardware.graphics = {
    enable = true;
    # driSupport = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      amdvlk
      vulkan-loader
      vulkan-validation-layers
      vulkan-extension-layer
    ];
    extraPackages32 = [pkgs.driversi686Linux.amdvlk];
  };
}