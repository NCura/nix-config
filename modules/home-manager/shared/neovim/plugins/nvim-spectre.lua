require("spectre").setup({})

-- Keybinds for spectre
map("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', "Toggle Spectre")
map("n", "<leader>Sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', "Search current word")
map("v", "<leader>Sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', "Search current word")
map("n", "<leader>Sf", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', "Search word on current file")
