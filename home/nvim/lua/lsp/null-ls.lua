-- https://www.youtube.com/watch?v=e3xxkEbhG0o

local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local _, fidget = pcall(require, "fidget")
if not _ then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	--[[ debug = true, ]]
	sources = {
		-- Javascript
		diagnostics.eslint_d,
		code_actions.eslint_d, -- .with({ extra_filetypes = { "astro" } }),
		formatting.eslint_d,
		--[[ j.with({ ]]
		--[[ extra_filetypes = { "astro" }, ]]
		--[[ arg = { "--fix-to-stdout", "--stdin", "--stdin-filename", "$FILENAME" }, ]]
		--[[ }), ]]

		formatting.prettierd.with({
			extra_filetypes = {
				"TOML",
				"astro",
				"css",
				"scss",
				"less",
				"html",
				"json",
				"yaml",
				"markdown",
				"graphql",
			},
		}),

		-- Lua
		formatting.stylua,

		-- Nix
		diagnostics.statix,
		code_actions.statix,

		-- Bash
		diagnostics.shellcheck,

		-- C
		diagnostics.cppcheck,
		-- formatting is done by clangd (lsp-config)

		-- Kotlin
		diagnostics.ktlint,
		formatting.ktlint,

		-- Python
		-- formatting.black.with { extra_args = { "--fast" } },
		-- formatting.yapf,
		-- diagnostics.flake8,
	},
})

fidget.setup() -- provide a UI for nvim-lsp's progress handler
