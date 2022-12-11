local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PackerBootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
  vim.cmd [[packadd packer.nvim]]
end

local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'glepnir/lspsaga.nvim'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'ray-x/cmp-treesitter'
  -- use { 'tzachar/cmp-tabnine', run = "./install.sh"} 
  use 'nvim-lua/popup.nvim'
  use 'rmagatti/session-lens'
  use 'folke/tokyonight.nvim'
  use 'joshdick/onedark.vim'
  use 'onsails/lspkind-nvim'
  use 'hoob3rt/lualine.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'romgrk/nvim-treesitter-context'
  use 'kyazdani42/nvim-web-devicons'
  use { 'kyazdani42/nvim-tree.lua', requires = 'nvim-tree/nvim-web-devicons' }
  use 'rhysd/git-messenger.vim'
  use 'nvim-lua/plenary.nvim'
  use { 'lewis6991/gitsigns.nvim', requires = 'nvim-lua/plenary.nvim' }
  use 'lukas-reineke/indent-blankline.nvim'
  use 'terrortylor/nvim-comment'
  use { 'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons' }
  use { "iamcco/markdown-preview.nvim", run = function() vim.fn["mkdp#util#install"]() end, }
  use { 'nvim-telescope/telescope.nvim', requires = 'rmagatti/session-lens' }
  use 'kdheepak/lazygit.nvim'
  use 'rebelot/kanagawa.nvim'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'vim-test/vim-test'
  use 'preservim/vimux'
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'nanotee/sqls.nvim'
  use 'rmagatti/auto-session'
  use 'unblevable/quick-scope'
  use 'preservim/nerdcommenter'
  use { 'folke/trouble.nvim', requires = "kyazdani42/nvim-web-devicons", run = function() vim.api.nvim_set_keymap("n", "<leader>hh", "<cmd>Trouble<cr>", { silent = true, noremap = true}) end }
  use 'folke/lsp-colors.nvim'
  use 'voldikss/vim-floaterm'
  use { 'junegunn/fzf', run = function () vim.fn['fzf#install']() end }
  use 'junegunn/fzf.vim'
  use 'vimwiki/vimwiki'
  use 'michal-h21/vim-zettel'
  use 'kosayoda/nvim-lightbulb'
  use { 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' }

  if PackerBootstrap then
    require('packer').sync()
  end
end)
