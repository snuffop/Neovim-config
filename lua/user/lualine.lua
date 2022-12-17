
-- Set lualine as statusline
-- See `:help lualine.txt`
require('lualine').setup {
  options = {
    icons_enabled = true,
  },

  sections = {
    lualine_c = {
      'lsp_progress' 
    }
  },

}
