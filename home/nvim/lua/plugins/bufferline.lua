return {
	"akinsho/bufferline.nvim",
	event = "BufRead",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		options = {
			numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
			close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
			-- right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
			left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
			middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
			-- NOTE: this plugin is designed with this icon in mind,
			-- and so changing this is NOT recommended, this is intended
			-- as an escape hatch for people who cannot bear it for whatever reason
			indicator = {
				style = "icon",
				icon = "▎",
			},
			buffer_close_icon = "",
			modified_icon = "●",
			close_icon = "",
			left_trunc_marker = "",
			right_trunc_marker = "",
			max_name_length = 30,
			max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
			tab_size = 21,
			diagnostics = "nvim_lsp", -- | "coc",
			diagnostics_update_in_insert = false,
			diagnostics_indicator = function(count, level, diagnostics_dict, context)
				local icon = level:match("error") and " " or " "
				return " " .. icon .. count
			end,
			offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
			show_buffer_icons = true,
			show_buffer_close_icons = true,
			show_close_icon = true,
			show_tab_indicators = true,
			persist_buffer_sort = true,
			separator_style = "thin",
			enforce_regular_tabs = false,
			always_show_bufferline = true,
		},
	},
}
