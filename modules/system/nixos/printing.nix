{ pkgs, ... }:
{
  # http://localhost:631
  services.printing = with pkgs; {
    enable = true;
    drivers = [
      gutenprint
      hplip
    ];
  };
}
