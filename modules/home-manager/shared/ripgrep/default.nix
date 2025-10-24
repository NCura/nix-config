{
  programs.ripgrep = {
    enable = true;
    arguments = [
      # Search hidden files and directories
      "--hidden"
      # Follow symlinks
      "--follow"
      # Smart case: case insensitive unless pattern has uppercase
      "--smart-case"
      # Show column numbers
      "--column"
      # Add common ignore patterns
      "--glob=!.git/*"
      "--glob=!node_modules/*"
      "--glob=!.cache/*"
      "--glob=!target/*"
      # Improve output readability
      "--max-columns-preview"
      "--colors=line:style:bold"
    ];
  };
}
