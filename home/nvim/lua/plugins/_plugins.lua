local fn = vim.fn
-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing Packer. Close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- An autocommand that reloads Neovim whenever you save this file (_plugins.lua)
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost _plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	-- Utilities
	use("lilydjwg/colorizer") -- highlight colour codes with their colour e.g #282 #718
	use("kyazdani42/nvim-web-devicons") -- a nice icons plugin, that many plugins use. Bufferline, Lualine and Telescope for example
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins

	-- Bufferline ( Tab-like line at the top of the buffer showing all open buffers like tabs )
	use("akinsho/bufferline.nvim") -- a tab-like line displaying all open buffers
	use("moll/vim-bbye") -- Easily dismiss buffers

	-- Lualine ( Info line at the bottom of the buffer showing git diff and location )
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
	})

	-- Toggle Term ( Floating Neovim terminal )
	use("akinsho/toggleterm.nvim")

	-- Nvim Tree ( File Explorer )
	use("kyazdani42/nvim-tree.lua")

	-- Language support. Null-ls and Neovim's LSP handles almost everything
	use("simrat39/rust-tools.nvim")

	-- Colour Scheme
	use({ "ellisonleao/gruvbox.nvim" })
	use({ "p00f/nvim-ts-rainbow", requires = "vim-treesitter/nvim-treesitter" }) -- colours matching parenthesis

	-- CMP Plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use({ "hrsh7th/cmp-buffer", requires = "hrsh7th/nvim-cmp" }) -- buffer completions
	use({ "hrsh7th/cmp-path", requires = "hrsh7th/nvim-cmp" }) -- path completions
	use({ "hrsh7th/cmp-cmdline", requires = "hrsh7th/nvim-cmp" }) -- cmdline completions
	use({ "saadparwaiz1/cmp_luasnip", requires = "hrsh7th/nvim-cmp" }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp", requires = "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-nvim-lua", requires = "hrsh7th/nvim-cmp" })
	use({ "f3fora/cmp-spell", requires = { "hrsh7th/nvim-cmp" } })
	use({ "hrsh7th/cmp-copilot", requires = { "github/copilot.vim", "hrsh7th/nvim-cmp" } })

	-- Snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- Indentation
	use("lukas-reineke/indent-blankline.nvim")

	-- LSP ( Language Server Protocol support )
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
	use({ "j-hui/fidget.nvim", requires = { "jose-elias-alvarez/null-ls.nvim" } }) -- nice little notifier in the corner communicating the current state of Null-ls

	-- Telescope ( Search Client and UI )
	use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
	use({ "nvim-telescope/telescope-media-files.nvim", requires = { "nvim-telescope/telescope.nvim" } })
	use({ "nvim-telescope/telescope-fzf-native.nvim", requires = { "nvim-telescope/telescope.nvim" }, run = "make" })

	-- Git
	use("lewis6991/gitsigns.nvim")

	-- Treesitter ( Syntax Highlighting )
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use({ "windwp/nvim-ts-autotag", requires = "nvim-treesitter/nvim-treesitter" })
	-- use("nvim-treesitter/playground") -- comment this out until you want to use treesitter playground

	-- Whichkey ( Keybinding Prompt on leader-key down )
	use("folke/which-key.nvim")

	-- Text Manipulation
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	use("numToStr/Comment.nvim") -- Easily comment stuff
	use({ "JoosepAlviste/nvim-ts-context-commentstring", requires = "nvim-treesitter/nvim-treesitter" })
	use("AndrewRadev/splitjoin.vim") -- split a single line of code into multiple and multiple into single
	use("tpope/vim-surround") -- Provides an interface to wrap a given block with a symbol
	use("godlygeek/tabular") -- Takes a regular expression and aligns a block of text depending on that

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)

-- Noteworthy plugins:
-- Alpha, Neovim boot screen "goolord/alpha-nvim"
