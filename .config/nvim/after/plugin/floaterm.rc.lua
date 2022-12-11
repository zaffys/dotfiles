local status, lualine = pcall(require, "floatterm")
if (not status) then return end

local options = { noremap = true }

--vim.api.nvim_command([[
  --tnoremap <ESC> <C-\><C-n>
--]])

vim.api.nvim_set_keymap('n', '<leader>bb', '<CMD>FloatermNew --autoclose=2 --height=0.9 --width=0.9 btm<CR>', options)
vim.api.nvim_set_keymap('n', '<leader>k9', '<CMD>FloatermNew --autoclose=2 --height=0.9 --width=0.9 k9s<CR>', options)
vim.api.nvim_set_keymap('n', '<leader>ld', '<CMD>FloatermNew --autoclose=2 --height=0.9 --width=0.9 lazydocker<CR>', options)
vim.api.nvim_set_keymap('n', '<leader>lg', '<CMD>FloatermNew --autoclose=2 --height=0.9 --width=0.9 lazygit<CR>', options)
vim.api.nvim_set_keymap('n', '<leader>nn', '<CMD>FloatermNew --autoclose=2 --height=0.75 --width=0.75 nnn -Hde<CR>', options)
vim.api.nvim_set_keymap('n', '<leader>ln', '<CMD>FloatermNew --autoclose=2 --height=0.9 --width=0.9 lazynpm<CR>', options)
vim.api.nvim_set_keymap('n', '<leader>tt', '<CMD>FloatermNew --autoclose=2 --height=0.9 --width=0.9 zsh<CR>', options)

