Custom Keybinds (Lazy Migration)

- Leader: `<Space>`

Core
- `<leader>ex` — Open netrw explorer (`:Ex`).
- `<C-s>` — Save current buffer (`:w`). Note: when Harpoon loads, `<C-s>` is remapped by Harpoon (see below).
- `<F9>` — Make current file executable and run with Python3.
- Move lines: visual `<A-j>` move down, `<A-k>` move up.
- Find/replace helpers:
  - Normal `<C-g>` inserts `:%s//g` with cursor before flags.
  - Normal `<CR>` inserts `:s//` with cursor before flags.
  - Normal `<S-CR>` inserts `:%s//g` with cursor before flags.

Find (Telescope)
- `<leader>f` — Files (current working directory).
- `<leader>fd` — Files (current file’s directory).
- `<leader>fp` — Files (initial cwd when Neovim started).
- `<leader>fg` — Git files.
- `<leader>F` — Files (home directory).

Harpoon
- `<leader>a` — Add current file to Harpoon list.
- `<C-e>` — Toggle Harpoon quick menu.
- `<C-h>` — Jump to Harpoon file 1.
- `<C-t>` — Jump to Harpoon file 2.
- `<C-n>` — Jump to Harpoon file 3.
- `<C-s>` — Jump to Harpoon file 4 (overrides save mapping while Harpoon is active).

Git (vim-fugitive)
- `<leader>gs` — Open `:Git` status.

Undo Tree
- `<leader>u` — Toggle `:UndotreeToggle`.

LSP (set on LSP attach)
- `gd` — Go to definition.
- `K` — Hover documentation.
- `<leader>vws` — Workspace symbol search.
- `<leader>vd` — Open diagnostics float.
- `[d` — Next diagnostic.
- `]d` — Previous diagnostic.
- `<leader>vca` — Code action menu.
- `<leader>vrr` — References.
- `<leader>vrn` — Rename symbol.
- Insert `<C-h>` — Signature help.
- `<leader>qf` — Apply preferred quick fix code action.

Completion (nvim-cmp)
- Insert `<C-p>` — Select previous item.
- Insert `<C-n>` — Select next item.
- Insert `<C-b>` — Scroll docs up.
- Insert `<C-f>` — Scroll docs down.
- Insert `<C-y>` — Confirm selection.
- Insert `<C-Space>` — Trigger completion.

Multi-cursor (vim-visual-multi)
- Normal `<C-up>` — Add cursor below (`<Plug>(VM-AddCursorDown)`).
- Normal `<C-down>` — Add cursor above (`<Plug>(VM-AddCursorUp)`).
  - See plugin docs for full feature set (Tab to switch mode, run macros/ex, etc.).

Build helper
- `<leader>ba` — Run project build: `cd ~/Downloads/UIT/HK2/DSA/build && cmake ../solutions/ && make`.

QoL Plugins

WhichKey
- Shows available keys after pressing `<leader>` (help pop-up).
- `:WhichKey` — Open WhichKey for all mappings.
- `:WhichKey <leader>` — Show mappings under leader.

Comment.nvim
- Normal/Visual `gc` — Toggle linewise comment.
- Normal/Visual `gb` — Toggle blockwise comment.
- Also supports `gco` (comment below), `gcO` (above), `gcA` (end of line).

nvim-surround
- `ys<motion><char>` — Surround selection given by motion.
- `ds<char>` — Delete surrounding.
- `cs<old><new>` — Change surrounding.
- Visual `S<char>` — Surround selection.

ToggleTerm
- `<C-\`>` — Toggle floating terminal.
- `:ToggleTerm` — Command to toggle terminals.

Trouble
- `:TroubleToggle` — Toggle diagnostics/quickfix list UI.
- `:Trouble` — Open with a specific mode, e.g. `:Trouble diagnostics`.

TODO Comments
- `:TodoTrouble` — Show TODOs in Trouble list.
- `:TodoQuickFix` — Populate quickfix list with TODOs.

Other QoL (no default keybinds)
- Gitsigns — Adds git gutter signs; use `:Gitsigns ...` commands or ask to add keymaps.
- Indent Blankline — Shows indent guides automatically.
- Colorizer — Highlights color codes inline.
- Notify — Replaces `vim.notify` with a nicer UI.

