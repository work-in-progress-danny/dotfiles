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
			vimgrep_arguments = {
				"rg",
				"--hidden", -- Search hidden files
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
				"--trim",
				"--iglob=!**/.git/*", -- Exclude .git directories
			},
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
			find_files = {
				find_command = {
					"fd",
					"--type",
					"f",
					"-E",
					"**/.git/*", -- E-xclude .git directories
				},
			},
		},
	},
}
