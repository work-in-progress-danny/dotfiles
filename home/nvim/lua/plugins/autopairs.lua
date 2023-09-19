return {
  "windwp/nvim-autopairs",
  config = function()
    local nvim_autopairs = TryRequire("nvim-autopairs")
    local nvim_ts_autotag = TryRequire("nvim-ts-autotag")
    local cmp = TryRequire("cmp")

    if not cmp or not nvim_autopairs or not nvim_ts_autotag then
      return
    end

    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

    local filetypes = {
      "html",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "svelte",
      "vue",
      "tsx",
      "jsx",
      "rescript",
      "xml",
      "php",
      "markdown",
      "glimmer",
      "handlebars",
      "hbs",
    }
    local skip_tags = {
      "area",
      "base",
      "br",
      "col",
      "command",
      "embed",
      "hr",
      "img",
      "slot",
      "input",
      "keygen",
      "link",
      "meta",
      "param",
      "source",
      "track",
      "wbr",
      "menuitem",
    }

    nvim_ts_autotag.setup({ skip_tags = skip_tags, filetypes = filetypes })

    nvim_autopairs.setup({
      check_ts = true,
      -- ts_config = {
      -- 	lua = { "string", "source" },
      -- 	javascript = { "string", "template_string" },
      -- },
      disable_filetype = { "TelescopePrompt", "spectre_panel" },
      -- fast_wrap = {
      -- 	map = "<M-e>",
      -- 	chars = { "{", "[", "(", '"', "'" },
      -- 	pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
      -- 	offset = 0, -- Offset from pattern match
      -- 	end_key = "$",
      -- 	keys = "qwertyuiopzxcvbnmasdfghjkl",
      check_comma = true,
      -- 	highlight = "PmenuSel",
      -- 	highlight_grey = "LineNr",
      -- },
    })
  end,
}
