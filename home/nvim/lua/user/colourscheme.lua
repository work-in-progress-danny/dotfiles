-- local colorscheme = "gruvbox"
-- local colorscheme = "catppuccin"
local colorscheme = "gruvbox-material"
-- vim.g.catppuccin_flavour = "macchiato"

vim.cmd("let g:gruvbox_material_background = 'hard'")

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify('Woops colorscheme "' .. colorscheme .. '" not found!')
	return
end
