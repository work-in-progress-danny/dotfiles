return {
  "zbirenbaum/copilot.lua",
  event = "InsertEnter",
  dependencies = { "zbirenbaum/copilot-cmp" },
  config = function()
    require("copilot").setup({
      debounce = 50,
      filetypes = {
        telescope = false,
        gitcommit = true,
      },
    })
    require("copilot_cmp").setup({ method = "getCompletionsCycling" })
  end,
}
