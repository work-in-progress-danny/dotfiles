-- https://github.com/folke/which-key.nvim
-- https://github.com/LunarVim/LunarVim/blob/master/lua/lvim/core/which-key.lua
--
return {
	"folke/which-key.nvim", -- Whichkey ( Keybinding Prompt on leader-key down )
	config = function()
		local Terminal = require("toggleterm.terminal").Terminal

		local gitui = Terminal:new({ cmd = "gitui" })
		local htop = Terminal:new({ cmd = "htop" })
		local node = Terminal:new({ cmd = "node" })
		local terminal = Terminal:new()

		function GITUI_TOGGLE()
			gitui:toggle()
		end

		function HTOP_TOGGLE()
			htop:toggle()
		end

		function NODE_TOGGLE()
			node:toggle()
		end

		function TERMINAL_TOGGLE()
			terminal:toggle()
		end

		local which_key = TryRequire("which-key")
		if not which_key then
			return
		end

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
				h = { Cmd("lua vim.lsp.buf.signature_help()"), "Signature help" },
				k = { Cmd("lua vim.diagnostic.open_float()"), "Show diagnostics" },
				K = { Cmd("lua vim.lsp.buf.hover()"), "Show hover" },
			},
			r = { Cmd("lua vim.lsp.buf.rename()"), "Rename all instances" },
			a = { Cmd("lua vim.lsp.buf.code_action()"), "Display code action" },

			-- Telescope
			f = { Cmd("Telescope find_files hidden=true"), "Find files" },
			d = { Cmd("Telescope git_status hidden=true"), "Git diff" },
			G = { Cmd("Telescope live_grep hidden=true"), "Grep text" },
			b = { Cmd("Telescope buffers"), "Buffers" },
			s = { Cmd("Telescope current_buffer_fuzzy_find"), "Search current buffer" },
			R = { Cmd("Telescope resume"), "Resume last Telescope instance" },
			T = {
				name = "Telescope",
				t = { Cmd("Telescope"), "Toggle Telescope" },
				c = { Cmd("Telescope command_history"), "Command History" },
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
				q = { Cmd("Bdelete"), "Close buffer" }, -- (uses bbye)
				Q = { Cmd("Bdelete!"), "Force close buffer" }, -- (uses bbye)
				b = { Cmd("bd"), "Close buffer" },
				a = { Cmd("qall"), "Quit nvim" },
			},
			w = { Cmd("w!"), "Force write buffer" },
			h = { Cmd("noh"), "Remove highlights" },

			-- Get *
			g = {
				name = "Get something",
				D = { Cmd("lua vim.lsp.buf.declaration()"), "Declaration" },
				d = { Cmd("lua vim.lsp.buf.definition()"), "Definition" },
				i = { Cmd("lua vim.lsp.buf.implementation()"), "Implementation" },
				r = { Cmd("Telescope lsp_references"), "All references in code base" },
				["/"] = { Cmd("Telescope current_buffer_fuzzy_find"), "Search current buffer" },
			},

			-- Terminal
			t = {
				name = "Terminal",
				t = { TERMINAL_TOGGLE, "Open Terminal" },
				g = { GITUI_TOGGLE, "Open GitUI" }, -- GITUI_TOGGLE global is defined in toggle-term
				h = { HTOP_TOGGLE, "Open htop" }, -- HTOP_TOGGLE global is defined in toggle-term
				n = { NODE_TOGGLE, "Open a Node environment" }, -- HTOP_TOGGLE global is defined in toggle-term
			},
			z = { Cmd("Telescope symbols"), "z-emojis of course" },
			["/"] = { "<Plug>(comment_toggle_linewise_current)", "Comment toggle current line" },
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
