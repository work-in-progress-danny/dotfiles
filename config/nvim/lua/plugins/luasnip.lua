return {
	"L3MON4D3/LuaSnip", -- snippet engine
	event = "BufRead",
	dependencies = {
		"rafamadriz/friendly-snippets", -- a bunch of snippets to use
	},

	opts = function()
		local luasnip = require("luasnip.loaders.from_vscode")
		local loader_ok, _ = pcall(luasnip.load, { paths = "~/.dotfiles/config/nvim/lua/lsp/snippets" })

		if not loader_ok then
			print("Whoops seems like your snippets are whack dog, check ~/.dotfiles/home/nvim/lua/lsp/snippets")
			return
		end
	end,
}
