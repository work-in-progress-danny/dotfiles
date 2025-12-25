return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	main = "nvim-treesitter.configs", -- Important: tells Lazy to require this module for opts
	opts = {
		ensure_installed = {
			-- Core JS/TS ecosystem
			"typescript",
			"tsx",
			"javascript",

			-- Markup and styles
			"html",
			"css",
			"scss",

			-- Config/data formats
			"json",
			"jsonc",
			"jsdoc",

			-- Markdown
			"markdown",
			"markdown_inline",

			-- Common full-stack additions
			"bash",
			"dockerfile",
			"gitattributes",
			"gitignore",
			"git_rebase",
			"graphql",
			"regex",
			"toml",
			"yaml",

			-- Neovim essentials
			"lua",
			"vim",
			"vimdoc",
			"query",
		},

		highlight = { enable = true },
		indent = { enable = true },
		auto_install = true,
	},
}
