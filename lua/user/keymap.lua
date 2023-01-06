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

-- use <Del> to escape everything

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

------------
-- LEADER --
------------

--  
--  Symbol special character
--
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })


-- vim: ts=2 sts=2 sw=2 et
