-- https://github.com/lukas-reineke/indent-blankline.nvim
vim.opt.termguicolors = true
vim.opt.list = true
vim.opt.listchars = {
  -- a vertical line icon that overflows above and below the line
  tab = "▏ ",
  trail = "·",
  extends = "❯",
  precedes = "❮",
  nbsp = "␣",
}
vim.opt.listchars:append("eol:↴")

vim.cmd([[highlight IblScope guifg=#c015ef]])

return {
  "lukas-reineke/indent-blankline.nvim",
  event = "LspAttach",
  main = "ibl",
  config = {
    indent = {},
    scope = {
      enabled = true,
      include = {
        node_type = {
          lua = {
            "chunk",
            "do_statement",
            "while_statement",
            "repeat_statement",
            "if_statement",
            "for_statement",
            "function_declaration",
            "function_definition",
            "table_constructor",
          },
          typescript = {
            "statement_block",
            "function",
            "arrow_function",
            "function_declaration",
            "method_definition",
            "for_statement",
            "for_in_statement",
            "catch_clause",
            "object_pattern",
            "arguments",
            "switch_case",
            "switch_statement",
            "switch_default",
            "object",
            "object_type",
            "ternary_expression",
          },
        },
      },
    },
  },
}
