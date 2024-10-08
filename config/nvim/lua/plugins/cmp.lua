return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- buffer completions
		"hrsh7th/cmp-path", -- path completions
		"hrsh7th/cmp-cmdline", -- cmdline completions
		"saadparwaiz1/cmp_luasnip", -- snippet completions
		"hrsh7th/cmp-nvim-lsp", -- LSP completions
		"f3fora/cmp-spell", -- spell completions
		"windwp/nvim-autopairs",
		"zbirenbaum/copilot.lua",
	},
	config = function()
		local cmp, luasnip = TryRequire("cmp"), TryRequire("luasnip")
		if not cmp or not luasnip then
			return
		end

		require("luasnip/loaders/from_vscode").lazy_load()

		local check_backspace = function()
			local col = vim.fn.col(".") - 1
			return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
		end

    -- stylua: ignore start
    --   פּ ﯟ   some other good icons
    -- find more here: https://www.nerdfonts.com/cheat-sheet
    local kind_icons = {
      Copilot       = "",
      Text          = "󰊄",
      Method        = "m",
      Function      = "󰊕",
      Constructor   = "",
      Field         = "",
      Variable      = "󰫧",
      Class         = "",
      Interface     = "",
      Module        = "",
      Property      = "",
      Unit          = "",
      Value         = "",
      Enum          = "",
      Keyword       = "",
      Snippet       = "",
      Color         = "󰉦",
      File          = "",
      Reference     = "",
      Folder        = "",
      EnumMember    = "",
      Constant      = "",
      Struct        = "",
      Event         = "",
      Operator      = "",
      TypeParameter = "",
    }
		-- stylua: ignore end

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			mapping = {
				-- ["<C-k>"] = cmp.mapping.select_prev_item,
				-- ["<C-j>"] = cmp.mapping.select_next_item(),
				-- ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
				-- ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
				-- ["<C-e>"] = cmp.mapping({
				-- 	i = cmp.mapping.abort(),
				-- 	c = cmp.mapping.close(),
				-- }),
				-- Accept currently selected item. If none selected, `select` first item.
				-- Set `select` to `false` to only confirm explicitly selected items.
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<C-k>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
				["<C-j>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expandable() then
						luasnip.expand()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					elseif check_backspace() then
						fallback()
					else
						fallback()
					end
				end, {
					"i",
					"s",
				}),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, {
					"i",
					"s",
				}),
			},
			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					-- Kind icons
					vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
          -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
          -- stylua: ignore start
          vim_item.menu = ({
            copilot  = "[Copilot]",
            spell    = "[Spell]",
            nvim_lsp = "[LSP]",
            luasnip  = "[Snippet]",
            buffer   = "[File]",
            path     = "[Path]",
          })[entry.source.name]
          return vim_item
					-- stylua: ignore end
				end,
			},
			sources = {
				{ name = "copilot" },
				{ name = "nvim_lsp" },
				{ name = "spell", keyword_length = 4 },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			},
			confirm_opts = {
				behavior = cmp.ConfirmBehavior.Replace,
				select = false,
			},
			window = {
				documentation = {
					border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
				},
			},
			experimental = {
				ghost_text = true,
				native_menu = false,
			},
		})

		-- `/` cmdline setup.
		cmp.setup.cmdline("/", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{
					name = "cmdline",
					option = {
						ignore_cmds = { "Man", "!" },
					},
				},
			}),
		})
	end,
}
