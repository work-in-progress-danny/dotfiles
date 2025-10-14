return {
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			require("gruvbox").setup({
				contrast = "hard",
			})
			vim.cmd([[colorscheme gruvbox]])
		end,
	},
	"nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
	"nvim-lua/plenary.nvim", -- Useful lua functions used with lots of plugins
	"lilydjwg/colorizer", -- highlight colour codes with their colour e.g #282 #718
	"moll/vim-bbye", -- delete buffers without closing windows

	-- Language support. Null-ls and Neovim's LSP handles almost everything
	"simrat39/rust-tools.nvim",

	-- Text Manipulation
	"AndrewRadev/splitjoin.vim", -- split a single line of code into multiple and multiple into single
	"godlygeek/tabular", -- Takes a regular expression and aligns a block of text depending on that
}
