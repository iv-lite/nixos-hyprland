{
    config,
    pkgs,
    ...
}: {
  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "iv-lite";
    userEmail = "vibekwe@proton.me";
  };
}