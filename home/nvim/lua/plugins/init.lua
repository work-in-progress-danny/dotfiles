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
  "lilydjwg/colorizer",          -- highlight colour codes with their colour e.g #282 #718
  "kyazdani42/nvim-web-devicons", -- Adds "web dev icons", many plugins use the symbols ✓⤫↩. Bufferline, Lualine and Telescope for example
  "nvim-lua/popup.nvim",         -- An implementation of the Popup API from vim in Neovim
  "nvim-lua/plenary.nvim",       -- Useful lua functions used with lots of plugins
  "moll/vim-bbye",               -- Easily dismiss buffers

  -- Language support. Null-ls and Neovim's LSP handles almost everything
  "simrat39/rust-tools.nvim",

  -- Github Copilot
  {
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
  },

  -- Snippets

  -- LSP ( Language Server Protocol support )
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig", -- enable LSP

  -- Text Manipulation
  "AndrewRadev/splitjoin.vim", -- split a single line of code into multiple and multiple into single
  "tpope/vim-surround",       -- Provides an interface to wrap a given block with a symbol
  "godlygeek/tabular",        -- Takes a regular expression and aligns a block of text depending on that

  -- Automatically set up configuration after cloning packer.nvim
}
