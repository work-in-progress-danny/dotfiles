return {
	"mfussenegger/nvim-lint",
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			javascript = { "biomejs" },
			typescript = { "biomejs" },
			javascriptreact = { "biomejs" },
			typescriptreact = { "biomejs" },
		}

		vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePre", "TextChanged", "BufEnter" }, {
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
