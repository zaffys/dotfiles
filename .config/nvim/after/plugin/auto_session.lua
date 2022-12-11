local status, lualine = pcall(require, "lualine")
if (not status) then return end

local mapOpts = { noremap = true }

local opts = {
  auto_session_enabled = true,
  auto_save_enabled = false,
  auto_restore_enabled = true,
}

require'auto-session'.setup(opts)

vim.api.nvim_set_keymap('n', '<leader>sd', '<CMD>lua require("auto-session").DeleteSession()<CR>', mapOpts)
vim.api.nvim_set_keymap('n', '<leader>ss', '<CMD>lua require("auto-session").SaveSession()<CR>', mapOpts)
