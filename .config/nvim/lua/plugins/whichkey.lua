local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

require("plugins.toggle-term") -- needed for Gitui_toggle

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
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local normal_mode_mappings = {
	k = {
		name = "signature help",
		h = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature help" },
		k = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Show diagnostics" },
		K = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Show hover" },
	},
	-- Telescope
	f = { ":Telescope find_files hidden=true<cr>", "Find files" },
	G = { ":Telescope live_grep hidden=true<cr>", "Grep text" },
	T = { "<cmd>Telescope <cr>", "Toggle Telescope" },

	-- NvimTree
	e = { "<cmd>NvimTreeToggle<cr>", "Toggle nvim-tree" },

	-- Buffer
	w = { "<cmd>Bdelete<cr>", "Close buffer" }, -- (uses bbye)
	W = { "<cmd>Bdelete!<cr>", "Force close buffer" }, -- (uses bbye)
	s = { "<cmd>w!<cr>", "Force write buffer" },
	h = { "<cmd>noh<cr>", "Remove Highlights" },
	r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename all instances" },
	a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Display code action" },

	-- Get *
	g = {
		name = "Get something",

		D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration" },
		d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
		i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Implementation" },
		r = { " <cmd>lua vim.lsp.buf.references()<CR>", "All references in code base" },
	},

	-- Terminal
	t = {
		name = "Terminal",
		t = { "<cmd>ToggleTerm<cr>", "Open Terminal" },
		-- GitUI
		G = { Gitui_toggle, "Open GitUI" }, -- global is defined in toggle-term
	},
}

local visual_mode_opts = {
	mode = "x",
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
	-- default_mode = "x",
}

local visual_mode_mappings = {
	i = { ":echo hello", "Git danny hunk" },
}

which_key.setup(setup_preferences)
which_key.register(normal_mode_mappings, normal_mode_opts)
which_key.register(visual_mode_mappings, visual_mode_opts)

-- Plugins --
-- Telescope
-- keymap("n", "<leader>f", "<cmd>Telescope find_files hidden=true<cr>", opts)
-- keymap("n", "<leader>g", "<cmd>Telescope live_grep hidden=true<cr>", opts)
-- keymap("n", "<leader>T", "<cmd>Telescope <cr>", opts)
-- -- keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
--
-- -- Nvimtree
-- keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts)
--
-- -- Buffers
-- keymap("n", "<leader>w", "<cmd>Bdelete<cr>", opts) -- close buffer (uses bbye)
-- keymap("n", "<leader>W", "<cmd>Bdelete!<cr>", opts) -- force close buffer (uses bbye)
-- keymap("n", "<leader>s", "<cmd>w!", opts) -- force write buffer
--
-- -- LSP
-- keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- get variable declaration
-- keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts) -- get variable definition
-- keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- get variable implementation
-- keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts) -- get all references in codebase
--
-- keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
-- keymap("n", "<leader>K", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
-- keymap("n", "<leader>k", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
--
-- keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts) -- rename all occurances under cursor
--
-- keymap("n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts) -- code action under cursor
--
-- keymap("n", "[e", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts) -- jump to previous error
-- keymap("n", "]e", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts) -- jump to next error
--
-- -- No highlight
-- keymap("n", "<leader>h", "<cmd>noh<CR>", opts) -- turn off highlighted search results
--

-- local setup = {
-- 	ignore_missing = true,
-- 	plugins = {
-- 		marks = true, -- shows a list of your marks on ' and `
-- 		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
-- 		spelling = {
-- 			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
-- 			suggestions = 20, -- how many suggestions should be shown in the list?
-- 		},
-- 		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
-- 		-- No actual key bindings are created
-- presets = {
-- 			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
-- 			motions = false, -- adds help for motions
-- 			text_objects = false, -- help for text objects triggered after entering an operator
-- windows = true, -- default bindings on <c-w>
-- 			nav = true, -- misc bindings to work with windows
-- 			z = true, -- bindings for folds, spelling and others prefixed with z
-- 			g = true, -- bindings for prefixed with g
-- },
-- 	},
-- 	-- add operators that will trigger motion and text object completion
-- 	-- to enable all native operators, set the preset / operators plugin above
-- 	-- operators = { gc = "Comments" },
-- 	key_labels = {
-- 		-- override the label used to display some keys. It doesn't effect WK in any other way.
-- 		-- For example:
-- 		-- ["<space>"] = "SPC",
-- 		-- ["<cr>"] = "RET",
-- 		-- ["<tab>"] = "TAB",
-- 	},
-- 	icons = {
-- 		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
-- 		separator = "➜", -- symbol used between a key and it's label
-- 		group = "+", -- symbol prepended to a group
-- 	},
-- 	popup_mappings = {
-- 		scroll_down = "<c-d>", -- binding to scroll down inside the popup
-- 		scroll_up = "<c-u>", -- binding to scroll up inside the popup
-- 	},
-- window = {
-- 	border = "rounded", -- none, single, double, shadow
-- 	position = "bottom", -- bottom, top
-- 	margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
-- 	padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
-- 	winblend = 0,
-- },
-- layout = {
-- 	height = { min = 4, max = 25 }, -- min and max height of the columns
-- 	width = { min = 20, max = 50 }, -- min and max width of the columns
-- 	spacing = 3, -- spacing between columns
-- 	align = "left", -- align columns left, center or right
-- },
-- 	ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
-- 	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
-- 	show_help = true, -- show help message on the command line when the popup is visible
-- 	triggers = "auto", -- automatically setup triggers
-- 	-- triggers = {"<leader>"} -- or specify a list manually
-- 	triggers_blacklist = {
-- 		-- list of mode / prefixes that should never be hooked by WhichKey
-- 		-- this is mostly relevant for key maps that start with a native binding
-- 		-- most people should not need to change this
-- 		i = { "j", "k" },
-- 		v = { "j", "k" },
-- 	},
-- }
--
-- local opts = {
-- 	mode = "n", -- NORMAL mode
-- 	prefix = "<leader>",
-- 	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
-- 	silent = true, -- use `silent` when creating keymaps
-- 	noremap = true, -- use `noremap` when creating keymaps
-- 	nowait = true, -- use `nowait` when creating keymaps
-- }
--
-- local mappings = {
-- 	["a"] = { "<cmd>Alpha<cr>", "Alpha" },
-- 	["b"] = {
-- 		"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
-- 		"Buffers",
-- 	},
-- 	["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
-- 	["w"] = { "<cmd>w!<CR>", "Save" },
-- 	["q"] = { "<cmd>q!<CR>", "Quit" },
-- 	["c"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
-- 	["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
-- 	["f"] = {
-- 		"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
-- 		"Find files",
-- 	},
-- 	["F"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
-- 	["P"] = { "<cmd>Telescope projects<cr>", "Projects" },
--
-- 	p = {
-- 		name = "Packer",
-- 		c = { "<cmd>PackerCompile<cr>", "Compile" },
-- 		i = { "<cmd>PackerInstall<cr>", "Install" },
-- 		s = { "<cmd>PackerSync<cr>", "Sync" },
-- 		S = { "<cmd>PackerStatus<cr>", "Status" },
-- 		u = { "<cmd>PackerUpdate<cr>", "Update" },
-- 	},
--
-- 	g = {
-- 		name = "Git",
-- 		g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
-- 		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
-- 		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
-- 		l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
-- 		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
-- 		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
-- 		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
-- 		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
-- 		u = {
-- 			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
-- 			"Undo Stage Hunk",
-- 		},
-- 		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
-- 		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
-- 		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
-- 		d = {
-- 			"<cmd>Gitsigns diffthis HEAD<cr>",
-- 			"Diff",
-- 		},
-- 	},
--
-- 	l = {
-- 		name = "LSP",
-- 		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
-- 		d = {
-- 			"<cmd>Telescope lsp_document_diagnostics<cr>",
-- 			"Document Diagnostics",
-- 		},
-- 		w = {
-- 			"<cmd>Telescope lsp_workspace_diagnostics<cr>",
-- 			"Workspace Diagnostics",
-- 		},
-- 		f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
-- 		i = { "<cmd>LspInfo<cr>", "Info" },
-- 		I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
-- 		j = {
-- 			"<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
-- 			"Next Diagnostic",
-- 		},
-- 		k = {
-- 			"<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
-- 			"Prev Diagnostic",
-- 		},
-- 		l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
-- 		q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
-- 		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
-- 		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
-- 		S = {
-- 			"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
-- 			"Workspace Symbols",
-- 		},
-- 	},
-- 	s = {
-- 		name = "Search",
-- 		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
-- 		c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
-- 		h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
-- 		M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
-- 		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
-- 		R = { "<cmd>Telescope registers<cr>", "Registers" },
-- 		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
-- 		C = { "<cmd>Telescope commands<cr>", "Commands" },
-- 	},
--
-- 	t = {
-- 		name = "Terminal",
-- 		n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
-- 		u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
-- 		t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
-- 		p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
-- 		f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
-- 		h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
-- 		v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
-- 	},
-- }
--