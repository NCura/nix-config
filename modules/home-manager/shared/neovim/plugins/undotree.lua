require("undotree").setup({})

-- Keybind to toggle undotree
map("n", "<leader>u", "<cmd>lua require('undotree').toggle()<cr>", "Toggle undotree")
