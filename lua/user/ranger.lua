vim.g.NERDTreeHijackNetrw = 0 -- add this line if you use NERDTree
vim.g.ranger_replace_netrw = 1 -- open ranger when vim open a directory
vim.g.ranger_map_keys = 0 -- disable ranger keymap

vim.keymap.set('n', '<leader>frr', ':Ranger<CR>')
vim.keymap.set('n', '<leader>frf', ':RangerCurrentFile<CR>')
vim.keymap.set('n', '<leader>frd', ':RangerCurrentDirectory<CR>')
vim.keymap.set('n', '<leader>frt', ':RangerCurrentFileNewTab<CR>')

