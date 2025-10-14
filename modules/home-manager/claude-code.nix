{
  pkgs,
  ...
}: {
  programs.claude-code = {
    enable = true;
    package = pkgs.claude-code.overrideAttrs (old: rec {
      version = "2.0.14";
      src = pkgs.fetchzip {
        url = "https://registry.npmjs.org/@anthropic-ai/claude-code/-/claude-code-${version}.tgz";
        hash = "sha256-U/wd00eva/qbSS4LpW1L7nmPW4dT9naffeMkHQ5xr5o=";
      };
    });
    settings = {
      includeCoAuthoredBy = false;
    };
  };

  home.packages = with pkgs; [
    claude-monitor
  ];
}
