return {
	-- Utilities
	"folke/lazy.nvim",
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			require("gruvbox").setup({
				contrast = "hard",
				overrides = {
					SignColumn = { -- TODO this is still broken, not sure if it's gitsigns or not 26/10/2022
						link = "LineNr",
					},
				},
			})
			vim.cmd([[colorscheme gruvbox]])
		end,
	},
	"nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
	"nvim-lua/plenary.nvim", -- Useful lua functions used with lots of plugins
	{ "lilydjwg/colorizer", event = "BufRead" }, -- highlight colour codes with their colour e.g #282 #718
	{ "moll/vim-bbye" }, -- delete buffers without closing windows

	-- Language support. Null-ls and Neovim's LSP handles almost everything
	{ "simrat39/rust-tools.nvim", event = "BufRead" },

	-- Snippets

	-- LSP ( Language Server Protocol support )
	{ "williamboman/mason-lspconfig.nvim", event = "BufRead" },
	{ "neovim/nvim-lspconfig", event = "BufRead" }, -- enable LSP

	-- Text Manipulation
	{ "AndrewRadev/splitjoin.vim", event = "BufRead" }, -- split a single line of code into multiple and multiple into single
	{ "tpope/vim-surround", event = "BufRead" }, -- Provides an interface to wrap a given block with a symbol
	{ "godlygeek/tabular", event = "BufRead" }, -- Takes a regular expression and aligns a block of text depending on that

	-- Automatically set up configuration after cloning packer.nvim
}
