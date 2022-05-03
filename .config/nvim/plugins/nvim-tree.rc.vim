let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_icon_padding = ' ' "one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
let g:nvim_tree_symlink_arrow = ' >> ' " defaults to ' ➛ '. used as a separator between symlinks' source and target.
let g:nvim_tree_respect_buf_cwd = 1 "0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
let g:nvim_tree_create_in_closed_folder = 0 "1 by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
let g:nvim_tree_refresh_wait = 500 "1000 by default, control how often the tree can be refreshed, 1000 means the tree can be refresh once per 1000ms.
" Dictionary of buffer option names mapped to a list of option values that
" indicates to the window picker that the buffer's window should not be
" selectable.
let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ 'folder_arrows': 0,
    \ }
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath.
"if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
"but this will not work when you set indent_markers (because of UI conflict)

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   }
    \ }

nnoremap <C-e> :NvimTreeToggle<CR>

lua << EOF
-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
require'nvim-tree'.setup {
  disable_netrw       = false,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  open_on_tab         = false,
  hijack_cursor       = true,
  update_cwd          = false,
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = true,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 40,
    height = 40,
    hide_root_folder = false,
    side = 'left',
    mappings = {
      custom_only = true,
      list = {
        { key = {"<CR>", "o", "l", "<2-LeftMouse>"}, action = "edit" },
        { key = "<C-i>",                             action = "edit_in_place" },
        { key = {"O"},                               action = "edit_no_picker" },
        { key = {"<2-RightMouse>", "<C-]>"},         action = "cd" },
        { key = "<C-v>",                             action = "vsplit" },
        { key = "<C-x>",                             action = "split" },
        { key = "<C-t>",                             action = "tabnew" },
        { key = "<",                                 action = "prev_sibling" },
        { key = ">",                                 action = "next_sibling" },
        { key = "P",                                 action = "parent_node" },
        { key = {"<BS>", "h"},                       action = "close_node" },
        { key = "<Tab>",                             action = "preview" },
        { key = "K",                                 action = "first_sibling" },
        { key = "J",                                 action = "last_sibling" },
        { key = "I",                                 action = "toggle_ignored" },
        { key = "H",                                 action = "toggle_dotfiles" },
        { key = "R",                                 action = "refresh" },
        { key = "a",                                 action = "create" },
        { key = "df",                                action = "remove" },
        { key = "D",                                 action = "trash" },
        { key = "r",                                 action = "rename" },
        { key = "<C-r>",                             action = "full_rename" },
        { key = "dd",                                action = "cut" },
        { key = "c",                                 action = "copy" },
        { key = "p",                                 action = "paste" },
        { key = "y",                                 action = "copy_name" },
        { key = "Y",                                 action = "copy_path" },
        { key = "gy",                                action = "copy_absolute_path" },
        { key = "[c",                                action = "prev_git_item" },
        { key = "]c",                                action = "next_git_item" },
        { key = "-",                                 action = "dir_up" },
        { key = "s",                                 action = "system_open" },
        { key = "q",                                 action = "close" },
        { key = "g?",                                action = "toggle_help" },
        { key = "W",                                 action = "collapse_all" },
        { key = "S",                                 action = "search_node" },
        { key = "<C-k>",                             action = "toggle_file_info" },
        { key = ".",                                 action = "run_file_command" }
      }
    },
    number = false,
    relativenumber = false,
    signcolumn = "yes"
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  }
}
