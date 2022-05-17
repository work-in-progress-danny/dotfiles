-- https://www.youtube.com/watch?v=e3xxkEbhG0o

local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		-- Javascript
		-- formatting.deno_fmt, -- deno must be installed in the PATH, nix installs it
		formatting.prettier,
		diagnostics.eslint,

		-- Lua
		formatting.stylua,

		-- Rust
		formatting.rustfmt,

		-- Python
		-- formatting.black.with { extra_args = { "--fast" } },
		-- formatting.yapf,
		-- diagnostics.flake8,
	},
})
