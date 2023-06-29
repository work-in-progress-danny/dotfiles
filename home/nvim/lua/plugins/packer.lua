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
  -- stylua: ignore start
  -- Utilities
  use("lilydjwg/colorizer")           -- highlight colour codes with their colour e.g #282 #718
  use("kyazdani42/nvim-web-devicons") -- Adds "web dev icons", many plugins use the symbols ✓⤫↩. Bufferline, Lualine and Telescope for example
  use("wbthomason/packer.nvim")       -- My Neovim plugin manager of choice (it manages it's installation too after the first load)
  use("nvim-lua/popup.nvim")          -- An implementation of the Popup API from vim in Neovim
  use("nvim-lua/plenary.nvim")        -- Useful lua functions used ny lots of plugins
  use("moll/vim-bbye")                -- Easily dismiss buffers
  use("akinsho/toggleterm.nvim")      -- A nice plugin for toggling terminal windows
  use("folke/which-key.nvim")         -- Whichkey ( Keybinding Prompt on leader-key down )
  use("kyazdani42/nvim-tree.lua")     -- A better file tree explorer
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
  }) -- Info line at the bottom of the buffer showing git diff and location
	-- stylua: ignore end

	-- Language support. Null-ls and Neovim's LSP handles almost everything
	use("simrat39/rust-tools.nvim")

	-- Colours
	use({ "ellisonleao/gruvbox.nvim" }) -- my favourite colourscheme
	use({ "p00f/nvim-ts-rainbow", requires = "vim-treesitter/nvim-treesitter" }) -- colours matching parenthesis

	-- Github Copilot
	use({
		"zbirenbaum/copilot.lua",
		--[[ event = "InsertEnter", ]]
		config = function()
			vim.schedule(function()
				require("copilot").setup({
					ft_disable = {
						"markdown",
						"TelescopePrompt",
						--[[ ".git/COMMIT_EDITMSG", ]]
					},
				})
			end)
		end,
	})

  -- CMP completion
  -- stylua: ignore start
  use("hrsh7th/nvim-cmp")                                            -- The completion plugin
  use({ "hrsh7th/cmp-buffer", requires = "hrsh7th/nvim-cmp" })       -- buffer completions
  use({ "hrsh7th/cmp-path", requires = "hrsh7th/nvim-cmp" })         -- path completions
  use({ "hrsh7th/cmp-cmdline", requires = "hrsh7th/nvim-cmp" })      -- cmdline completions
  use({ "saadparwaiz1/cmp_luasnip", requires = "hrsh7th/nvim-cmp" }) -- snippet completions
  use({ "hrsh7th/cmp-nvim-lsp", requires = "hrsh7th/nvim-cmp" })     -- LSP completions
  use({ "f3fora/cmp-spell", requires = { "hrsh7th/nvim-cmp" } })     -- spell completions
  use({
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup({ method = "getCompletionsCycling" })
    end,
  }) -- copilot completions
	-- stylua: ignore end

	-- Snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- Indentation Guides
	use("lukas-reineke/indent-blankline.nvim")

	-- LSP ( Language Server Protocol support )
	use({
		"williamboman/mason.nvim",
		run = ":MasonUpdate", -- :MasonUpdate updates registry contents
	})
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig") -- enable LSP
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
	use("jay-babu/mason-null-ls.nvim")
	use({ "j-hui/fidget.nvim", tag = "legacy" }) -- nice little notifier in the corner communicating the current state of Null-ls

	-- Telescope ( Search Client and UI )
	use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
	use({ "nvim-telescope/telescope-media-files.nvim", requires = { "nvim-telescope/telescope.nvim" } })
	use({ "nvim-telescope/telescope-fzf-native.nvim", requires = { "nvim-telescope/telescope.nvim" }, run = "make" })
	use("nvim-telescope/telescope-symbols.nvim") -- adds emojis to telescope

	-- Git Signs ( Adds + and - signs to the left of the buffer showing git diff )
	use("lewis6991/gitsigns.nvim")

	-- Treesitter ( Syntax Highlighting )
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use({ "windwp/nvim-ts-autotag", requires = "nvim-treesitter/nvim-treesitter" })
	-- use("nvim-treesitter/playground") -- comment this out until you want to use treesitter playground

	-- Text Manipulation
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	use("numToStr/Comment.nvim") -- Easily comment stuff
	use({ "JoosepAlviste/nvim-ts-context-commentstring", requires = "nvim-treesitter/nvim-treesitter" })
	use("AndrewRadev/splitjoin.vim") -- split a single line of code into multiple and multiple into single
	use("tpope/vim-surround") -- Provides an interface to wrap a given block with a symbol
	use("godlygeek/tabular") -- Takes a regular expression and aligns a block of text depending on that

	-- Automatically set up configuration after cloning packer.nvim
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
