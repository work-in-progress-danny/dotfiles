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

local function open_nvim_tree(data)
	local IGNORED_FT = {
		"startify",
		"dashboard",
		"alpha",
	}
	-- buffer is a [No Name]
	local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

	-- buffer is a directory
	local directory = vim.fn.isdirectory(data.file) == 1

	if not no_name and not directory then
		return
	end

	-- &ft
	local filetype = vim.bo[data.buf].ft

	-- change to the directory
	if directory then
		vim.cmd.cd(data.file)
	end

	-- skip ignored filetypes
	if vim.tbl_contains(IGNORED_FT, filetype) then
		return
	end

	-- open the tree
	require("nvim-tree.api").tree.open()
end

-- this is a callback to open nvim_tree on nvim start. There used to be a nice setting in the setup
-- function but it was removed. This is a workaround to open the tree on nvim start.
-- see: https://github.com/nvim-tree/nvim-tree.lua/wiki/Open-At-Startup
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
