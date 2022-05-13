--   use('editorconfig/editorconfig-vim')
--   use('lukas-reineke/indent-blankline.nvim')
--   use('tpope/vim-fugitive') -- Git
--   use({ 'SmiteshP/nvim-gps' })
--   use({ 'windwp/nvim-spectre', requires = { 'nvim-lua/plenary.nvim' } }) -- Search UI

--   -- Text operations
--   use('AndrewRadev/splitjoin.vim')
--   use('christoomey/vim-sort-motion')
--   use('ntpeters/vim-better-whitespace')
--   use('rstacruz/vim-closer')
--   use('tpope/vim-commentary')

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
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
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
	use("kyazdani42/nvim-web-devicons") -- a nice icons plugin
	use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight see: https://github.com/neovim/neovim/issues/12587

	-- Bufferline
	use("akinsho/bufferline.nvim")
	use("moll/vim-bbye")

	-- Lualine
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
	})

	-- Nvim Tree
	use("kyazdani42/nvim-tree.lua")

	-- Colour Scheme
	use("morhetz/gruvbox") -- My favourite colour scheme
	use("lifepillar/vim-gruvbox8")
	use({ "p00f/nvim-ts-rainbow", requires = "vim-treesitter/nvim-treesitter" }) -- colours matching parenthesis
	use("lilydjwg/colorizer")

	-- CMP Plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use({ "hrsh7th/cmp-buffer", requires = "hrsh7th/nvim-cmp" }) -- buffer completions
	use({ "hrsh7th/cmp-path", requires = "hrsh7th/nvim-cmp" }) -- path completions
	use({ "hrsh7th/cmp-cmdline", requires = "hrsh7th/nvim-cmp" }) -- cmdline completions
	use({ "saadparwaiz1/cmp_luasnip", requires = "hrsh7th/nvim-cmp" }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp", requires = "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-nvim-lua", requires = "hrsh7th/nvim-cmp" })
	use("f3fora/cmp-spell")

	-- Snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters

	-- Telescope
	use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
	use({ "nvim-telescope/telescope-media-files.nvim", requires = { "nvim-telescope/telescope.nvim" } })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	-- Git
	use("lewis6991/gitsigns.nvim")
	use("akinsho/git-conflict.nvim")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("nvim-treesitter/playground")

	-- Whichkey
	use("folke/which-key.nvim")

	-- Text Manipulation
	use("tpope/vim-surround") -- A nice text wrapping helper
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	use("numToStr/Comment.nvim") -- Easily comment stuff
	use({ "JoosepAlviste/nvim-ts-context-commentstring", requires = "nvim-treesitter/nvim-treesitter" })
	use("AndrewRadev/splitjoin.vim") -- split a single line of code into multiple and visa versa

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
