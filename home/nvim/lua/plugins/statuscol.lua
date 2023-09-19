return {
  "luukvbaal/statuscol.nvim",
  config = function()
    local builtin = require("statuscol.builtin")

    vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
    vim.o.foldcolumn = "1"
    vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
    --[[ vim.cmd([[: highlight FoldColumn guibg=#1e222a guifg=]]

    Get_and_set_gruvbox_highlight_group("GruvboxBg0", "guifg", "FoldColumn", "guibg")
    Get_and_set_gruvbox_highlight_group("GruvboxFg1", "guifg", "FoldColumn", "guifg")

    require("statuscol").setup({

      segments = {
        {
          text = { builtin.foldfunc },
          click = "v:lua.ScFa",
          auto = true,
          condition = { builtin.not_empty }, -- table of booleans or functions returning a boolean
          hl = "FoldColumn",            -- %# highlight group label, applies to each text element
          bg = "Normal",                -- %* highlight group label, applies to the background
          sign = {                      -- table of fields that configure a sign segment
            -- at least one of "name", "text", and "namespace" is required
            -- legacy signs are matched against the defined sign name e.g. "DiagnosticSignError"
            -- extmark signs can be matched agains either the namespace or the sign text itself
            name = { ".*" }, -- table of lua patterns to match the sign name against
            text = { ".*" }, -- table of lua patterns to match the extmark sign text against
            namespace = { ".*" }, -- table of lua patterns to match the extmark sign namespace against
            -- below values list the default when omitted:
            maxwidth = 1,   -- maximum number of signs that will be displayed in this segment
            colwidth = 2,   -- number of display cells per sign in this segment
            auto = false,   -- when true, the segment will not be drawn if no signs matching
            -- the pattern are currently placed in the buffer.
            wrap = false,   -- when true, signs in this segment will also be drawn on the
            -- virtual or wrapped part of a line (when v:virtnum != 0).
            fillchar = " ", -- character used to fill a segment with less signs than maxwidth
            fillcharhl = nil, -- highlight group used for fillchar (SignColumn/CursorLineSign if omitted)
          },
        },
        {
          sign = { name = { "Diagnostic" }, maxwidth = 1 },
          click = "v:lua.ScSa",
        },
        { text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
        {
          sign = { name = { ".*" }, maxwidth = 2, colwidth = 1, wrap = true, auto = true },
          click = "v:lua.ScSa",
        },
      },
    })
  end,
}
