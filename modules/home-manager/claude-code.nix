{
  pkgs,
  ...
}: {
  programs.claude-code = {
    enable = true;
    package = pkgs.claude-code.overrideAttrs (old: rec {
      version = "2.0.1";
      src = pkgs.fetchzip {
        url = "https://registry.npmjs.org/@anthropic-ai/claude-code/-/claude-code-${version}.tgz";
        hash = "sha256-LUbDPFa0lY74MBU4hvmYVntt6hVZy6UUZFN0iB4Eno8=";
      };
    });
  };

  home.packages = with pkgs; [
    claude-monitor
  ];
}
