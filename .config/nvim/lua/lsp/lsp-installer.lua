local _, lsp_installer = pcall(require, "nvim-lsp-installer")
if not _ then
	return
end

local _, lspconfig = pcall(require, "lspconfig")
if not _ then
	return
end

lsp_installer.setup()

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

lspconfig.rust_analyzer.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
