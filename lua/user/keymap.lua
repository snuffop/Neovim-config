-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- remap ;
vim.keymap.set('n', ';', ':', {desc="remap"})
vim.keymap.set('v', ';', ':', {desc="remap"})

-- Paste last thing yanked, not deleted
vim.keymap.set('n', ',p', '"0p')
vim.keymap.set('n', ',P', '"0P')

-- use del to escape everything

vim.keymap.set('n', '<Del>', '<Esc>')
vim.keymap.set('v', '<Del>', '<Esc>gV')
vim.keymap.set('o', '<Del>', '<Esc>')
vim.keymap.set('c', '<Del>', '<C-C><Esc>')
vim.keymap.set('i', '<Del>', '<Esc>`^')
vim.keymap.set('t', '<Del>', '<C-\\><C-n>')


-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- LEADER --

--  Symbol special character
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader><space>', ':Telescope<CR>', {desc = 'Telescope Commands'})

-- B buffers

vim.keymap.set('n', '<leader>bb', require('telescope.builtin').buffers, { desc = 'Find existing buffers' })

-- F Files

vim.keymap.set('n', '<leader>fs', ':up<cr>', {desc = 'File Save'})
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = 'Find Files' })
vim.keymap.set("n", "<leader>fz", require("telescope").extensions.zoxide.list, { desc = 'zoxide' })

-- G Git

vim.keymap.set('n', '<leader>gc', require('telescope.builtin').git_bcommits, { desc = '[G]it [B]commits' })
vim.keymap.set('n', '<leader>gg', ':LazyGit<CR>')
vim.keymap.set('n', '<leader>gi', require('telescope').extensions.gh.gist)
vim.keymap.set('n', '<leader>gi', require('telescope').extensions.gh.issues)
vim.keymap.set('n', '<leader>gp', require('telescope').extensions.gh.pull_request)
vim.keymap.set('n', '<leader>gs', require('telescope.builtin').git_status, { desc = '[G]it [S]tatus' })

-- P Project

vim.keymap.set('n', '<leader>pf', require('telescope.builtin').git_files, { desc = '[P]roject [F]iles' })

-- S Search

vim.keymap.set('n', '<leader>sc', require('telescope.builtin').commands, { desc = 'Commands' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = 'Diagnostics' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = 'Grep' })
vim.keymap.set('n', '<leader>sj', require('telescope.builtin').jumplist, { desc = 'Jumplist' })
vim.keymap.set('n', '<leader>sm', require('telescope.builtin').keymaps, { desc = 'Keymaps' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').registers, { desc = 'Registers' })
vim.keymap.set('n', '<leader>st', require('telescope.builtin').treesitter, { desc = 'Treesitter' })
vim.keymap.set('n', '<leader>sv', require('telescope.builtin').vim_options, { desc = 'Vim_options' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = 'Word' })

-- help
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = 'Help' })

-- vim: ts=2 sts=2 sw=2 et
