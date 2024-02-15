require('plugins')
require('lualine-config')
require('null-ls-config')
require('prettier-config')
vim.opt.number = true
vim.opt.hlsearch = false
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>')
vim.keymap.set('n', '<leader>f', '<cmd>Prettier<cr>')

vim.keymap.set("i", "jj", "<ESC>")

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()
require("autoclose").setup()
require('lualine').setup()
require('neosolarized').setup({
    comment_italics = true,
    background_set = false,
  })
require'lspconfig'.pyright.setup{}
