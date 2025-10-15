return {
	"zbirenbaum/copilot.lua",
	config = function()
		require("copilot").setup({
			debounce = 25,
			filetypes = {
				telescope = false,
				gitcommit = true,
			},
		})
		require("copilot_cmp").setup({
			method = "getCompletionsCycling",
		})
	end,
}
