return {
	"karb94/neoscroll.nvim",
	config = function()
		local neoscroll = require("neoscroll")

		local keymap = {
			["<C-u>"] = function()
				neoscroll.ctrl_u({ duration = 100 })
			end,
			["<C-d>"] = function()
				neoscroll.ctrl_d({ duration = 100 })
			end,
			["<C-b>"] = function()
				neoscroll.ctrl_b({ duration = 100 })
			end,
			["<C-f>"] = function()
				neoscroll.ctrl_f({ duration = 100 })
			end,
			["<C-y>"] = function()
				neoscroll.scroll(-0.1, { move_cursor = false, duration = 100 })
			end,
			["<C-e>"] = function()
				neoscroll.scroll(0.1, { move_cursor = false, duration = 100 })
			end,
			["zt"] = function()
				neoscroll.zt({ half_win_duration = 250 })
			end,
			["zz"] = function()
				neoscroll.zz({ half_win_duration = 250 })
			end,

			["zb"] = function()
				neoscroll.zb({ half_win_duration = 250 })
			end,

			["G"] = function()
				local bufnr = vim.api.nvim_get_current_buf()
				local lines = vim.api.nvim_buf_line_count(bufnr)

				if lines < 400 then
					neoscroll.scroll(lines, { move_cursor = true, duration = 100 })
				else
					vim.api.nvim_command("normal! G")
				end
			end,

			["gg"] = function()
				local bufnr = vim.api.nvim_get_current_buf()
				local lines = vim.api.nvim_buf_line_count(bufnr)

				if lines < 400 then
					neoscroll.scroll(0, { move_cursor = true, duration = 100 })
				else
					vim.api.nvim_command("normal! gg")
				end
			end,
		}
		local modes = { "n", "v", "x" }

		for key, func in pairs(keymap) do
			vim.keymap.set(modes, key, func)
		end

		neoscroll.setup({ keymap })
	end,
}
