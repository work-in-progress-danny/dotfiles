local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	return
end

local on_attach = function(client)
	if
		client.name == "jsonls"
		or client.name == "rustfmt"
		or client.name == "rust_analyzer"
		or client.name == "lua_ls"
	then
		client.server_capabilities.documentFormattingProvider = false -- disable language servers that also do formatting, leave it up to null-ls
		client.server_capabilities.documentRangeFormattingProvider = false -- disable language servers that also do formatting, leave it up to null-ls
	end
end
local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

return {
	"williamboman/mason.nvim", -- :MasonUpdate updates registry contents
	event = "BufRead",
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local lspconfig = require("lspconfig")
		local rust_tools = require("rust-tools")

		mason.setup()
		mason_lspconfig.setup()

		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
					-- Do not send telemetry data containing a randomized but unique identifier
					telemetry = {
						enable = false,
					},
				},
			},
			on_attach = on_attach,
			capabilities = capabilities,
		})

		lspconfig.jsonls.setup({
			settings = require("lsp.settings.jsonls").settings,
			on_attach = on_attach,
			capabilities = capabilities,
		})

		lspconfig.ts_ls.setup({
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

					vim.cmd([[
            autocmd BufEnter,CursorHold,InsertLeave,BufWritePost *.rs silent! lua print('hit')
          ]])
				end,
				autoSetHints = true,
				inlay_hints = {
					show_parameter_hints = false,
					parameter_hints_prefix = "",
					other_hints_prefix = "",
				},
			},
			server = {
				settings = {
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

		local signs = {
			{ name = "DiagnosticSignError", text = "" },
			{ name = "DiagnosticSignWarn", text = "" },
			{ name = "DiagnosticSignHint", text = "" },
			{ name = "DiagnosticSignInfo", text = "" },
		}
		Get_and_set_gruvbox_highlight_group("GruvboxRed", "guifg", "DiagnosticSignError", "guifg")
		Get_and_set_gruvbox_highlight_group("GruvboxYellow", "guifg", "DiagnosticSignWarn", "guifg")
		Get_and_set_gruvbox_highlight_group("GruvboxAqua", "guifg", "DiagnosticSignHint", "guifg")
		Get_and_set_gruvbox_highlight_group("GruvboxPurple", "guifg", "DiagnosticSignInfo", "guifg")

		for _, sign in ipairs(signs) do
			vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text })
		end

		vim.diagnostic.config({
			virtual_text = false,
			signs = {
				active = signs,
			},
			update_in_insert = true,
			underline = true,
			severity_sort = true,
			float = {
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})

		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
			border = "rounded",
		})

		vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
			border = "rounded",
		})
	end,
}
