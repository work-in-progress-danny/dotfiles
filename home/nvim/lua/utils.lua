-- Desc: Utility functions for use in other lua files

-- Try to require a package, gracefully fail and print out some debug info
function TryRequire(package_name)
  local status_ok, package = pcall(require, package_name)
  local file_path = debug.getinfo(2, "S").source
  local calling_line = debug.getinfo(2, "l").currentline

  if not status_ok then
    print('Failed to require: "' .. package_name .. '" ' .. file_path .. ":" .. calling_line .. ".")
    return nil
  end

  return package
end

-- Shorthand for vim.cmd
function Cmd(command_body)
  return "<cmd>" .. command_body .. "<cr>"
end

-- A nice way to set highlight groups from Gruvbox's highlight groups
-- example:
-- Get_and_set_gruvbox_highlight_group("GruvboxBg0", "guifg", "FoldColumn", "guibg")
-- You can find the Gruvbox highlight groups by running :hi Gruvbox<tab>
function Get_and_set_gruvbox_highlight_group(
  gruvbox_highlight,
  gruvbox_highlight_attribute,
  target_highlight_group,
  target_highlight_attribute
)
  -- Get the attributes of the source highlight group
  local highlight_info = vim.api.nvim_exec("highlight " .. gruvbox_highlight, true)

  -- Extract the desired attribute (like guibg, guifg, ctermfg, etc.)
  local colour = string.match(highlight_info, gruvbox_highlight_attribute .. "=(%S+)")
  if not colour then
    print("Unable to find " .. gruvbox_highlight_attribute .. " in " .. gruvbox_highlight)
    return
  else
    -- Set the attribute for the target highlight group
    vim.cmd("highlight " .. target_highlight_group .. " " .. target_highlight_attribute .. "=" .. colour)
  end
end
