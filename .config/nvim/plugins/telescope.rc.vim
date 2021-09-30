nnoremap <silent> <leader>f <cmd>lua require('telescope.builtin').fd()<cr>
nnoremap <silent> <leader>g <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <silent> <leader><leader> <cmd>lua require('telescope.builtin').buffers()<cr>

lua << EOF
local actions = require('telescope.actions')
-- Global remapping
------------------------------
require'telescope'.setup{
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      }
    },
    file_ignore_patterns = {
      'node_modules',
      'vendor'
    }
  }
}
EOF
