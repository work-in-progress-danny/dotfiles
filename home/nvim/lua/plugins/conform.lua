return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		-- Set up format-on-save
		format_on_save = { timeout_ms = 10000, lsp_fallback = true },
		-- Define your formatters
		formatters_by_ft = {
			lua = { "stylua" },
			-- ESLINT FUCKING SUCKS AS A FORMATTER
			-- TIMES OUT AFTER 10 SECONDS ON A 75 LINE FILE
			--[[ javascript = { "eslint_d" }, ]]
			--[[ javascriptreact = { "eslint_d" }, ]]
			--[[ typescript = { "eslint_d" }, ]]
			--[[ typescriptreact = { "eslint_d" }, ]]
		},
		-- Customize formatters
		formatters = {},
	},
}
