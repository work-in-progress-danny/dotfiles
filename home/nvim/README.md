# My Neovim Config

This is a pretty custom none-isolated installation, many of the dependencies are installed via Nix,
If you're using it go wild. Maybe one day I'll move to a nix based setup/config until then Lua it is

## TODO

### Features

- figure out folding

- Figure out spelling. Kind of done, z = opens all the spelling suggestions. I would want a better interface for it though

add all `lua vim.lsp.buf.` functions to keymaps, things like;

- highlight all matching
- go to definition
- show all use cases
- show signature
- change "show error hover" text colour to anything but red
- map `<leader>k` to show error and code action with a nice popup

### Fixes

- find a nicer colour scheme, for some reason gruv box in the terminal is shit
  why are functions the same color as text but props are all colour coded?

### Performance

- ~eslint~ prettier is slow.. I wonder if deno is better, like a rust process running in the
  backround the adhears to ~eslintrc~ prettierrc rules. I think why it's slow is because it runs node ~eslint~ prettier every time

## Design notes

I like gruvbox but the current theme is pissing me off, maybe its the lsp

I don't want to ever have to use `:`, instead I want to have a leader shortcut for everything

## Notes

LSP's provide snippets, colour coding, error checking
Formatters ( null-ls )

Solidify my understanding of this setup;

- what is an lsp server

## Tips / Keymaps

- `ctrl o` can open a closed buffer

- in nvim-tree `ctrl k` show hovered file details

- `:noh` is no highlight / removes all highlights

- `*` highlights all occurences under cursor

- `:windo close` closes the current window but leaves the buffer open (it will pop up in your remaining window)

- gJ split joins up, gS split joins down

## Radar

https://github.com/ahmedkhalf/project.nvim https://github.com/LunarVim/Neovim-from-scratch/commit/60c29a60a338d81bd93d7784595c3e91f0772053
