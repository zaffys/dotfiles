local status, lualine = pcall(require, "zettel")
if (not status) then return end

local options = { noremap = true }

vim.g.vimwiki_list = {{
  ext = '.wiki',
  path = '~/vimwiki',
  syntax = 'default',
}}

-- Keymaps
vim.api.nvim_set_keymap('n', '<leader>ww','<CMD>vsp | VimwikiIndex<CR>', options)
vim.api.nvim_set_keymap('n', '<leader>zn','<CMD>lua vim.cmd("ZettelNew " .. vim.fn.input("Title: "))<CR>', options)
vim.api.nvim_set_keymap('n', '<leader>zo','<CMD>ZettelOpen<CR>', options)
vim.api.nvim_set_keymap('n', '<leader>zi','<CMD>ZettelInsertNote<CR>', options)
vim.api.nvim_set_keymap('n', '<leader>zb','<CMD>ZettelBackLinks<CR>', options)
vim.api.nvim_set_keymap('n', '<leader>zu','<CMD>ZettelInbox<CR>', options)
vim.api.nvim_set_keymap('n', '<leader>zl','<CMD>ZettelGenerateLinks<CR>', options)
vim.api.nvim_set_keymap('n', '<leader>zt','<CMD>ZettelGenerateTags<CR>', options)
vim.api.nvim_set_keymap('n', '<leader>zs','<CMD>ZettelSearch<CR>', options)
vim.api.nvim_set_keymap('n', '<leader>zy','<CMD>ZettelYankName<CR>', options)
