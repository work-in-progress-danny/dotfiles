require("mason").setup()
require("mason-lspconfig").setup()

-- After setting up mason-lspconfig you may set up servers via lspconfig
-- require("lspconfig").lua_ls.setup {}
-- require("lspconfig").rust_analyzer.setup {}
-- ...
local _, lspconfig = pcall(require, "lspconfig")
if not _ then
	return
end

local _, rust_tools = pcall(require, "rust-tools")
if not _ then
	return
end

local on_attach = require("lsp.handlers").on_attach
local capabilities = require("lsp.handlers").capabilities

lspconfig.lua_ls.setup({
	settings = require("lsp.settings.lua_ls").settings,
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.jsonls.setup({
	settings = require("lsp.settings.jsonls").settings,
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.pyright.setup({
	settings = require("lsp.settings.pyright").settings,
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.astro.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.svelte.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.tailwindcss.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = {
		"astro",
		"html",
		"css",
		"scss",
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"svelte",
	},
})

lspconfig.cssls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.rnix.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.clangd.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.bashls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.kotlin_language_server.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

rust_tools.setup({ -- rust-tools is a special thing, and doesn't get setup with lspconfig or null-ls
	expand_macro = true,
	tools = {
		on_initialized = function()
			vim.cmd([[
            autocmd BufEnter,CursorHold,InsertLeave,BufWritePost *.rs silent! lua vim.lsp.codelens.refresh()
          ]])
		end,
		autoSetHints = true,
		-- hover_with_actions = true, deprecated unknown reason 16/8/22
		inlay_hints = {
			show_parameter_hints = false,
			parameter_hints_prefix = "",
			other_hints_prefix = "",
		},
	},
	server = {
		settings = {
			-- on_attach = on_attach, -- broken for some reason 22/10/22
			capabilities = capabilities,
			["rust-analyzer"] = {
				lens = {
					enable = true,
				},
				checkOnSave = {
					command = "clippy",
				},
			},
		},
	},
})
