local status, lualine = pcall(require, "tokyonight")
if (not status) then return end

-- Theme settings
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
vim.g.tokyonight_transparent = true

-- Load colorscheme
vim.cmd[[colorscheme tokyonight]]
