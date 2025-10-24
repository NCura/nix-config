{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # Nix tools
    nixfmt-tree
    sops

    # Core utilities
    wget
    curl
    psmisc # killall, fuser, etc.

    # Compression
    zip
    unzip

    # System monitoring
    glances

    # Network tools
    sshfs
    dig
    traceroute
    dnsutils
    net-tools
    inetutils
    xh
    imapsync

    # Development tools
    openssl
    cmake
    gnumake
    gccgo
    nodejs_22
    nodePackages.npm
    devenv

    # System utilities
    lsof
    trashy

    # Libraries (for specific apps)
    nss # for Bazecor
    nspr # for Bazecor
    atk
  ];
}
