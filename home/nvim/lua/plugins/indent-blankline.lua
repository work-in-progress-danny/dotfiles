-- https://github.com/lukas-reineke/indent-blankline.nvim

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- I had to remap the opening commands to include IndentBlanklineRefresh, it's not ideal
-- https://github.com/lukas-reineke/indent-blankline.nvim/issues/265

keymap("", "zo", "zo:IndentBlanklineRefresh<CR>", opts)
keymap("", "zO", "zO:IndentBlanklineRefresh<CR>", opts)
keymap("", "zR", "zR:IndentBlanklineRefresh<CR>", opts)
