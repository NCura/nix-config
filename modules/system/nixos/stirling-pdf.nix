{
  services.stirling-pdf = {
    enable = true;

    # Environment variables for customization
    # See: https://github.com/Stirling-Tools/Stirling-PDF#customisation
    environment = {
      # Server configuration
      SERVER_PORT = "9081";

      # UI customization (optional)
      UI_APP_NAME = "Stirling PDF";
      UI_HOME_DESCRIPTION = "Your locally hosted one-stop-shop for all your PDF needs.";

      # Security settings (optional)
      # SECURITY_ENABLE_LOGIN = "false";  # Set to "true" to enable login

      # Locale settings (optional)
      # UI_APP_LOCALE = "en_US";
    };
  };

  # Optional: Open firewall for Stirling PDF
  networking.firewall.allowedTCPPorts = [ 9081 ];
}
