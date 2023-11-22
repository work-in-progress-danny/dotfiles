local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("utils")
TryRequire("user")
TryRequire("lazy").setup("plugins", {
  checker = {
    -- automatically check for plugin updates
    enabled = true,
    concurrency = 10, ---@type number? set to 1 to check for updates very slowly
    notify = true,   -- get a notification when new updates are found
    frequency = 86400, -- check for updates every 24 hours
  },
  change_detection = {
    -- automatically check for config file changes and reload the ui
    enabled = false,
    notify = false, -- get a notification when changes are found
  },
})
