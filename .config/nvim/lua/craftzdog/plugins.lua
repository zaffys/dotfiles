local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  -- use {
  --   'svrana/neosolarized.nvim',
  --   requires = { 'tjdevries/colorbuddy.nvim' }
  -- }
  use 'nvim-lualine/lualine.nvim' -- Statusline
  use 'nvim-lua/plenary.nvim' -- Common utilities
  use 'onsails/lspkind-nvim' -- vscode-like pictograms
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp' -- Completion
  use 'neovim/nvim-lspconfig' -- LSP
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  use 'glepnir/lspsaga.nvim' -- LSP UIs
  use 'L3MON4D3/LuaSnip'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use 'kyazdani42/nvim-web-devicons' -- File icons
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use { 'numToStr/Comment.nvim', requires = { 'JoosepAlviste/nvim-ts-context-commentstring' } }
  use 'norcalli/nvim-colorizer.lua'
  use 'folke/zen-mode.nvim'
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
  use 'akinsho/nvim-bufferline.lua'
  -- use 'github/copilot.vim'

  use 'lewis6991/gitsigns.nvim'
  use 'dinhhuy258/git.nvim' -- For git blame & browse

  -- lazygit
  use 'kdheepak/lazygit.nvim'

  -- themes
  use 'EdenEast/nightfox.nvim' -- nightfox theme
  use 'wuelnerdotexe/vim-enfocado' -- enfocado theme
  -- use "olimorris/onedarkpro.nvim" -- onedarkpro theme
  -- use 'sainnhe/sonokai' -- sonokai theme

  use("navarasu/onedark.nvim")

  -- git blame ( GitLens )
  use({ "kessejones/git-blame-line.nvim" })

  -- rainbow parentheses
  use("p00f/nvim-ts-rainbow")

  -- toggleterm terminal in vim TODO: setup.rc
  use({
    "akinsho/toggleterm.nvim",
    tag = "*",
    config = function()
      require("toggleterm").setup()
    end,
  })

  -- lsp colors
  use("folke/lsp-colors.nvim")

  -- treesitter context
  use("nvim-treesitter/nvim-treesitter-context")

  -- indent blankline
  use("lukas-reineke/indent-blankline.nvim")

  -- smooth scrolling TODO: setup
  use("karb94/neoscroll.nvim")

  -- which key
  use({
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup({})
    end,
  })

  -- highlight word under the cursor
  use("RRethy/vim-illuminate")

  -- % improved
  use("andymass/vim-matchup")

end)
