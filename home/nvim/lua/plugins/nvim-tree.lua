local function open_nvim_tree(data)
  local IGNORED_FT = {
    "startify",
    "dashboard",
    "alpha",
  }
  -- buffer is a [No Name]
  local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not no_name and not directory then
    return
  end

  -- &ft
  local filetype = vim.bo[data.buf].ft

  -- change to the directory
  if directory then
    vim.cmd.cd(data.file)
  end

  -- skip ignored filetypes
  if vim.tbl_contains(IGNORED_FT, filetype) then
    return
  end

  -- open the tree
  require("nvim-tree.api").tree.open()
end

-- this is a callback to open nvim_tree on nvim start. There used to be a nice setting in the setup
-- function but it was removed. This is a workaround to open the tree on nvim start.
-- see: https://github.com/nvim-tree/nvim-tree.lua/wiki/Open-At-Startup
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- https://www.youtube.com/watch?v=SpexCBrZ1pQ&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ&index=15
return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local nvim_tree = require("nvim-tree")
    local api = require("nvim-tree.api")
    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- I removed a bunch of keymaps, if something doesn't work it was this commit: #7174eb2584e923461dc0fcda0aa93019cba4fd6a
    vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
    vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
    --[[ vim.keymap.set("n", "s", api.node.open.horizontal, opts("Open: Horizontal Split")) ]]

    nvim_tree.setup({
      renderer = {
        root_folder_label = false,
        icons = {
          glyphs = {
            default = "",
            symlink = "",
            git = {
              unstaged = "",
              staged = "✔",
              unmerged = "",
              renamed = "➜",
              deleted = "",
              ignored = "◌",
              untracked = "?",
            },
            folder = {
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
            },
          },
        },
      },
      disable_netrw = true,
      hijack_netrw = true,
      open_on_tab = false,
      hijack_cursor = false,
      update_cwd = true,
      diagnostics = {
        enable = true,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      update_focused_file = {
        enable = true,
        update_cwd = true,
      },
      git = {
        enable = true,
        ignore = true,
        timeout = 500,
      },
      view = {
        width = 50,
        side = "left",
        number = false,
        relativenumber = false,
      },
      trash = {
        cmd = "trash",
        require_confirm = true,
      },
    })

    Get_and_set_gruvbox_highlight_group("GruvboxGreen", "guifg", "NvimTreeGitStaged", "guifg")
    Get_and_set_gruvbox_highlight_group("GruvboxPurpleBold", "guifg", "NvimTreeGitNew", "guifg")
  end,
}
