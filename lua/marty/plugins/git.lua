

local octo = require("octo")
octo.setup {}

-- gitsigns
local gitsigns = require("gitsigns")
gitsigns.setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  }
}


-- NEOGIT
local neogit = require("neogit")
neogit.setup {
  use_magit_keybindings = true,
  integrations = {
    diffview = true
  }
}
