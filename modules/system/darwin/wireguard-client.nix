{
  pkgs,
  config,
  ...
}:
let
  homeDir = config.users.users.nicolascura.home;
  privateKeyFile = "${homeDir}/wireguard-keys/nicolas-local-private.key";
  generateConfigScript = pkgs.writeShellScriptBin "generate-wg-config" ''
        if [ ! -f "${privateKeyFile}" ]; then
          echo "Error: Private key not found at ${privateKeyFile}"
          exit 1
        fi

        PRIVATE_KEY=$(cat ${privateKeyFile})

        # Function to generate WireGuard config
        generate_config() {
          local ADDRESS=$1
          local OUTPUT_FILE=$2

          cat > "$OUTPUT_FILE" << EOF
    [Interface]
    PrivateKey = $PRIVATE_KEY
    Address = $ADDRESS
    DNS = 10.0.1.5

    [Peer]
    PublicKey = 6HBSPNC/7zKuppBvkvXdMrDBcoaIZ5OFS8Bl8M38ixo=
    Endpoint = 83.228.200.122:51820
    AllowedIPs = 10.0.1.0/24, 192.168.2.0/24
    PersistentKeepalive = 25
    EOF
        }

        # Generate configs for different devices
        generate_config "192.168.2.3/32" "$HOME/wg-infomaniak-macos.conf"
        generate_config "192.168.2.4/32" "$HOME/wg-infomaniak-iphone.conf"

        echo "WireGuard config files generated:"
        echo "  macOS:  $HOME/wg-infomaniak-macos.conf"
        echo "  iPhone: $HOME/wg-infomaniak-iphone.conf"
        echo ""
        echo "Import the macOS config into the WireGuard macOS app"
        echo "For iPhone, you can generate a QR code with: qrencode -t ansiutf8 < $HOME/wg-infomaniak-iphone.conf"
  '';
in
{
  # WireGuard client configuration for macOS
  #
  # Setup instructions:
  # 1. Place your private key at: ${privateKeyFile}
  # 2. Run: generate-wg-config
  # 3. Import the generated ~/wg-infomaniak.conf file into the WireGuard app

  # Install WireGuard tools and config generator
  environment.systemPackages = with pkgs; [
    wireguard-tools
    generateConfigScript
  ];
}
