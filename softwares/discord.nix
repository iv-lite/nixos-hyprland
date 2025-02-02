{
  inputs,
  lib,
  config,
  pkgs,
  user,
  ...
}:
{
  # environment.systemPackages = with pkgs; [
  #   (discord.override {
  #     version = "0.0.82";
  #     src = fetchurl {
  #       url = "https://stable.dl2.discordapp.net/apps/linux/0.0.82/discord-0.0.82.tar.gz";
  #       hash = "sha256-L8Lwe5UavmbW1s3gsSJiHjbiZnNtyEsEJzlrN0Fgc3w=";
  #     };
  #   })
  # ];

  environment.systemPackages = [
    pkgs.legcord
  ];
}
