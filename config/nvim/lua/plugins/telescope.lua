return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"ThePrimeagen/harpoon",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-media-files.nvim",
		"nvim-telescope/telescope-symbols.nvim", -- adds emojis to telescope
		"nvim-telescope/telescope-live-grep-args.nvim",
	},
	opts = {
		defaults = {
			prompt_prefix = " ",
			selection_caret = " ",
			path_display = { "smart" },
			file_ignore_patterns = {
				--[[ "node_modules", ]]
			},
			pickers = {
				buffers = {
					sort_lastused = true,
					theme = "dropdown",
					previewer = false,
					mappings = {
						i = {
							["<c-d>"] = "delete_buffer",
						},
						n = {
							["<c-d>"] = "delete_buffer",
						},
					},
				},
			},
		},
	},
}
