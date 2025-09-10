vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Ensure this folder is on runtimepath when testing via `nvim -u ./init.lua`
do
  local this_dir = vim.fn.fnamemodify(debug.getinfo(1, 'S').source:sub(2), ':h')
  if not string.find(vim.o.runtimepath, this_dir, 1, true) then
    vim.opt.rtp:prepend(this_dir)
  end
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("config.options")
require("config.keymaps")

require("lazy").setup({
  spec = { { import = "plugins" } },
  defaults = { lazy = true },
  change_detection = { notify = false },
})
