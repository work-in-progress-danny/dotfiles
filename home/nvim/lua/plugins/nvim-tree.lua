-- https://www.youtube.com/watch?v=SpexCBrZ1pQ&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ&index=15

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

local mappings = {
	{ key = { "l", "o", "<2-LeftMouse>" }, action = "edit" },
	{ key = "v", action = "vsplit" },
	{ key = "s", action = "split" },
	{ key = "<C-t>", action = "tabnew" },
	{ key = "<", action = "prev_sibling" },
	{ key = ">", action = "next_sibling" },
	{ key = "P", action = "parent_node" },
	{ key = "<BS>", action = "close_node" },
	{ key = "<Tab>", action = "preview" },
	{ key = "I", action = "toggle_git_ignored" },
	{ key = "R", action = "refresh" },
	{ key = "a", action = "create" },
	{ key = "d", action = "remove" },
	{ key = "r", action = "rename" },
	{ key = "x", action = "cut" },
	{ key = "c", action = "copy" },
	{ key = "p", action = "paste" },
	{ key = "y", action = "copy_name" },
	{ key = "Y", action = "copy_path" },
	{ key = "gy", action = "copy_absolute_path" },
	{ key = "[c", action = "prev_git_item" },
	{ key = "]c", action = "next_git_item" },
	{ key = "-", action = "dir_up" },
	{ key = "q", action = "close" },
	{ key = "g?", action = "toggle_help" },
	{ key = "W", action = "collapse_all" },
	{ key = "S", action = "search_node" },
	{ key = "K", action = "toggle_file_info" },
	{ key = ".", action = "run_file_command" },
	-- default mappings
	-- { key = "<C-r>", action = "full_rename" },
	-- { key = "s", action = "system_open" },
	-- { key = "K", action = "first_sibling" },
	-- { key = "J", action = "last_sibling" },
	-- { key = "<C-e>", action = "edit_in_place" },
	-- { key = { "O" }, action = "edit_no_picker" },
	-- { key = { "<2-RightMouse>", "<C-]>" }, action = "cd" },
	-- { key = "H", action = "toggle_dotfiles" },
	-- { key = "D", action = "trash" },
}

nvim_tree.setup({
	renderer = {
		icons = {
			glyphs = {
				default = "",
				symlink = "",
				git = {
					unstaged = "",
					unmerged = "",
					renamed = "➜",
					deleted = "",
					ignored = "◌",
					untracked = "?",
					-- staged = "S",
				},
				folder = {
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
				},
			},
		},
	},
	disable_netrw = true,
	hijack_netrw = true,
	open_on_setup = true,
	ignore_ft_on_setup = {
		"startify",
		"dashboard",
		"alpha",
	},
	open_on_tab = false,
	hijack_cursor = false,
	update_cwd = true,
	diagnostics = {
		enable = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
	git = {
		enable = true,
		ignore = true,
		timeout = 500,
	},
	view = {
		width = 50,
		height = 30,
		hide_root_folder = true,
		side = "left",
		mappings = {
			custom_only = false,
			list = mappings,
		},
		number = false,
		relativenumber = false,
	},
	trash = {
		cmd = "trash",
		require_confirm = true,
	},
})
