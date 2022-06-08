local opts = { noremap = true, silent = true }
-- require("plugins.whichkey")

require("plugins.whichkey")

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   all modes = "",
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal
keymap("", "q", "<Nop>", opts) -- remap q to nothing because its annoying when trying to :q

-- Better Movement
keymap("n", "<S-b>", "^", opts) -- shift b moves the Cursor to the start of the line
keymap("n", "<S-e>", "$", opts) -- shift e moves the Cursor to the end of the line

-- No highlight
keymap("n", "<leader>h", "<cmd>noh<CR>", opts) -- turn off highlighted search results

-- Use Telescope current_buffer_fuzzy_find over vim's /
keymap("", "/", Cmd("Telescope current_buffer_fuzzy_find"), opts)

-- Comment
-- [reference](https://github.com/numToStr/Comment.nvim/blob/master/doc/API.md#%EF%B8%8F-usage)
keymap("n", "<leader>/", ":lua require('Comment.api').toggle_current_linewise()<cr>", opts) -- leader / comment out the current line when in normal mode
keymap("v", "<leader>/", ":lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<cr>", opts) -- leader / comments out all highlighted lines when in visual mode

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Plugins
-- LSP
keymap("n", "[e", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts) -- jump to previous error
keymap("n", "]e", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts) -- jump to next error
