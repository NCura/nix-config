{pkgs, ...}:
pkgs.opencode.overrideAttrs (oldAttrs: rec {
  version = "0.15.8";
  src = pkgs.fetchFromGitHub {
    owner = "sst";
    repo = "opencode";
    tag = "v${version}";
    hash = "sha256-6brfh6yTFGnhUo9kZ5VAcC1whhMPJYYwVIT7j6g+wkw=";
  };

  tui = oldAttrs.tui.overrideAttrs (oldTui: {
    inherit version src;
    vendorHash = "sha256-g3+2q7yRaM6BgIs5oIXz/u7B84ZMMjnxXpvFpqDePU4=";
  });

  node_modules = oldAttrs.node_modules.overrideAttrs (oldNode: {
    inherit version src;
    outputHash = {
      x86_64-linux = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
      aarch64-darwin = "sha256-+wUulok3OdJ0YewuyOkv5zbiC+3QzhokfT3aCdL5akk=";
    }.${pkgs.stdenv.hostPlatform.system};
  });
})
