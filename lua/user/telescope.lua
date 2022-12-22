
-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
  extensions = {
    repo = {
      list = {
        fd_opts = {
          "--no-ignore-vsc",
        },
        search_dirs = {
           "~/Source/",
           "~/.config",
         },
       },
    },
    projects = {
      base_dirs = {
        {path = '~/Source'},
        {path = '~/.config'},
      hidden_file = true,
      theme = "dropdown",
      order_by = "asc",
      }
    },
    media_files = {
      filetypes = {"png", "webp", "jpg", "jpeg","pdf"},
      find_cmd = "rg" -- find command (defaults to `fd`)
    },
     fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    },
  },
}

require("telescope").load_extension("repo")
require("telescope").load_extension("media_files")
require('telescope').load_extension("fzf")
require('telescope').load_extension("zoxide")
require('telescope').load_extension("gh")
require('telescope').load_extension('project')
require('telescope').load_extension('packer')

