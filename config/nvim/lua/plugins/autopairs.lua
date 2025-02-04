return {
	"windwp/nvim-autopairs",
	dependencies = {
		"windwp/nvim-ts-autotag",
		"hrsh7th/nvim-cmp",
	},
	config = function()
		local nvim_autopairs = require("nvim-autopairs")
		local nvim_ts_autotag = require("nvim-ts-autotag")
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local cmp = require("cmp")

		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

		nvim_autopairs.setup({
			check_ts = true,
			disable_filetype = { "TelescopePrompt", "spectre_panel" },
			check_comma = true,
		})

		nvim_ts_autotag.setup({
			opts = {
				enable_close = true, -- Auto close tags
				enable_rename = true, -- Auto rename pairs of tags
				enable_close_on_slash = true, -- Auto close on trailing </
			},
		})
	end,
}
