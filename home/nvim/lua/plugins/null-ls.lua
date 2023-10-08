-- https://www.youtube.com/watch?v=e3xxkEbhG0o

return {
  "jose-elias-alvarez/null-ls.nvim",
  event = "BufRead",
  dependencies = {
    "jay-babu/mason-null-ls.nvim",
    { "j-hui/fidget.nvim", tag = "legacy" }, -- nice little notifier in the corner communicating the current state of Null-ls
  },
  config = function()
    local null_ls = require("null-ls")
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    local formatting = null_ls.builtins.formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    local diagnostics = null_ls.builtins.diagnostics
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    local code_actions = null_ls.builtins.code_actions

    null_ls.setup({
      --[[ debug = true, ]]
      sources = {
        -- Javascript / Typescript
        diagnostics.eslint_d,
        code_actions.eslint_d,
        formatting.eslint_d,

        formatting.prettierd.with({
          extra_filetypes = {
            "TOML",
            "astro",
            "css",
            "scss",
            "less",
            "html",
            "json",
            "yaml",
            "markdown",
            "graphql",
          },
        }),

        -- Lua
        formatting.stylua,
        diagnostics.luacheck.with({
          args = { "--no-color" },
        }),

        -- Nix
        diagnostics.statix,
        code_actions.statix,

        -- Bash
        diagnostics.shellcheck,

        -- C
        diagnostics.cppcheck,
        -- formatting is done by clangd (lsp-config)

        -- Rust (rust-analyzer) is handled by rust-tools.nvim
        formatting.rustfmt.with({
          extra_args = function(params)
            local Path = require("plenary.path")
            local cargo_toml = Path:new(params.root .. "/" .. "Cargo.toml")

            if cargo_toml:exists() and cargo_toml:is_file() then
              for _, line in ipairs(cargo_toml:readlines()) do
                local edition = line:match([[^edition%s*=%s*%"(%d+)%"]])
                if edition then
                  return { "--edition=" .. edition }
                end
              end
            end
            -- default edition when we don't find `Cargo.toml` or the `edition` in it.
            return { "--edition=2021" }
          end,
        }),
      },
    })

    require("fidget").setup() -- provide a UI for nvim-lsp's progress handler
  end,
}
