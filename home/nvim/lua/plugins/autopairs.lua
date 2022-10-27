-- https://www.youtube.com/watch?v=_hbvvBgXlBo&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ&index=12

local status_ok, nvim_autopairs = pcall(require, "nvim-autopairs")
if not status_ok then
	return
end

local status_ok_autotag, nvim_ts_autotag = pcall(require, "nvim-ts-autotag")
if not status_ok_autotag then
	return
end

-- Setup nvim-cmp
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

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
