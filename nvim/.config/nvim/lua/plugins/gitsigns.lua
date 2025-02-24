-- https://www.youtube.com/watch?v=ZgyVY7tArwg&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ&index=14
return {
	"lewis6991/gitsigns.nvim",
	event = "BufRead",
	config = function()
		Get_and_set_gruvbox_highlight_group("GruvboxGreen", "guifg", "GitSignsAdd", "guifg")
		Get_and_set_gruvbox_highlight_group("GruvboxRed", "guifg", "GitSignsDelete", "guifg")
		Get_and_set_gruvbox_highlight_group("GruvboxBlue", "guifg", "GitSignsChange", "guifg")
		Get_and_set_gruvbox_highlight_group("GruvboxYellow", "guifg", "GitSignsChangeDelete", "guifg")

		require("gitsigns").setup({
			signs = {
				add = { text = "┃" },
				change = { text = "┃" },
				delete = { text = "┃" },
				topdelete = { text = "┃" },
				changedelete = { text = "┃" },
			},
			signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
			numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
			linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
			word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
			watch_gitdir = {
				interval = 1000,
				follow_files = true,
			},
			attach_to_untracked = true,
			current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
				delay = 100,
				ignore_whitespace = false,
				abbrev_sha = true,
			},
			current_line_blame_formatter = " <author>, <author_time> - <summary> #<abbrev_sha>",
			sign_priority = 6,
			update_debounce = 100,
			status_formatter = nil, -- Use default
			max_file_length = 40000,
			preview_config = {
				-- Options passed to nvim_open_win
				border = "single",
				style = "minimal",
				relative = "cursor",
				row = 0,
				col = 1,
			},
		})
	end,
}
