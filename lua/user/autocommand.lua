-- Auto commands
--autocmd! BufRead,BufNewFile *.j2  call jinja#AdjustFiletype()

-- Create view for all files
-- vim.api.nvim_create_autocmd(
--   { "BufWinLeave" },
--   { pattern= {"*.*"},
--     command = "mkview" }
-- )
--
-- -- Load View for all files
-- vim.api.nvim_create_autocmd(
--   { "BufWinEnter" },
--   { pattern= {"*.*"},
--     command = "loadview" }
-- )

-- Enable Spell checker
vim.api.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    { pattern = { "*.txt", "*.md", "*.tex", "*.org" }, command = "setlocal spell" }
)

-- Enable Spell checker
vim.api.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    { pattern = { "*.j2", "*.jinja" }, command = "set filetype=jinja" }
)

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

