nnoremap <silent> <Leader>f :Telescope find_files<cr>
nnoremap <silent> <Leader>g :Telescope live_grep<cr>
nnoremap <silent> <Leader><Leader> :Telescope buffers<cr>
nnoremap <silent> <Leager>h :Telescope help_tags<cr>

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
