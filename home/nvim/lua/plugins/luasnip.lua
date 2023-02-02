local status_ok, luasnip = pcall(require, "luasnip.loaders.from_vscode")
if not status_ok then
  return
end

local loader_ok, _ = pcall(luasnip.load, { paths = "~/.dotfiles/home/nvim/lua/snippets" })

if not loader_ok then
  vim.notify_once("Whoops seems like your snippets are whack, check ~/.dotfiles/home/nvim/lua/snippets")
  return
end
