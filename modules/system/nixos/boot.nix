{
  config,
  pkgs,
  ...
}:
{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelModules = [
    "kvm-amd"
    "xone"
    "v4l2loopback"
  ];
  boot.kernel.sysctl = {
    "vm.max_map_count" = 2147483642;
    "vm.swappiness" = 10;
  };
  # For obs
  boot.extraModulePackages = [
    config.boot.kernelPackages.v4l2loopback
    # pkgslinuxPackages_6_6.xone for xbox controller
  ];
  services.xserver.videoDrivers = [ "amdgpu" ];
}
