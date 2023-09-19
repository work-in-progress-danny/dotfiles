-- -- Info line at the bottom of the buffer showing git diff and location
return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "kyazdani42/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    -- Color table for highlights
    -- stylua: ignore start
    local mode_color = {
      n      = Colors.red,
      i      = Colors.green,
      v      = Colors.blue,
      [""]  = Colors.blue,
      V      = Colors.blue,
      c      = Colors.magenta,
      no     = Colors.red,
      s      = Colors.orange,
      S      = Colors.orange,
      [""]  = Colors.orange,
      ic     = Colors.yellow,
      R      = Colors.violet,
      Rv     = Colors.violet,
      cv     = Colors.red,
      ce     = Colors.red,
      r      = Colors.cyan,
      rm     = Colors.cyan,
      ["r?"] = Colors.cyan,
      ["!"]  = Colors.red,
      t      = Colors.red,
    }

    local mode_label = {
      n      = "Normal",
      i      = "Insert",
      v      = "Visual",
      [""]  = "Visual Block",
      V      = "Visual Line",
      c      = "Command",
      r      = Colors.cyan,
      rm     = Colors.cyan,
      ["r?"] = Colors.cyan,
      ["!"]  = Colors.red,
      t      = Colors.red,

      -- don't know what modes these are
      no     = Colors.red,
      s      = Colors.orange,
      S      = Colors.orange,
      [""]  = Colors.orange,
      ic     = Colors.yellow,
      R      = "Replace",
      Rv     = Colors.violet,
      cv     = Colors.red,
      ce     = Colors.red,
    }
    -- stylua: ignore end

    local conditions = {
      buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
      end,
      hide_in_width = function()
        return vim.fn.winwidth(0) > 80
      end,
      check_git_workspace = function()
        local filepath = vim.fn.expand("%:p:h")
        local gitdir = vim.fn.finddir(".git", filepath .. ";")
        return gitdir and #gitdir > 0 and #gitdir < #filepath
      end,
    }

    -- Config
    local config = {
      options = {
        -- Disable sections and component separators
        component_separators = "",
        section_separators = "",
        theme = {
          -- We are going to use lualine_c an lualine_x as left and
          -- right section. Both are highlighted by c theme .  So we
          -- are just setting default looks o statusline
          normal = { c = { fg = Colors.fg, bg = Colors.bg } },
          inactive = { c = { fg = Colors.fg, bg = Colors.bg } },
        },
      },
      sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        -- These will be filled later
        lualine_c = {},
        lualine_x = {},
      },
      inactive_sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
      },
    }

    -- Inserts a component in lualine_c at left section
    local function ins_left(component)
      table.insert(config.sections.lualine_c, component)
    end

    -- Inserts a component in lualine_x ot right section
    local function ins_right(component)
      table.insert(config.sections.lualine_x, component)
    end

    ins_left({
      -- mode component
      function()
        -- auto change label according to Neovim's mode
        return mode_label[vim.fn.mode()]
      end,
      color = function()
        -- auto change color according to Neovim's mode
        return { fg = mode_color[vim.fn.mode()] }
      end,
      padding = { left = 1 },
    })

    ins_left({
      "filename",
      file_status = true, -- displays file status (readonly status, modified status)
      path = 1,        -- 0 = just filename, 1 = relative path, 2 = absolute path
      color = { fg = Colors.violet },
    })

    ins_left({
      -- filesize component
      "filesize",
      cond = conditions.buffer_not_empty,
    })

    ins_left({ "location", cond = conditions.buffer_not_empty })

    ins_left({ "progress", color = { fg = Colors.fg }, padding = { left = -1 } })

    ins_left({
      "diagnostics",
      sources = { "nvim_diagnostic" },
      symbols = { error = " ", warn = " ", info = " " },
      diagnostics_color = {
        color_error = { fg = Colors.red },
        color_warn = { fg = Colors.yellow },
        color_info = { fg = Colors.cyan },
      },
    })

    -- Insert mid section. You can make any number of sections in neovim :)
    -- for lualine it's any number greater then 2
    -- ins_left({
    -- 	function()
    -- 		return "%="
    -- 	end,
    -- })

    -- ins_left({
    -- 	-- Lsp server name .
    -- 	function()
    -- 		local msg = "No Active Lsp"
    -- 		local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
    -- 		local clients = vim.lsp.get_active_clients()
    -- 		if next(clients) == nil then
    -- 			return msg
    -- 		end
    -- 		for _, client in ipairs(clients) do
    -- 			local filetypes = client.config.filetypes
    -- 			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
    -- 				return client.name
    -- 			end
    -- 		end
    -- 		return msg
    -- 	end,
    -- 	icon = " LSP:",
    -- 	color = { fg = "#ffffff" },
    -- })

    -- Add components to right sections
    ins_right({
      "o:encoding",    -- option component same as &encoding in viml
      fmt = string.upper, -- I'm not sure why it's upper case either ;)
      cond = conditions.hide_in_width,
      color = { fg = Colors.green },
    })

    ins_right({
      "fileformat",
      fmt = string.upper,
      icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
      color = { fg = Colors.green },
    })

    ins_right({
      "branch",
      icon = "",
      color = { fg = Colors.violet },
    })

    ins_right({
      "diff",
      -- Is it me or the symbol for modified us really weird
      symbols = { added = " ", modified = "柳", removed = " " },
      diff_color = {
        added = { fg = Colors.green },
        modified = { fg = Colors.orange },
        removed = { fg = Colors.red },
      },
      cond = conditions.hide_in_width,
    })

    -- Now don't forget to initialize lualine
    lualine.setup(config)
  end,
}
