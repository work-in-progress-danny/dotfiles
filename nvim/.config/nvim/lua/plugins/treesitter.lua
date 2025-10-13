return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = "all",
			auto_install = true,
		})
	end,
}
