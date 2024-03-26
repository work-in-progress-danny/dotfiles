return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		format_on_save = { timeout_ms = 10000, lsp_fallback = true },
		formatters_by_ft = {
			lua = { "stylua" },
			rust = { "rustfmt" },
			typescript = { "biome" },
			javascript = { "biome" },
			javascriptreact = { "biome" },
			typescriptreact = { "biome" },
			toml = { "taplo" },
		},
	},
}
