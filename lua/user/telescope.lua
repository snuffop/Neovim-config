
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

require("telescope").load_extension "repo"
require("telescope").load_extension "media_files"

-- Enable telescope fzf native, if installed
require('telescope').load_extension "fzf"

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>t', ':Telescope<CR>')

vim.keymap.set('n', '<leader>sc', require('telescope.builtin').commands, { desc = '[S]earch [C]commands' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sm', require('telescope.builtin').keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').registers, { desc = '[S]earch [R]egisters' })
vim.keymap.set('n', '<leader>st', require('telescope.builtin').treesitter, { desc = '[S]earch [T]reesitter' })
vim.keymap.set('n', '<leader>sv', require('telescope.builtin').vim_options, { desc = '[S]earch [V]im_options' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sj', require('telescope.builtin').jumplist, { desc = '[S]earch [J]umplism' })

vim.keymap.set('n', '<leader>pf', require('telescope.builtin').git_files, { desc = '[P]roject [F]iles' })

vim.keymap.set('n', '<leader>gs', require('telescope.builtin').git_status, { desc = '[G]it [S]tatus' })
vim.keymap.set('n', '<leader>gc', require('telescope.builtin').git_bcommits, { desc = '[G]it [B]commits' })
