-- Text operations
--   use('christoomey/vim-sort-motion')
--   use('ntpeters/vim-better-whitespace')

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
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
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

-- Install your plugins here
return packer.startup(function(use)
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	-- use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight see: https://github.com/neovim/neovim/issues/12587

	-- Scrollbar
	use("petertriho/nvim-scrollbar")

	-- Bufferline
	use("akinsho/bufferline.nvim") -- a tab-like line displaying all open buffers
	use("moll/vim-bbye") -- Easily dismiss buffers

	-- Alpha (startup screen)
	-- use("goolord/alpha-nvim")

	-- Lualine
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
	})

	-- Toggle Term
	use("akinsho/toggleterm.nvim")

	-- Nvim Tree
	use("kyazdani42/nvim-tree.lua")

	-- Languages
	use("simrat39/rust-tools.nvim")

	-- Colour Scheme
	-- use("morhetz/gruvbox") -- My favourite colour scheme
	-- use("sainnhe/gruvbox-material")
	-- use("luisiacc/gruvbox-baby")
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

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
	use({ "j-hui/fidget.nvim", requires = { "jose-elias-alvarez/null-ls.nvim" } }) -- nice little notifier in the corner communicating the internals of lsp

	-- Github Copilot
	use("github/copilot.vim")

	-- Telescope
	use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
	use({ "nvim-telescope/telescope-media-files.nvim", requires = { "nvim-telescope/telescope.nvim" } })
	use({ "nvim-telescope/telescope-fzf-native.nvim", requires = { "nvim-telescope/telescope.nvim" }, run = "make" })

	-- Git
	use("lewis6991/gitsigns.nvim")
	use("akinsho/git-conflict.nvim")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use({ "windwp/nvim-ts-autotag", requires = "nvim-treesitter/nvim-treesitter" })
	-- use("nvim-treesitter/playground") -- comment this out until you want to use treesitter playground

	-- Whichkey
	use("folke/which-key.nvim")

	-- Text Manipulation
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter

	use("numToStr/Comment.nvim") -- Easily comment stuff
	use({ "JoosepAlviste/nvim-ts-context-commentstring", requires = "nvim-treesitter/nvim-treesitter" })
	use("AndrewRadev/splitjoin.vim") -- split a single line of code into multiple and visa versa
	use("tpope/vim-surround") -- Provides an interface to wrap a given block with a symbol
	use("godlygeek/tabular") -- Takes a regular expression and aligns a block of text depending on that

	-- Utilities
	use("lilydjwg/colorizer") -- highlight colour codes e.g #282 #718
	use("kyazdani42/nvim-web-devicons") -- a nice icons plugin

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
