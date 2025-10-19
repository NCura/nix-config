{
  # accounts.email.accounts.icloud = {
  #   address = "nicolas.cura@icloud.com";
  #   thunderbird.enable = true;
  # };

  programs.thunderbird = {
    enable = true;
    profiles.default = {
      isDefault = true;
    };
  };
}
