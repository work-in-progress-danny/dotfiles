local _, lsp_installer = pcall(require, "nvim-lsp-installer")
if not _ then
	return
end

local _, lspconfig = pcall(require, "lspconfig")
if not _ then
	return
end

local _, rust_tools = pcall(require, "rust-tools")
if not _ then
	return
end

lsp_installer.setup({
	ensure_installed = {
		"sumneko_lua",
		"pyright",
		"jsonls",
		"tsserver",
		"tailwindcss",
		"cssls",
		"rust_analyzer",
		"rnix",
		"bashls",
		"clangd",
	},
})

local on_attach = require("lsp.handlers").on_attach
local capabilities = require("lsp.handlers").capabilities

lspconfig.sumneko_lua.setup({
	settings = require("lsp.settings.sumneko_lua").settings,
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

lspconfig.tailwindcss.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.cssls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.rust_analyzer.setup({
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

rust_tools.setup({
	tools = { -- rust-tools options
		autoSetHints = true,
		hover_with_actions = true,
		inlay_hints = {
			show_parameter_hints = false,
			parameter_hints_prefix = "",
			other_hints_prefix = "",
		},
	},

	-- all the opts to send to nvim-lspconfig
	-- these override the defaults set by rust-tools.nvim
	-- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
	server = {
		-- on_attach is a callback called when the language server attachs to the buffer
		on_attach = on_attach,
		capabilities = capabilities,
		-- settings = {
		-- to enable rust-analyzer settings visit:
		-- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
		-- ["rust-analyzer"] = {
		-- enable clippy on save
		-- checkOnSave = {
		-- 	command = "clippy",
		-- 	-- },
		-- },
		-- },
	},
})
