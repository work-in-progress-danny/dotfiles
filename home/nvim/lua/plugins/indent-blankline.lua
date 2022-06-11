-- https://github.com/lukas-reineke/indent-blankline.nvim

local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
	return
end

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- I had to remap the opening commands to include IndentBlanklineRefresh, it's not ideal
-- https://github.com/lukas-reineke/indent-blankline.nvim/issues/265
--
vim.opt.termguicolors = true
vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")
vim.cmd([[highlight IndentBlanklineContextChar guifg=#c015ef gui=nocombine]])

indent_blankline.setup({
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = true,
	use_treesitter = true,
	context_patterns = {
		"class",
		"return",
		"function",
		"method",
		"^if",
		"^do",
		"^switch",
		"^while",
		"jsx_element",
		"^for",
		"^object",
		"^table",
		"block",
		"arguments",
		"if_statement",
		"else_clause",
		"jsx_element",
		"jsx_self_closing_element",
		"try_statement",
		"catch_clause",
		"import_statement",
		"operation_type",
	},
})

keymap("", "zo", "zo:IndentBlanklineRefresh<CR>", opts)
keymap("", "zO", "zO:IndentBlanklineRefresh<CR>", opts)
keymap("", "zR", "zR:IndentBlanklineRefresh<CR>", opts)
