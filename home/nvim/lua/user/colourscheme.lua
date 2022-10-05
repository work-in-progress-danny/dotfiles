local colorscheme = "gruvbox"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify_once('Whoops colorscheme "' .. colorscheme .. '" not found!')
	return
end
vim.o.termguicolors = true

vim.cmd("set background=dark")
