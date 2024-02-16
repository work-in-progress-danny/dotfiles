return {
	"numToStr/Comment.nvim", -- Easily comment stuff
	dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
	event = "BufRead",
	config = function()
		require("ts_context_commentstring").setup({})

		require("Comment").setup({
			pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
		})
	end,
}
