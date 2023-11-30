return {
	"kylechui/nvim-surround",
	dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
	event = "VeryLazy",
	config = function()
		require("nvim-surround").setup({
			-- Configuration here, or leave empty to use defaults
		})
	end,
}
