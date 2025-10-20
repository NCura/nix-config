{
  services.mattermost = {
    enable = true;

    # Site configuration
    siteName = "Mattermost";
    siteUrl = "http://localhost:8065"; # Adjust this to your domain when deploying

    # Network configuration
    host = "0.0.0.0"; # Listen on all interfaces
    port = 8065;

    # Database configuration
    database = {
      create = true; # Automatically create local PostgreSQL database
      driver = "postgres";
      peerAuth = true; # Use peer authentication (no password required)
    };

    # Enable socket for mmctl management tool
    socket = {
      enable = true;
    };

    # Disable telemetry for privacy
    telemetry = {
      enableDiagnostics = false;
      enableSecurityAlerts = true; # Keep security alerts enabled
    };
  };

  # Optional: Open firewall for Mattermost
  networking.firewall.allowedTCPPorts = [8065];
}
