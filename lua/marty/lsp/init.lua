local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "marty.lsp.mason"
require("marty.lsp.handlers").setup()
require "marty.lsp.null-ls"
