{
    config,
    pkgs,
    ...
}: {
  imports = [
    ./greetd/greetd.nix
  ];
}
