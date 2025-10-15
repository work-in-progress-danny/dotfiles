return {
	"stevearc/conform.nvim",
	opts = {
		format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
		formatters_by_ft = {
			lua = { "stylua" },
			rust = { "rustfmt" },
			typescript = { "biome-check" },
			javascript = { "biome-check" },
			javascriptreact = { "biome-check" },
			typescriptreact = { "biome-check" },
			json = { "biome-check" },
			jsonc = { "biome-check" },
			html = { "prettier" },
			toml = { "taplo" },
			yaml = { "yamlfmt" },
			python = { "ruff_format" },
			markdown = { "markdownlint" },
		},
	},
}
