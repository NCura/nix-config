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
        OUTPUT_FILE="$HOME/wg-infomaniak.conf"

        cat > "$OUTPUT_FILE" << EOF
    [Interface]
    PrivateKey = $PRIVATE_KEY
    Address = 192.168.2.2/32

    [Peer]
    PublicKey = 1o1JWy+5CmxI8reFHCFjtIGB0U47Kj87S5bprVcjKQ8=
    Endpoint = 83.228.200.122:51820
    AllowedIPs = 10.0.1.0/24
    PersistentKeepalive = 25
    EOF

        echo "WireGuard config file generated at: $OUTPUT_FILE"
        echo "You can now import this file into the WireGuard macOS app"
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
