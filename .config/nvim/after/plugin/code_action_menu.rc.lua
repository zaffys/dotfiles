local status, lualine = pcall(require, "code_action_menu")
if (not status) then return end

local options = { noremap = true }

vim.api.nvim_exec([[
  autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()
]], false)

-- Keymaps
vim.api.nvim_set_keymap('n', '<leader>fm', '<CMD>CodeActionMenu<CR>', options)

