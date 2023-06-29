local M = {}

M.on_attach = function(client)
	if
		client.name == "tsserver"
		or client.name == "jsonls"
		or client.name == "rustfmt"
		or client.name == "rust_analyzer"
		or client.name == "lua_ls"
	then
		client.server_capabilities.document_formatting = false -- disable language servers that also do formatting, leave it up to null-ls
	end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	return
end

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
