local status, indent_blankline = pcall(require, "indent_blankline")
if (not status) then return end

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "eol:↴"
vim.opt.termguicolors = true

vim.cmd [[highlight IndentBlanklineIndent1 guibg=#1f1f1f gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine]]

indent_blankline.setup {

  -- show_end_of_line = true,
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = false,
  show_trailing_blankline_indent = false,

  char = "",
  char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
  },
  space_char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
  },
}
