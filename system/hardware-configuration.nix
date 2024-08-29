# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [
    "amdgpu"
  ];
  boot.kernelModules = [
    "kvm-intel"
    "i2c-dev"
  ];
  boot.kernelParams = [
    "amdgpu.backlight=0"
  ];
  hardware.i2c.enable = true;
  boot.kernelPackages = pkgs.unstable.linuxPackages_latest;
  # services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];

  # hardware.acpilight.enable = true;

  # hardware.graphics = {
  #   enable = true;
  #   enable32Bit = true;

  #   extraPackages = with pkgs; [
  #     amdvlk
  #   ];
  #   # For 32 bit applications 
  #   extraPackages32 = with pkgs; [
  #     driversi686Linux.amdvlk
  #   ];
  # };

  hardware.opengl = {
    enable = true;
    package = pkgs.unstable.mesa.drivers;
    package32 = pkgs.unstable.pkgsi686Linux.mesa.drivers;
    driSupport = true;
    driSupport32Bit = true;

    extraPackages = with pkgs; [
      amdvlk
    ];

    extraPackages32 = with pkgs; [
      driversi686Linux.amdvlk
    ];
  };


  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/5bbca373-d0f9-4a3f-90f6-a53e71ba1c8a";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."luks-bf1ab646-5407-4d1c-ad54-333aa79df6ab".device = "/dev/disk/by-uuid/bf1ab646-5407-4d1c-ad54-333aa79df6ab";

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/1B82-0DBD";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  swapDevices =
    [{ device = "/dev/disk/by-uuid/834e3e9f-6cb4-4169-a802-278655acb4b1"; }];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp8s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp9s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  # hardware.logitech.wireless.enable = true;
  # hardware.logitech.wireless.enableGraphical = true;
}
