return {
	"folke/which-key.nvim", -- Whichkey ( Keybinding Prompt on leader-key down )
	config = function()
		local which_key = require("which-key")

		local setup_preferences = {
			ignore_missing = true,
			window = {
				border = "rounded", -- none, single, double, shadow
				position = "bottom", -- bottom, top
				margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
				padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
				winblend = 0,
			},
			layout = {
				height = { min = 4, max = 25 }, -- min and max height of the columns
				width = { min = 20, max = 50 }, -- min and max width of the columns
				spacing = 3, -- spacing between columns
				align = "left", -- align columns left, center or right
			},
		}

		local normal_mode_opts = {
			mode = "n", -- NORMAL mode
			prefix = " ",
			buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
			silent = true, -- use `silent` when creating keymaps
			noremap = true, -- use `noremap` when creating keymaps
			nowait = true, -- use `nowait` when creating keymaps
		}

		local normal_mode_mappings = {
			-- Code Management
			n = { Cmd("lua vim.diagnostic.goto_next({ border = 'rounded' })"), "Jump to next error" },
			N = { Cmd("lua vim.diagnostic.goto_prev({ border = 'rounded' })"), "Jump to previous error" },
			k = {
				name = "signature help",
				-- TODO add a script check whether there is diagnostics to show if not display variable signature
				K = { Cmd("lua vim.lsp.buf.hover()"), "Show hover" },
				h = { Cmd("lua vim.lsp.buf.signature_help()"), "Signature help" },
				k = { Cmd("lua vim.diagnostic.open_float()"), "Show diagnostics" },
			},
			r = { Cmd("lua vim.lsp.buf.rename()"), "Rename all instances" },
			a = { Cmd("lua vim.lsp.buf.code_action()"), "Display code action" },

			-- Git diff
			d = {
				name = "Git diff",
				f = { Cmd("Telescope git_status hidden=true"), "files" },
				o = { Cmd("DiffviewOpen"), "open diff view" },
				c = { Cmd("DiffviewClose"), "close diff view" },
				p = { Cmd("diffput"), "put diff back" },
			},

			-- Telescope
			f = { Cmd("Telescope find_files hidden=true"), "Find files" },
			G = { Cmd('lua require("telescope").extensions.live_grep_args.live_grep_args()'), "Grep text" },
			b = { Cmd("Telescope buffers"), "Buffers" },
			s = { Cmd("Telescope current_buffer_fuzzy_find"), "Search current buffer" },
			R = { Cmd("Telescope resume"), "Resume last Telescope instance" },
			T = {
				name = "Telescope",
				t = { Cmd("Telescope"), "Toggle Telescope" },
				c = { Cmd("Telescope command_history"), "Command History" },
				h = { Cmd("Telescope help_tags"), "Search Help Tags" },
			},

			-- Marks
			m = {
				name = "Marks",
				a = { Cmd('lua require("harpoon.mark").add_file()'), "Add Mark" },
				m = { Cmd("Telescope harpoon marks"), "Open Marks list" },
			},

			-- NvimTree
			e = { Cmd("NvimTreeToggle"), "Toggle nvim-tree" },

			-- Buffer Management
			q = {
				name = "Close",
				Q = { Cmd("Bdelete!"), "Force close buffer" }, -- (uses bbye)
				b = { Cmd("bd"), "Close buffer" },
				o = { Cmd("BufferLineCloseOthers"), "Close all other buffers" }, -- (uses bufferline)
				q = { Cmd("Bdelete"), "Close buffer" }, -- (uses bbye)
				v = { Cmd("qall"), "Quit nvim" },
			},
			w = { Cmd("w!"), "Force write buffer" },
			h = { Cmd("noh"), "Remove highlights" },

			-- Get *
			g = {
				name = "Get something",
				D = { Cmd("lua vim.lsp.buf.declaration()"), "Declaration" },
				["/"] = { Cmd("Telescope current_buffer_fuzzy_find"), "Search current buffer" },
				d = { Cmd("lua vim.lsp.buf.definition()"), "Definition" },
				i = { Cmd("lua vim.lsp.buf.implementation()"), "Implementation" },
				r = { Cmd("Telescope lsp_references"), "All references in code base" },
			},

			t = { Cmd("TroubleToggle"), "Toggle Trouble buffer" },
			-- J = { Cmd("ToggleTerm"), "Toggle Terminal" },
			z = { Cmd("Telescope symbols"), "z-emojis of course" },
			["/"] = { "<Plug>(comment_toggle_linewise_current)", "Comment toggle current line" },
			["="] = { Cmd("wincmd ="), "Reset window distribution" },
		}

		local visual_mode_opts = {
			mode = "x",
			prefix = " ",
			buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
			silent = true, -- use `silent` when creating keymaps
			noremap = true, -- use `noremap` when creating keymaps
			nowait = true, -- use `nowait` when creating keymaps
		}

		local visual_mode_mappings = {
			["/"] = { "<Plug>(comment_toggle_linewise_visual)", "Comment toggle current highlight" },
		}

		which_key.setup(setup_preferences)
		which_key.register(normal_mode_mappings, normal_mode_opts)
		which_key.register(visual_mode_mappings, visual_mode_opts)
	end,
}
