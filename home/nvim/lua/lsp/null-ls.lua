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
	debug = false,
	sources = {
		-- Javascript
		-- formatting.deno_fmt, -- deno must be installed in the PATH, nix installs it
		formatting.prettierd,
		diagnostics.eslint_d,

		-- Lua
		formatting.stylua,

		-- Nix
		diagnostics.statix,
		code_actions.statix,
		-- Bash
		diagnostics.shellcheck,

		-- Rust
		-- rustfmt defaults to rust 2015, this script attempts to read from cargo.toml or defaults to 2021
		-- https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Source-specific-Configuration#rustfmt
		-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#rustfmt
		formatting.rustfmt.with({
			extra_args = function(params)
				local Path = require("plenary.path")
				local cargo_toml = Path:new(params.root .. "/" .. "Cargo.toml")

				if cargo_toml:exists() and cargo_toml:is_file() then
					for _, line in ipairs(cargo_toml:readlines()) do
						local edition = line:match([[^edition%s*=%s*%"(%d+)%"]])
						if edition then
							return { "--edition=" .. edition }
						end
					end
				end
				-- default edition when we don't find `Cargo.toml` or the `edition` in it.
				return { "--edition=2021" }
			end,
		}),

		-- Python
		-- formatting.black.with { extra_args = { "--fast" } },
		-- formatting.yapf,
		-- diagnostics.flake8,
	},
})

fidget.setup() -- provide a UI for nvim-lsp's progress handler
