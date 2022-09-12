# My Neovim Config

> This is a pretty custom none-isolated installation, many of the dependencies are installed via Nix,
> if you're using nix too, go wild, else be prepared for broken installs. Maybe one day I'll move to
> a nix based setup/config until then Lua it is.

## Installation

1. move this directory to your ~/.config/nvim
2. run `nvim`, this will be pretty buggy as everything is installing and configuring itself, restart
   nvim a few times prompting any failed installs again. When in Neovm you can run `:PackerInstall` to install all remaining dependencies.

## TODO

### Features

- figure out folding
- Figure out spelling. Kind of done, `z=` opens all the spelling suggestions. I would want a cleaner interface for it though

- map `<leader>k` to show error and code action with a nice popup

### Bugs

- when in telescope, and not in insert mode, if which key is triggered an error will occur
  - the same thing would happen when in nvim-tree, maybe I should dup that logic
- change "show error hover" text colour to anything but red

### Performance

- lazy load plugins?
  - alpha.nvim, only load on empty buffer startup?

## Design notes

I don't want to ever have to use `:`, instead I want to have a leader shortcut for everything

## Notes

### Tips / Keymaps

- `ctrl o` can open a closed buffer

- in nvim-tree `ctrl k` show hovered file details

- `:noh` is no highlight / removes all highlights

- `*` highlights all occurences under cursor

- `:windo close` closes the current window but leaves the buffer open (it will pop up in your remaining window)

- gJ split joins up, gS split joins down

- when search and replacing `:%s/` `( )` are capture groups and can be used to replace with `\1` `\2`. don't for get to escape the `\( \)`

## Radar

https://github.com/ahmedkhalf/project.nvim https://github.com/LunarVim/Neovim-from-scratch/commit/60c29a60a338d81bd93d7784595c3e91f0772053
