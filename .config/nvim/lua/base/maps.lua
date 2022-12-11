-- map <Leader> on space key
vim.g.mapleader = ' '

local keymap = vim.keymap

-- write
keymap.set('n', '<Leader>w', ':w<CR>')
-- read
keymap.set('n', '<Leader>e', ':e<CR>')
-- Change from insert mode to normal mode
keymap.set('i', 'jj', '<ESC>:<C-u>w<CR>')
-- Enable to use tab key for auto-completions
keymap.set('i', '<expr><TAB>', "pumvisible() ? '<Down>' : '<TAB>'")
keymap.set('i', '<expr><S-TAB>', "pumvisible() ? '<Up>' : '<S-TAB>'")

-- augroup Maps
vim.cmd([[
  autocmd!
  " Go to definition for Ruby by ctags
  autocmd BufEnter *.rb nnoremap <buffer> g] g<C-]>
  autocmd BufEnter *.rb inoremap <buffer> g] <ESC>g<C-]>
  " trail whitespace
  autocmd BufWritePre * :%s/\s\+$//e
augroup END
]])

-- augroup Markdown
vim.cmd([[
  augroup WrapInMarkdown
  autocmd!
  autocmd FileType markdown setlocal wrap
augroup END
]])

local augroup = vim.api.nvim_create_augroup('user_cmds', {clear = true})

vim.api.nvim_create_autocmd('FileType', {
  pattern = {'help', 'man'},
  group = augroup,
  desc = 'Use q to close the window',
  command = 'nnoremap <buffer> q <cmd>quit<cr>'
})

vim.api.nvim_create_autocmd('TextYankPost', {
  group = augroup,
  desc = 'Highlight on yank',
  callback = function(event)
    vim.highlight.on_yank({higroup = 'Visual', timeout = 200})
  end
})

local settings = {
  backup = false,
  errorbells = false,
  expandtab = true,
  hidden = true,
  scrolloff = 3,
  softtabstop = 2,
  showmode = false,
  termguicolors = true
}

-- Generic vim.o
for k, v in pairs(settings) do
  vim.o[k] = v
end

-- Custom vim.o
vim.o.clipboard = 'unnamedplus'
vim.o.shortmess = vim.o.shortmess .. 'c'

-- Not yet in vim.o
vim.cmd('set encoding=utf8')
vim.cmd('set nowritebackup')
vim.cmd('set shiftwidth=2')
vim.cmd('set secure')
vim.cmd('set splitright')
vim.cmd('set tabstop=2')
vim.cmd('set updatetime=300')

-- vim wo
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.wrap = false

-- Manage window
keymap.set('n', ',', '<Nop>')
keymap.set('n', ',j', '<C-w>j')
keymap.set('n', ',k', '<C-w>k')
keymap.set('n', ',l', '<C-w>l')
keymap.set('n', ',h', '<C-w>h')
keymap.set('n', ',=', '<C-w>=')
keymap.set('n', ',s', ':<C-u>sp<CR>')
keymap.set('n', ',v', ':<C-u>vs<CR>')

-- emacs keybind
keymap.set('i', '<C-p>', '<Up>')
keymap.set('i', '<C-n>', '<Down>')
keymap.set('i', '<C-b>', '<Left>')
keymap.set('i', '<C-f>', '<Right>')
keymap.set('i', '<C-a>', '<C-o>:call s:home()<CR>')
keymap.set('i', '<C-e>', '<End>')
keymap.set('i', '<C-d>', '<Del>')
keymap.set('i', '<C-h>', '<BS>')
keymap.set('i', '<C-k>', '<C-r>=s:kill()<CR>')
