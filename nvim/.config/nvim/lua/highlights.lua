vim.api.nvim_set_hl(0, "NormalFloat", { bg = Colors.bg })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = Colors.dark0_soft, bg = Colors.bg })
vim.api.nvim_set_hl(0, "DiagnosticFloatingError", { fg = Colors.red, bg = Colors.bg })
vim.api.nvim_set_hl(0, "DiagnosticFloatingWarn", { fg = Colors.bright_yellow, bg = Colors.bg })
vim.api.nvim_set_hl(0, "DiagnosticFloatingInfo", { fg = Colors.cyan, bg = Colors.bg })
vim.api.nvim_set_hl(0, "DiagnosticFloatingHint", { fg = Colors.blue, bg = Colors.bg })

vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = Colors.red, bg = "NONE" })
vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { fg = Colors.bright_yellow, bg = "NONE" })
vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { fg = Colors.cyan, bg = "NONE" })
vim.api.nvim_set_hl(0, "DiagnosticSignHint", { fg = Colors.blue, bg = "NONE" })

vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE", fg = Colors.fg })
vim.api.nvim_set_hl(0, "FoldColumn", { bg = "NONE", fg = Colors.fg })
vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE", fg = Colors.dark2 })
vim.api.nvim_set_hl(0, "CursorLineSign", { bg = Colors.dark1 })
vim.api.nvim_set_hl(0, "CursorLineFold", { bg = Colors.dark1 })

vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = Colors.neutral_green, bg = "NONE" })
vim.api.nvim_set_hl(0, "GitSignsChange", { fg = Colors.neutral_blue, bg = "NONE" })
vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = Colors.neutral_red, bg = "NONE" })
vim.api.nvim_set_hl(0, "GitSignsChangeDelete", { fg = Colors.neutral_yellow, bg = "NONE" })

vim.api.nvim_set_hl(0, "Comment", { fg = Colors.dark1 })
vim.o.background = "dark"
vim.o.winborder = "rounded"
