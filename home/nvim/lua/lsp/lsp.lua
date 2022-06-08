-- reference video https://www.youtube.com/watch?v=6F3ONwrCxMg&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ&index=8

local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("lsp.lsp-installer")
require("lsp.handlers").setup()
