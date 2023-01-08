--Next [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
--
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

local keymap = vim.keymap


-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- remap ;
keymap.set('n', ';', ':', {desc="remap"})
keymap.set('v', ';', ':', {desc="remap"})

-- Paste last thing yanked, not deleted
keymap.set('n', ',p', '"0p')
keymap.set('n', ',P', '"0P')

keymap.set('n', 'x', '"_x')

-- use <Del> to escape everything

keymap.set('n', '<Del>', '<Esc>')
keymap.set('v', '<Del>', '<Esc>gV')
keymap.set('o', '<Del>', '<Esc>')
keymap.set('c', '<Del>', '<C-C><Esc>')
keymap.set('i', '<Del>', '<Esc>`^')
keymap.set('t', '<Del>', '<C-\\><C-n>')


-- Diagnostic keymaps
keymap.set('n', '[d', vim.diagnostic.goto_prev)
keymap.set('n', ']d', vim.diagnostic.goto_next)
keymap.set('n', '<leader>e', vim.diagnostic.open_float)
keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- number inc and desc
keymap.set('n', '<leader>+', '<C-a>')
keymap.set('n', '<leader>-', '<C-x>')

--  Symbol special character

keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })
keymap.set('n', '<leader>nh', ':nohl<CR>', { desc = "Clear Search Highlights"})

-- Plugin Keymaps
--

keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>", {desc = "Nvim Tree Toggle"})

-- vim: ts=2 sts=2 sw=2 et
