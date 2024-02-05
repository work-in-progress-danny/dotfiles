return {
	"windwp/nvim-autopairs",
	event = "BufRead",
	config = function()
		local nvim_autopairs = require("nvim-autopairs")
		local nvim_ts_autotag = require("nvim-ts-autotag")
		local cmp = require("cmp")

		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

		local filetypes = {
			"html",
			"javascript",
			"typescript",
			"javascriptreact",
			"typescriptreact",
			"svelte",
			"vue",
			"tsx",
			"jsx",
			"rescript",
			"xml",
			"php",
			"markdown",
			"glimmer",
			"handlebars",
			"hbs",
		}
		local skip_tags = {
			"area",
			"base",
			"br",
			"col",
			"command",
			"embed",
			"hr",
			"img",
			"slot",
			"input",
			"keygen",
			"link",
			"meta",
			"param",
			"source",
			"track",
			"wbr",
			"menuitem",
		}

		nvim_ts_autotag.setup({ skip_tags = skip_tags, filetypes = filetypes })

		nvim_autopairs.setup({
			check_ts = true,
			-- ts_config = {
			-- 	lua = { "string", "source" },
			-- 	javascript = { "string", "template_string" },
			-- },
			disable_filetype = { "TelescopePrompt", "spectre_panel" },
			-- fast_wrap = {
			-- 	map = "<M-e>",
			-- 	chars = { "{", "[", "(", '"', "'" },
			-- 	pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
			-- 	offset = 0, -- Offset from pattern match
			-- 	end_key = "$",
			-- 	keys = "qwertyuiopzxcvbnmasdfghjkl",
			check_comma = true,
			-- 	highlight = "PmenuSel",
			-- 	highlight_grey = "LineNr",
			-- },
		})
	end,
}
