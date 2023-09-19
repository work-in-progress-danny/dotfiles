-- https://github.com/lukas-reineke/indent-blankline.nvim
return {
  "lukas-reineke/indent-blankline.nvim",
  depends = "nvim-treesitter/nvim-treesitter",
  config = function()
    vim.opt.termguicolors = true
    vim.opt.list = true
    -- vim.opt.listchars:append("space:⋅")
    vim.opt.listchars:append("eol:↴")
    vim.cmd([[highlight IndentBlanklineContextChar guifg=#c015ef gui=nocombine]])

    require("indent_blankline").setup({
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
  end,
}
