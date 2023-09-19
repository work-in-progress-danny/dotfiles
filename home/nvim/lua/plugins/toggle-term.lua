return {
  "akinsho/toggleterm.nvim", -- A nice plugin for toggling terminal windows
  config = function()
    local toggleterm = require("toggleterm")

    toggleterm.setup({
      size = 20,
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      persist_mode = true,
      direction = "float",
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    })

    function _G.set_terminal_keymaps()
      local opts = { noremap = true }
      vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts) -- allow for escape to exit insert mode
      vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
    end

    vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

    local Terminal = require("toggleterm.terminal").Terminal

    local gitui = Terminal:new({ cmd = "gitui" })
    local htop = Terminal:new({ cmd = "htop" })
    local node = Terminal:new({ cmd = "node" })
    local terminal = Terminal:new()

    function GITUI_TOGGLE()
      gitui:toggle()
    end

    function HTOP_TOGGLE()
      htop:toggle()
    end

    function NODE_TOGGLE()
      node:toggle()
    end

    function TERMINAL_TOGGLE()
      terminal:toggle()
    end

    -- local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
    --
    -- function _LAZYGIT_TOGGLE()
    -- 	lazygit:toggle()
    -- end
    --
    -- local node = Terminal:new({ cmd = "node", hidden = true })
    --
    -- function _NODE_TOGGLE()
    -- 	node:toggle()
    -- end
    --
    -- local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })
    --
    -- function _NCDU_TOGGLE()
    -- 	ncdu:toggle()
    -- end
    --

    -- local python = Terminal:new({ cmd = "python", hidden = true })
    --
    -- function _PYTHON_TOGGLE()
    -- 	python:toggle()
    -- end
  end,
}

