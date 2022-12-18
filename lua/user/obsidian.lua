-- Obsidian setup 
--
require("obsidian").setup({
  dir = "~/Nextcloud/Obsidian",
  completion = {
    nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
  },
  daily_notes = {
    folder = "DailyNotes",
-- YYYY/MM-MMMM/YYYY-MM-DD-dddd
  },
})
