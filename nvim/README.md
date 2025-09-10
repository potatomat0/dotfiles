# Lazy.nvim Test Migration

This folder contains a self‑contained Lazy.nvim config that mirrors your current Packer setup, keymaps, options, and Vimscript settings — without touching your existing config.

## Quick Start (best isolation)

- Ensure Neovim 0.8+ and Git are installed.
- Use a separate app name so it won’t load your main config:

```bash
export NVIM_APPNAME=nvim-lazy-migration
mkdir -p ~/.config/$NVIM_APPNAME
cp -a "$(pwd)"/lazy-migration/* ~/.config/$NVIM_APPNAME/
# First launch triggers lazy bootstrap + installs plugins
nvim
```

## One-off test from this folder

From repo root or inside this folder:

```bash
cd lazy-migration
nvim -u ./init.lua
```

## Headless installs / maintenance

- Install/update plugins headlessly:
```bash
nvim -u ./init.lua --headless "+Lazy! sync" +qa
```
- Update Treesitter parsers:
```bash
nvim -u ./init.lua --headless "+TSUpdate" +qa
```
- Open Mason UI to install LSPs:
```bash
nvim -u ./init.lua "+Mason"
```

## Common interactive commands (inside Neovim)

- `:Lazy` — manage plugins
- `:Mason` — manage LSP/DAP/formatters
- `:TSUpdate` — update Treesitter parsers
- `:checkhealth` — diagnostics

## Notes

- FZF keymaps: `<leader>f` (cwd file dir), `<leader>F` (home).
- Harpoon overrides `<C-s>` (matches your current precedence over save).
- Markdown preview plugin settings mirror your Vimscript config.
- Obsidian workspaces are set to your packer.lua version.

