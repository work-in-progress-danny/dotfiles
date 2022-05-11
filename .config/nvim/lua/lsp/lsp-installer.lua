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

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
-- lsp_installer.on_server_ready(function(server)
-- 	local opts = {
-- 	}
-- 	if server.name == "jsonls" then
-- 		local jsonls_opts = require("lsp.settings.jsonls")
-- 		opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
-- 	end
-- 	if server.name == "sumneko_lua" then
-- 		local sumneko_opts = require("lsp.settings.sumneki_lua")
-- 		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
-- 	end
-- 	if server.name == "pyright" then
-- 		local pyright_opts = require("lsp.settings.pyright")
-- 		opts = vim.tbl_deep_extend("force", pyright_opts, opts)
-- 	end
-- 	-- This setup() function is exactly the same as lspconfig's setup function.
-- 	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- 	server:setup(opts)
-- end)

-- lspconfig.tsserver.setup({
-- 	init_options = { require("lsp.settings.tsserver") },
-- })
