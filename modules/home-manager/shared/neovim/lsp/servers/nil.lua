-- Nix Language Server (nil) configuration
-- https://github.com/oxalica/nil

{
	cmd = { "nil" },
	filetypes = { "nix" },
	root_markers = { { "flake.nix", "flake.lock" }, ".git" },
	settings = {
		-- Add nil-specific settings here if needed
	},
}
