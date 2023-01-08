-- [[ Setting options ]]

local opt = vim.opt 


opt.autoindent = true
opt.background = "dark"                                    -- force themes with light and dark versions to one or the other
opt.backspace = 'indent,eol,start'
opt.backup = false                                         -- creates a backup file
opt.breakindent = true                                     -- Enable break indent
opt.clipboard:append("unnamedplus")                              -- allows neovim to access the system clipboard
opt.cmdheight = 2                                          -- more space in the neovim command line for displaying messages
opt.completeopt = { "menuone", "noselect" }                -- mostly just for cmp
opt.conceallevel = 0                                       -- so that `` is visible in markdown files
opt.cursorline = true                                      -- highlight the current line
opt.expandtab = true                                       -- convert tabs to spaces
opt.fileencoding = "utf-8"                                 -- the encoding written to a file
opt.foldenable = false
opt.formatoptions:remove({ "c", "r", "o" })                -- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.
opt.guifont = "FiraCode Nerd Font:h9"                      -- the font used in graphical neovim applications
opt.hlsearch = true                                        -- Set highlight on search
opt.ignorecase = true                                      -- Case insensitive searching UNLESS /C or capital in search
opt.iskeyword:append "-"                                   -- hyphenated words recognized by searches
opt.linebreak = true                                       -- companion to wrap, don't split words
opt.mouse = 'a'                                            -- Enable mouse mode
opt.number = true                                          -- allow for number and relative number to get hybred
opt.numberwidth = 4                                        -- set number column width to 2 {default 4}
opt.pumheight = 10                                         -- pop up menu height
opt.relativenumber = true                                  -- Make line numbers default
opt.runtimepath:remove("/usr/share/vim/vimfiles")          -- separate vim plugins from neovim in case vim still in use
opt.scrolloff = 8                                          -- minimal number of screen lines to keep above and below the cursor
opt.shiftwidth = 2                                         -- the number of spaces inserted for each indentation
opt.shortmess = "ilmnrx"                                   -- flags to shorten vim messages, see :help 'shortmess'
opt.showmode = false                                       -- we don't need to see things like -- INSERT -- anymore
opt.showtabline = 2                                        -- always show tabs
opt.sidescrolloff = 8                                      -- minimal number of screen columns either side of cursor if wrap is `false`
opt.signcolumn = 'yes'                                     -- Decrease update time
opt.smartcase = true                                       -- Case insensitive searching UNLESS /C or capital in search
opt.smartindent = true                                     -- make indenting smarter again
opt.splitbelow = true                                      -- force all horizontal splits to go below current window
opt.splitright = true                                      -- force all vertical splits to go to the right of current window
opt.swapfile = false                                       -- creates a swapfile
opt.tabstop = 2                                            -- insert 2 spaces for a tab
opt.termguicolors = true                                   -- True Color Terminal
opt.timeoutlen = 300                                       -- time to wait for a mapped sequence to complete (in milliseconds)
opt.undofile = true                                        -- Save undo history
opt.updatetime = 250                                       -- Decrease update time
opt.whichwrap = "bs<>[]hl"                                 -- which "horizontal" keys are allowed to travel to prev/next line
opt.wrap = false                                            -- display lines as one long line
opt.writebackup = false                                    -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

-- vim: ts=2 sts=2 sw=2 et
