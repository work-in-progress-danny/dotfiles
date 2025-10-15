-- Apply highlight groups for blink.cmp
vim.api.nvim_set_hl(0, "BlinkCmpMenu", { bg = Colors.bg, fg = Colors.fg })
vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { fg = Colors.dark0_soft, bg = Colors.bg })
vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { bg = Colors.bg, fg = Colors.magenta, bold = true })
vim.api.nvim_set_hl(0, "BlinkCmpScrollBarThumb", { bg = "" })
vim.api.nvim_set_hl(0, "BlinkCmpScrollBarGutter", { bg = "" })

-- Label and description Colors
vim.api.nvim_set_hl(0, "BlinkCmpLabel", { fg = Colors.fg })
vim.api.nvim_set_hl(0, "BlinkCmpLabelDeprecated", { fg = Colors.red, strikethrough = true })
vim.api.nvim_set_hl(0, "BlinkCmpLabelMatch", { fg = Colors.orange, bold = true })
vim.api.nvim_set_hl(0, "BlinkCmpLabelDetail", { fg = Colors.cyan })
vim.api.nvim_set_hl(0, "BlinkCmpLabelDescription", { fg = Colors.violet })

-- Kinds (functions, variables, etc.)
vim.api.nvim_set_hl(0, "BlinkCmpKind", { fg = Colors.yellow })
vim.api.nvim_set_hl(0, "BlinkCmpKindFunction", { fg = Colors.blue })
vim.api.nvim_set_hl(0, "BlinkCmpKindVariable", { fg = Colors.orange })
vim.api.nvim_set_hl(0, "BlinkCmpKindField", { fg = Colors.cyan })
vim.api.nvim_set_hl(0, "BlinkCmpKindClass", { fg = Colors.magenta })
vim.api.nvim_set_hl(0, "BlinkCmpKindInterface", { fg = Colors.violet })
vim.api.nvim_set_hl(0, "BlinkCmpKindModule", { fg = Colors.green })
vim.api.nvim_set_hl(0, "BlinkCmpKindKeyword", { fg = Colors.red })

-- Source label (e.g. [LSP], [Path], etc.)
vim.api.nvim_set_hl(0, "BlinkCmpSource", { fg = Colors.violet, italic = true })

-- Ghost text (preview inline)
vim.api.nvim_set_hl(0, "BlinkCmpGhostText", { fg = Colors.darkblue, italic = true })

-- Documentation window
vim.api.nvim_set_hl(0, "BlinkCmpDoc", { bg = "#20232a", fg = Colors.fg })
vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { fg = Colors.fg, bg = "#20232a" })
vim.api.nvim_set_hl(0, "BlinkCmpDocSeparator", { fg = Colors.cyan })
-- vim.api.nvim_set_hl(0, "BlinkCmpDocCursorLine",      { bg = "#32302f", fg = Colors.yellow })

-- Signature help
vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelp", { bg = "#20232a", fg = Colors.fg })
vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelpBorder", { fg = require("gruvbox").palette.bright_blue })
vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelpActiveParameter", { fg = Colors.orange, bold = true })

return {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"fang2hou/blink-copilot",
	},
	version = "1.*",
	opts = {
		keymap = {
			preset = "none",
			["<Tab>"] = { "select_next", "fallback" },
			["<S-Tab>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },
			["<Up>"] = { "select_prev", "fallback" },
			["<CR>"] = { "accept", "fallback" },
			["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },
			["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
			["<C-e>"] = { "hide", "fallback" },
		},
		appearance = {
			nerd_font_variant = "mono",
		},
		sources = {
			default = {
				"lsp",
				"path",
				"buffer",
				"snippets",
				"copilot",
			},
			providers = {
				copilot = {
					name = "copilot",
					module = "blink-copilot",
					score_offset = 100,
					async = true,
				},
				lsp = {
					name = "LSP",
					module = "blink.cmp.sources.lsp",
				},
				path = {
					name = "Path",
					module = "blink.cmp.sources.path",
				},
				snippets = {
					name = "Snip",
					module = "blink.cmp.sources.snippets",
				},
				buffer = {
					name = "Buf",
					module = "blink.cmp.sources.buffer",
				},
			},
		},
		completion = {
			menu = {
				draw = {
					columns = {
						{ "source_symbol", "source_name" },
						{ "label", "label_description", gap = 1 },
						{ "kind_icon", "kind", gap = 1 },
					},

					components = {
						source_symbol = {
							text = function(ctx)
								local provider = ctx.item.source or {}
								return provider.symbol or ""
							end,
							highlight = function()
								return { { group = "Comment", priority = 0 } }
							end,
							width = { max = 2 },
						},
						source_name = {
							text = function(ctx)
								local provider = ctx.item.source or {}
								return provider.name or ""
							end,
							highlight = function()
								return { { group = "Comment", priority = 0 } }
							end,
							width = { max = 8, ellipsis = true },
						},
					},
				},
				border = "rounded",
			},
		},
		fuzzy = { implementation = "prefer_rust" },
	},
	opts_extend = { "sources.default" },
}
