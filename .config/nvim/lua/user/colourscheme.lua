local colorscheme = "gruvbox"
-- local colorscheme = "catppuccin"
-- vim.g.catppuccin_flavour = "macchiato"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify('Woops colorscheme "' .. colorscheme .. '" not found!')
	return
end
