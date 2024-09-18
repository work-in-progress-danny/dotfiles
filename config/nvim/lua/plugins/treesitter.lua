-- https://www.youtube.com/watch?v=hkxPa5w3bZ0&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ&index=10
return {
	"nvim-treesitter/nvim-treesitter",
	event = "BufRead",
	dependencies = {
		"windwp/nvim-ts-autotag",
		"JoosepAlviste/nvim-ts-context-commentstring",
		"p00f/nvim-ts-rainbow",
		"lukas-reineke/indent-blankline.nvim",
		"kevinhwang91/nvim-ufo",
	},
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"lua",
			"json",
			"typescript",
			"javascript",
			"jsx",
			"tsx",
			"vim",
			"vimdoc",
		}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
		sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
		ignore_install = { "t32", "smali" }, -- List of parsers to ignore installing
		highlight = {
			enable = false, -- false will disable the whole extension
			disable = { "" }, -- list of language that will be disabled
			additional_vim_regex_highlighting = false,
		},
		indent = {
			enable = false,
			-- disable = { "yaml" }
		},
		playground = {
			enable = false,
		},
		autopairs = {
			enable = false,
		},
		rainbow = {
			enable = true,
			extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
			max_file_lines = nil, -- Do not enable for files with more than n lines, int
			-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
			--[[ colors = { ]]
			--[[ 	"#E06C75", ]]
			--[[ 	"#E5C07B", ]]
			--[[ 	"#98C379", ]]
			--[[ 	"#56B6C2", ]]
			--[[ 	"#61AFEF", ]]
			--[[ 	"#C678DD", ]]
			--[[ }, -- table of hex strings, this matches the colours set in indent-blankline.lua ]]
			-- termcolors = {} -- table of colour name strings
		},
	},
}
