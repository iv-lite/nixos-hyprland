# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ inputs, config, lib, pkgs, modulesPath, ... }:
let
  pkgs-hyprland = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [
    "amdgpu"
  ];
  boot.extraModulePackages = [
    # config.boot.kernelPackages.ddcci-driver 
  ];
  boot.kernelModules = [
    "kvm-intel"
  ];
  boot.kernelParams = [
    "amdgpu.backlight=0"
  ];


  # hardware.i2c.enable = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  # services.xserver.enable = true;
  # services.xserver.videoDrivers = [ "amdgpu" ];

  hardware.acpilight.enable = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;

    extraPackages = with pkgs; [
      amdvlk
    ];
    #  For 32 bit applications 
    extraPackages32 = with pkgs; [
      driversi686Linux.amdvlk
    ];
  };

  # hardware.opengl = {
  #   enable = true;
  #   # package = pkgs.unstable.mesa.drivers;
  #   # package32 = pkgs.unstable.pkgsi686Linux.mesa.drivers;
  #   # package = pkgs-hyprland.mesa.drivers;
  #   # package32 = pkgs-hyprland.pkgsi686Linux.mesa.drivers;
  #   driSupport = true;
  #   driSupport32Bit = true;

  #   # extraPackages = with pkgs.unstable; [
  #   #   amdvlk
  #   #   vulkan-loader
  #   #   vulkan-validation-layers
  #   #   vulkan-extension-layer
  #   # ];

  #   # extraPackages32 = with pkgs.unstable; [
  #   #   driversi686Linux.amdvlk
  #   # ];


  #   extraPackages = with pkgs; [
  #     amdvlk
  #     vulkan-loader
  #     vulkan-validation-layers
  #     vulkan-extension-layer
  #   ];

  #   extraPackages32 = with pkgs; [
  #     driversi686Linux.amdvlk
  #   ];

  #   # extraPackages = with pkgs-hyprland; [
  #   #   amdvlk
  #  # ];

  #   # extraPackages32 = with pkgs-hyprland; [
  #   #   driversi686Linux.amdvlk
  #   # ];
  # };
  # environment.variables.AMD_VULKAN_ICD = "vulkan";

  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp8s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp9s0.useDHCP = lib.mkDefault true;

  # hardware.logitech.wireless.enable = true;
  # hardware.logitech.wireless.enableGraphical = true;
}
