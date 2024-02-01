require("nhat.remap")
require('nhat.packer')
require('nhat.set')
-- automatically trigger the command :lua ColorMyPencils() whenever neovim starts
vim.cmd [[augroup ColorMyPencils]]
vim.cmd [[autocmd!]]
vim.cmd [[autocmd VimEnter * lua ColorMyPencils()]]
vim.cmd [[augroup END]]

