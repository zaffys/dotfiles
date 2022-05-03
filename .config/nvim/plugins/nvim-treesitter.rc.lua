-- NOTE: https://github.com/nvim-treesitter/nvim-treesitter/issues/270#issuecomment-725883316jI
require'nvim-treesitter.configs'.setup {
  ensure_installed = 'all',
  highlight = {
    enable = true,
    -- https://github.com/nvim-treesitter/nvim-treesitter/issues/703#issuecomment-818838957
    additional_vim_regex_highlighting = true,
  },
}
