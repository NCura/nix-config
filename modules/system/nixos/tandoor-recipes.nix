{ pkgs, ... }:
{
  services.tandoor-recipes = {
    enable = true;
    port = 9080;
    address = "0.0.0.0"; # Listen on all interfaces

    # Enable local PostgreSQL database
    database.createLocally = true;

    # Optional: Extra configuration
    extraConfig = {
      # Enable user signup if desired
      # ENABLE_SIGNUP = "1";

      # Set timezone (adjust as needed)
      TIMEZONE = "Europe/Paris";
    };
  };

  # Optional: Open firewall for Tandoor Recipes
  networking.firewall.allowedTCPPorts = [ 9080 ];
}
