local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup({

  -- nvim-ts-rainbow bracket plugin
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
    colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },

  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "bash",
    "tsx",
    "vue",
    "javascript",
    "typescript",
    "toml",
    "jsdoc",
    "python",
    "json",
    "yaml",
    "swift",
    "css",
    "scss",
    "html",
    "lua",
    "rust",
    "go",
    "gomod",
    "graphql",
    "dockerfile"
  },
  autotag = {
    enable = true,
  },
})

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
