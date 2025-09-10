local map = vim.keymap.set
vim.g.mapleader = " "

-- Built-in explorer
map("n", "<leader>ex", vim.cmd.Ex, { desc = "Explorer (netrw)" })

-- Make current file executable and run with python
_G.MakeExecutableAndExecute = function()
  vim.cmd("silent execute '!chmod +x %'")
  vim.cmd("execute '!python3 %'")
end
map("n", "<F9>", ":lua MakeExecutableAndExecute()<CR>", { noremap = true, desc = "Make file executable and run" })

-- Save
map("n", "<C-s>", ":w<CR>", { noremap = true, silent = true, desc = "Save file" })

-- Move selected lines
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true, desc = "Move selection up" })

-- Find and replace helpers
map("n", "<C-g>", ":%s//g<Left><Left>", { noremap = true, desc = "Global substitute prompt" })
map("n", "<CR>", ":s//<Left><Left>", { noremap = true, desc = "Inline substitute prompt" })
map("n", "<S-CR>", ":%s//g<Left><Left>", { noremap = true, desc = "Global substitute prompt" })

-- Multi-cursor (vim-visual-multi) - map to <Plug>, allow remap
map("n", "<C-up>", "<Plug>(VM-AddCursorDown)", { remap = true })
map("n", "<C-down>", "<Plug>(VM-AddCursorUp)", { remap = true })

-- Harpoon: lazy-load plugin on first use, then execute
local function _harpoon_load()
  require("lazy").load({ plugins = { "harpoon" } })
end
map("n", "<leader>a", function() _harpoon_load(); require("harpoon.mark").add_file() end, { desc = "Harpoon add file" })
map("n", "<C-e>", function() _harpoon_load(); require("harpoon.ui").toggle_quick_menu() end)
-- map("n", "<C-h>", function() _harpoon_load(); require("harpoon.ui").nav_file(1) end)
-- map("n", "<C-t>", function() _harpoon_load(); require("harpoon.ui").nav_file(2) end)
-- map("n", "<C-n>", function() _harpoon_load(); require("harpoon.ui").nav_file(3) end)

-- Fugitive
map("n", "<leader>gs", vim.cmd.Git, { desc = "Git status" })

-- Undotree
map("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })

-- Telescope keys are defined in the plugin spec for reliable lazy-loading


-- Build all (your mapping)
map("n", "<leader>ba", function()
  vim.cmd("silent !cd ~/Downloads/UIT/HK2/DSA/build && cmake ../solutions/ && make")
end, { silent = true, desc = "Build all solutions" })
