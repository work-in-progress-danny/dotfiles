return {
	"nvim-treesitter/nvim-treesitter",
	event = "BufRead",
	build = ":TSUpdate",
	opts = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = "all",
			auto_install = true,
		})
	end,
}
