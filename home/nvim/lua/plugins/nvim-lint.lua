return {
	"mfussenegger/nvim-lint",
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			markdown = { "vale" },
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			json = { "jsonlint" },
		}

		vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePre", "TextChanged", "BufEnter" }, {
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
