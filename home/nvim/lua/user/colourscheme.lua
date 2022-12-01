local colorscheme = "tokyonight-moon"

local gruvbox_status_ok, gruvbox = pcall(require, "gruvbox")
if not gruvbox_status_ok then
  return
end

local tokyonight_status_ok, tokyonight = pcall(require, "tokyonight")
if not tokyonight_status_ok then
  return
end

-- stylua: ignore start
Colors = {
  bg       = "#1d2021",
  fg       = "#ebdbb2",
  yellow   = "#ECBE7B",
  cyan     = "#008080",
  darkblue = "#081633",
  green    = "#98be65",
  orange   = "#FF8800",
  violet   = "#a9a1e1",
  magenta  = "#c678dd",
  blue     = "#51afef",
  red      = "#ec5f67",
}
-- stylua: ignore end

gruvbox.setup({
  contrast = "hard",
  overrides = {
    SignColumn = { -- TODO this is still broken, not sure if it's gitsigns or not 26/10/2022
      link = "LineNr",
    },
  },
})

vim.o.termguicolors = true
vim.cmd("set background=dark")

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify_once('Whoops colorscheme "' .. colorscheme .. '" not found!')
  return
end
