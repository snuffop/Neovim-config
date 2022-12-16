require "user.packer"
require "user.options"
require "user.keymap"
require "user.autocommand"
require "user.treesitter"
require "user.lsp"
require "user.cmp"
require "user.ranger"
require "user.vimwiki"


--autocmd! BufRead,BufNewFile *.j2  call jinja#AdjustFiletype()
-- vim: ts=2 sts=2 sw=2 et
