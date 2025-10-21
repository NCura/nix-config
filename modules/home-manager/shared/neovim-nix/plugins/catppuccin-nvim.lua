-- Catppuccin colorscheme
-- https://github.com/catppuccin/nvim

require("catppuccin").setup({
	flavour = "mocha",
	color_overrides = {
		mocha = {
			base = "#0b0816", -- base00
			mantle = "#1e1e1e", -- base01
			surface0 = "#212121", -- base02
			surface1 = "#595959", -- base03
			surface2 = "#b0b0b0", -- base04
			text = "#f9f2ee", -- base05
			rosewater = "#ffd7ba", -- base06
			lavender = "#ffffff", -- base07
			red = "#e57373", -- base08
			peach = "#fab387", -- base09
			yellow = "#deb887", -- base0A
			green = "#c5e1a5", -- base0B
			teal = "#94e2d5", -- base0C
			blue = "#ececec", -- base0D
			mauve = "#f9e79f", -- base0E
			flamingo = "#f2cdcd", -- base0F
		},
	},
	integrations = {
		treesitter = true,
	},
})

vim.cmd.colorscheme("catppuccin")
