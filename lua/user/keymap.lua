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

vim.keymap.set('n', '<leader><space>', require('telescope.builtin').commands, { desc = 'Commands' })




-- 
-- N Notes
-- 

vim.keymap.set('n', "<leader>ntC", ":CalendarT", { desc = 'Calendar' })
vim.keymap.set('n', "<leader>ntf", require('telekasten').find_notes, { desc = 'TelFind Notes' })
vim.keymap.set('n', "<leader>ntd", require('telekasten').find_daily_notes, { desc = 'Tel Find Daily Notes' })
vim.keymap.set('n', "<leader>ntg", require('telekasten').search_notes, { desc = 'Tel Search Notes' })
vim.keymap.set('n', "<leader>ntz", require('telekasten').follow_link, { desc = 'Tel Follow Link' })
vim.keymap.set('n', "<leader>ntT", require('telekasten').goto_today, { desc = 'Tel Go to Today' })
vim.keymap.set('n', "<leader>ntW", require('telekasten').goto_thisweek, { desc = 'Tel Go to This week' })
vim.keymap.set('n', "<leader>ntw", require('telekasten').find_weekly_notes, { desc = 'Tel Find Weekly' })
vim.keymap.set('n', "<leader>ntn", require('telekasten').new_note, { desc = 'Tel New Note' })
vim.keymap.set('n', "<leader>ntN", require('telekasten').new_templated_note, { desc = 'Tel Template Note' })
vim.keymap.set('n', "<leader>nty", require('telekasten').yank_notelink, { desc = 'Tel Yank Note Link' })
vim.keymap.set('n', "<leader>ntc", require('telekasten').show_calendar, { desc = 'Tel Show Calendar' })
vim.keymap.set('n', "<leader>nti", require('telekasten').paste_img_and_link, { desc = 'Tel Paste Image' })
vim.keymap.set('n', "<leader>ntt", require('telekasten').toggle_todo, { desc = 'Tel Toggle Todo' })
vim.keymap.set('n', "<leader>ntb", require('telekasten').show_backlinks, { desc = 'Tel Show Backlinks' })
vim.keymap.set('n', "<leader>ntF", require('telekasten').find_friends, { desc = 'Tel Find Friends' })
vim.keymap.set('n', "<leader>ntp", require('telekasten').preview_img, { desc = 'Tel Preview Image' })
vim.keymap.set('n', "<leader>ntm", require('telekasten').browse_media, { desc = 'Tel Browse Media' })
vim.keymap.set('n', "<leader>nta", require('telekasten').show_tags, { desc = 'Tel Show Tags' })
vim.keymap.set('n', "<leader>ntr", require('telekasten').rename_note, { desc = 'Tel Rename Note' })
vim.keymap.set('n', '<leader>ntz', require('telekasten').panel, { desc = 'Telekasten' })
-- vim.keymap.set('n', "<leader>zI", require('telekasten').insert_img_link,{ i=true })

-- 
-- O Open
-- 

vim.keymap.set('n', '<leader>omn', require('user.MyTele').edit_neovim, {desc = "Open My Nvim"})

--
-- P Project
--



--
-- S Search
--

vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = 'Diagnostics' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = 'Grep' })
vim.keymap.set('n', '<leader>sj', require('telescope.builtin').jumplist, { desc = 'Jumplist' })
vim.keymap.set('n', '<leader>st', require('telescope.builtin').treesitter, { desc = 'Treesitter' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = 'Word' })

-- 
-- T 
-- 

vim.keymap.set('n', '<leader>tt', ':Telescope<CR>', {desc = 'Telescope'})


--
-- Z 
--



-- vim: ts=2 sts=2 sw=2 et
