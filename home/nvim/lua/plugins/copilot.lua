local status_ok, _ = pcall(require, "github/copilot.vim")
if not status_ok then
	return
end

-- [reddit post with fix for copilot making suggestions in TelescopePrompt](https://www.reddit.com/r/neovim/comments/qs8siw/copilot_and_telescope/)
-- check more info with :h copilot
vim.cmd([[
  let g:copilot_filetypes = { 'TelescopePrompt': v:false }
  highlight CopilotSuggestion guifg=#555555 ctermfg=8 " change this later maybe 
]])
