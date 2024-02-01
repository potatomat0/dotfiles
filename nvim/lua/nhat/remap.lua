vim.g.mapleader = " "

vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)

-- pressing F9 execute the current file and grant permission automatically
_G.MakeExecutableAndExecute = function()
  vim.cmd("silent execute '!chmod +x %'")
  vim.cmd("execute '!python3 %'")
end 
vim.api.nvim_set_keymap('n', '<leader>f', ':Files %:p:h<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>F', ':FZF ~<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F9>', ':lua MakeExecutableAndExecute()<CR>', { noremap = true })
-- ctrl+s in normal mode to save files
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
-- move line(s) up/down with alt+ k/j if the whole line is selected 
vim.api.nvim_set_keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
-- find an replace 
vim.api.nvim_set_keymap("n", "<C-g>", ":%s//g<Left><Left>", { noremap = true })
vim.api.nvim_set_keymap("n", "<CR>", ":s//<Left><Left>", { noremap = true })
vim.api.nvim_set_keymap("n", "<S-CR>", ":%s//g<Left><Left>", { noremap = true })
-- multiple cursor 
-- Basic usage:
-- select words with Ctrl-N (like Ctrl-d in Sublime Text/VS Code)

-- create cursors vertically with Ctrl-Down/Ctrl-Up
-- select one character at a time with Shift-Arrows
-- press n/N to get next/previous occurrence
-- press [/] to select next/previous cursor
-- press q to skip current and get next occurrence
-- press Q to remove current cursor/selection
-- start insert mode with i,a,I,A
-- Two main modes:
-- 
-- in cursor mode commands work as they would in normal mode
-- in extend mode commands work as they would in visual mode
-- press Tab to switch between «cursor» and «extend» mode
-- Most vim commands work as expected (motions, r to replace characters, ~ to change case, etc). Additionally you can:
-- 
-- run macros/ex/normal commands at cursors
-- align cursors
-- transpose selections
-- add patterns with regex, or from visual mode
-- And more... of course, you can enter insert mode and autocomplete will work.
vim.api.nvim_set_keymap("n", "<C-up>", "<Plug>(VM-AddCursorDown)", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-down>", "<Plug>(VM-AddCursorUp)", { noremap = true }) 

--
-- vim.keymap.set("n", "<C-d>", "C-d>zz")
-- vim.keymap.set("n", "<C-u>", "C-u>zz")




