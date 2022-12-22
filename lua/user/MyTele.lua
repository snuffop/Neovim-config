local M = {}


function M.edit_neovim()

  require('telescope.builtin').git_files {
  shorten_path = true,
  cwd = "~/.config/nvim",
  prompt = " ~ Neovim Config ~",
  height = 10,

  layout_strategy = 'horizontal',
  layout_options = {
    preview_width = 0.75,
  },
}
end

return M
