return {
	"mason-org/mason-lspconfig.nvim",
	lazy = false,
	opts = {
		ensure_installed = {
			"biome",
			"ts_ls",
			"cssls",
			"cspell_ls",
			"bashls",
			"biome",
			"jsonls",
			"lua_ls",
			"stylua",
			"tailwindcss",
			"taplo",
		},
	},
	dependencies = {
		"mason-org/mason.nvim",
		"neovim/nvim-lspconfig",
	},
}
